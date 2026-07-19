"use client";

import { Star } from "lucide-react";
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
            href={`/destinations/${dest.slug}/`}
            className="bg-brand hover:bg-brand-hover text-white text-xs lg:text-sm font-semibold py-2 px-6 rounded-full transition-colors cursor-pointer shadow-sm inline-block"
          >
            View
          </Link>
        </div>
      </div>

      {/* Full-card clickable overlay for desktop (mobile uses explicit View button) */}
      <Link
        href={`/destinations/${dest.slug}/`}
        className="absolute inset-0 z-10 cursor-pointer hidden md:block"
        aria-label={`View details for ${dest.name}`}
      />
    </div>
  );
}
