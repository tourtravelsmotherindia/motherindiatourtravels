import { workerLogger } from "../lib/logger";
import { createSupabaseClient } from "../lib/supabase";
import { requireAdmin } from "../middleware/auth";
import type { Env } from "../types";

/** GET /admin/bookings — list all booking inquiries */
export async function handleAdminBookingsGet(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const bookings = await db.from("BookingInquiry").select("*").order("createdAt", false).get();
  return Response.json(bookings);
}

/** PATCH /admin/bookings/:id/status */
export async function handleAdminBookingsUpdateStatus(
  request: Request,
  url: URL,
  env: Env,
): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  // Path: /admin/bookings/:id/status
  const parts = url.pathname.split("/");
  const id = parts[3];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as { status: string };
  if (!body.status) return Response.json({ error: "status required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const booking = await db.from("BookingInquiry").update(id, {
    status: body.status,
    updatedAt: new Date().toISOString(),
  });
  return Response.json(booking);
}

/** GET /admin/contacts — list all contact submissions */
export async function handleAdminContactsGet(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const contacts = await db.from("ContactSubmission").select("*").order("createdAt", false).get();
  return Response.json(contacts);
}

/** PATCH /admin/contacts/:id/status */
export async function handleAdminContactsUpdateStatus(
  request: Request,
  url: URL,
  env: Env,
): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const parts = url.pathname.split("/");
  const id = parts[3];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as { status: string };
  if (!body.status) return Response.json({ error: "status required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const contact = await db.from("ContactSubmission").update(id, { status: body.status });
  return Response.json(contact);
}

/** POST /deploy — trigger GitHub actions or Cloudflare Pages deployment */
export async function handleDeploy(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

  let target = "cpanel";
  let inputs = {};
  let ref = env.GITHUB_REF || "deploy";

  try {
    if (request.headers.get("content-type")?.includes("application/json")) {
      const body = (await request.json()) as {
        target?: string;
        ref?: string;
        inputs?: Record<string, unknown>;
      };
      if (body && typeof body === "object") {
        if (body.target) {
          target = body.target;
        }
        if (body.ref) {
          ref = body.ref;
        }
        if (body.inputs) {
          inputs = body.inputs;
        }
      }
    }
  } catch (e) {
    // Ignore body parse errors if body is empty or malformed
  }

  if (target === "cloudflare") {
    const deployHook = env.CLOUDFLARE_PAGES_DEPLOY_HOOK;
    if (!deployHook) {
      return Response.json(
        {
          error: "Cloudflare Pages deployment hook URL is missing in server environment variables",
        },
        { status: 500 },
      );
    }

    try {
      const response = await fetch(deployHook, {
        method: "POST",
      });

      if (response.ok) {
        return Response.json({
          success: true,
          message: "Cloudflare Pages deployment triggered successfully",
        });
      } else {
        const errorText = await response.text();
        workerLogger.error(
          "Admin",
          "Cloudflare Pages hook failed:",
          env.ENVIRONMENT,
          response.status,
          errorText,
        );
        return Response.json(
          {
            error: `Failed to trigger Cloudflare Pages deployment: ${errorText || response.statusText}`,
          },
          { status: response.status },
        );
      }
    } catch (err: any) {
      workerLogger.error(
        "Admin",
        "Error triggering Cloudflare Pages deployment:",
        env.ENVIRONMENT,
        err,
      );
      return Response.json(
        { error: `Internal error triggering Cloudflare Pages deployment: ${err.message || err}` },
        { status: 500 },
      );
    }
  }

  // Default: cpanel (GitHub Actions dispatch)
  const token = env.GITHUB_TOKEN;
  const owner = env.GITHUB_OWNER;
  const repo = env.GITHUB_REPO;
  const workflow = env.GITHUB_WORKFLOW || "deploy-cpanel.yml";

  if (!token || !owner || !repo) {
    return Response.json(
      { error: "GitHub deployment configuration is missing in server environment variables" },
      { status: 500 },
    );
  }

  try {
    const url = `https://api.github.com/repos/${owner}/${repo}/actions/workflows/${workflow}/dispatches`;
    const response = await fetch(url, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        Accept: "application/vnd.github+json",
        "Content-Type": "application/json",
        "User-Agent": "Mother-India-Admin-Panel",
      },
      body: JSON.stringify({
        ref,
        inputs,
      }),
    });

    if (response.ok || response.status === 204) {
      return Response.json({ success: true, message: "Deployment triggered successfully" });
    } else {
      const errorText = await response.text();
      workerLogger.error(
        "Admin",
        "GitHub dispatch failed:",
        env.ENVIRONMENT,
        response.status,
        errorText,
      );
      return Response.json(
        { error: `Failed to trigger deployment: ${errorText || response.statusText}` },
        { status: response.status },
      );
    }
  } catch (err: any) {
    workerLogger.error("Admin", "Error triggering deployment:", env.ENVIRONMENT, err);
    return Response.json(
      { error: `Internal error triggering deployment: ${err.message || err}` },
      { status: 500 },
    );
  }
}

