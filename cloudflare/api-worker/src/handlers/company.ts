import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** GET /company — public fetch of Company profile */
export async function handleCompanyGet(env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const company = await db
    .from("Company")
    .select(
      "id,name,tagline,description,email,phone,whatsapp,address,city,state,country,pincode,mapEmbedUrl,socialLinks,logoUrl,establishedYear",
    )
    .getOne();
  if (!company) return Response.json({ error: "Company profile not found" }, { status: 404 });
  return Response.json(company);
}

/** PATCH /company — admin update Company profile (single-row table) */
export async function handleCompanyUpdate(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }
  const body = (await request.json()) as Record<string, unknown>;
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);

  // Fetch the existing company record to get its id
  const existing = await db.from("Company").select("id").getOne<{ id: string }>();
  if (!existing) {
    return Response.json({ error: "Company profile not found" }, { status: 404 });
  }

  const updated = await db.from("Company").update(existing.id, body);
  return Response.json(updated);
}
