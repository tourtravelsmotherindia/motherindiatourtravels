"use client";

import { motion } from "framer-motion";
import { ArrowUpRight, Clock, MapPin, Star } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React from "react";

import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";

import FavoriteButton from "../ui/FavoriteButton";

interface PackageCardProps {
  id: string;
  slug: string;
  name: string;
  heroImage?: string;
  hero_image?: string;
  durationText?: string;
  duration_range?: string;
  min_days?: number;
  destinations: string[] | { destinationName: string }[] | unknown[];
  is_popular?: boolean;
  variant?: "white" | "overlay"; // default "white"
  priority?: boolean;
  isFavorite?: boolean;
  onToggleFavorite?: (slug: string) => void;
  showRating?: boolean; // overlay-variant only
  // Framer-motion props
  initial?: React.ComponentPropsWithoutRef<typeof motion.div>["initial"];
  whileInView?: React.ComponentPropsWithoutRef<typeof motion.div>["whileInView"];
  viewport?: React.ComponentPropsWithoutRef<typeof motion.div>["viewport"];
  transition?: React.ComponentPropsWithoutRef<typeof motion.div>["transition"];
}

export default function PackageCard({
  slug,
  name,
  heroImage,
  hero_image,
  durationText,
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
  const rawImageSrc = heroImage || hero_image || "/images/placeholder-landscape.png";
  const imageSrc = getOptimizedImageUrl(rawImageSrc, 800);

  // Extract duration string (keep undefined if none exists)
  const duration = durationText || duration_range || (min_days ? `${min_days} Days` : undefined);

  // Map destinations properly (either string list or object list)
  const mappedDestinations = React.useMemo(() => {
    if (!destinations || !Array.isArray(destinations)) return [];
    return destinations
      .map((d) => {
        if (typeof d === "string") return d;
        if (d && typeof d === "object" && "destinationName" in d) {
          return d.destinationName;
        }
        return "";
      })
      .filter(Boolean);
  }, [destinations]);

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
        className="group relative w-full h-[340px] sm:h-[380px] md:h-[400px] lg:h-[350px] xl:h-[380px] 2xl:h-[420px] rounded-[2rem] overflow-hidden shadow-sm bg-gray-50 flex flex-col border-0"
      >
        <div className="absolute inset-0 z-0">
          <Image
            src={imageSrc}
            alt={name}
            fill
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 25vw"
            className="object-cover"
            priority={priority}
          />
          <div className="absolute inset-x-0 top-0 h-24 bg-gradient-to-b from-black/40 to-transparent z-10" />
          <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/35 to-transparent z-10" />
        </div>

        {duration && (
          <div className="absolute top-4 left-4 z-20 bg-white/20 backdrop-blur-md border border-white/25 text-white text-[10px] font-semibold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm flex items-center gap-1.5 select-none">
            <Clock className="w-3.5 h-3.5" />
            <span>{duration}</span>
          </div>
        )}

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
          <h3 className="text-lg xl:text-xl font-bold text-white leading-snug tracking-tight mb-2 drop-shadow-sm">
            {name}
          </h3>
          <div className="flex items-center justify-between mt-1 gap-2">
            <div className="flex items-center gap-1.5 text-white/80 text-xs font-normal min-w-0 flex-1">
              <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
              <span className="truncate drop-shadow-sm">
                {mappedDestinations.slice(0, 2).join(", ")}
                {mappedDestinations.length > 2 && "..."}
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {showRating && (
                <div className="flex items-center gap-1 bg-black/45 backdrop-blur-md border border-white/10 px-2 py-1 rounded-lg text-yellow-400 text-[10px] font-extrabold shadow-sm select-none">
                  <Star className="w-3.5 h-3.5 fill-current" />
                  <span>4.9</span>
                </div>
              )}
              <div className="w-8 h-8 rounded-full bg-white text-brand-dark flex items-center justify-center shadow-md transition-all duration-300 active:scale-95">
                <ArrowUpRight className="w-4 h-4" />
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

  // "white" variant (Heart icon positioned on top-right of the image)
  return (
    <motion.div
      initial={initial}
      whileInView={whileInView}
      viewport={viewport}
      transition={transition}
      className="group relative bg-white rounded-[2rem] shadow-sm flex flex-col h-full justify-between cursor-pointer border border-neutral-100 overflow-hidden"
    >
      <div>
        {/* Flush Image Container with curvy bottom border radius */}
        <div className="relative w-full aspect-[4/3] bg-neutral-100 z-0 rounded-b-[1.5rem] overflow-hidden">
          <Image
            src={imageSrc}
            alt={name}
            fill
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
            className="object-cover"
            priority={priority}
          />
        </div>

        {/* Padded Text Content Block */}
        <div className="px-5 pb-5 pt-4">
          {duration ? (
            /* Layout when duration exists */
            <div>
              <div className="flex items-center gap-1.5 text-neutral-600 font-normal mb-2.5">
                <Clock className="w-4.5 h-4.5 text-neutral-400 shrink-0" />
                <span className="text-xs font-semibold">{duration}</span>
              </div>

              <h3 className="font-bold text-base text-foreground leading-snug line-clamp-1 mb-2">
                {name}
              </h3>
            </div>
          ) : (
            /* Layout when duration is absent (Name is at the very top of the text block) */
            <h3 className="font-bold text-base text-foreground leading-snug line-clamp-2 mb-2.5">
              {name}
            </h3>
          )}

          <div className="flex items-center gap-1.5 text-neutral-500 text-xs font-normal">
            <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
            <span className="truncate">{mappedDestinations.slice(0, 3).join(", ")}</span>
          </div>
        </div>
      </div>

      {onToggleFavorite && (
        <div className="absolute top-4 right-4 z-20">
          <FavoriteButton
            isFavorite={isFavorite}
            onToggle={handleFavoriteClick}
            variant="solid"
            size="sm"
          />
        </div>
      )}

      {/* Clickable Card Overlay */}
      <Link
        href={`/packages/${slug}`}
        className="absolute inset-0 z-10 cursor-pointer"
        aria-label={`View details for ${name}`}
      />
    </motion.div>
  );
}
