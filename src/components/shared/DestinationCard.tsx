"use client";

import Image from "next/image";
import Link from "next/link";
import { useState } from "react";

import FavoriteButton from "@/components/ui/FavoriteButton";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type DestinationDisplay } from "@/types/destination";

export default function DestinationCard({
  dest,
  isMobile = false,
  priority = false,
}: {
  dest: DestinationDisplay;
  isMobile?: boolean;
  priority?: boolean;
}) {
  const [isFavorite, setIsFavorite] = useState(false);

  const rawImageSrc = dest.image || "/images/placeholder-landscape.png";
  const imageSrc = getOptimizedImageUrl(rawImageSrc, 1000);
  const locationText = dest.stateName ? `${dest.stateName}, ${dest.countryName}` : dest.countryName;

  return (
    <div className="relative h-full w-full rounded-[2.5rem] overflow-hidden group shadow-card border border-border-light cursor-pointer">
      {/* 1. Base Sharp Background Image */}
      <Image
        src={imageSrc}
        alt={dest.name}
        fill
        sizes={isMobile ? "(max-width: 768px) 100vw, 290px" : "(max-width: 1024px) 50vw, 600px"}
        className="object-cover transition-transform duration-700 group-hover:scale-105"
        priority={priority}
      />

      {/* 2. Duplicate Blurred Background Image for Bottom Gradient Blur */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none z-0 [mask-image:linear-gradient(to_top,black_15%,transparent_65%)]">
        <Image
          src={imageSrc}
          alt=""
          fill
          sizes={isMobile ? "(max-width: 768px) 100vw, 290px" : "(max-width: 1024px) 50vw, 600px"}
          className="object-cover blur-[8px] scale-[1.05] transition-transform duration-700 group-hover:scale-[1.10]"
          priority={priority}
        />
      </div>

      {/* 3. Subtle Darkening Gradient Overlay for High Text Readability */}
      <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/15 to-transparent transition-opacity duration-500 group-hover:from-black/75 group-hover:via-black/25 z-0" />

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

      {/* Content Overlay - placed directly on the card, no box/borders */}
      <div className="absolute inset-0 p-6 sm:p-8 flex flex-col justify-end text-white z-10">
        <div className="flex flex-col gap-1 sm:gap-1.5">
          <h3 className="text-xl sm:text-2xl md:text-3xl font-bold tracking-tight leading-tight">
            {dest.name}
          </h3>
          <p className="text-xs sm:text-sm md:text-base text-white/80 font-normal leading-normal tracking-wide">
            {locationText}
          </p>
        </div>
      </div>

      {/* Full-card clickable overlay for all viewports */}
      <Link
        href={`/destinations/${dest.slug}/`}
        className="absolute inset-0 z-20 cursor-pointer"
        aria-label={`View details for ${dest.name}`}
      />
    </div>
  );
}
