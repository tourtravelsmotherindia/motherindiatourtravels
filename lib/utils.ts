// Pure utility functions — safe to import in both server and client components
// No Node.js dependencies (no 'fs', 'path', etc.)

// ─── Double-Encoded JSON Helper ──────────────────────────────
/**
 * Safely decode a value that may be a JSON-encoded string.
 * Returns the parsed value if the input is a string containing valid JSON,
 * otherwise returns the value as-is.
 */
export function decodeJsonField<T>(val: T | string): T {
  if (typeof val !== "string") return val as T;
  try {
    const parsed = JSON.parse(val);
    return parsed as T;
  } catch {
    return val as unknown as T;
  }
}

// ─── Media URL Resolver ──────────────────────────────────────
/**
 * Resolve a media path to a full URL.
 * Mirrors the PHP getMediaUrl() function.
 */
export function resolveMediaUrl(mediaPath: string | null | undefined): string {
  if (!mediaPath) return "";
  if (typeof mediaPath !== "string") return "";
  const cleaned = mediaPath.replace(/\/\//g, "/").replace(/^\//, "");
  if (cleaned.startsWith("http")) return cleaned;
  return `https://travelxploria.com/uploads_media/${cleaned}`;
}
