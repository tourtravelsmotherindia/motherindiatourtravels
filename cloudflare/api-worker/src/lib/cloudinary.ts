/**
 * Signs a Cloudinary upload request.
 * Uses Web Crypto API (HMAC-SHA256) — fully compatible with Workers runtime.
 */
export async function signCloudinaryUpload(
  paramsToSign: Record<string, string>,
  apiSecret: string,
): Promise<string> {
  // Sort params alphabetically and build the signing string
  const signStr = Object.keys(paramsToSign)
    .sort()
    .map((k) => `${k}=${paramsToSign[k]}`)
    .join("&");

  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(apiSecret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"],
  );

  const sig = await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(signStr));

  return Array.from(new Uint8Array(sig))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

/**
 * Builds the public-facing image URL via the images worker.
 * Cloudinary's res.cloudinary.com URL is never exposed.
 */
export function buildImageUrl(
  publicId: string,
  transformations = "f_auto,q_auto",
  imagesBase = "https://images.motherindiatourtravels.com",
): string {
  return `${imagesBase}/${transformations}/${publicId}`;
}
