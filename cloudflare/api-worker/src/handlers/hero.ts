import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

export async function handleHeroGet(env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  const config = await db.from("HeroConfig").select("*").eq("id", 1).getOne();
  const slides = await db
    .from("HeroSlide")
    .select("*")
    .eq("heroConfigId", 1)
    .order("sortOrder")
    .get();
  return Response.json({ ...config, slides });
}

export async function handleHeroUpdate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_KEY);
  const config = await db.from("HeroConfig").update("1", body);
  return Response.json(config);
}
