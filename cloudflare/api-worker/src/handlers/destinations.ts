import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

export async function handleDestinationsGet(url: URL, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const id = url.pathname.split("/")[2];
  if (id) {
    const dest = await db.from("Destination").select("*").eq("id", id).getOne();
    if (!dest) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(dest);
  }
  const dests = await db
    .from("Destination")
    .select("id,name,slug,type,isFeatured,countryId,stateId,image")
    .get();
  return Response.json(dests);
}

export async function handleDestinationsCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const dest = await db.from("Destination").insert(body);
  return Response.json(dest, { status: 201 });
}

export async function handleDestinationsUpdate(
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
  const dest = await db.from("Destination").update(id, body);
  return Response.json(dest);
}

export async function handleDestinationsDelete(
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
  await db.from("Destination").delete(id);
  return new Response(null, { status: 204 });
}
