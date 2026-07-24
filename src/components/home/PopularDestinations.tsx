"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ArrowLeft, ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useState } from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import FavoriteButton from "@/components/ui/FavoriteButton";
import SeeAllLink from "@/components/ui/SeeAllLink";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type DestinationsSectionData } from "@/types/destination";

// Framer motion variants for the sliding transition inside fixed slots
const slideVariants = {
  enter: (dir: number) => ({
    x: dir > 0 ? "100%" : dir < 0 ? "-100%" : 0,
    opacity: 0.8,
  }),
  center: {
    x: 0,
    opacity: 1,
  },
  exit: (dir: number) => ({
    x: dir > 0 ? "-100%" : dir < 0 ? "100%" : 0,
    opacity: 0.8,
  }),
};

const slideTransition = {
  x: { type: "spring", stiffness: 260, damping: 26 },
  opacity: { duration: 0.25 },
} as const;

export default function PopularDestinations({
  sectionData,
}: {
  sectionData: DestinationsSectionData;
}) {
  const { tagline, subtitle, items: destinations } = sectionData;

  const [centerIndex, setCenterIndex] = useState(0);
  const [dimensions, setDimensions] = useState({ cardWidth: 260, cardGap: 32 });
  const [favorites, setFavorites] = useState<Record<string, boolean>>({});
  const [direction, setDirection] = useState<number>(0);

  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth < 768) {
        setDimensions({ cardWidth: 180, cardGap: 16 });
      } else {
        setDimensions({ cardWidth: 260, cardGap: 32 });
      }
    };
    handleResize();
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  if (!destinations || destinations.length === 0) return null;

  const len = destinations.length;

  // Mobile navigation handlers (bounded, original behavior)
  const handlePrevMobile = () => {
    setDirection(-1);
    setCenterIndex((prev) => Math.max(0, prev - 1));
  };

  const handleNextMobile = () => {
    setDirection(1);
    setCenterIndex((prev) => Math.min(len - 1, prev + 1));
  };

  // Desktop navigation handlers (infinite wrap-around)
  const handlePrevDesktop = () => {
    setDirection(-1);
    setCenterIndex((prev) => (prev - 1 + len) % len);
  };

  const handleNextDesktop = () => {
    setDirection(1);
    setCenterIndex((prev) => (prev + 1) % len);
  };

  // Desktop direct card click handler
  const handleCardClickDesktop = (slotIdx: number) => {
    if (slotIdx === 2) return;
    const diff = slotIdx - 2; // -2, -1, 1, 2
    setDirection(diff > 0 ? 1 : -1);
    setCenterIndex((prev) => (prev + diff + len) % len);
  };

  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => ({ ...prev, [slug]: !prev[slug] }));
  };

  const rightSlot = <SeeAllLink href="/destinations/" label="See All" />;
  const slots = [0, 1, 2, 3, 4];

  return (
    <section className="py-section-standard bg-white overflow-hidden">
      <div className="layout-container relative">
        {/* Section Header */}
        <SectionHeader
          title={tagline}
          subtitle={subtitle}
          rightSlot={rightSlot}
          mobileLayout="row"
        />

        {/* ========================================================================= */}
        {/* MOBILE VIEW (Preserved original sliding carousel) */}
        {/* ========================================================================= */}
        <div className="md:hidden relative w-full flex justify-center items-center h-[340px] sm:h-[480px] mt-8 select-none">
          {/* Whitish Side Gradient Overlays */}
          <div className="absolute left-0 top-0 bottom-0 w-[10%] sm:w-[12%] bg-gradient-to-r from-white via-white/40 to-transparent z-20 pointer-events-none" />
          <div className="absolute right-0 top-0 bottom-0 w-[10%] sm:w-[12%] bg-gradient-to-l from-white via-white/40 to-transparent z-20 pointer-events-none" />

          {/* Overlaid Arrow Navigation Buttons */}
          <button
            type="button"
            onClick={handlePrevMobile}
            disabled={centerIndex === 0}
            className="absolute left-2 sm:left-6 top-[40%] -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 disabled:opacity-20 disabled:pointer-events-none cursor-pointer group active:scale-95"
            aria-label="Previous destination"
          >
            <ArrowLeft className="w-4 h-4 sm:w-5 sm:h-5 transition-transform group-hover:-translate-x-0.5" />
          </button>

          <button
            type="button"
            onClick={handleNextMobile}
            disabled={centerIndex === destinations.length - 1}
            className="absolute right-2 sm:right-6 top-[40%] -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 disabled:opacity-20 disabled:pointer-events-none cursor-pointer group active:scale-95"
            aria-label="Next destination"
          >
            <ArrowRight className="w-4 h-4 sm:w-5 sm:h-5 transition-transform group-hover:translate-x-0.5" />
          </button>

          {/* Sliding Cards container (items-end for straight bottom baseline) */}
          <div
            className="absolute left-1/2 -translate-x-1/2 flex items-end transition-transform duration-500 ease-out h-full pb-2"
            style={{
              transform: `translate3d(calc(-50% - ${(centerIndex - (destinations.length - 1) / 2) * (dimensions.cardWidth + dimensions.cardGap)}px), 0, 0)`,
              gap: `${dimensions.cardGap}px`,
            }}
          >
            {destinations.map((dest, idx) => {
              const distance = Math.abs(idx - centerIndex);
              const isFavorite = favorites[dest.slug] || false;
              const imageSrc = getOptimizedImageUrl(
                dest.image || "/images/placeholder-landscape.png",
                1000,
              );

              let heightClass = "h-[150px] sm:h-[190px] opacity-35 blur-[0.5px]";
              if (distance === 0) {
                heightClass = "h-[240px] sm:h-[300px] opacity-100 shadow-md";
              } else if (distance === 1) {
                heightClass = "h-[190px] sm:h-[240px] opacity-75";
              }

              return (
                <div
                  key={dest.slug}
                  className="flex flex-col items-center shrink-0 transition-all duration-500 justify-end"
                  style={{ width: `${dimensions.cardWidth}px` }}
                >
                  {/* Card Image Container */}
                  <div
                    className={`relative w-full rounded-[2rem] overflow-hidden border border-neutral-100 transition-all duration-500 ${heightClass}`}
                  >
                    <Image
                      src={imageSrc}
                      alt={dest.name}
                      fill
                      sizes="(max-width: 768px) 190px, 280px"
                      className="object-cover"
                      priority={idx === 0}
                    />

                    {/* Favorite Button (only fully visible on active card) */}
                    <div
                      className={`absolute top-4 right-4 z-20 transition-opacity duration-300 ${
                        distance === 0 ? "opacity-100" : "opacity-0 pointer-events-none"
                      }`}
                    >
                      <FavoriteButton
                        isFavorite={isFavorite}
                        onToggle={(e) => {
                          e.stopPropagation();
                          toggleFavorite(dest.slug);
                        }}
                        variant="solid"
                        size="sm"
                        ariaLabel="Add to favorites"
                      />
                    </div>

                    {/* Full Card Link Overlay */}
                    <Link
                      href={`/destinations/${dest.slug}/`}
                      onClick={(e) => {
                        if (idx !== centerIndex) {
                          e.preventDefault();
                          setCenterIndex(idx);
                        }
                      }}
                      className="absolute inset-0 z-20 cursor-pointer"
                      aria-label={`View details for ${dest.name}`}
                    />
                  </div>

                  {/* Card Info Below Card Image */}
                  <div className="text-center flex flex-col items-center justify-start h-20 w-full mt-4 overflow-hidden">
                    <h3
                      className={`font-serif tracking-tight transition-all duration-500 ${
                        distance === 0
                          ? "text-lg sm:text-2xl font-bold text-neutral-900"
                          : "text-sm sm:text-base italic font-semibold text-neutral-400"
                      }`}
                    >
                      {dest.name}
                    </h3>

                    {distance === 0 && (
                      <div className="flex items-center gap-1.5 mt-1.5 text-[10px] sm:text-xs font-semibold text-emerald-600 tracking-wide">
                        <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse shrink-0" />
                        <span>12k+ Happy Tourist</span>
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* ========================================================================= */}
        {/* DESKTOP VIEW (New static-slot symmetrical arc design) */}
        {/* ========================================================================= */}
        <div className="hidden md:block relative w-full mt-10 select-none overflow-hidden">
          {/* Centered Row of Slots */}
          <div className="flex items-center justify-center gap-5 lg:gap-8 py-8 w-max min-w-full mx-auto relative z-10">
            {slots.map((s) => {
              const destIndex = (centerIndex - 2 + s + len) % len;
              const dest = destinations[destIndex];
              const isFavorite = favorites[dest.slug] || false;
              const imageSrc = getOptimizedImageUrl(
                dest.image || "/images/placeholder-landscape.png",
                1000,
              );

              // Symmetrical sizing & opacity based on slot index
              let slotCardClasses = "";
              let textClasses = "";
              if (s === 0 || s === 4) {
                // Outer slots (shortest)
                slotCardClasses =
                  "w-[160px] lg:w-[200px] h-[225px] lg:h-[265px] opacity-30 rounded-[2rem] border border-neutral-100/50 shadow-sm";
                textClasses = "text-xs lg:text-sm italic font-semibold text-neutral-400 font-serif";
              } else if (s === 1 || s === 3) {
                // Intermediate slots (medium)
                slotCardClasses =
                  "w-[195px] lg:w-[240px] h-[270px] lg:h-[310px] opacity-70 rounded-[2rem] border border-neutral-100 shadow-md";
                textClasses =
                  "text-sm lg:text-base italic font-semibold text-neutral-500 font-serif";
              } else {
                // Center active slot (tallest)
                slotCardClasses =
                  "w-[230px] lg:w-[280px] h-[325px] lg:h-[375px] opacity-100 rounded-[2.5rem] border border-brand-light shadow-xl ring-8 ring-brand-light/10";
                textClasses = "text-lg lg:text-2xl font-bold text-neutral-900 font-serif";
              }

              return (
                <div
                  key={`slot-${s}`}
                  className="flex flex-col items-center shrink-0"
                  style={{
                    width: s === 0 || s === 4 ? "200px" : s === 1 || s === 3 ? "240px" : "280px",
                  }}
                >
                  {/* Card Slot Wrapper with static height constraints */}
                  <div
                    className={`relative overflow-hidden transition-all duration-300 ${slotCardClasses}`}
                  >
                    <AnimatePresence initial={false} custom={direction}>
                      <motion.div
                        key={dest.slug}
                        custom={direction}
                        variants={slideVariants}
                        initial="enter"
                        animate="center"
                        exit="exit"
                        transition={slideTransition}
                        className="absolute inset-0 w-full h-full"
                      >
                        <Image
                          src={imageSrc}
                          alt={dest.name}
                          fill
                          sizes="(max-width: 1024px) 240px, 300px"
                          className="object-cover"
                          priority={s === 2}
                        />
                      </motion.div>
                    </AnimatePresence>

                    {/* Favorite Button (only active card) */}
                    {s === 2 && (
                      <div className="absolute top-4 right-4 z-20">
                        <FavoriteButton
                          isFavorite={isFavorite}
                          onToggle={(e) => {
                            e.stopPropagation();
                            toggleFavorite(dest.slug);
                          }}
                          variant="solid"
                          size="sm"
                          ariaLabel="Add to favorites"
                        />
                      </div>
                    )}

                    {/* Direct Card Click / Detail Link Overlay */}
                    <Link
                      href={`/destinations/${dest.slug}/`}
                      onClick={(e) => {
                        if (s !== 2) {
                          e.preventDefault();
                          handleCardClickDesktop(s);
                        }
                      }}
                      className="absolute inset-0 z-20 cursor-pointer"
                      aria-label={`View details for ${dest.name}`}
                    />
                  </div>

                  {/* Card Title and Info Area (slides in sync with images) */}
                  <div className="text-center flex flex-col items-center justify-start h-20 w-full mt-4 lg:mt-5 overflow-hidden relative">
                    <AnimatePresence initial={false} custom={direction}>
                      <motion.div
                        key={dest.slug}
                        custom={direction}
                        variants={slideVariants}
                        initial="enter"
                        animate="center"
                        exit="exit"
                        transition={slideTransition}
                        className="absolute inset-0 flex flex-col items-center px-2"
                      >
                        <h3 className={`tracking-tight leading-snug ${textClasses}`}>
                          {dest.name}
                        </h3>

                        {s === 2 && (
                          <div className="flex items-center gap-1.5 mt-1.5 text-xs font-semibold text-emerald-600 tracking-wide">
                            <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse shrink-0" />
                            <span>12k+ Happy Tourist</span>
                          </div>
                        )}
                      </motion.div>
                    </AnimatePresence>
                  </div>
                </div>
              );
            })}
          </div>

          {/* Whitish Side Gradient Overlays to fade cards on left/right edges */}
          <div className="absolute left-0 top-0 bottom-0 w-[18%] lg:w-[22%] bg-gradient-to-r from-white via-white/80 to-transparent z-20 pointer-events-none" />
          <div className="absolute right-0 top-0 bottom-0 w-[18%] lg:w-[22%] bg-gradient-to-l from-white via-white/80 to-transparent z-20 pointer-events-none" />

          {/* Left Navigation Arrow */}
          <button
            type="button"
            onClick={handlePrevDesktop}
            className="absolute left-4 lg:left-10 top-1/2 -translate-y-1/2 z-30 w-10 h-10 lg:w-12 lg:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 cursor-pointer group active:scale-95"
            aria-label="Previous destination"
          >
            <ArrowLeft className="w-4 h-4 lg:w-5 lg:h-5 transition-transform group-hover:-translate-x-0.5" />
          </button>

          {/* Right Navigation Arrow */}
          <button
            type="button"
            onClick={handleNextDesktop}
            className="absolute right-4 lg:right-10 top-1/2 -translate-y-1/2 z-30 w-10 h-10 lg:w-12 lg:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 cursor-pointer group active:scale-95"
            aria-label="Next destination"
          >
            <ArrowRight className="w-4 h-4 lg:w-5 lg:h-5 transition-transform group-hover:translate-x-0.5" />
          </button>
        </div>
      </div>
    </section>
  );
}
