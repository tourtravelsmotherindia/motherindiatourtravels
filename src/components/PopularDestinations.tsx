"use client";

import React, { useRef, useState } from "react";
import Image from "next/image";
import { ArrowLeft, ArrowRight, Star, Heart } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

interface Destination {
  id: number;
  name: string;
  location: string;
  duration: string;
  rating: number;
  ratingCount: string;
  price: string;
  image: string;
}

const destinations: Destination[] = [
  {
    id: 1,
    name: "Klingking Beach",
    location: "Bali, Indonesia",
    duration: "3 Days & 2 Nights",
    rating: 4.9,
    ratingCount: "(74k)",
    price: "$399",
    image: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=800&q=80",
  },
  {
    id: 2,
    name: "Red Rock Canyon",
    location: "Nevada, USA",
    duration: "4 Days & 3 Nights",
    rating: 4.8,
    ratingCount: "(12k)",
    price: "$499",
    image: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
  },
  {
    id: 3,
    name: "Cinque Terre",
    location: "Liguria, Italy",
    duration: "5 Days & 4 Nights",
    rating: 4.7,
    ratingCount: "(32k)",
    price: "$599",
    image: "https://images.unsplash.com/photo-1516483638261-f4dbaf036963?auto=format&fit=crop&w=800&q=80",
  },
  {
    id: 4,
    name: "Venice Canals",
    location: "Venice, Italy",
    duration: "3 Days & 2 Nights",
    rating: 4.9,
    ratingCount: "(54k)",
    price: "$450",
    image: "https://images.unsplash.com/photo-1527631746610-bca00a040d60?auto=format&fit=crop&w=800&q=80",
  },
  {
    id: 5,
    name: "Leh Ladakh",
    location: "Ladakh, India",
    duration: "6 Days & 5 Nights",
    rating: 4.9,
    ratingCount: "(8k)",
    price: "$650",
    image: "https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=800&q=80",
  },
  {
    id: 6,
    name: "Kerala Backwaters",
    location: "Alappuzha, India",
    duration: "5 Days & 4 Nights",
    rating: 4.8,
    ratingCount: "(15k)",
    price: "$420",
    image: "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
  },
];

function DestinationCard({ dest, isMobile = false, priority = false }: { dest: Destination; isMobile?: boolean; priority?: boolean }) {
  const [isFavorite, setIsFavorite] = useState(false);

  return (
    <div className="relative h-full w-full rounded-[2.5rem] overflow-hidden group shadow-card border border-border-light cursor-pointer">
      {/* Full Background Image */}
      <Image
        src={dest.image}
        alt={dest.name}
        fill
        sizes={isMobile ? "(max-width: 768px) 100vw, 290px" : "(max-width: 1024px) 50vw, 600px"}
        className="object-cover transition-transform duration-700 group-hover:scale-105"
        priority={priority}
      />

      {/* Favorite Button (Heart Icon) */}
      <button
        onClick={(e) => {
          e.stopPropagation();
          setIsFavorite(!isFavorite);
        }}
        className="absolute top-6 right-6 z-20 w-11 h-11 rounded-full bg-white flex items-center justify-center shadow-md cursor-pointer hover:scale-110 active:scale-95 transition-all duration-200"
        aria-label="Add to favorites"
      >
        <Heart
          className={`w-5 h-5 transition-colors ${
            isFavorite ? "fill-red-500 text-red-500" : "text-zinc-400 group-hover:text-red-500"
          }`}
        />
      </button>

      {/* Bottom dark gradient overlay */}
      <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/35 to-transparent transition-opacity duration-300 group-hover:via-black/55 group-hover:from-black/95 z-0" />

      {/* Content Overlay */}
      <div className="absolute inset-0 p-6 flex flex-col justify-end text-white z-10">
        <div className="flex flex-col">
          <h3 className="text-xl lg:text-2xl font-extrabold tracking-tight leading-tight mb-1">
            {dest.name}, <span className="text-white/80 font-semibold text-lg lg:text-xl">{dest.location}</span>
          </h3>

          {/* Duration & Rating Row */}
          <div className="flex items-center gap-3 mt-1.5 text-xs lg:text-sm font-medium text-white/90">
            <span>{dest.duration}</span>
            <span className="w-1.5 h-1.5 rounded-full bg-white/50" />
            <div className="flex items-center gap-1">
              <Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />
              <span>{dest.rating}</span>
              <span className="text-white/70">{dest.ratingCount}</span>
            </div>
          </div>
        </div>

        {/* View button: always visible on mobile, reveals on hover on desktop */}
        <div
          className={`transition-all duration-300 flex items-center justify-end overflow-hidden ${
            isMobile
              ? "h-10 mt-4 opacity-100"
              : "h-0 opacity-0 group-hover:h-10 group-hover:opacity-100 group-hover:mt-4"
          }`}
        >
          <button className="bg-brand hover:bg-brand-hover text-white text-xs lg:text-sm font-bold py-2 px-6 rounded-full transition-colors cursor-pointer shadow-sm">
            View
          </button>
        </div>
      </div>
    </div>
  );
}

