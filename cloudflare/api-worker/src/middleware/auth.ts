import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/**
 * Extracts Bearer token from Authorization header.
 */
export function extractToken(request: Request): string | null {
  const auth = request.headers.get("Authorization");
  if (!auth?.startsWith("Bearer ")) return null;
  return auth.slice(7).trim();
}

/**
 * Verifies the admin JWT via Supabase Auth /user endpoint.
 * Returns the authenticated user or throws a 401 Response.
 */
export async function requireAdmin(
  request: Request,
  env: Env,
): Promise<{ id: string; email: string }> {
  const token = extractToken(request);
  if (!token) {
    throw new Response(JSON.stringify({ error: "Unauthorized — missing token" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const user = await db.verifyToken(token);

  if (!user) {
    throw new Response(JSON.stringify({ error: "Unauthorized — invalid token" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  // Verify user role is ADMIN in the User database table
  try {
    const dbUser = await db
      .from("User")
      .select("role")
      .eq("email", user.email)
      .getOne<{ role: string }>();

    if (!dbUser || dbUser.role !== "ADMIN") {
      throw new Response(JSON.stringify({ error: "Forbidden — admin privileges required" }), {
        status: 403,
        headers: { "Content-Type": "application/json" },
      });
    }
  } catch (err) {
    console.error("Admin authorization check failed:", err);
    throw new Response(JSON.stringify({ error: "Internal server error authorizing user" }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }

  return user;
}
