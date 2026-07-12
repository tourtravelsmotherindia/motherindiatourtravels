import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** GET /faqs — public list ordered by sortOrder */
export async function handleFaqsGet(env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const faqs = await db.from("FAQ").select("*").order("sortOrder").get();
  return Response.json(faqs);
}

/** POST /faqs — admin create FAQ */
export async function handleFaqsCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const faq = await db.from("FAQ").insert(body);
  return Response.json(faq, { status: 201 });
}

/** PATCH /faqs/:id — admin update FAQ */
export async function handleFaqsUpdate(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const faq = await db.from("FAQ").update(id, body);
  return Response.json(faq);
}

/** DELETE /faqs/:id — admin delete FAQ */
export async function handleFaqsDelete(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  await db.from("FAQ").delete(id);
  return new Response(null, { status: 204 });
}
