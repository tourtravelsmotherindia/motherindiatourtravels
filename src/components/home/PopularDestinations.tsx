"use client";

import { ArrowLeft, ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useState } from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import FavoriteButton from "@/components/ui/FavoriteButton";
import SeeAllLink from "@/components/ui/SeeAllLink";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type DestinationsSectionData } from "@/types/destination";

export default function PopularDestinations({
  sectionData,
}: {
  sectionData: DestinationsSectionData;
}) {
  const { tagline, subtitle, items: destinations } = sectionData;

  const [centerIndex, setCenterIndex] = useState(0);
  const [dimensions, setDimensions] = useState({ cardWidth: 260, cardGap: 32 });
  const [favorites, setFavorites] = useState<Record<string, boolean>>({});

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

  const handlePrev = () => {
    setCenterIndex((prev) => Math.max(0, prev - 1));
  };

  const handleNext = () => {
    setCenterIndex((prev) => Math.min(destinations.length - 1, prev + 1));
  };

  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => ({ ...prev, [slug]: !prev[slug] }));
  };

  const rightSlot = <SeeAllLink href="/destinations/" label="See All" />;

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

        {/* Carousel Viewport Wrapper */}
        <div className="relative w-full flex justify-center items-center h-[340px] sm:h-[480px] mt-8 select-none">
          {/* Whitish Side Gradient Overlays */}
          <div className="absolute left-0 top-0 bottom-0 w-[15%] sm:w-[20%] md:w-[28%] bg-gradient-to-r from-white via-white/80 to-transparent z-20 pointer-events-none" />
          <div className="absolute right-0 top-0 bottom-0 w-[15%] sm:w-[20%] md:w-[28%] bg-gradient-to-l from-white via-white/80 to-transparent z-20 pointer-events-none" />

          {/* Overlaid Arrow Navigation Buttons */}
          <button
            type="button"
            onClick={handlePrev}
            disabled={centerIndex === 0}
            className="absolute left-2 sm:left-6 md:left-12 lg:left-20 top-[40%] -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 disabled:opacity-20 disabled:pointer-events-none cursor-pointer group active:scale-95"
            aria-label="Previous destination"
          >
            <ArrowLeft className="w-4 h-4 sm:w-5 sm:h-5 transition-transform group-hover:-translate-x-0.5" />
          </button>

          <button
            type="button"
            onClick={handleNext}
            disabled={centerIndex === destinations.length - 1}
            className="absolute right-2 sm:right-6 md:right-12 lg:right-20 top-[40%] -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full bg-white hover:bg-neutral-50 shadow-md border border-neutral-100 flex items-center justify-center text-neutral-700 transition-all duration-300 disabled:opacity-20 disabled:pointer-events-none cursor-pointer group active:scale-95"
            aria-label="Next destination"
          >
            <ArrowRight className="w-4 h-4 sm:w-5 sm:h-5 transition-transform group-hover:translate-x-0.5" />
          </button>

          {/* Sliding Cards container */}
          <div
            className="absolute left-1/2 -translate-x-1/2 flex items-center transition-transform duration-500 ease-out h-full"
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
                1000
              );

              let scaleClass = "scale-[0.70] opacity-20 blur-[1px]";
              if (distance === 0) {
                scaleClass = "scale-100 opacity-100 shadow-md";
              } else if (distance === 1) {
                scaleClass = "scale-[0.84] opacity-55 blur-[0.3px]";
              }

              return (
                <div
                  key={dest.slug}
                  className="flex flex-col items-center shrink-0 transition-all duration-500"
                  style={{ width: `${dimensions.cardWidth}px` }}
                >
                  {/* Card Image Container */}
                  <div
                    className={`relative w-full aspect-[3/4] rounded-[2.5rem] overflow-hidden border border-neutral-100 transition-all duration-500 ${scaleClass}`}
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
                  <div className="text-center flex flex-col items-center justify-start h-20 w-full mt-4 sm:mt-5 overflow-hidden">
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
      </div>
    </section>
  );
}
