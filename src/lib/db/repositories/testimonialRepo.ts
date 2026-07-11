import { prisma } from "@/lib/db/prisma";

export interface ReviewItem {
  id: string;
  reviewer: string;
  review: string;
  rating: number;
  packageName: string;
  source: string;
  isApproved: boolean;
  isFeatured: boolean;
  createdAt: Date;
}

export async function getFeaturedTestimonials(): Promise<ReviewItem[]> {
  const testimonials = await prisma.testimonial.findMany({
    where: { isApproved: true, isFeatured: true },
    orderBy: { createdAt: "desc" },
  });

  return testimonials.map((t) => ({
    id: t.id,
    reviewer: t.reviewer,
    review: t.review,
    rating: t.rating,
    packageName: t.packageName,
    source: t.source,
    isApproved: t.isApproved,
    isFeatured: t.isFeatured,
    createdAt: t.createdAt,
  }));
}

export async function getAllTestimonials(): Promise<ReviewItem[]> {
  const testimonials = await prisma.testimonial.findMany({
    where: { isApproved: true },
    orderBy: { createdAt: "desc" },
  });

  return testimonials.map((t) => ({
    id: t.id,
    reviewer: t.reviewer,
    review: t.review,
    rating: t.rating,
    packageName: t.packageName,
    source: t.source,
    isApproved: t.isApproved,
    isFeatured: t.isFeatured,
    createdAt: t.createdAt,
  }));
}
