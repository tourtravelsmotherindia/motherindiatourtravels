/**
 * Returns CORS preflight/response headers.
 * Only allows requests from the configured ALLOWED_ORIGIN.
 */
export function corsHeaders(allowedOrigin: string, requestOrigin: string | null): HeadersInit {
  const origin = requestOrigin && requestOrigin === allowedOrigin ? allowedOrigin : allowedOrigin;

  return {
    "Access-Control-Allow-Origin": origin,
    "Access-Control-Allow-Methods": "GET, POST, PATCH, DELETE, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type, Authorization",
    "Access-Control-Max-Age": "86400",
  };
}

/** Handles CORS preflight OPTIONS requests */
export function handleOptions(request: Request, allowedOrigin: string): Response | null {
  if (request.method !== "OPTIONS") return null;
  return new Response(null, {
    status: 204,
    headers: corsHeaders(allowedOrigin, request.headers.get("origin")),
  });
}

/** Wraps a Response with CORS headers */
export function withCors(
  response: Response,
  allowedOrigin: string,
  requestOrigin: string | null,
): Response {
  const res = new Response(response.body, response);
  const hdrs = corsHeaders(allowedOrigin, requestOrigin);
  for (const [k, v] of Object.entries(hdrs)) {
    res.headers.set(k, v as string);
  }
  return res;
}
