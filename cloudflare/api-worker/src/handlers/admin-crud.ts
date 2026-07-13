import { requireAdmin } from "../middleware/auth";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

// Map URL path slugs to exact Prisma database model names
const TABLE_MAP: Record<string, string> = {
  countries: "Country",
  states: "State",
  destinations: "Destination",
  attractions: "Attraction",
  categories: "Category",
  packages: "Package",
  "package-variants": "PackageVariant",
  "itinerary-days": "ItineraryDay",
  "hero-configs": "HeroConfig",
  "hero-slides": "HeroSlide",
  "site-sections": "SiteSection",
  faqs: "FAQ",
  "gallery-images": "GalleryImage",
  "blog-categories": "BlogPostCategory",
  "blog-posts": "BlogPost",
  bookings: "BookingInquiry",
  contacts: "ContactSubmission",
  subscribers: "NewsletterSubscriber",
  company: "Company",
  testimonials: "Testimonial",
  users: "User",
  "destination-neighbours": "DestinationNeighbour",
  "package-destinations": "PackageDestination",
  "package-categories": "PackageCategory",
  "package-attractions": "PackageAttraction",
  "system-status": "SystemStatus",
};

// Check if table has standard ID column
const COMPOSITE_TABLES = [
  "DestinationNeighbour",
  "PackageDestination",
  "PackageCategory",
  "PackageAttraction",
];

// Tables that use updatedAt timestamps
const TABLES_WITH_UPDATED_AT = [
  "Country",
  "Destination",
  "Package",
  "PackageVariant",
  "HeroConfig",
  "BlogPost",
  "BookingInquiry",
  "Company",
  "User",
  "SystemStatus",
];

// Resolves table name or returns error response
function getTableName(tableParam: string): { dbTableName?: string; errorResponse?: Response } {
  const dbTableName = TABLE_MAP[tableParam];
  if (!dbTableName) {
    return {
      errorResponse: Response.json(
        { error: `Table '${tableParam}' not supported or found` },
        { status: 400 },
      ),
    };
  }
  return { dbTableName };
}

// Generate auth headers for fetching Supabase REST endpoint directly
function getSupabaseHeaders(env: Env, extra: Record<string, string> = {}): Record<string, string> {
  const headers: Record<string, string> = {
    apikey: env.SUPABASE_SECRET_KEY,
    "Content-Type": "application/json",
    ...extra,
  };
  if (env.SUPABASE_SECRET_KEY && env.SUPABASE_SECRET_KEY.startsWith("eyJ")) {
    headers.Authorization = `Bearer ${env.SUPABASE_SECRET_KEY}`;
  }
  return headers;
}

// GET /admin/crud/:table or /admin/crud/:table/:id
export async function handleAdminCrudGet(request: Request, url: URL, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (r) {
    return r as Response;
  }

  const parts = url.pathname.split("/");
  const tableParam = parts[3];
  const id = parts[4];

  const { dbTableName, errorResponse } = getTableName(tableParam);
  if (errorResponse) return errorResponse;

  const targetUrl = new URL(`${env.SUPABASE_URL}/rest/v1/${dbTableName}`);

  if (id) {
    // Single record fetch
    targetUrl.searchParams.set("id", `eq.${id}`);
    const res = await fetch(targetUrl.toString(), {
      headers: getSupabaseHeaders(env),
    });

    if (!res.ok) {
      return Response.json({ error: await res.text() }, { status: res.status });
    }

    const data = (await res.json()) as any[];
    if (data.length === 0) {
      return Response.json({ error: "Record not found" }, { status: 404 });
    }
    return Response.json(data[0]);
  }

  // Forward query string for sorting, filtering, limits, pagination
  targetUrl.search = url.search;
  const res = await fetch(targetUrl.toString(), {
    headers: getSupabaseHeaders(env),
  });

  if (!res.ok) {
    return Response.json({ error: await res.text() }, { status: res.status });
  }

  const data = await res.json();
  return Response.json(data);
}

// POST /admin/crud/:table
export async function handleAdminCrudCreate(
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
  const tableParam = parts[3];

  const { dbTableName, errorResponse } = getTableName(tableParam);
  if (errorResponse) return errorResponse;

  let body: Record<string, any>;
  try {
    body = (await request.json()) as Record<string, any>;
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  // Auto-generate standard IDs for models using CUID/UUID if not provided
  if (dbTableName && !COMPOSITE_TABLES.includes(dbTableName)) {
    if (!body.id) {
      body.id = crypto.randomUUID();
    }
  }

  // Inject updatedAt timestamp if model has it
  if (dbTableName && TABLES_WITH_UPDATED_AT.includes(dbTableName) && !body.updatedAt) {
    body.updatedAt = new Date().toISOString();
  }

  const targetUrl = `${env.SUPABASE_URL}/rest/v1/${dbTableName}`;
  const res = await fetch(targetUrl, {
    method: "POST",
    headers: getSupabaseHeaders(env, { Prefer: "return=representation" }),
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    return Response.json({ error: await res.text() }, { status: res.status });
  }

  const data = (await res.json()) as any[];
  return Response.json(data[0] ?? {}, { status: 201 });
}

// PATCH /admin/crud/:table/:id or /admin/crud/:table
export async function handleAdminCrudUpdate(
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
  const tableParam = parts[3];
  const id = parts[4];

  const { dbTableName, errorResponse } = getTableName(tableParam);
  if (errorResponse) return errorResponse;

  let body: Record<string, any>;
  try {
    body = (await request.json()) as Record<string, any>;
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  // Update updatedAt timestamp
  if (dbTableName && TABLES_WITH_UPDATED_AT.includes(dbTableName)) {
    body.updatedAt = new Date().toISOString();
  }

  const targetUrl = new URL(`${env.SUPABASE_URL}/rest/v1/${dbTableName}`);
  if (id) {
    targetUrl.searchParams.set("id", `eq.${id}`);
  } else {
    // Update matching rows based on query params (e.g. composite keys)
    targetUrl.search = url.search;
  }

  const res = await fetch(targetUrl.toString(), {
    method: "PATCH",
    headers: getSupabaseHeaders(env, { Prefer: "return=representation" }),
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    return Response.json({ error: await res.text() }, { status: res.status });
  }

  const data = (await res.json()) as any[];
  if (data.length === 0) {
    return Response.json({ error: "Record not found or no changes made" }, { status: 404 });
  }
  return Response.json(data[0]);
}

// DELETE /admin/crud/:table/:id or /admin/crud/:table
export async function handleAdminCrudDelete(
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
  const tableParam = parts[3];
  const id = parts[4];

  const { dbTableName, errorResponse } = getTableName(tableParam);
  if (errorResponse) return errorResponse;

  const targetUrl = new URL(`${env.SUPABASE_URL}/rest/v1/${dbTableName}`);
  if (id) {
    targetUrl.searchParams.set("id", `eq.${id}`);
  } else {
    // Delete matching rows based on query params (e.g. composite keys)
    targetUrl.search = url.search;
  }

  const res = await fetch(targetUrl.toString(), {
    method: "DELETE",
    headers: getSupabaseHeaders(env),
  });

  if (!res.ok) {
    return Response.json({ error: await res.text() }, { status: res.status });
  }

  return new Response(null, { status: 204 });
}
