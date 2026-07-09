import { prisma } from "@/lib/db/prisma";

export async function getHeroSlides() {
  const slides = await prisma.heroSlide.findMany({ orderBy: { id: "asc" } });
  return {
    slides: slides.map((s) => ({
      id: s.id,
      image: s.image,
      tag: s.tag,
      title: s.title,
      description: s.description,
    })),
  };
}
