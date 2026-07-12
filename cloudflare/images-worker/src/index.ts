interface Env {
  BUCKET: R2Bucket;
  ENVIRONMENT: string;
  ALLOWED_ORIGIN: string;
}

const CACHE_MAX_AGE = 2_592_000; // 30 days in seconds

export default {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    // Only allow GET and HEAD
    if (request.method !== "GET" && request.method !== "HEAD") {
      return new Response("Method Not Allowed", { status: 405 });
    }

    const cache = caches.default;
    const cached = await cache.match(request);
    if (cached) return cached;

    const { pathname } = new URL(request.url);
    if (!pathname || pathname === "/" || pathname === "/health") {
      return Response.json({
        status: "healthy",
        worker: "images-worker",
        environment: env.ENVIRONMENT || "production",
        timestamp: Date.now(),
      });
    }

    const key = decodeURIComponent(pathname.substring(1));

    if (request.method === "HEAD") {
      const object = await env.BUCKET.head(key);
      if (!object) return new Response("Not Found", { status: 404 });

      const headers = new Headers();
      object.writeHttpMetadata(headers);
      headers.set("etag", object.httpEtag);
      headers.set(
        "Cache-Control",
        `public, max-age=${CACHE_MAX_AGE}, stale-while-revalidate=86400`,
      );

      const origin = request.headers.get("origin");
      if (env.ENVIRONMENT === "development") {
        headers.set("Access-Control-Allow-Origin", origin || "*");
      } else {
        headers.set("Access-Control-Allow-Origin", env.ALLOWED_ORIGIN);
      }

      return new Response(null, { headers });
    }

    const object = await env.BUCKET.get(key);
    if (!object) return new Response("Not Found", { status: 404 });

    const headers = new Headers();
    object.writeHttpMetadata(headers);
    headers.set("etag", object.httpEtag);
    headers.set("Cache-Control", `public, max-age=${CACHE_MAX_AGE}, stale-while-revalidate=86400`);
    headers.set("X-Content-Type-Options", "nosniff");

    const origin = request.headers.get("origin");
    if (env.ENVIRONMENT === "development") {
      headers.set("Access-Control-Allow-Origin", origin || "*");
    } else {
      headers.set("Access-Control-Allow-Origin", env.ALLOWED_ORIGIN);
    }

    const response = new Response(object.body, { headers });

    // Store in Cloudflare edge cache asynchronously
    ctx.waitUntil(cache.put(request, response.clone()));

    return response;
  },
} satisfies ExportedHandler<Env>;
