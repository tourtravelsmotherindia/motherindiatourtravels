"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Play, Star } from "lucide-react";
import Image from "next/image";
import { useState } from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import PrevNextNav from "@/components/ui/PrevNextNav";
import { type Review } from "@/types/review";

export default function TravelerMoments() {
  const [currentIndex, setCurrentIndex] = useState(0);

  const reviews: Review[] = [
    {
      id: 1,
      name: "Salahuddin Shakib",
      role: "Founder & CEO at Pixetive",
      avatar:
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&h=150&q=80",
      image:
        "https://images.unsplash.com/photo-1501555088652-021faa106b9b?auto=format&fit=crop&w=800&q=80",
      quote:
        "I am a traveler and Mother India Travels helps me a lot in finding interesting tourist destinations and of course the price offered is very worth it.",
      hasVideo: false,
      rating: 5,
    },
    {
      id: 2,
      name: "Sarah Johnson",
      role: "Verified Traveler",
      avatar:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&h=150&q=80",
      image:
        "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
      quote:
        "The view from Tiger Nest in Ladakh was absolutely breathtaking! A life-changing journey organized flawlessly.",
      hasVideo: true,
      rating: 5,
    },
    {
      id: 3,
      name: "Michael Chen",
      role: "Verified Traveler",
      avatar:
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&h=150&q=80",
      image:
        "https://images.unsplash.com/photo-1542401886-65d6c61db217?auto=format&fit=crop&w=800&q=80",
      quote:
        "Kerala houseboats are a dream! Every evening was magical, and the food was outstanding. Highly recommend them!",
      hasVideo: false,
      rating: 5,
    },
    {
      id: 4,
      name: "Emma Wilson",
      role: "Solo Backpacker",
      avatar:
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&h=150&q=80",
      image:
        "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
      quote:
        "Sleeping under the Jaisalmer desert stars was an experience of a lifetime. The staff was incredibly friendly.",
      hasVideo: false,
      rating: 5,
    },
  ];

  const handlePrev = () => {
    setCurrentIndex((prev) => (prev === 0 ? reviews.length - 1 : prev - 1));
  };

  const handleNext = () => {
    setCurrentIndex((prev) => (prev === reviews.length - 1 ? 0 : prev + 1));
  };

  const reviewA = reviews[currentIndex];
  const reviewB = reviews[(currentIndex + 1) % reviews.length];

  const rightSlot = (
    <PrevNextNav
      onPrev={handlePrev}
      onNext={handleNext}
      prevAriaLabel="Previous testimonial"
      nextAriaLabel="Next testimonial"
    />
  );

  return (
    <section id="blog" className="py-16 md:py-24 overflow-hidden layout-container">
      <SectionHeader
        title={
          <>
            <span className="md:hidden">Reviews</span>
            <span className="hidden md:inline">What Our Customers Say</span>
          </>
        }
        subtitle="Hear from our adventurers about their recent travel experiences"
        rightSlot={rightSlot}
      />

      {/* MOBILE VIEW: Horizontal scrolling cards */}
      <div className="flex overflow-x-auto md:hidden gap-4 snap-x snap-mandatory no-scrollbar pb-4">
        {reviews.map((review) => {
          return (
            <div
              key={review.id}
              className="w-[280px] shrink-0 snap-start bg-white rounded-[2rem] border border-border-light p-5 shadow-card transition-all duration-300 flex flex-col h-full"
            >
              {/* Image Container with Play Overlay if Video review */}
              <div className="relative h-60 w-full rounded-[1.5rem] overflow-hidden mb-5">
                <Image
                  src={review.image}
                  alt={`${review.name} travel moment`}
                  fill
                  sizes="(max-width: 768px) 100vw, 33vw"
                  className="object-cover transition-transform duration-500 hover:scale-103"
                />

                {/* Play Button Overlay */}
                {review.hasVideo && (
                  <div className="absolute inset-0 bg-black/15 flex items-center justify-center">
                    <motion.button
                      whileHover={{ scale: 1.1 }}
                      whileTap={{ scale: 0.95 }}
                      className="w-14 h-14 rounded-full bg-white/20 backdrop-blur-md border border-white/40 flex items-center justify-center text-white cursor-pointer shadow-lg hover:bg-white/30 transition-all"
                    >
                      <Play className="w-5 h-5 fill-white text-white translate-x-0.5" />
                    </motion.button>
                  </div>
                )}
              </div>

              {/* Review Text */}
              <blockquote className="text-sm font-semibold text-foreground/90 italic leading-relaxed mb-6 flex-grow">
                &ldquo;{review.quote}&rdquo;
              </blockquote>

              {/* User Metadata */}
              <div className="flex items-center gap-3.5 pt-4 border-t border-border-light">
                <div className="relative w-11 h-11 rounded-full overflow-hidden shrink-0">
                  <Image
                    src={review.avatar}
                    alt={review.name}
                    fill
                    sizes="44px"
                    className="object-cover"
                  />
                </div>
                <div className="flex-1 min-w-0">
                  <h4 className="text-sm font-bold text-foreground truncate">{review.name}</h4>
                  <div className="flex items-center gap-1.5 mt-0.5">
                    <span className="text-[10px] text-zinc-500 font-semibold uppercase tracking-wider">
                      {review.role}
                    </span>
                    <span className="w-1 h-1 rounded-full bg-zinc-300" />
                    <div className="flex items-center">
                      {[...Array(review.rating)].map((_, i) => (
                        <Star key={i} className="w-2.5 h-2.5 fill-amber-400 text-amber-400" />
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {/* DESKTOP VIEW: The new alternating grid layout matching reference */}
      <div className="hidden md:block min-h-[600px] relative">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentIndex}
            initial={{ opacity: 0, y: 15 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -15 }}
            transition={{ duration: 0.35, ease: "easeOut" }}
            className="flex flex-col gap-8"
          >
            {/* ROW 1: Image Left, Testimonial Right */}
            <div className="grid grid-cols-[4.2fr_5.8fr] gap-12 lg:gap-16 items-stretch">
              {/* Image side */}
              <div className="relative h-[240px] lg:h-[285px] w-full rounded-[2rem] overflow-hidden shadow-sm">
                <Image
                  src={reviewA.image}
                  alt={`${reviewA.name} travel moment`}
                  fill
                  sizes="(max-width: 1024px) 40vw, 550px"
                  className="object-cover"
                  priority
                />
                {reviewA.hasVideo && (
                  <div className="absolute inset-0 bg-black/15 flex items-center justify-center">
                    <button
                      type="button"
                      className="w-14 h-14 rounded-full bg-white/20 backdrop-blur-md border border-white/40 flex items-center justify-center text-white cursor-pointer shadow-lg hover:bg-white/30 transition-all"
                    >
                      <Play className="w-5 h-5 fill-white text-white translate-x-0.5" />
                    </button>
                  </div>
                )}
              </div>

              {/* Testimonial side */}
              <div className="flex flex-col justify-between py-2 px-4 h-full">
                <blockquote className="text-[1.25rem] lg:text-[1.45rem] font-medium text-foreground/90 leading-relaxed italic pr-8">
                  &ldquo;{reviewA.quote}&rdquo;
                </blockquote>

                <div className="flex items-center justify-between pt-4 border-t border-zinc-100">
                  <div className="flex items-center gap-4">
                    <div className="relative w-12 h-12 rounded-full overflow-hidden shrink-0">
                      <Image
                        src={reviewA.avatar}
                        alt={reviewA.name}
                        fill
                        sizes="48px"
                        className="object-cover animate-fade-in"
                      />
                    </div>
                    <div>
                      <h4 className="text-base font-bold text-foreground leading-snug">
                        {reviewA.name}
                      </h4>
                      <p className="text-xs text-zinc-500 font-normal mt-0.5">{reviewA.role}</p>
                    </div>
                  </div>

                  {/* Stars */}
                  <div className="flex items-center gap-0.5">
                    {[...Array(reviewA.rating)].map((_, i) => (
                      <Star key={i} className="w-4 h-4 fill-amber-400 text-amber-400" />
                    ))}
                  </div>
                </div>
              </div>
            </div>

            {/* ROW 2: Testimonial Left, Image Right */}
            <div className="grid grid-cols-[5.8fr_4.2fr] gap-12 lg:gap-16 items-stretch">
              {/* Testimonial side */}
              <div className="flex flex-col justify-between py-2 px-4 h-full">
                <blockquote className="text-[1.25rem] lg:text-[1.45rem] font-medium text-foreground/90 leading-relaxed italic pr-8">
                  &ldquo;{reviewB.quote}&rdquo;
                </blockquote>

                <div className="flex items-center justify-between pt-4 border-t border-zinc-100">
                  <div className="flex items-center gap-4">
                    <div className="relative w-12 h-12 rounded-full overflow-hidden shrink-0">
                      <Image
                        src={reviewB.avatar}
                        alt={reviewB.name}
                        fill
                        sizes="48px"
                        className="object-cover animate-fade-in"
                      />
                    </div>
                    <div>
                      <h4 className="text-base font-bold text-foreground leading-snug">
                        {reviewB.name}
                      </h4>
                      <p className="text-xs text-zinc-500 font-normal mt-0.5">{reviewB.role}</p>
                    </div>
                  </div>

                  {/* Stars */}
                  <div className="flex items-center gap-0.5">
                    {[...Array(reviewB.rating)].map((_, i) => (
                      <Star key={i} className="w-4 h-4 fill-amber-400 text-amber-400" />
                    ))}
                  </div>
                </div>
              </div>

              {/* Image side */}
              <div className="relative h-[240px] lg:h-[285px] w-full rounded-[2rem] overflow-hidden shadow-sm">
                <Image
                  src={reviewB.image}
                  alt={`${reviewB.name} travel moment`}
                  fill
                  sizes="(max-width: 1024px) 40vw, 550px"
                  className="object-cover"
                />
                {reviewB.hasVideo && (
                  <div className="absolute inset-0 bg-black/15 flex items-center justify-center">
                    <button
                      type="button"
                      className="w-14 h-14 rounded-full bg-white/20 backdrop-blur-md border border-white/40 flex items-center justify-center text-white cursor-pointer shadow-lg hover:bg-white/30 transition-all"
                    >
                      <Play className="w-5 h-5 fill-white text-white translate-x-0.5" />
                    </button>
                  </div>
                )}
              </div>
            </div>
          </motion.div>
        </AnimatePresence>
      </div>
    </section>
  );
}
