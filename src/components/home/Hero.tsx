"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronLeft, ChevronRight, Search, SlidersHorizontal } from "lucide-react";
import Image from "next/image";
import { useRouter } from "next/navigation";
import { useCallback, useEffect, useState } from "react";

import HideScrollbar from "@/components/shared/HideScrollbar";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type HeroConfigData } from "@/types/hero";

const AUTO_ROTATE_INTERVAL = 5000;

export default function Hero({ heroConfig }: { heroConfig?: HeroConfigData | null }) {
  const router = useRouter();
  const [currentSlide, setCurrentSlide] = useState(0);
  const [direction, setDirection] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");

  const isVideoMode = heroConfig?.mode === "VIDEO" && heroConfig.videoUrl;
  const slides = heroConfig?.slides ?? [];
  const totalSlides = slides.length;

  const goToSlide = useCallback(
    (index: number) => {
      setDirection(index > currentSlide ? 1 : -1);
      setCurrentSlide((index + totalSlides) % totalSlides);
    },
    [currentSlide, totalSlides],
  );

  const nextSlide = useCallback(() => {
    setDirection(1);
    setCurrentSlide((prev) => (prev + 1) % totalSlides);
  }, [totalSlides]);

  const prevSlide = useCallback(() => {
    setDirection(-1);
    setCurrentSlide((prev) => (prev - 1 + totalSlides) % totalSlides);
  }, [totalSlides]);

  useEffect(() => {
    if (isPaused || totalSlides <= 1) return;
    const timer = setInterval(nextSlide, AUTO_ROTATE_INTERVAL);
    return () => clearInterval(timer);
  }, [nextSlide, isPaused, totalSlides]);

  const handleDragEnd = useCallback(
    (_: unknown, info: { offset: { x: number }; velocity: { x: number } }) => {
      const swipeThreshold = 50;
      if (info.offset.x < -swipeThreshold || info.velocity.x < -500) {
        nextSlide();
      } else if (info.offset.x > swipeThreshold || info.velocity.x > 500) {
        prevSlide();
      }
    },
    [nextSlide, prevSlide],
  );

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (searchQuery.trim()) {
      router.push(`/search?q=${encodeURIComponent(searchQuery.trim())}`);
    } else {
      router.push("/search");
    }
  };

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

  const slideVariants = {
    enter: (dir: number) => ({
      x: dir > 0 ? "100%" : dir < 0 ? "-100%" : 0,
    }),
    center: {
      x: 0,
    },
    exit: (dir: number) => ({
      x: dir < 0 ? "100%" : dir > 0 ? "-100%" : 0,
    }),
  };

  return (
    <>
      {/* Desktop Hero (hidden on mobile, block on desktop) */}
      <section
        id="home"
        className="hidden md:block relative w-full h-[100dvh] overflow-hidden bg-black touch-pan-y"
        onMouseEnter={() => setIsPaused(true)}
        onMouseLeave={() => setIsPaused(false)}
        aria-label="Hero slider desktop"
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
              drag="x"
              dragConstraints={{ left: 0, right: 0 }}
              dragElastic={0.2}
              onDragEnd={handleDragEnd}
              className="absolute inset-0 cursor-grab active:cursor-grabbing"
            >
              <Image
                src={getOptimizedImageUrl(slides[currentSlide].image, 1600)}
                alt={slides[currentSlide].title}
                fill
                sizes="100vw"
                priority
                className="object-cover object-center pointer-events-none"
              />
            </motion.div>
          </AnimatePresence>

          <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/25 to-black/35 pointer-events-none" />
          <div className="absolute inset-0 bg-gradient-to-r from-black/40 via-transparent to-transparent pointer-events-none" />

          {slides.map((slide, index) => (
            <motion.div
              key={`content-${slide.id}`}
              animate={{
                opacity: index === currentSlide ? 1 : 0,
                y: index === currentSlide ? 0 : 20,
              }}
              initial={false}
              transition={{ duration: 0.5 }}
              style={{ pointerEvents: index === currentSlide ? "auto" : "none" }}
              className="absolute inset-0 flex items-end pb-24 md:pb-32 lg:pb-36 px-6 sm:px-12 md:px-16 lg:px-24"
            >
              <div className="max-w-3xl text-left z-10">
                {slide.tag && (
                  <span className="inline-block text-white font-semibold tracking-[0.25em] text-[10px] uppercase bg-black/30 backdrop-blur-md px-4 py-2 rounded-full border border-white/15 mb-5">
                    {slide.tag}
                  </span>
                )}
                <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-extrabold text-white leading-[1.1] tracking-tight font-display [text-shadow:0_2px_15px_rgba(0,0,0,0.4)]">
                  {slide.title}
                </h1>
                {slide.description && (
                  <p className="text-white/80 mt-5 sm:mt-6 text-sm sm:text-base md:text-lg max-w-lg leading-relaxed [text-shadow:0_1px_8px_rgba(0,0,0,0.3)]">
                    {slide.description}
                  </p>
                )}
              </div>
            </motion.div>
          ))}

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

      {/* Mobile Hero (block on mobile, hidden on desktop) */}
      <section
        id="home"
        className="block md:hidden relative w-full h-[52vh] min-h-[360px] max-h-[450px] overflow-hidden bg-black rounded-b-[2rem] shadow-premium touch-pan-y"
        onMouseEnter={() => setIsPaused(true)}
        onMouseLeave={() => setIsPaused(false)}
        aria-label="Hero slider mobile"
      >
        <HideScrollbar />
        <div className="relative h-full w-full overflow-hidden">
          {/* Slide Background Images with smooth swiper drag */}
          <div className="absolute inset-0">
            <AnimatePresence initial={false} custom={direction}>
              <motion.div
                key={slides[currentSlide].id}
                custom={direction}
                variants={slideVariants}
                initial="enter"
                animate="center"
                exit="exit"
                transition={{
                  x: { type: "spring", stiffness: 300, damping: 30 },
                }}
                drag="x"
                dragConstraints={{ left: 0, right: 0 }}
                dragElastic={1}
                onDragEnd={handleDragEnd}
                className="absolute inset-0 cursor-grab active:cursor-grabbing w-full h-full"
              >
                <Image
                  src={getOptimizedImageUrl(slides[currentSlide].image, 800)}
                  alt={slides[currentSlide].title}
                  fill
                  priority
                  className="object-cover object-center pointer-events-none"
                />
              </motion.div>
            </AnimatePresence>

            {/* Premium overlays matching reference aesthetics */}
            <div className="absolute inset-0 bg-gradient-to-b from-black/50 via-black/10 to-black/75 pointer-events-none" />
            <div className="absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-black via-black/30 to-transparent pointer-events-none" />
          </div>

          {/* Dynamic Content Overlay (greetings header removed) */}
          <div className="absolute bottom-22 inset-x-5 z-20 text-left pointer-events-none">
            <AnimatePresence mode="wait">
              <motion.div
                key={`mobile-content-${slides[currentSlide].id}`}
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -10 }}
                transition={{ duration: 0.3 }}
              >
                <h1 className="text-xl font-extrabold text-white leading-snug font-display tracking-tight [text-shadow:0_2px_8px_rgba(0,0,0,0.5)]">
                  {slides[currentSlide].title}
                </h1>
                {slides[currentSlide].description && (
                  <p className="text-white/75 mt-1.5 text-[11px] max-w-sm line-clamp-2 leading-relaxed [text-shadow:0_1px_4px_rgba(0,0,0,0.4)]">
                    {slides[currentSlide].description}
                  </p>
                )}
              </motion.div>
            </AnimatePresence>
          </div>

          {/* Floating Frosted glass search bar matching Reference 2 */}
          <div className="absolute bottom-5 left-0 right-0 px-5 z-30 pointer-events-auto">
            <form onSubmit={handleSearchSubmit} className="flex gap-2.5 items-center w-full">
              <div className="relative flex-1">
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Search Place"
                  className="w-full bg-white/10 backdrop-blur-xl pl-11 pr-4 py-3 rounded-full text-base text-white placeholder-white/50 font-medium focus:bg-white/15 focus:outline-none focus:ring-1 focus:ring-white/20 shadow-inner transition-all border border-white/10"
                />
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-white/50 w-4 h-4 pointer-events-none z-10" />
              </div>
              <button
                type="submit"
                className="w-10 h-10 rounded-full bg-brand hover:bg-brand-hover text-white flex items-center justify-center transition-all shadow-md active:scale-95 cursor-pointer shrink-0 border border-brand/10"
                aria-label="Submit search"
              >
                <SlidersHorizontal className="w-4 h-4" />
              </button>
            </form>
          </div>

          {/* Slide Indicator Dots */}
          {totalSlides > 1 && (
            <div className="absolute bottom-[82px] right-5 z-25 flex gap-1 pointer-events-auto">
              {slides.map((_, index) => (
                <button
                  type="button"
                  key={index}
                  onClick={() => goToSlide(index)}
                  className={`h-1 rounded-full transition-all duration-300 cursor-pointer ${
                    index === currentSlide ? "w-4 bg-white shadow-sm" : "w-1 bg-white/40"
                  }`}
                  aria-label={`Go to slide ${index + 1}`}
                />
              ))}
            </div>
          )}
        </div>
      </section>
    </>
  );
}
