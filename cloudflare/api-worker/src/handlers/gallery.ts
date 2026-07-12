import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

export async function handleGalleryGet(url: URL, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const id = url.pathname.split("/")[2];
  if (id) {
    const img = await db.from("GalleryImage").select("*").eq("id", id).getOne();
    if (!img) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(img);
  }
  const images = await db.from("GalleryImage").select("*").order("sortOrder").get();
  return Response.json(images);
}

export async function handleGalleryCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const img = await db.from("GalleryImage").insert(body);
  return Response.json(img, { status: 201 });
}

export async function handleGalleryUpdate(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const img = await db.from("GalleryImage").update(id, body);
  return Response.json(img);
}

export async function handleGalleryDelete(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  await db.from("GalleryImage").delete(id);
  return new Response(null, { status: 204 });
}
