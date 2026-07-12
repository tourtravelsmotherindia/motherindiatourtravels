import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** GET /site-sections/:key — public */
export async function handleSiteSectionsGet(url: URL, env: Env): Promise<Response> {
  const key = url.pathname.split("/")[2];
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  if (key) {
    const section = await db.from("SiteSection").select("*").eq("key", key).getOne();
    if (!section) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(section);
  }
  const sections = await db.from("SiteSection").select("*").get();
  return Response.json(sections);
}

/** PATCH /site-sections/:key — admin update */
export async function handleSiteSectionsUpdate(
  request: Request,
  url: URL,
  env: Env,
): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const key = url.pathname.split("/")[2];
  if (!key) return Response.json({ error: "key required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  // Upsert by key
  const section = await db.from("SiteSection").upsert({ key, ...body }, "key");
  return Response.json(section);
}
