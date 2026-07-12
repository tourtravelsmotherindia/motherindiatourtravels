import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** POST /newsletter — saves subscriber email to NewsletterSubscriber */
export async function handleNewsletter(request: Request, env: Env): Promise<Response> {
  let body: { email?: string; name?: string };
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const email = (body.email || "").trim().toLowerCase();
  const name = (body.name || "").trim();

  if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    return Response.json({ error: "A valid email address is required" }, { status: 400 });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);

  try {
    // Upsert to handle duplicate subscriptions gracefully
    await db.from("NewsletterSubscriber").upsert({ email, name }, "email");
  } catch (err) {
    console.error("Newsletter upsert failed:", err);
    return Response.json({ error: "Failed to save subscription" }, { status: 500 });
  }

  return Response.json({ success: true });
}
