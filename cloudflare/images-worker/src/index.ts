interface Env {
  BUCKET: R2Bucket;
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
    if (!pathname || pathname === "/") {
      return new Response("Not Found", { status: 404 });
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
      return new Response(null, { headers });
    }

    const object = await env.BUCKET.get(key);
    if (!object) return new Response("Not Found", { status: 404 });

    const headers = new Headers();
    object.writeHttpMetadata(headers);
    headers.set("etag", object.httpEtag);
    headers.set("Cache-Control", `public, max-age=${CACHE_MAX_AGE}, stale-while-revalidate=86400`);
    headers.set("X-Content-Type-Options", "nosniff");

    const response = new Response(object.body, { headers });

    // Store in Cloudflare edge cache asynchronously
    ctx.waitUntil(cache.put(request, response.clone()));

    return response;
  },
} satisfies ExportedHandler<Env>;
