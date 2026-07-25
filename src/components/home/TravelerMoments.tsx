"use client";

import SectionHeader from "@/components/shared/SectionHeader";
import TestimonialMarquee from "@/components/ui/marquee-01";

export default function TravelerMoments() {
  return (
    <section id="testimonials" className="py-gap-section overflow-hidden layout-container">
      <SectionHeader
        title="What Our Customers Say"
        subtitle="Hear from our adventurers about their recent travel experiences"
      />
      <div className="mt-8">
        <TestimonialMarquee />
      </div>
    </section>
  );
}
