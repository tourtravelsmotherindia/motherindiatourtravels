"use client";

import { motion } from "framer-motion";
import { useState } from "react";

import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import SeeAllLink from "@/components/ui/SeeAllLink";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type PackageItem } from "@/types/package";

export default function TripCards({ packages }: { packages: PackageItem[] }) {
  const [isDomestic, setIsDomestic] = useState(true);
  const { isFavorite, toggleFavorite } = useFavorites();

  const featuredPackages = packages.filter((pkg) => pkg.isFeatured);

  const domesticPackages = featuredPackages.filter((pkg) => pkg.isDomestic).slice(0, 4);
  const internationalPackages = featuredPackages.filter((pkg) => !pkg.isDomestic).slice(0, 4);

  const currentTrips = isDomestic ? domesticPackages : internationalPackages;

  const rightSlot = (
    <div className="flex flex-wrap items-center justify-between sm:justify-start gap-3 sm:gap-6 w-full sm:w-auto">
      <div className="bg-neutral-100 p-1 rounded-full flex gap-1 border border-neutral-200/50 relative">
        <button
          onClick={() => setIsDomestic(true)}
          className={`relative px-3.5 sm:px-5 py-1.5 sm:py-2 rounded-full text-[11px] sm:text-xs font-semibold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
            isDomestic ? "text-foreground" : "text-muted hover:text-foreground"
          }`}
        >
          {isDomestic && (
            <motion.span
              layoutId="activeTripTab"
              className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
              transition={{ type: "spring", stiffness: 380, damping: 30 }}
            />
          )}
          Domestic
        </button>
        <button
          onClick={() => setIsDomestic(false)}
          className={`relative px-3.5 sm:px-5 py-1.5 sm:py-2 rounded-full text-[11px] sm:text-xs font-semibold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
            !isDomestic ? "text-foreground" : "text-muted hover:text-foreground"
          }`}
        >
          {!isDomestic && (
            <motion.span
              layoutId="activeTripTab"
              className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
              transition={{ type: "spring", stiffness: 380, damping: 30 }}
            />
          )}
          International
        </button>
      </div>

      <SeeAllLink href="/packages" label="See All" />
    </div>
  );

  return (
    <section id="packages" className="py-16 md:py-24 overflow-hidden layout-container">
      <SectionHeader
        title="Explore Trips"
        subtitle="Handpicked adventures designed to inspire your next journey"
        rightSlot={rightSlot}
      />

      <motion.div
        key={isDomestic ? "domestic" : "international"}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.3, ease: "easeOut" }}
        className="flex overflow-x-auto gap-4 sm:gap-6 snap-x snap-mandatory no-scrollbar pb-4 sm:pb-0 sm:grid sm:grid-cols-2 lg:grid-cols-4"
      >
        {currentTrips.map((pkg, idx) => {
          const isFav = isFavorite(pkg.slug);

          return (
            <div key={pkg.id} className="w-[280px] sm:w-auto shrink-0 snap-start">
              <PackageCard
                id={pkg.id}
                slug={pkg.slug}
                name={pkg.name}
                heroImage={pkg.heroImage}
                destinations={pkg.destinations}
                variant="white"
                isFavorite={isFav}
                onToggleFavorite={toggleFavorite}
                showRating={true}
                initial={{ opacity: 0 }}
                whileInView={{ opacity: 1 }}
                viewport={{ once: true, margin: "-50px" }}
                transition={{ duration: 0.4, delay: idx * 0.05 }}
              />
            </div>
          );
        })}
      </motion.div>
    </section>
  );
}
