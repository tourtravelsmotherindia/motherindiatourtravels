"use client";

import { ArrowLeft, ArrowRight } from "lucide-react";
import React from "react";

interface PrevNextNavProps {
  onPrev: () => void;
  onNext: () => void;
  prevAriaLabel?: string;
  nextAriaLabel?: string;
  size?: "sm" | "md"; // sm = w-10 h-10, md = w-12 h-12 (default)
  className?: string;
}

export default function PrevNextNav({
  onPrev,
  onNext,
  prevAriaLabel = "Previous slide",
  nextAriaLabel = "Next slide",
  size = "md",
  className = "",
}: PrevNextNavProps) {
  const sizeClasses = size === "sm" ? "w-10 h-10" : "w-12 h-12";
  const iconSizeClasses = size === "sm" ? "w-4.5 h-4.5" : "w-5 h-5";

  return (
    <div className={`flex items-center gap-3 shrink-0 ${className}`}>
      <button
        type="button"
        onClick={onPrev}
        className={`rounded-full border border-zinc-200 bg-white flex items-center justify-center text-zinc-700 hover:bg-zinc-50 hover:border-zinc-300 transition-all duration-200 cursor-pointer shadow-sm ${sizeClasses}`}
        aria-label={prevAriaLabel}
      >
        <ArrowLeft className={iconSizeClasses} />
      </button>
      <button
        type="button"
        onClick={onNext}
        className={`rounded-full bg-brand flex items-center justify-center text-white hover:bg-brand-hover transition-all duration-200 cursor-pointer shadow-sm ${sizeClasses}`}
        aria-label={nextAriaLabel}
      >
        <ArrowRight className={iconSizeClasses} />
      </button>
    </div>
  );
}
