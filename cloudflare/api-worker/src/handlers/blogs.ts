import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

export async function handleBlogsGet(url: URL, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const id = url.pathname.split("/")[2];
  if (id) {
    const post = await db.from("BlogPost").select("*").eq("id", id).getOne();
    if (!post) return Response.json({ error: "Not found" }, { status: 404 });
    return Response.json(post);
  }
  const posts = await db
    .from("BlogPost")
    .select(
      "id,slug,title,excerpt,coverImage,isPublished,isFeatured,publishedAt,categoryId,destinationId",
    )
    .order("createdAt", false)
    .get();
  return Response.json(posts);
}

export async function handleBlogsCreate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const post = await db.from("BlogPost").insert({
    id: body.id || crypto.randomUUID(),
    ...body,
    updatedAt: new Date().toISOString(),
  });
  return Response.json(post, { status: 201 });
}

export async function handleBlogsUpdate(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const post = await db.from("BlogPost").update(id, {
    ...body,
    updatedAt: new Date().toISOString(),
  });
  return Response.json(post);
}

export async function handleBlogsDelete(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const id = url.pathname.split("/")[2];
  if (!id) return Response.json({ error: "id required" }, { status: 400 });
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  await db.from("BlogPost").delete(id);
  return new Response(null, { status: 204 });
}
