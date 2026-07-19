"use client";

import { motion } from "framer-motion";
import { Calendar, CloudSun, Compass, MapPin, Sparkles } from "lucide-react";
import Image from "next/image";
import React from "react";

import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type CompanyData } from "@/types/company";
import { type DestinationItem } from "@/types/destination";
import { type PackageItem } from "@/types/package";

export default function DestinationDetailClient({
  destination,
  packages,
  companyData,
}: {
  destination: DestinationItem;
  packages: PackageItem[];
  companyData: CompanyData | null;
}) {
  const { isFavorite, toggleFavorite } = useFavorites();

  const heroImageSrc = getOptimizedImageUrl(
    destination.image || "/images/placeholder-landscape.png",
    1920,
  );

  const locationText = destination.stateName
    ? `${destination.stateName}, ${destination.countryName}`
    : destination.countryName;

  return (
    <PageShell companyData={companyData} ptClass="pt-0" bgClass="bg-white">
      {/* Hero Section */}
      <section className="relative h-[65vh] min-h-[450px] w-full overflow-hidden flex items-end">
        <Image src={heroImageSrc} alt={destination.name} fill priority className="object-cover" />
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/35 to-transparent z-10" />

        <div className="layout-container pb-16 z-20 text-white relative">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="max-w-3xl"
          >
            <div className="flex items-center gap-2 mb-3">
              <span className="bg-brand text-white px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider select-none shadow-sm">
                {destination.type || "Explore"}
              </span>
              <div className="flex items-center gap-1 text-white/80 text-xs font-semibold">
                <MapPin className="w-3.5 h-3.5 text-neutral-300" />
                <span>{locationText}</span>
              </div>
            </div>
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold tracking-tight mb-4 drop-shadow-sm">
              {destination.name}
            </h1>
          </motion.div>
        </div>
      </section>

      {/* Main Details and Quick Facts */}
      <section className="py-20 layout-container">
        <div className="grid grid-cols-1 lg:grid-cols-[1.8fr_1fr] gap-12 items-start">
          {/* Detailed Overview */}
          <motion.div
            initial={{ opacity: 0 }}
            whileInView={{ opacity: 1 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
            className="flex flex-col gap-6"
          >
            <h2 className="text-2xl md:text-3xl font-extrabold text-foreground tracking-tight flex items-center gap-2">
              <Compass className="w-6 h-6 text-brand" />
              <span>About {destination.name}</span>
            </h2>
            <p className="text-neutral-600 text-sm md:text-base leading-relaxed whitespace-pre-line font-medium">
              {destination.description ||
                `Welcome to ${destination.name}. Explore the unique culture, landscapes, and experiences this beautiful place has to offer.`}
            </p>
          </motion.div>

          {/* Quick Facts Card */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, delay: 0.1 }}
            className="bg-neutral-50 border border-neutral-200/50 p-6 md:p-8 rounded-[2.5rem] shadow-sm flex flex-col gap-6"
          >
            <h3 className="text-lg font-bold text-neutral-800 tracking-tight flex items-center gap-2 pl-1">
              <Sparkles className="w-5 h-5 text-brand" />
              <span>Quick Details</span>
            </h3>

            <div className="flex flex-col gap-4">
              {destination.bestTimeToVisit && (
                <div className="flex items-start gap-4 p-3 bg-white border border-neutral-100 rounded-2xl">
                  <div className="w-10 h-10 rounded-xl bg-amber-50 text-amber-500 flex items-center justify-center shrink-0">
                    <Calendar className="w-5 h-5" />
                  </div>
                  <div>
                    <h4 className="text-xs font-bold text-neutral-400 uppercase tracking-wider">
                      Best Time to Visit
                    </h4>
                    <p className="text-neutral-700 text-sm font-semibold mt-0.5">
                      {destination.bestTimeToVisit}
                    </p>
                  </div>
                </div>
              )}

              {destination.climate && (
                <div className="flex items-start gap-4 p-3 bg-white border border-neutral-100 rounded-2xl">
                  <div className="w-10 h-10 rounded-xl bg-blue-50 text-blue-500 flex items-center justify-center shrink-0">
                    <CloudSun className="w-5 h-5" />
                  </div>
                  <div>
                    <h4 className="text-xs font-bold text-neutral-400 uppercase tracking-wider">
                      Climate
                    </h4>
                    <p className="text-neutral-700 text-sm font-semibold mt-0.5">
                      {destination.climate}
                    </p>
                  </div>
                </div>
              )}
            </div>
          </motion.div>
        </div>
      </section>

      {/* Local Attractions (if available) */}
      {destination.attractions && destination.attractions.length > 0 && (
        <section className="py-20 bg-neutral-50/70 border-t border-neutral-100">
          <div className="layout-container">
            <SectionHeader
              title={`Top Attractions in ${destination.name}`}
              subtitle="Must-visit sightseeing points and activities for your checklist"
              align="left"
            />

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mt-12">
              {destination.attractions.map((attraction, idx) => {
                const attractionImg = getOptimizedImageUrl(
                  attraction.image || "/images/placeholder-landscape.png",
                  800,
                );
                return (
                  <motion.div
                    key={attraction.id}
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    transition={{ duration: 0.4, delay: idx * 0.05 }}
                    className="bg-white rounded-3xl overflow-hidden border border-neutral-200/50 shadow-sm flex flex-col h-full"
                  >
                    <div className="relative aspect-[16/10] w-full">
                      <Image
                        src={attractionImg}
                        alt={attraction.name}
                        fill
                        className="object-cover"
                      />
                    </div>
                    <div className="p-6 flex flex-col flex-grow">
                      <h3 className="font-bold text-base text-neutral-800 leading-snug mb-2">
                        {attraction.name}
                      </h3>
                      <p className="text-xs text-neutral-500 font-medium leading-relaxed flex-grow">
                        {attraction.description ||
                          "A gorgeous location worth exploring during your tour."}
                      </p>
                    </div>
                  </motion.div>
                );
              })}
            </div>
          </div>
        </section>
      )}

      {/* Tour Packages visiting this destination */}
      <section className="py-24 border-t border-neutral-100">
        <div className="layout-container">
          <SectionHeader
            title={`Tour Packages visiting ${destination.name}`}
            subtitle={`Browse our curated dynamic itineraries covering ${destination.name}`}
            align="left"
          />

          <div className="mt-12">
            {packages.length === 0 ? (
              <div className="text-center py-16 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
                <Compass className="w-10 h-10 text-neutral-300 mx-auto mb-4" />
                <h3 className="text-base font-bold text-neutral-800">No packages found</h3>
                <p className="text-neutral-500 text-xs mt-1.5 font-semibold">
                  We are currently designing customized itineraries for {destination.name}. Contact
                  us to tailor-make your tour!
                </p>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                {packages.map((pkg) => (
                  <PackageCard
                    key={pkg.id}
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    heroImage={pkg.heroImage}
                    destinations={pkg.destinations}
                    variant="white"
                    isFavorite={isFavorite(pkg.slug)}
                    onToggleFavorite={toggleFavorite}
                  />
                ))}
              </div>
            )}
          </div>
        </div>
      </section>
    </PageShell>
  );
}
