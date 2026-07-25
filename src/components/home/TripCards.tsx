"use client";

import { motion } from "framer-motion";
import { useState } from "react";

import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import SeeAllLink from "@/components/ui/SeeAllLink";
import SegmentedControl from "@/components/ui/SegmentedControl";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type PackageItem } from "@/types/package";

const TRIP_TYPE_OPTIONS = [
  { label: "Domestic", value: "domestic" },
  { label: "International", value: "international" },
] as const;

type TripType = (typeof TRIP_TYPE_OPTIONS)[number]["value"];

export default function TripCards({ packages }: { packages: PackageItem[] }) {
  const [tripType, setTripType] = useState<TripType>("domestic");
  const { isFavorite, toggleFavorite } = useFavorites();

  const featuredPackages = packages.filter((pkg) => pkg.isFeatured);

  const domesticPackages = featuredPackages.filter((pkg) => pkg.isDomestic).slice(0, 4);
  const internationalPackages = featuredPackages.filter((pkg) => !pkg.isDomestic).slice(0, 4);

  const currentTrips = tripType === "domestic" ? domesticPackages : internationalPackages;

  const rightSlot = (
    <div className="flex flex-wrap items-center justify-between sm:justify-start gap-3 sm:gap-6 w-full sm:w-auto">
      <SegmentedControl
        options={TRIP_TYPE_OPTIONS as unknown as { label: string; value: string }[]}
        value={tripType}
        onChange={(v) => setTripType(v as TripType)}
        layoutId="trip-type"
      />
      <SeeAllLink href="/packages" label="See All" />
    </div>
  );

  return (
    <section id="packages" className="py-gap-section overflow-hidden layout-container">
      <SectionHeader
        title="Explore Trips"
        subtitle="Handpicked adventures designed to inspire your next journey"
        rightSlot={rightSlot}
      />

      <motion.div
        key={tripType}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.3, ease: "easeOut" }}
        className="flex overflow-x-auto gap-4 sm:gap-6 snap-x snap-mandatory no-scrollbar pb-4 sm:pb-0 sm:grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4"
      >
        {currentTrips.map((pkg) => {
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
              />
            </div>
          );
        })}
      </motion.div>
    </section>
  );
}
