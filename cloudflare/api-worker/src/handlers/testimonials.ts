import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** GET /testimonials — public list of approved testimonials */
export async function handleTestimonialsGet(url: URL, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const id = url.pathname.split("/")[2];
  if (id) {
    const testimonial = await db.from("Testimonial").select("*").eq("id", id).getOne();
    if (!testimonial) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(testimonial);
  }
  const testimonials = await db
    .from("Testimonial")
    .select("*")
    .eq("isApproved", true)
    .order("sortOrder")
    .get();
  return Response.json(testimonials);
}

/** POST /testimonials — admin create testimonial */
export async function handleTestimonialsCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const testimonial = await db.from("Testimonial").insert({
    id: body.id || crypto.randomUUID(),
    ...body,
  });
  return Response.json(testimonial, { status: 201 });
}

/** PATCH /testimonials/:id — admin update testimonial */
export async function handleTestimonialsUpdate(
  request: Request,
  url: URL,
  env: Env,
): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const testimonial = await db.from("Testimonial").update(id, body);
  return Response.json(testimonial);
}

/** DELETE /testimonials/:id — admin delete testimonial */
export async function handleTestimonialsDelete(
  request: Request,
  url: URL,
  env: Env,
): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  await db.from("Testimonial").delete(id);
  return new Response(null, { status: 204 });
}
