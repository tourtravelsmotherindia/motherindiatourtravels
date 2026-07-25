"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ArrowLeft, ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useRef, useState } from "react";

import DestinationCard from "@/components/shared/DestinationCard";
import SectionHeader from "@/components/shared/SectionHeader";
import DotIndicator from "@/components/ui/DotIndicator";
import FavoriteButton from "@/components/ui/FavoriteButton";
import SeeAllLink from "@/components/ui/SeeAllLink";
import { useDestinationFavorites } from "@/lib/hooks/useFavorites";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type DestinationsSectionData } from "@/types/destination";

export default function PopularDestinations({
  sectionData,
}: {
  sectionData: DestinationsSectionData;
}) {
  const { tagline, subtitle, items: destinations } = sectionData;

  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0); // for mobile dots
  const [centerIndex, setCenterIndex] = useState(0); // for desktop active center card
  const { isFavorite, toggleFavorite } = useDestinationFavorites();

  if (!destinations || destinations.length === 0) return null;

  const len = destinations.length;

  // Mobile scroll handlers
  const handleScroll = () => {
    if (!containerRef.current) return;
    const scrollLeft = containerRef.current.scrollLeft;
    const width = containerRef.current.offsetWidth;
    const index = Math.round(scrollLeft / (width / 1.1));
    setActiveIndex(Math.min(Math.max(index, 0), len - 1));
  };

  const scrollToCard = (idx: number) => {
    if (!containerRef.current) return;
    const cardWidth = containerRef.current.scrollWidth / len;
    containerRef.current.scrollTo({
      left: idx * cardWidth,
      behavior: "smooth",
    });
    setActiveIndex(idx);
  };

  // Desktop navigation handlers (infinite wrap-around)
  const handlePrevDesktop = () => {
    setCenterIndex((prev) => (prev - 1 + len) % len);
  };

  const handleNextDesktop = () => {
    setCenterIndex((prev) => (prev + 1) % len);
  };

  const handleCardClickDesktop = (slotIdx: number) => {
    if (slotIdx === 2) return;
    const diff = slotIdx - 2; // -2, -1, 1, 2
    setCenterIndex((prev) => (prev + diff + len) % len);
  };

  const rightSlot = <SeeAllLink href="/destinations/" label="See All" />;
  const slots = [0, 1, 2, 3, 4];

  // Map the 5 visible slots dynamically to destination items
  const visibleDestinations = slots.map((s) => {
    const destIndex = (centerIndex - 2 + s + len) % len;
    return {
      dest: destinations[destIndex],
      slot: s,
    };
  });

  return (
    <section className="py-gap-section bg-white overflow-hidden">
      <div className="layout-container relative">
        {/* Section Header */}
        <SectionHeader
          title={tagline}
          subtitle={subtitle}
          rightSlot={rightSlot}
          mobileLayout="row"
        />

        {/* Mobile View */}
        <div className="md:hidden mt-4">
          <div
            ref={containerRef}
            onScroll={handleScroll}
            className="flex gap-6 overflow-x-auto pb-8 snap-x snap-mandatory no-scrollbar cursor-grab active:cursor-grabbing"
            style={{ scrollBehavior: "smooth" }}
          >
            {destinations.map((dest, idx) => (
              <div key={dest.slug} className="h-[400px] w-[290px] shrink-0 snap-start">
                <DestinationCard dest={dest} isMobile priority={idx === 0} />
              </div>
            ))}
          </div>

          {/* Navigation Dot Indicators */}
          <DotIndicator
            count={destinations.length}
            activeIndex={activeIndex}
            onChange={scrollToCard}
            className="mt-2"
          />
        </div>

        {/* Desktop View */}
        <div className="hidden md:block relative w-full mt-10 select-none overflow-hidden">
          {/* Centered Row of Slots */}
          <div className="flex items-center justify-center gap-5 lg:gap-8 py-8 w-max min-w-full mx-auto relative z-10">
            <AnimatePresence mode="popLayout" initial={false}>
              {visibleDestinations.map(({ dest, slot: s }) => {
                const favoriteActive = isFavorite(dest.slug);
                const imageSrc = getOptimizedImageUrl(
                  dest.image || "/images/placeholder-landscape.png",
                  1000,
                );

                // Symmetrical sizing & styling classes based on slot index
                let slotCardClasses = "";
                let textClasses = "";
                let containerWidthClass = "";

                if (s === 0 || s === 4) {
                  // Outer slots (shortest)
                  slotCardClasses =
                    "w-[160px] lg:w-[200px] h-[225px] lg:h-[265px] rounded-[2rem] border border-neutral-100/50 shadow-sm";
                  textClasses =
                    "text-xs lg:text-sm italic font-semibold text-neutral-400 font-serif";
                  containerWidthClass = "w-[160px] lg:w-[200px]";
                } else if (s === 1 || s === 3) {
                  // Intermediate slots (medium)
                  slotCardClasses =
                    "w-[195px] lg:w-[240px] h-[270px] lg:h-[310px] rounded-[2rem] border border-neutral-100 shadow-md";
                  textClasses =
                    "text-sm lg:text-base italic font-semibold text-neutral-500 font-serif";
                  containerWidthClass = "w-[195px] lg:w-[240px]";
                } else {
                  // Center active slot (tallest)
                  slotCardClasses =
                    "w-[230px] lg:w-[280px] h-[325px] lg:h-[375px] rounded-[2.5rem] border border-brand-light shadow-xl ring-8 ring-brand-light/20";
                  textClasses = "text-lg lg:text-2xl font-bold text-neutral-900 font-serif";
                  containerWidthClass = "w-[230px] lg:w-[280px]";
                }

                return (
                  <motion.div
                    layout
                    key={dest.slug}
                    initial={{ opacity: 0, scale: 0.8 }}
                    animate={{
                      opacity: s === 0 || s === 4 ? 0.35 : 1, // Only outer cards have opacity fade
                      scale: 1,
                    }}
                    exit={{ opacity: 0, scale: 0.8 }}
                    transition={{
                      type: "spring",
                      stiffness: 220,
                      damping: 28,
                    }}
                    className={`flex flex-col items-center shrink-0 ${containerWidthClass}`}
                  >
                    {/* Card Slot Wrapper with layout transitions */}
                    <motion.div
                      layout
                      className={`relative overflow-hidden ${slotCardClasses}`}
                      transition={{
                        type: "spring",
                        stiffness: 220,
                        damping: 28,
                      }}
                    >
                      <Image
                        src={imageSrc}
                        alt={dest.name}
                        fill
                        sizes="(max-width: 1024px) 240px, 300px"
                        className="object-cover"
                        priority={s === 2}
                      />

                      {/* Favorite Button (only active card) */}
                      {s === 2 && (
                        <div className="absolute top-4 right-4 z-30">
                          <FavoriteButton
                            isFavorite={favoriteActive}
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
                    </motion.div>

                    {/* Card Title and Info Area */}
                    <div className="text-center flex flex-col items-center justify-start h-20 w-full mt-4 lg:mt-5 overflow-hidden relative">
                      <h3
                        className={`tracking-tight leading-snug transition-all duration-300 ${textClasses}`}
                      >
                        {dest.name}
                      </h3>
                    </div>
                  </motion.div>
                );
              })}
            </AnimatePresence>
          </div>

          {/* Whitish Side Gradient Overlays — only covers the outermost 3rd cards (Slot 0 and Slot 4) halfway, leaving Slot 1 & 3 clean */}
          <div className="absolute left-0 top-0 bottom-0 w-[100px] lg:w-[140px] bg-gradient-to-r from-white to-transparent z-20 pointer-events-none" />
          <div className="absolute right-0 top-0 bottom-0 w-[100px] lg:w-[140px] bg-gradient-to-l from-white to-transparent z-20 pointer-events-none" />

          {/* Left Arrow Button */}
          <button
            type="button"
            onClick={handlePrevDesktop}
            className="absolute left-4 lg:left-10 top-1/2 -translate-y-1/2 z-30 w-10 h-10 lg:w-12 lg:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 cursor-pointer group active:scale-95"
            aria-label="Previous destination"
          >
            <ArrowLeft className="w-4 h-4 lg:w-5 lg:h-5 transition-transform group-hover:-translate-x-0.5" />
          </button>

          {/* Right Arrow Button */}
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
