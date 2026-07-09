import { prisma } from "@/lib/db/prisma";

export async function getTestimonials() {
  const testimonials = await prisma.testimonial.findMany({
    orderBy: { id: "asc" },
  });
  return {
    total: testimonials.length,
    testimonials: testimonials.map((t) => ({
      id: t.id,
      reviewer: t.reviewer,
      review: t.review,
      rating: t.rating,
      package: t.package,
      source: t.source,
    })),
  };
}
