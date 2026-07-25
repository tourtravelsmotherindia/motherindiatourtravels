import SectionHeader from "@/components/shared/SectionHeader";
import TestimonialMarquee from "@/components/ui/marquee-01";
import { type ReviewItem } from "@/types/review";

export default function TravelerMoments({ testimonials }: { testimonials: ReviewItem[] }) {
  return (
    <section id="testimonials" className="py-gap-section overflow-hidden layout-container">
      <SectionHeader
        title="What Our Customers Say"
        subtitle="Hear from our adventurers about their recent travel experiences"
      />
      <div className="mt-8">
        <TestimonialMarquee testimonials={testimonials} />
      </div>
    </section>
  );
}
