"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronLeft, ChevronRight } from "lucide-react";
import Image from "next/image";
import { useCallback, useEffect, useState } from "react";

import HideScrollbar from "@/components/shared/HideScrollbar";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type HeroConfigData } from "@/types/hero";

const AUTO_ROTATE_INTERVAL = 5000;

export default function Hero({ heroConfig }: { heroConfig?: HeroConfigData | null }) {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [isPaused, setIsPaused] = useState(false);

  const isVideoMode = heroConfig?.mode === "VIDEO" && heroConfig.videoUrl;
  const slides = heroConfig?.slides ?? [];
  const totalSlides = slides.length;

  const goToSlide = useCallback(
    (index: number) => setCurrentSlide((index + totalSlides) % totalSlides),
    [totalSlides],
  );

  const nextSlide = useCallback(() => goToSlide(currentSlide + 1), [currentSlide, goToSlide]);
  const prevSlide = useCallback(() => goToSlide(currentSlide - 1), [currentSlide, goToSlide]);

  useEffect(() => {
    if (isPaused || totalSlides <= 1) return;
    const timer = setInterval(nextSlide, AUTO_ROTATE_INTERVAL);
    return () => clearInterval(timer);
  }, [nextSlide, isPaused, totalSlides]);

  if (!heroConfig) return null;
  if (isVideoMode) {
    return (
      <section
        id="home"
        className="relative w-full h-[100dvh] overflow-hidden bg-black"
        aria-label="Hero video"
      >
        <HideScrollbar />
        <video
          src={heroConfig.videoUrl}
          autoPlay
          loop
          muted
          playsInline
          className="absolute inset-0 w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-black/30 pointer-events-none" />
      </section>
    );
  }

  if (totalSlides === 0) return null;

  return (
    <section
      id="home"
      className="relative w-full h-[100dvh] overflow-hidden bg-black"
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      aria-label="Hero slider"
    >
      <HideScrollbar />
      <div className="relative h-full w-full overflow-hidden">
        <AnimatePresence mode="wait">
          <motion.div
            key={slides[currentSlide].id}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 1.2, ease: "easeInOut" }}
            className="absolute inset-0"
          >
            <Image
              src={getOptimizedImageUrl(slides[currentSlide].image, 1600)}
              alt={slides[currentSlide].title}
              fill
              sizes="100vw"
              priority
              className="object-cover object-center"
            />
          </motion.div>
        </AnimatePresence>

        {/* Dynamic overlay gradients to look premium and guarantee text readability */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/25 to-black/35 pointer-events-none" />
        <div className="absolute inset-0 bg-gradient-to-r from-black/40 via-transparent to-transparent pointer-events-none" />

        {/* Slide Text Content */}
        <AnimatePresence mode="wait">
          <motion.div
            key={`content-${slides[currentSlide].id}`}
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.5, delay: 0.15 }}
            className="absolute inset-0 flex items-end pb-24 md:pb-32 lg:pb-36 px-6 sm:px-12 md:px-16 lg:px-24"
          >
            <div className="max-w-3xl text-left z-10">
              {slides[currentSlide].tag && (
                <span className="inline-block text-white font-semibold tracking-[0.25em] text-[10px] uppercase bg-black/30 backdrop-blur-md px-4 py-2 rounded-full border border-white/15 mb-5">
                  {slides[currentSlide].tag}
                </span>
              )}
              <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-extrabold text-white leading-[1.1] tracking-tight font-display [text-shadow:0_2px_15px_rgba(0,0,0,0.4)]">
                {slides[currentSlide].title}
              </h1>
              {slides[currentSlide].description && (
                <p className="text-white/80 mt-5 sm:mt-6 text-sm sm:text-base md:text-lg max-w-lg leading-relaxed [text-shadow:0_1px_8px_rgba(0,0,0,0.3)]">
                  {slides[currentSlide].description}
                </p>
              )}
            </div>
          </motion.div>
        </AnimatePresence>

        {/* Slide Navigation Arrows */}
        {totalSlides > 1 && (
          <>
            <button
              type="button"
              onClick={prevSlide}
              className="absolute top-1/2 left-4 md:left-6 transform -translate-y-1/2 z-20 w-10 h-10 md:w-12 md:h-12 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white flex items-center justify-center hover:bg-white/25 transition-all duration-300 cursor-pointer"
              aria-label="Previous slide"
            >
              <ChevronLeft className="w-5 h-5 md:w-6 md:h-6" />
            </button>
            <button
              type="button"
              onClick={nextSlide}
              className="absolute top-1/2 right-4 md:right-6 transform -translate-y-1/2 z-20 w-10 h-10 md:w-12 md:h-12 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white flex items-center justify-center hover:bg-white/25 transition-all duration-300 cursor-pointer"
              aria-label="Next slide"
            >
              <ChevronRight className="w-5 h-5 md:w-6 md:h-6" />
            </button>
          </>
        )}

        {/* Slide Indicators */}
        {totalSlides > 1 && (
          <div className="absolute bottom-10 left-6 sm:left-12 md:left-16 lg:left-24 z-20 flex gap-2.5">
            {slides.map((_, index) => (
              <button
                type="button"
                key={index}
                onClick={() => goToSlide(index)}
                className={`w-2.5 h-2.5 rounded-full transition-all duration-300 cursor-pointer ${
                  index === currentSlide
                    ? "bg-white scale-110 shadow-lg shadow-white/30"
                    : "bg-white/40 hover:bg-white/70"
                }`}
                aria-label={`Go to slide ${index + 1}`}
              />
            ))}
          </div>
        )}
      </div>
    </section>
  );
}
