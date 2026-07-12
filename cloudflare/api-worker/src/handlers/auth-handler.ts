import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** POST /auth/login — exchanges email+password for Supabase JWT */
export async function handleLogin(request: Request, env: Env): Promise<Response> {
  let body: { email?: string; password?: string };
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const { email, password } = body;
  if (!email || !password) {
    return Response.json({ error: "email and password are required" }, { status: 400 });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const result = await db.signIn(email, password);

  if (!result) {
    return Response.json({ error: "Invalid credentials" }, { status: 401 });
  }

  return Response.json({
    access_token: result.access_token,
    refresh_token: result.refresh_token,
  });
}
