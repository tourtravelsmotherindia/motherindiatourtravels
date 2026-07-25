import { prisma } from "@/lib/db/prisma";
import { type ReviewItem } from "@/types/review";

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
    avatar: t.avatar,
    reviewLink: t.reviewLink,
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
    avatar: t.avatar,
    reviewLink: t.reviewLink,
    isApproved: t.isApproved,
    isFeatured: t.isFeatured,
    createdAt: t.createdAt,
  }));
}
