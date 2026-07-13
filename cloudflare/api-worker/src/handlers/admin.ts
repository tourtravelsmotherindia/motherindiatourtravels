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
