"use client";

import React, { useState } from "react";
import Image from "next/image";
import { Play, ArrowLeft, ArrowRight, Star } from "lucide-react";
import { motion } from "framer-motion";

interface Review {
  id: number;
  name: string;
  role: string;
  avatar: string;
  image: string;
  quote: string;
  hasVideo: boolean;
  rating: number;
}

export default function TravelerMoments() {
  const [currentIndex, setCurrentIndex] = useState(0);

  const reviews: Review[] = [
    {
      id: 1,
      name: "Sarah Johnson",
      role: "Verified Traveler",
      avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&h=150&q=80",
      image: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80",
      quote: "The view from Tiger Nest in Ladakh was absolutely breathtaking! A life-changing journey organized flawlessly.",
      hasVideo: true,
      rating: 5,
    },
    {
      id: 2,
      name: "Michael Chen",
      role: "Verified Traveler",
      avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&h=150&q=80",
      image: "https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=600&q=80",
      quote: "Kerala houseboats are a dream! Every evening was magical, and the food was outstanding. Highly recommend them!",
      hasVideo: false,
      rating: 5,
    },
    {
      id: 3,
      name: "Emma Wilson",
      role: "Verified Traveler",
      avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&h=150&q=80",
      image: "https://images.unsplash.com/photo-1472214222541-d510753a49fa?auto=format&fit=crop&w=600&q=80",
      quote: "Sleeping under the Jaisalmer desert stars was an experience of a lifetime. The staff was incredibly friendly.",
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

  return (
    <section className="py-16 px-4 md:px-8 max-w-[1440px] mx-auto overflow-hidden">
      {/* Section Header */}
      <div className="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-4">
        <div>
          <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
            Traveler <span className="font-serif italic font-medium text-brand">Moments</span>
          </h2>
          <p className="text-muted font-medium mt-2">
            Hear from our adventurers about their recent travel experiences
          </p>
        </div>
        {/* Navigation Buttons */}
        <div className="flex items-center gap-3 shrink-0">
          <button
            onClick={handlePrev}
            className="w-11 h-11 rounded-full border border-border-light bg-white flex items-center justify-center text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/20 transition-all duration-200 cursor-pointer shadow-sm"
            aria-label="Previous testimonial"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <button
            onClick={handleNext}
            className="w-11 h-11 rounded-full border border-border-light bg-white flex items-center justify-center text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/20 transition-all duration-200 cursor-pointer shadow-sm"
            aria-label="Next testimonial"
          >
            <ArrowRight className="w-5 h-5" />
          </button>
        </div>
      </div>

      {/* Testimonials Layout Grid */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {reviews.map((review, idx) => {
          // Adjust display indices to simulate shifting carousel on desktop
          const displayIdx = (idx - currentIndex + reviews.length) % reviews.length;
          
          return (
            <motion.div
              layout
              initial={{ opacity: 0, scale: 0.95 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5 }}
              key={review.id}
              className={`bg-white rounded-[2rem] border border-border-light p-5 shadow-card hover:shadow-premium transition-all duration-300 flex flex-col h-full ${
                displayIdx === 0 ? "order-first" : displayIdx === 1 ? "order-none" : "order-last"
              }`}
            >
              {/* Image Container with Play Overlay if Video review */}
              <div className="relative h-60 w-full rounded-2xl overflow-hidden mb-5">
                <Image
                  src={review.image}
                  alt={`${review.name} travel moment`}
                  fill
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
                    className="object-cover"
                  />
                </div>
                <div className="flex-1 min-w-0">
                  <h4 className="text-sm font-extrabold text-foreground truncate">
                    {review.name}
                  </h4>
                  <div className="flex items-center gap-1.5 mt-0.5">
                    <span className="text-[10px] text-brand font-bold uppercase tracking-wider">
                      {review.role}
                    </span>
                    <span className="w-1 h-1 rounded-full bg-brand" />
                    <div className="flex items-center">
                      {[...Array(review.rating)].map((_, i) => (
                        <Star key={i} className="w-2.5 h-2.5 fill-amber-400 text-amber-400" />
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </motion.div>
          );
        })}
      </div>
    </section>
  );
}
