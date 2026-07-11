import { prisma } from "@/lib/db/prisma";
import type { HeroConfigData } from "@/types/hero";

export async function getHeroConfig(): Promise<HeroConfigData | null> {
  const config = await prisma.heroConfig.findUnique({
    where: { id: 1 },
    include: {
      slides: { orderBy: { sortOrder: "asc" } },
    },
  });

  if (!config) return null;

  return {
    id: config.id,
    mode: config.mode as "SLIDES" | "VIDEO",
    videoUrl: config.videoUrl,
    slides: config.slides.map((s) => ({
      id: s.id,
      image: s.image,
      tag: s.tag,
      title: s.title,
      description: s.description,
      sortOrder: s.sortOrder,
    })),
  };
}
