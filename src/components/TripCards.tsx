"use client";

import { motion } from "framer-motion";
import { ArrowRight, ArrowUpRight, Clock, Heart, MapPin, Star } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useState } from "react";

interface PackageItem {
  id: string;
  slug: string;
  name: string;
  is_popular: boolean;
  is_domestic: boolean;
  destinations: string[];
  duration_range: string;
  hero_image: string;
  min_days: number;
}

interface PackagesData {
  packages: PackageItem[];
}

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

  return (
    <section id="packages" className="py-24 overflow-hidden layout-container">
      {/* Section Header */}
      <div className="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-6">
        <div>
          <h2 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight leading-[1.1]">
            Explore Trips
          </h2>
          <p className="text-muted font-normal mt-2">
            Handpicked adventures designed to inspire your next journey
          </p>
        </div>

        {/* Sliding Pill Switch Selector */}
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

          <Link
            href="/packages"
            className="hidden sm:flex items-center gap-2 text-brand hover:text-brand-hover font-semibold text-sm group shrink-0"
          >
            <span>See All Trips</span>
            <span className="w-8 h-8 rounded-full border border-brand/20 flex items-center justify-center group-hover:border-brand transition-all duration-300">
              <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5 duration-300" />
            </span>
          </Link>
        </div>
      </div>

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
          const imageSrc = pkg.hero_image || "/images/placeholder-landscape.png";

          return (
            <motion.div
              initial={{ opacity: 0 }}
              whileInView={{ opacity: 1 }}
              viewport={{ once: true, margin: "-50px" }}
              transition={{ duration: 0.4, delay: idx * 0.05 }}
              key={pkg.id}
              className="group relative w-full h-[420px] xl:h-[450px] 2xl:h-[480px] rounded-[2rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-500 bg-gray-50 flex flex-col"
            >
              {/* Background Image */}
              <div className="absolute inset-0 z-0">
                <Image
                  src={imageSrc}
                  alt={pkg.name}
                  fill
                  sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 25vw"
                  className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
                />
                {/* Gradient overlays for readability */}
                <div className="absolute inset-x-0 top-0 h-24 bg-gradient-to-b from-black/40 to-transparent z-10" />
                <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/35 to-transparent z-10" />
              </div>

              {/* Glassmorphic Duration Badge */}
              <div className="absolute top-4 left-4 z-20 bg-white/20 backdrop-blur-md border border-white/25 text-white text-[10px] font-semibold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm flex items-center gap-1.5 select-none">
                <Clock className="w-3.5 h-3.5" />
                <span>{pkg.duration_range || `${pkg.min_days} Days`}</span>
              </div>

              {/* Glassmorphic Favorite Button */}
              <button
                onClick={(e) => {
                  e.preventDefault();
                  e.stopPropagation();
                  toggleFavorite(pkg.slug);
                }}
                className="absolute top-4 right-4 z-20 w-9 h-9 rounded-full bg-white/20 backdrop-blur-md border border-white/25 flex items-center justify-center text-white hover:bg-white hover:text-red-500 hover:border-white transition-all duration-300 active:scale-90 group/heart cursor-pointer shadow-sm"
              >
                <Heart
                  className={`w-4.5 h-4.5 transition-transform duration-300 group-hover/heart:scale-110 ${
                    isFavorite ? "fill-red-500 text-red-500" : "text-white"
                  }`}
                />
              </button>

              {/* Bottom Card Content overlay */}
              <div className="mt-auto p-6 z-20 flex flex-col justify-end">
                <h3 className="text-xl font-bold text-white leading-snug tracking-tight mb-2 group-hover:text-brand transition-colors duration-300 drop-shadow-sm">
                  {pkg.name}
                </h3>
                <div className="flex items-center justify-between mt-1 gap-2">
                  {/* Destinations with pin icon */}
                  <div className="flex items-center gap-1.5 text-white/80 text-xs font-normal">
                    <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
                    <span className="truncate max-w-[130px] sm:max-w-[160px] drop-shadow-sm">
                      {pkg.destinations.slice(0, 2).join(", ")}
                      {pkg.destinations.length > 2 && "..."}
                    </span>
                  </div>

                  {/* Rating & Action Button */}
                  <div className="flex items-center gap-2 shrink-0">
                    <div className="flex items-center gap-1 bg-black/45 backdrop-blur-md border border-white/10 px-2 py-1 rounded-lg text-yellow-400 text-[10px] font-extrabold shadow-sm select-none">
                      <Star className="w-3 h-3 fill-current" />
                      <span>4.9</span>
                    </div>
                    <div className="w-8 h-8 rounded-full bg-white text-brand-dark flex items-center justify-center shadow-md transition-all duration-300 group-hover:bg-brand group-hover:text-white group-hover:scale-105 active:scale-95">
                      <ArrowUpRight className="w-4 h-4 transition-transform duration-300 group-hover:rotate-45" />
                    </div>
                  </div>
                </div>
              </div>

              {/* Card Link overlay to wrap the entire card visually */}
              <Link
                href={`/packages/${pkg.slug}`}
                className="absolute inset-0 z-10 cursor-pointer"
                aria-label={`View details for ${pkg.name}`}
              />
            </motion.div>
          );
        })}
      </motion.div>

      {/* Mobile-only See All Button */}
      <div className="mt-10 flex justify-center sm:hidden">
        <Link
          href="/packages"
          className="flex items-center gap-2 text-brand hover:text-brand-hover font-bold text-sm group"
        >
          <span>See All Trips</span>
          <span className="w-8 h-8 rounded-full border border-brand/20 flex items-center justify-center group-hover:border-brand transition-all duration-300">
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5 duration-300" />
          </span>
        </Link>
      </div>
    </section>
  );
}
