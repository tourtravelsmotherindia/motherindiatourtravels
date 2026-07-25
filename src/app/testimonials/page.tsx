import { type Metadata } from "next";
import { Suspense } from "react";

import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllTestimonials } from "@/lib/db/repositories/testimonialRepo";

import TestimonialsClient from "./TestimonialsClient";

export const metadata: Metadata = {
  title: "Customer Testimonials | Mother India Tour Travels",
  description:
    "Read reviews and feedback from travelers who explored India and abroad with Mother India Tour Travels. Real testimonials from Google and TripAdvisor.",
  alternates: {
    canonical: "/testimonials/",
  },
};

export default async function TestimonialsPage() {
  const [reviews, companyData] = await Promise.all([getAllTestimonials(), getCompanyData()]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading traveler testimonials...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/testimonials" />
      <TestimonialsClient initialReviews={reviews} companyData={companyData} />
    </Suspense>
  );
}