export default function PopularDestinations() {
  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0); // for mobile dots
  const [currentIndex, setCurrentIndex] = useState(0); // for desktop pagination

  // Mobile scroll handlers
  const handleScroll = () => {
    if (!containerRef.current) return;
    const scrollLeft = containerRef.current.scrollLeft;
    const width = containerRef.current.offsetWidth;
    const index = Math.round(scrollLeft / (width / 1.1)); // Approx mobile card width
    setActiveIndex(Math.min(Math.max(index, 0), destinations.length - 1));
  };

  const scrollToCard = (idx: number) => {
    if (!containerRef.current) return;
    const cardWidth = containerRef.current.scrollWidth / destinations.length;
    containerRef.current.scrollTo({
      left: idx * cardWidth,
      behavior: "smooth",
    });
    setActiveIndex(idx);
  };

  // Desktop slide handlers
  const handlePrev = () => {
    setCurrentIndex((prev) => (prev === 0 ? destinations.length - 1 : prev - 1));
  };

  const handleNext = () => {
    setCurrentIndex((prev) => (prev === destinations.length - 1 ? 0 : prev + 1));
  };

  // Get current active set of 4 destinations for desktop view
  const cardA = destinations[currentIndex];
  const cardB = destinations[(currentIndex + 1) % destinations.length];
  const cardC = destinations[(currentIndex + 2) % destinations.length];
  const cardD = destinations[(currentIndex + 3) % destinations.length];

  return (
    <section className="py-16 bg-white border-y border-border-light">
      <div className="max-w-[1440px] mx-auto px-4 md:px-8">
        {/* Section Header */}
        <div className="flex items-center justify-between mb-12 gap-4">
          <div>
            <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
             Explore Top <span className="text-brand">Destination</span>
            </h2>
            <p className="text-muted font-medium mt-2 text-sm md:text-base">
              Explore the world&apos;s most sought-after travel experiences
            </p>
          </div>
          {/* Navigation Buttons */}
          <div className="flex items-center gap-3 shrink-0">
            <button
              onClick={handlePrev}
              className="w-12 h-12 rounded-full border border-zinc-200 bg-white flex items-center justify-center text-zinc-700 hover:bg-zinc-50 hover:border-zinc-300 transition-all duration-200 cursor-pointer shadow-sm"
              aria-label="Previous destination"
            >
              <ArrowLeft className="w-5 h-5" />
            </button>
            <button
              onClick={handleNext}
              className="w-12 h-12 rounded-full bg-brand flex items-center justify-center text-white hover:bg-brand-hover transition-all duration-200 cursor-pointer shadow-sm"
              aria-label="Next destination"
            >
              <ArrowRight className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* MOBILE VIEW: Keeps the original horizontal scroll layout */}
        <div className="md:hidden">
          <div
            ref={containerRef}
            onScroll={handleScroll}
            className="flex gap-6 overflow-x-auto pb-8 snap-x snap-mandatory no-scrollbar cursor-grab active:cursor-grabbing"
            style={{ scrollBehavior: "smooth" }}
          >
            {destinations.map((dest, idx) => (
              <div key={dest.id} className="h-[400px] w-[290px] shrink-0 snap-start">
                <DestinationCard dest={dest} isMobile priority={idx === 0} />
              </div>
            ))}
          </div>

          {/* Navigation Dot Indicators */}
          <div className="flex items-center justify-center gap-2 mt-2">
            {destinations.map((_, idx) => (
              <button
                key={idx}
                onClick={() => scrollToCard(idx)}
                className={`h-2.5 rounded-full transition-all duration-300 ${
                  activeIndex === idx ? "w-8 bg-brand" : "w-2.5 bg-muted/30 hover:bg-muted/50"
                }`}
                aria-label={`Go to slide ${idx + 1}`}
              />
            ))}
          </div>
        </div>

        {/* DESKTOP VIEW: The new alternating asymmetric grid layout */}
        <div className="hidden md:block min-h-[640px] relative">
          <AnimatePresence mode="wait">
            <motion.div
              key={currentIndex}
              initial={{ opacity: 0, y: 15 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -15 }}
              transition={{ duration: 0.35, ease: "easeOut" }}
              className="flex flex-col gap-8"
            >
              {/* Row 1: Wide Left, Narrow Right */}
              <div className="grid grid-cols-[5.8fr_4.2fr] gap-8 items-stretch h-[280px] lg:h-[330px]">
                <DestinationCard dest={cardA} priority />
                <DestinationCard dest={cardB} />
              </div>

              {/* Row 2: Narrow Left, Wide Right */}
              <div className="grid grid-cols-[4.2fr_5.8fr] gap-8 items-stretch h-[280px] lg:h-[330px]">
                <DestinationCard dest={cardC} />
                <DestinationCard dest={cardD} />
              </div>
            </motion.div>
          </AnimatePresence>
        </div>
      </div>
    </section>
  );
}
