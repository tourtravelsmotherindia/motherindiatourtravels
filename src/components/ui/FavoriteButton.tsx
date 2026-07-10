"use client";

import { Heart } from "lucide-react";
import React from "react";

interface FavoriteButtonProps {
  isFavorite: boolean;
  onToggle: (e: React.MouseEvent<HTMLButtonElement>) => void;
  variant?: "solid" | "glass"; // default "solid"
  size?: "sm" | "md"; // default "sm" (w-9 h-9) vs "md" (w-11 h-11)
  ariaLabel?: string;
}

export default function FavoriteButton({
  isFavorite,
  onToggle,
  variant = "solid",
  size = "sm",
  ariaLabel = "Toggle Favorite",
}: FavoriteButtonProps) {
  const sizeClasses = size === "sm" ? "w-9 h-9" : "w-11 h-11";

  const iconSizeClasses = size === "sm" ? "w-4 h-4" : "w-5 h-5";

  const variantClasses =
    variant === "glass"
      ? "bg-white/20 backdrop-blur-md border border-white/25 text-white hover:bg-white hover:text-red-500 hover:border-white"
      : "bg-white hover:bg-neutral-50 border border-neutral-200/60 text-neutral-600 hover:text-red-500";

  return (
    <button
      type="button"
      onClick={onToggle}
      className={`rounded-full flex items-center justify-center transition-all duration-300 active:scale-90 group/heart cursor-pointer shadow-sm ${sizeClasses} ${variantClasses}`}
      aria-label={ariaLabel}
    >
      <Heart
        className={`transition-transform duration-300 group-hover/heart:scale-110 ${iconSizeClasses} ${
          isFavorite
            ? "fill-red-500 text-red-500 stroke-red-500"
            : variant === "glass"
              ? "text-white stroke-white"
              : "text-neutral-500 stroke-neutral-500"
        }`}
      />
    </button>
  );
}
