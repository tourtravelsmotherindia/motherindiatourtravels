/**
 * Utility to optimize Pexels and Unsplash remote images by overriding
 * query parameters for size and quality. Since static export is used,
 * client-side optimization via remote image parameters is highly efficient.
 */
export function getOptimizedImageUrl(url: string, width: number, quality = 80): string {
  if (!url) return "/images/placeholder-landscape.png";

  try {
    // If it's a relative path or local image, return as-is
    if (url.startsWith("/") || !url.startsWith("http")) {
      return url;
    }

    const parsedUrl = new URL(url);

    // Optimize Unsplash images
    if (parsedUrl.hostname.includes("unsplash.com")) {
      parsedUrl.searchParams.set("w", width.toString());
      parsedUrl.searchParams.set("q", quality.toString());
      parsedUrl.searchParams.set("fit", "crop");
      parsedUrl.searchParams.set("auto", "format");
      return parsedUrl.toString();
    }

    // Optimize Pexels images
    if (parsedUrl.hostname.includes("pexels.com")) {
      parsedUrl.searchParams.set("w", width.toString());
      // Deleting height ('h') allows Pexels/imgix to scale the image proportionally
      parsedUrl.searchParams.delete("h");
      parsedUrl.searchParams.set("auto", "compress");
      parsedUrl.searchParams.set("cs", "tinysrgb");
      return parsedUrl.toString();
    }

    // Optimize our own Cloudflare R2 worker images
    if (parsedUrl.hostname.includes("images.motherindiatourtravels.com")) {
      parsedUrl.searchParams.set("w", width.toString());
      parsedUrl.searchParams.set("q", quality.toString());
      return parsedUrl.toString();
    }
  } catch (e) {
    console.error("Failed to parse image URL in optimizer", e);
  }

  return url;
}
