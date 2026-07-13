import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
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

/** POST /deploy — trigger GitHub actions deployment */
export async function handleDeploy(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

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

  let inputs = {};
  let ref = env.GITHUB_REF || "deploy";

  try {
    if (request.headers.get("content-type")?.includes("application/json")) {
      const body = (await request.json()) as { ref?: string; inputs?: Record<string, unknown> };
      if (body && typeof body === "object") {
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
      console.error("GitHub dispatch failed:", response.status, errorText);
      return Response.json(
        { error: `Failed to trigger deployment: ${errorText || response.statusText}` },
        { status: response.status },
      );
    }
  } catch (err: any) {
    console.error("Error triggering deployment:", err);
    return Response.json(
      { error: `Internal error triggering deployment: ${err.message || err}` },
      { status: 500 },
    );
  }
}

/** GET /deploy — fetch latest deployment workflow run status */
export async function handleDeployStatus(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

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
      console.error("Failed to fetch workflow runs:", response.status, errorText);
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
    console.error("Error fetching deployment status:", err);
    return Response.json(
      { error: `Internal error fetching deployment status: ${err.message || err}` },
      { status: 500 },
    );
  }
}
