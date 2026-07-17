import { withBuildCache } from "@/lib/db/buildCache";
import { prisma } from "@/lib/db/prisma";
import type { GallerySectionData } from "@/types/gallery";

export async function getGallerySectionData(): Promise<GallerySectionData> {
  return withBuildCache("gallery-section", async () => {
    const [images, section] = await Promise.all([
      prisma.galleryImage.findMany({
        orderBy: { sortOrder: "asc" },
        include: {
          destination: { select: { name: true, slug: true } },
        },
      }),
      prisma.siteSection.findUnique({ where: { key: "gallery" } }),
    ]);

    return {
      tagline: section?.tagline ?? "Our Travel Gallery",
      subtitle:
        section?.subtitle ??
        "Catch a glimpse of the mesmerizing landscapes, historical monuments, and soulful cultures captured during our curated trips.",
      images: images.map((img) => ({
        id: img.id,
        title: img.title,
        location: img.location,
        image: img.image,
        altText: img.altText,
        sortOrder: img.sortOrder,
        destinationId: img.destinationId,
        destinationName: img.destination?.name ?? null,
        destinationSlug: img.destination?.slug ?? null,
      })),
    };
  });
}
