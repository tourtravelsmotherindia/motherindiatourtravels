import { workerLogger } from "../lib/logger";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";
import { requireAdmin } from "../middleware/auth";
import monitoringConfig from "../monitoring.json";

async function fetchWithTimeout(url: string, timeoutMs = 10000): Promise<Response> {
  const controller = new AbortController();
  const id = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const response = await fetch(url, { signal: controller.signal });
    clearTimeout(id);
    return response;
  } catch (err) {
    clearTimeout(id);
    throw err;
  }
}

async function pingUrl(url: string): Promise<{ success: boolean; timeMs: number }> {
  const start = Date.now();
  try {
    const res = await fetchWithTimeout(url, 10000);
    // 2xx and 3xx statuses are considered up. We also accept 404/405 for website/images in case /health isn't fully set up,
    // but both workers have a /health endpoint that returns 200, and the website should return 200.
    return { success: res.status >= 200 && res.status < 400, timeMs: Date.now() - start };
  } catch (err) {
    workerLogger.error("KeepAlive Cron", `Health ping failed for ${url}:`, env.ENVIRONMENT, err);
    return { success: false, timeMs: Date.now() - start };
  }
}

export async function handleCronPing(
  env: Env,
  triggeredBy = "cloudflare-worker-cron",
): Promise<Record<string, unknown>> {
  workerLogger.log(
    "KeepAlive Cron",
    "Starting system status and keep-alive checks...",
    env.ENVIRONMENT,
  );

  if (!env.SUPABASE_URL || !env.SUPABASE_SECRET_KEY) {
    workerLogger.error(
      "KeepAlive Cron",
      "SUPABASE_URL or SUPABASE_SECRET_KEY is missing!",
      env.ENVIRONMENT,
    );
    throw new Error("Missing Supabase configuration");
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);

  // 1. Uptime check endpoints
  const websiteCheck = await pingUrl(monitoringConfig.websiteUrl);
  const imagesCheck = await pingUrl(`${monitoringConfig.imagesUrl}/health`);

  // API worker is self — if this code is running, the API is up. No need to fetch its own /health.
  const apiUp = true;

  // 2. Database checks and counts (generates read activity)
  let dbSuccess = false;
  let dbPingTimeMs = 0;
  let companyName = "";
  let packagesCount = 0;
  let blogsCount = 0;
  let destinationsCount = 0;
  let recentInquiriesCount = 0;

  const dbStart = Date.now();
  try {
    // Read from Company (singleton)
    const company = await db
      .from("Company")
      .select("id,name")
      .getOne<{ id: number; name: string }>();
    companyName = company?.name ?? "";

    // Read from Package
    const packages = await db.from("Package").select("id").get();
    packagesCount = packages.length;

    // Read from BlogPost
    const blogs = await db.from("BlogPost").select("id").get();
    blogsCount = blogs.length;

    // Read from Destination
    const destinations = await db.from("Destination").select("id").get();
    destinationsCount = destinations.length;

    // Read from BookingInquiry (recent ones)
    const inquiries = await db.from("BookingInquiry").select("id").limit(10).get();
    recentInquiriesCount = inquiries.length;

    dbSuccess = true;
    dbPingTimeMs = Date.now() - dbStart;
    workerLogger.log(
      "KeepAlive Cron",
      "Database read queries completed successfully.",
      env.ENVIRONMENT,
    );
  } catch (err) {
    dbPingTimeMs = Date.now() - dbStart;
    workerLogger.error("KeepAlive Cron", "Database queries failed:", env.ENVIRONMENT, err);
  }

  // 3. Determine Overall Status
  let status = "healthy";
  if (!dbSuccess) {
    status = "down";
  } else if (!websiteCheck.success || !imagesCheck.success) {
    status = "degraded";
  }

  // 4. Save results to SystemStatus table (generates write activity)
  const now = new Date().toISOString();
  const id = crypto.randomUUID();
  const statusPayload = {
    id,
    status,
    lastPing: now,
    websiteStatus: websiteCheck.success ? "up" : "down",
    apiStatus: apiUp ? "up" : "down",
    imagesStatus: imagesCheck.success ? "up" : "down",
    dbStatus: dbSuccess ? "up" : "down",
    metadata: {
      companyName,
      packagesCount,
      blogsCount,
      destinationsCount,
      recentInquiriesCount,
      updatedBy: triggeredBy,
      websitePingTimeMs: websiteCheck.timeMs,
      apiPingTimeMs: 0,
      imagesPingTimeMs: imagesCheck.timeMs,
      dbPingTimeMs,
    },
    createdAt: now,
  };

  try {
    // 1. Insert new health log
    await db.from("SystemStatus").insert(statusPayload);
    workerLogger.log("KeepAlive Cron", "Log inserted successfully", env.ENVIRONMENT);

    // 2. Delete logs older than 90 days
    const ninetyDaysAgo = new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString();
    const deleteUrl = `${env.SUPABASE_URL}/rest/v1/SystemStatus?createdAt=lt.${ninetyDaysAgo}`;
    const deleteRes = await fetch(deleteUrl, {
      method: "DELETE",
      headers: {
        apikey: env.SUPABASE_SECRET_KEY,
        Authorization: `Bearer ${env.SUPABASE_SECRET_KEY}`,
      },
    });
    if (!deleteRes.ok) {
      workerLogger.error("KeepAlive Cron", "Failed to purge old logs", env.ENVIRONMENT);
    } else {
      workerLogger.log(
        "KeepAlive Cron",
        "Successfully purged logs older than 90 days.",
        env.ENVIRONMENT,
      );
    }

    return statusPayload;
  } catch (err) {
    workerLogger.error(
      "KeepAlive Cron",
      "Failed to write SystemStatus to database:",
      env.ENVIRONMENT,
      err,
    );
    throw err;
  }
}

/** GET /cron-ping — Public endpoint protected by token (e.g. for external cron/UptimeRobot pings) */
export async function handleCronPingRequest(request: Request, env: Env): Promise<Response> {
  const url = new URL(request.url);
  const token = url.searchParams.get("token");

  if (env.ENVIRONMENT === "production" && token !== env.SUPABASE_SECRET_KEY) {
    return Response.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    const data = await handleCronPing(env);
    return Response.json({ success: true, message: "System status pinged successfully", data });
  } catch (error: any) {
    return Response.json({ success: false, error: error.message }, { status: 500 });
  }
}

/** POST /admin/system-status/ping — Admin dashboard manual trigger */
export async function handleAdminSystemStatusPing(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

  try {
    const data = await handleCronPing(env, "admin-dashboard-manual");
    return Response.json({ success: true, message: "System health check triggered", data });
  } catch (error: any) {
    return Response.json({ success: false, error: error.message }, { status: 500 });
  }
}
