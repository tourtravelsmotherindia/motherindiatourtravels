/**
 * Mother India Tour Travels — Images Worker
 *
 * Serves Cloudinary images via images.motherindiatourtravels.com
 * hiding the real Cloudinary URL from the browser.
 *
 * Request pattern:
 *   images.motherindiatourtravels.com/f_auto,q_auto,w_800/mother-india/photo.jpg
 *
 * Proxies to:
 *   res.cloudinary.com/{cloud}/image/upload/f_auto,q_auto,w_800/mother-india/photo.jpg
 *
 * Cache strategy: 30 days at Cloudflare edge (Cache-Control: public, max-age=2592000)
 */

interface Env {
  /** Cloudinary cloud name — set via: npx wrangler secret put CLOUDINARY_CLOUD */
  CLOUDINARY_CLOUD: string;
}

const CACHE_MAX_AGE = 2_592_000; // 30 days in seconds

export default {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    // Only allow GET and HEAD
    if (request.method !== "GET" && request.method !== "HEAD") {
      return new Response("Method Not Allowed", { status: 405 });
    }

    const cache = caches.default;

    // Check Cloudflare edge cache first
    const cached = await cache.match(request);
    if (cached) return cached;

    const { pathname, search } = new URL(request.url);

    if (!pathname || pathname === "/") {
      return new Response("Not Found", { status: 404 });
    }

    const cloudinaryOrigin = `https://res.cloudinary.com/${env.CLOUDINARY_CLOUD}/image/upload`;
    const upstream = `${cloudinaryOrigin}${pathname}${search}`;

    let upstreamResponse: Response;
    try {
      upstreamResponse = await fetch(upstream, {
        method: request.method,
        headers: {
          // Forward useful headers for Cloudinary optimization
          Accept: request.headers.get("Accept") ?? "image/*",
        },
        cf: {
          // Tell Cloudflare to cache the upstream response too
          cacheEverything: true,
          cacheTtl: CACHE_MAX_AGE,
        },
      });
    } catch {
      return new Response("Bad Gateway — could not reach image origin", { status: 502 });
    }

    if (!upstreamResponse.ok && upstreamResponse.status !== 304) {
      return new Response(`Image not found (upstream ${upstreamResponse.status})`, {
        status: upstreamResponse.status,
      });
    }

    // Build the response with long-lived cache headers
    const response = new Response(upstreamResponse.body, {
      status: upstreamResponse.status,
      headers: buildCacheHeaders(upstreamResponse),
    });

    // Store in Cloudflare edge cache asynchronously
    ctx.waitUntil(cache.put(request, response.clone()));

    return response;
  },
} satisfies ExportedHandler<Env>;

/**
 * Builds the response headers, preserving Content-Type from Cloudinary
 * and setting long-lived cache-control headers.
 */
function buildCacheHeaders(upstream: Response): Headers {
  const headers = new Headers();

  // Preserve content metadata from Cloudinary
  const preserve = ["Content-Type", "Content-Length", "ETag", "Last-Modified"];
  for (const h of preserve) {
    const val = upstream.headers.get(h);
    if (val) headers.set(h, val);
  }

  // Long-lived public cache — 30 days
  headers.set("Cache-Control", `public, max-age=${CACHE_MAX_AGE}, stale-while-revalidate=86400`);

  // Security headers
  headers.set("X-Content-Type-Options", "nosniff");
  headers.set("Vary", "Accept");

  return headers;
}
