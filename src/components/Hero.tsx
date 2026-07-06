"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Calendar, ChevronLeft, ChevronRight, MapPin, Search, Users } from "lucide-react";
import Image from "next/image";
import type React from "react";
import { useCallback, useEffect, useState } from "react";

import heroData from "@/data/hero.json";

interface Slide {
  id: number;
  image: string;
  tag: string;
  title: string;
  description: string;
}

const slides: Slide[] = heroData.slides;
const AUTO_ROTATE_INTERVAL = 5000;

export default function Hero() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [destination, setDestination] = useState("");
  const [checkIn, setCheckIn] = useState("");
  const [checkOut, setCheckOut] = useState("");
  const [guests, setGuests] = useState(1);
  const [isPaused, setIsPaused] = useState(false);

  const totalSlides = slides.length;

  const goToSlide = useCallback(
    (index: number) => setCurrentSlide((index + totalSlides) % totalSlides),
    [totalSlides],
  );

  const nextSlide = useCallback(() => goToSlide(currentSlide + 1), [currentSlide, goToSlide]);

  const prevSlide = useCallback(() => goToSlide(currentSlide - 1), [currentSlide, goToSlide]);

  // Auto-rotate slides
  useEffect(() => {
    if (isPaused) return;
    const timer = setInterval(nextSlide, AUTO_ROTATE_INTERVAL);
    return () => clearInterval(timer);
  }, [nextSlide, isPaused]);

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    alert(`Searching for: ${destination} | Dates: ${checkIn} to ${checkOut} | Guests: ${guests}`);
  };

  return (
    <section
      id="home"
      className="relative w-full px-4 md:px-8 pt-4 pb-20 max-w-[1440px] mx-auto"
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      aria-label="Hero slider"
    >
      {/* Hero Banner Container */}
      <div className="relative h-[550px] md:h-[650px] w-full rounded-[2.5rem] overflow-hidden bg-black">
        {/* Slides — simultaneous enter/exit for smooth crossfade, no black flash */}
        <AnimatePresence>
          <motion.div
            key={slides[currentSlide].id}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 1.2, ease: "easeInOut" }}
            className="absolute inset-0"
          >
            <Image
              src={slides[currentSlide].image}
              alt={slides[currentSlide].title}
              fill
              sizes="100vw"
              priority
              className="object-cover object-center"
            />
          </motion.div>
        </AnimatePresence>

        {/* Subtle gradient behind text only — keeps light images readable */}
        <div className="absolute inset-0 bg-gradient-to-r from-black/40 via-black/15 to-transparent pointer-events-none" />

        {/* Slide Text Content */}
        <AnimatePresence mode="wait">
          <motion.div
            key={`content-${slides[currentSlide].id}`}
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.5, delay: 0.15 }}
            className="absolute inset-0 flex items-center"
          >
            <div className="container mx-auto px-6 lg:px-12">
              <div className="max-w-2xl">
                <span className="inline-block text-white font-semibold tracking-widest text-xs md:text-sm bg-black/30 backdrop-blur-md px-4 py-1.5 rounded-full border border-white/15 mb-4">
                  {slides[currentSlide].tag}
                </span>
                <h1 className="text-4xl md:text-6xl font-extrabold text-white mt-4 leading-tight tracking-tight font-sans [text-shadow:0_2px_12px_rgba(0,0,0,0.7)]">
                  {slides[currentSlide].title}
                </h1>
                <p className="text-gray-100 mt-6 text-base md:text-lg max-w-lg leading-relaxed [text-shadow:0_1px_6px_rgba(0,0,0,0.6)]">
                  {slides[currentSlide].description}
                </p>
              </div>
            </div>
          </motion.div>
        </AnimatePresence>

        {/* Navigation Arrows */}
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

        {/* Navigation Dots */}
        <div className="absolute bottom-6 left-1/2 transform -translate-x-1/2 z-20 flex gap-2.5">
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
      </div>

      {/* Floating Search Panel */}
      <div className="relative -mt-16 z-20 max-w-5xl mx-auto px-4 w-full">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="bg-white rounded-3xl p-6 md:p-8 shadow-premium border border-border-light flex flex-col items-center gap-6"
        >
          <form onSubmit={handleSearch} className="w-full flex flex-col items-center gap-6">
            {/* Grid of Inputs */}
            <div className="w-full grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 items-center divide-y sm:divide-y-0 lg:divide-x divide-border-light">
              {/* Destination Column */}
              <div className="flex items-center gap-3.5 pb-4 sm:pb-0 lg:px-4">
                <MapPin className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label
                    htmlFor="search-destination"
                    className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5"
                  >
                    Destination
                  </label>
                  <input
                    id="search-destination"
                    type="text"
                    value={destination}
                    onChange={(e) => setDestination(e.target.value)}
                    placeholder="Where are you going?"
                    className="w-full text-sm font-semibold text-foreground placeholder:text-muted/65 focus:outline-none bg-transparent"
                  />
                </div>
              </div>

              {/* Check-in Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4">
                <Calendar className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label
                    htmlFor="search-checkin"
                    className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5"
                  >
                    Check-in Date
                  </label>
                  <input
                    id="search-checkin"
                    type="date"
                    value={checkIn}
                    onChange={(e) => setCheckIn(e.target.value)}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer"
                  />
                </div>
              </div>

              {/* Check-out Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4">
                <Calendar className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label
                    htmlFor="search-checkout"
                    className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5"
                  >
                    Check-out Date
                  </label>
                  <input
                    id="search-checkout"
                    type="date"
                    value={checkOut}
                    onChange={(e) => setCheckOut(e.target.value)}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer"
                  />
                </div>
              </div>

              {/* Guests Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 lg:px-4">
                <Users className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label
                    htmlFor="search-guests"
                    className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5"
                  >
                    Add Guests
                  </label>
                  <select
                    id="search-guests"
                    value={guests}
                    onChange={(e) => setGuests(Number(e.target.value))}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer appearance-none"
                  >
                    {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((num) => (
                      <option key={num} value={num}>
                        {num} Guest{num > 1 ? "s" : ""}
                      </option>
                    ))}
                  </select>
                </div>
              </div>
            </div>

            {/* CTA Button */}
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              type="submit"
              className="px-10 py-4 bg-brand hover:bg-brand-hover text-white rounded-full font-bold text-sm shadow-premium transition-all duration-300 hover:-translate-y-0.5 flex items-center gap-2 cursor-pointer tracking-wider"
            >
              <Search className="w-4 h-4 text-white" />
              Find Packages
            </motion.button>
          </form>
        </motion.div>
      </div>
    </section>
  );
}