/** GET /deploy — fetch latest deployment workflow or Cloudflare Pages run status */
export async function handleDeployStatus(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

  const url = new URL(request.url);
  const target = url.searchParams.get("target") || "cpanel";

  if (target === "cloudflare") {
    const accountId = env.CLOUDFLARE_ACCOUNT_ID;
    const projectName = env.CLOUDFLARE_PROJECT_NAME;
    const apiToken = env.CLOUDFLARE_API_TOKEN;

    if (!accountId || !projectName || !apiToken) {
      return Response.json(
        {
          error: "Cloudflare Pages monitoring settings are missing in server environment variables",
        },
        { status: 500 },
      );
    }

    try {
      const url = `https://api.cloudflare.com/client/v4/accounts/${accountId}/pages/projects/${projectName}/deployments?per_page=1`;
      const response = await fetch(url, {
        method: "GET",
        headers: {
          Authorization: `Bearer ${apiToken}`,
          "Content-Type": "application/json",
          "User-Agent": "Mother-India-Admin-Panel",
        },
      });

      if (!response.ok) {
        const errorText = await response.text();
        workerLogger.error(
          "Admin",
          "Failed to fetch Cloudflare Pages deployments:",
          env.ENVIRONMENT,
          response.status,
          errorText,
        );
        return Response.json(
          { error: `Failed to fetch deployment status: ${errorText || response.statusText}` },
          { status: response.status },
        );
      }

      const data = (await response.json()) as {
        result?: Array<{
          id: string;
          status: string;
          url: string;
          created_on: string;
        }>;
      };

      const latestDeployment = data.result?.[0] || null;

      if (!latestDeployment) {
        return Response.json({ status: "unknown", conclusion: null });
      }

      // Map Cloudflare Pages statuses: "queued", "building", "success", "failure", "canceled"
      // to standard API response payload: { status, conclusion, url, createdAt }
      let status = "completed";
      let conclusion: string | null = null;

      if (latestDeployment.status === "queued") {
        status = "queued";
      } else if (latestDeployment.status === "building") {
        status = "in_progress";
      } else if (latestDeployment.status === "success") {
        status = "completed";
        conclusion = "success";
      } else if (latestDeployment.status === "failure") {
        status = "completed";
        conclusion = "failure";
      } else if (latestDeployment.status === "canceled") {
        status = "completed";
        conclusion = "cancelled";
      } else {
        status = latestDeployment.status;
      }

      return Response.json({
        status,
        conclusion,
        url: latestDeployment.url,
        createdAt: latestDeployment.created_on,
      });
    } catch (err: any) {
      workerLogger.error(
        "Admin",
        "Error fetching Cloudflare Pages deployment status:",
        env.ENVIRONMENT,
        err,
      );
      return Response.json(
        { error: `Internal error fetching deployment status: ${err.message || err}` },
        { status: 500 },
      );
    }
  }

  // Default: cpanel (GitHub Actions run status)
  const token = env.GITHUB_TOKEN;
  const owner = env.GITHUB_OWNER;
  const repo = env.GITHUB_REPO;
  const workflow = env.GITHUB_WORKFLOW || "deploy-cpanel.yml";

  if (!token || !owner || !repo) {
    return Response.json(
      { error: "GitHub deployment configuration is missing in server environment variables" },
      { status: 500 },
    );
  }

  try {
    const url = `https://api.github.com/repos/${owner}/${repo}/actions/workflows/${workflow}/runs?per_page=1`;
    const response = await fetch(url, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
        Accept: "application/vnd.github+json",
        "User-Agent": "Mother-India-Admin-Panel",
      },
    });

    if (!response.ok) {
      const errorText = await response.text();
      workerLogger.error(
        "Admin",
        "Failed to fetch workflow runs:",
        env.ENVIRONMENT,
        response.status,
        errorText,
      );
      return Response.json(
        { error: `Failed to fetch deployment status: ${errorText || response.statusText}` },
        { status: response.status },
      );
    }

    const data = (await response.json()) as {
      workflow_runs: Array<{
        status: string;
        conclusion: string | null;
        html_url: string;
        created_at: string;
      }>;
    };

    const latestRun = data.workflow_runs?.[0] || null;

    if (!latestRun) {
      return Response.json({ status: "unknown", conclusion: null });
    }

    return Response.json({
      status: latestRun.status,
      conclusion: latestRun.conclusion,
      url: latestRun.html_url,
      createdAt: latestRun.created_at,
    });
  } catch (err: any) {
    workerLogger.error("Admin", "Error fetching deployment status:", env.ENVIRONMENT, err);
    return Response.json(
      { error: `Internal error fetching deployment status: ${err.message || err}` },
      { status: 500 },
    );
  }
}
