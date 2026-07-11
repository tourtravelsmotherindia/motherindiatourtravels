"use client";

import { motion } from "framer-motion";
import { ArrowUpRight, Clock, MapPin, Star } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React from "react";

import FavoriteButton from "../ui/FavoriteButton";

interface PackageCardProps {
  id: string;
  slug: string;
  name: string;
  hero_image: string;
  duration_range: string;
  min_days: number;
  destinations: string[];
  is_popular?: boolean;
  variant?: "white" | "overlay"; // default "white"
  priority?: boolean;
  isFavorite?: boolean;
  onToggleFavorite?: (slug: string) => void;
  showRating?: boolean; // overlay-variant only
  // Framer-motion props
  initial?: any;
  whileInView?: any;
  viewport?: any;
  transition?: any;
}

export default function PackageCard({
  slug,
  name,
  hero_image,
  duration_range,
  min_days,
  destinations,
  variant = "white",
  priority = false,
  isFavorite = false,
  onToggleFavorite,
  showRating = true,
  initial,
  whileInView,
  viewport,
  transition,
}: PackageCardProps) {
  const imageSrc = hero_image || "/images/placeholder-landscape.png";
  const durationText = duration_range || `${min_days} Days`;

  const handleFavoriteClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    e.stopPropagation();
    if (onToggleFavorite) {
      onToggleFavorite(slug);
    }
  };

  if (variant === "overlay") {
    return (
      <motion.div
        initial={initial}
        whileInView={whileInView}
        viewport={viewport}
        transition={transition}
        className="group relative w-full h-[340px] sm:h-[380px] md:h-[400px] lg:h-[350px] xl:h-[380px] 2xl:h-[420px] rounded-[2rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-500 bg-gray-50 flex flex-col"
      >
        <div className="absolute inset-0 z-0">
          <Image
            src={imageSrc}
            alt={name}
            fill
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 25vw"
            className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
            priority={priority}
          />
          <div className="absolute inset-x-0 top-0 h-24 bg-gradient-to-b from-black/40 to-transparent z-10" />
          <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/35 to-transparent z-10" />
        </div>

        <div className="absolute top-4 left-4 z-20 bg-white/20 backdrop-blur-md border border-white/25 text-white text-[10px] font-semibold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm flex items-center gap-1.5 select-none">
          <Clock className="w-3.5 h-3.5" />
          <span>{durationText}</span>
        </div>

        {onToggleFavorite && (
          <div className="absolute top-4 right-4 z-20">
            <FavoriteButton
              isFavorite={isFavorite}
              onToggle={handleFavoriteClick}
              variant="glass"
              size="sm"
            />
          </div>
        )}

        <div className="mt-auto p-5 xl:p-6 z-20 flex flex-col justify-end">
          <h3 className="text-lg xl:text-xl font-bold text-white leading-snug tracking-tight mb-2 group-hover:text-brand transition-colors duration-300 drop-shadow-sm">
            {name}
          </h3>
          <div className="flex items-center justify-between mt-1 gap-2">
            <div className="flex items-center gap-1.5 text-white/80 text-xs font-normal min-w-0 flex-1">
              <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
              <span className="truncate drop-shadow-sm">
                {destinations.slice(0, 2).join(", ")}
                {destinations.length > 2 && "..."}
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {showRating && (
                <div className="flex items-center gap-1 bg-black/45 backdrop-blur-md border border-white/10 px-2 py-1 rounded-lg text-yellow-400 text-[10px] font-extrabold shadow-sm select-none">
                  <Star className="w-3 h-3 fill-current" />
                  <span>4.9</span>
                </div>
              )}
              <div className="w-8 h-8 rounded-full bg-white text-brand-dark flex items-center justify-center shadow-md transition-all duration-300 group-hover:bg-brand group-hover:text-white group-hover:scale-105 active:scale-95">
                <ArrowUpRight className="w-4 h-4 transition-transform duration-300 group-hover:rotate-45" />
              </div>
            </div>
          </div>
        </div>

        <Link
          href={`/packages/${slug}`}
          className="absolute inset-0 z-10 cursor-pointer"
          aria-label={`View details for ${name}`}
        />
      </motion.div>
    );
  }

  // "white" variant
  return (
    <motion.div
      initial={initial}
      whileInView={whileInView}
      viewport={viewport}
      transition={transition}
      className="group relative bg-white border border-neutral-100 rounded-[2rem] p-4 shadow-card hover:shadow-premium transition-all duration-500 flex flex-col h-full justify-between"
    >
      <div>
        <div className="relative w-full h-[220px] md:h-[260px] lg:h-[280px] xl:h-[320px] rounded-[1.5rem] overflow-hidden bg-neutral-100 z-0">
          <Image
            src={imageSrc}
            alt={name}
            fill
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
            className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
            priority={priority}
          />
        </div>

        <div className="flex items-center justify-between mt-5 mb-3 px-1">
          <div className="flex items-center gap-1.5 text-neutral-600 font-normal">
            <Clock className="w-4 h-4 text-neutral-400 shrink-0" />
            <span className="text-sm">{durationText}</span>
          </div>

          {onToggleFavorite && (
            <FavoriteButton
              isFavorite={isFavorite}
              onToggle={handleFavoriteClick}
              variant="solid"
              size="sm"
            />
          )}
        </div>

        <h3 className="font-bold text-lg text-foreground leading-snug px-1 line-clamp-1 mb-2">
          {name}
        </h3>

        <div className="flex items-center gap-1.5 text-neutral-500 text-xs px-1 mb-6 font-normal">
          <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
          <span className="truncate">{destinations.join(", ")}</span>
        </div>
      </div>

      <div className="px-1 pb-1">
        <Link
          href={`/packages/${slug}`}
          className="block w-full border border-neutral-900 text-neutral-900 hover:bg-brand hover:border-brand hover:text-white font-semibold text-xs uppercase tracking-wider py-3.5 rounded-full transition-all duration-300 text-center select-none cursor-pointer"
        >
          View Details
        </Link>
      </div>
    </motion.div>
  );
}
