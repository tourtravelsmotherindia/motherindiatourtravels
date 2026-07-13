import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** GET /auth/check-init — returns true if no admin account exists yet */
export async function handleCheckInit(request: Request, env: Env): Promise<Response> {
  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  try {
    const admins = await db.from("User").select("id").eq("role", "ADMIN").get();
    const needsInitialization = admins.length === 0;
    return Response.json({ needsInitialization });
  } catch (err) {
    console.error("Check-init check failed:", err);
    // Safe fallback: allow initialization if database is not set up yet
    return Response.json({ needsInitialization: true });
  }
}

/** POST /auth/signup — registers the first admin user if no admin exists */
export async function handleSignup(request: Request, env: Env): Promise<Response> {
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

  // Check if any admin already exists
  try {
    const admins = await db.from("User").select("id").eq("role", "ADMIN").get();
    if (admins.length > 0) {
      return Response.json(
        { error: "Signup forbidden — admin account already exists" },
        { status: 403 },
      );
    }
  } catch (err) {
    console.warn("User table query during signup failed, proceeding:", err);
  }

  // Create account in Supabase Auth
  const user = await db.signUp(email, password);
  if (!user || !user.id) {
    return Response.json({ error: "Failed to create account in auth provider" }, { status: 400 });
  }

  // Initialize profile with ADMIN role in public.User
  try {
    await db.from("User").insert({
      id: user.id,
      email: email,
      role: "ADMIN",
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    });
  } catch (err) {
    console.error("Failed to insert admin row in public.User:", err);
    return Response.json(
      { error: "User created in auth, but failed to initialize public profile" },
      { status: 500 },
    );
  }

  // Automatically sign in the user
  const loginResult = await db.signIn(email, password);
  if (!loginResult) {
    return Response.json(
      { message: "Admin initialized successfully. Please log in." },
      { status: 201 },
    );
  }

  return Response.json({
    access_token: loginResult.access_token,
    refresh_token: loginResult.refresh_token,
    message: "Admin initialized successfully",
  });
}

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

/** POST /auth/refresh — refreshes the access token using a refresh token */
export async function handleRefresh(request: Request, env: Env): Promise<Response> {
  let body: { refresh_token?: string };
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const { refresh_token } = body;
  if (!refresh_token) {
    return Response.json({ error: "refresh_token is required" }, { status: 400 });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);
  const result = await db.refreshToken(refresh_token);

  if (!result) {
    return Response.json({ error: "Invalid or expired refresh token" }, { status: 401 });
  }

  return Response.json({
    access_token: result.access_token,
    refresh_token: result.refresh_token,
  });
}
