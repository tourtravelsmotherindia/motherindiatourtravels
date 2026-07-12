import { createSupabaseClient } from "../lib/supabase";
import { requireAdmin } from "../middleware/auth";
import type { Env } from "../types";

/** GET /tours — public list, GET /tours/:id — public detail */
export async function handleToursGet(url: URL, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  const id = url.pathname.split("/")[2]; // /tours/:id

  if (id) {
    const pkg = await db.from("Package").select("*").eq("id", id).getOne();
    if (!pkg) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(pkg);
  }

  const packages = await db
    .from("Package")
    .select("id,slug,name,heroImage,isPopular,isDomestic,countryId,stateId")
    .get();
  return Response.json(packages);
}

/** POST /tours — admin create package */
export async function handleToursCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  const pkg = await db.from("Package").insert(body);
  return Response.json(pkg, { status: 201 });
}

/** PATCH /tours/:id — admin update package */
export async function handleToursUpdate(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  const pkg = await db.from("Package").update(id, body);
  return Response.json(pkg);
}

/** DELETE /tours/:id — admin delete package */
export async function handleToursDelete(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  await db.from("Package").delete(id);
  return new Response(null, { status: 204 });
}
