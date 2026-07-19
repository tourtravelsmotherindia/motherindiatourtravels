"use client";

import { AnimatePresence, motion } from "framer-motion";
import { useRef, useState } from "react";

import DestinationCard from "@/components/shared/DestinationCard";
import SectionHeader from "@/components/shared/SectionHeader";
import DotIndicator from "@/components/ui/DotIndicator";
import PrevNextNav from "@/components/ui/PrevNextNav";
import { type DestinationsSectionData } from "@/types/destination";

export default function PopularDestinations({
  sectionData,
}: {
  sectionData: DestinationsSectionData;
}) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0); // for mobile dots
  const [currentIndex, setCurrentIndex] = useState(0); // for desktop pagination

  const { tagline, subtitle, items: destinations } = sectionData;

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
  if (!destinations || destinations.length === 0) return null;

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
        <SectionHeader title={tagline} subtitle={subtitle} rightSlot={rightSlot} />

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
