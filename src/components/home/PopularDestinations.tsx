"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Star } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useRef, useState } from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import DotIndicator from "@/components/ui/DotIndicator";
import FavoriteButton from "@/components/ui/FavoriteButton";
import PrevNextNav from "@/components/ui/PrevNextNav";
import { type DestinationDisplay } from "@/types/destination";

function DestinationCard({
  dest,
  isMobile = false,
  priority = false,
}: {
  dest: DestinationDisplay;
  isMobile?: boolean;
  priority?: boolean;
}) {
  const [isFavorite, setIsFavorite] = useState(false);

  const imageSrc = dest.image || "/images/placeholder-landscape.png";
  const locationText = dest.stateName ? `${dest.stateName}, ${dest.countryName}` : dest.countryName;

  return (
    <div className="relative h-full w-full rounded-[2.5rem] overflow-hidden group shadow-card border border-border-light cursor-pointer">
      {/* Full Background Image */}
      <Image
        src={imageSrc}
        alt={dest.name}
        fill
        sizes={isMobile ? "(max-width: 768px) 100vw, 290px" : "(max-width: 1024px) 50vw, 600px"}
        className="object-cover transition-transform duration-700 group-hover:scale-105"
        priority={priority}
      />

      {/* Favorite Button (Heart Icon) */}
      <div className="absolute top-6 right-6 z-20">
        <FavoriteButton
          isFavorite={isFavorite}
          onToggle={(e) => {
            e.stopPropagation();
            setIsFavorite(!isFavorite);
          }}
          variant="solid"
          size="md"
          ariaLabel="Add to favorites"
        />
      </div>

      {/* Bottom dark gradient overlay */}
      <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/35 to-transparent transition-opacity duration-300 group-hover:via-black/55 group-hover:from-black/95 z-0" />

      {/* Content Overlay */}
      <div className="absolute inset-0 p-6 flex flex-col justify-end text-white z-10">
        <div className="flex flex-col">
          <h3 className="text-xl lg:text-2xl font-bold tracking-tight leading-tight mb-1">
            {dest.name},{" "}
            <span className="text-white/80 font-semibold text-lg lg:text-xl">{locationText}</span>
          </h3>

          {/* Duration & Rating Row */}
          <div className="flex items-center gap-3 mt-1.5 text-xs lg:text-sm font-medium text-white/90">
            <span>{dest.type || "Explore"}</span>
            <span className="w-1.5 h-1.5 rounded-full bg-white/50" />
            <div className="flex items-center gap-1">
              <Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />
              <span>4.9</span>
              <span className="text-white/70">(Featured)</span>
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
          <Link
            href={`/destinations/${dest.slug}`}
            className="bg-brand hover:bg-brand-hover text-white text-xs lg:text-sm font-semibold py-2 px-6 rounded-full transition-colors cursor-pointer shadow-sm inline-block"
          >
            View
          </Link>
        </div>
      </div>

      {/* Full-card clickable overlay for desktop (mobile uses explicit View button) */}
      <Link
        href={`/destinations/${dest.slug}`}
        className="absolute inset-0 z-10 cursor-pointer hidden md:block"
        aria-label={`View details for ${dest.name}`}
      />
    </div>
  );
}

export default function PopularDestinations({
  destinations,
}: {
  destinations: DestinationDisplay[];
}) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0); // for mobile dots
  const [currentIndex, setCurrentIndex] = useState(0); // for desktop pagination

  // Mobile scroll handlers
  const handleScroll = () => {
    if (!containerRef.current) return;
    const scrollLeft = containerRef.current.scrollLeft;
    const width = containerRef.current.offsetWidth;
    const index = Math.round(scrollLeft / (width / 1.1));
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

  // Edge case: empty data → render nothing
  if (destinations.length === 0) return null;

  // Wrap index for safety
  const wrap = (i: number) =>
    ((i % destinations.length) + destinations.length) % destinations.length;

  // Get current active set of 4 destinations for desktop view
  const cardA = destinations[wrap(currentIndex)];
  const cardB = destinations[wrap(currentIndex + 1)];
  const cardC = destinations[wrap(currentIndex + 2)];
  const cardD = destinations[wrap(currentIndex + 3)];

  const rightSlot = (
    <PrevNextNav
      onPrev={handlePrev}
      onNext={handleNext}
      prevAriaLabel="Previous destination"
      nextAriaLabel="Next destination"
    />
  );

  return (
    <section className="py-24 bg-white border-y border-border-light">
      <div className="layout-container">
        {/* Section Header */}
        <SectionHeader
          title="Explore Top Destinations"
          subtitle="Explore the world's most sought-after travel experiences"
          rightSlot={rightSlot}
        />

        {/* MOBILE VIEW: Horizontal scroll layout */}
        <div className="md:hidden">
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

        {/* DESKTOP VIEW: Alternating asymmetric grid layout */}
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
              <div className="grid grid-cols-[5.8fr_4.2fr] gap-8 items-stretch h-[280px] lg:h-[330px] xl:h-[360px] 2xl:h-[390px]">
                <DestinationCard dest={cardA} priority />
                <DestinationCard dest={cardB} />
              </div>

              {/* Row 2: Narrow Left, Wide Right */}
              <div className="grid grid-cols-[4.2fr_5.8fr] gap-8 items-stretch h-[280px] lg:h-[330px] xl:h-[360px] 2xl:h-[390px]">
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
