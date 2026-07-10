"use client";

import { motion } from "framer-motion";
import { useState } from "react";

import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import SeeAllLink from "@/components/ui/SeeAllLink";

import { type PackagesData, type PackageItem } from "@/types/package";

export default function TripCards({ packagesData }: { packagesData?: PackagesData }) {
  const [isDomestic, setIsDomestic] = useState(true);
  const [favorites, setFavorites] = useState<string[]>([]);

  // Cast packages index data
  const allPackages = (packagesData?.packages || []) as PackageItem[];

  // Filter packages: show popular only
  const popularPackages = allPackages.filter((pkg) => pkg.is_popular);

  // Filter domestic and international packages and get first 4
  const domesticPackages = popularPackages.filter((pkg) => pkg.is_domestic).slice(0, 4);
  const internationalPackages = popularPackages.filter((pkg) => !pkg.is_domestic).slice(0, 4);

  // Determine current display list
  const currentTrips = isDomestic ? domesticPackages : internationalPackages;

  // Toggle favorite
  const toggleFavorite = (slug: string) => {
    setFavorites((prev) =>
      prev.includes(slug) ? prev.filter((s) => s !== slug) : [...prev, slug],
    );
  };

  const rightSlot = (
    <div className="flex items-center gap-6 self-start md:self-end">
      <div className="bg-neutral-100 p-1 rounded-full flex gap-1 border border-neutral-200/50 relative">
        <button
          onClick={() => setIsDomestic(true)}
          className={`relative px-5 py-2 rounded-full text-xs font-semibold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
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
          className={`relative px-5 py-2 rounded-full text-xs font-semibold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
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

      <SeeAllLink href="/packages" label="See All Trips" className="hidden sm:flex" />
    </div>
  );

  return (
    <section id="packages" className="py-24 overflow-hidden layout-container">
      {/* Section Header */}
      <SectionHeader
        title="Explore Trips"
        subtitle="Handpicked adventures designed to inspire your next journey"
        rightSlot={rightSlot}
      />

      {/* Grid of Trip Cards */}
      <motion.div
        key={isDomestic ? "domestic" : "international"}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.3, ease: "easeOut" }}
        className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6"
      >
        {currentTrips.map((pkg, idx) => {
          const isFavorite = favorites.includes(pkg.slug);

          return (
            <PackageCard
              key={pkg.id}
              id={pkg.id}
              slug={pkg.slug}
              name={pkg.name}
              hero_image={pkg.hero_image}
              duration_range={pkg.duration_range}
              min_days={pkg.min_days}
              destinations={pkg.destinations}
              variant="overlay"
              isFavorite={isFavorite}
              onToggleFavorite={toggleFavorite}
              showRating={true}
              initial={{ opacity: 0 }}
              whileInView={{ opacity: 1 }}
              viewport={{ once: true, margin: "-50px" }}
              transition={{ duration: 0.4, delay: idx * 0.05 }}
            />
          );
        })}
      </motion.div>

      {/* Mobile-only See All Button */}
      <div className="mt-10 flex justify-center sm:hidden">
        <SeeAllLink href="/packages" label="See All Trips" />
      </div>
    </section>
  );
}
