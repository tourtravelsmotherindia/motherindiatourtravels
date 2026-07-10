"use client";

import React from "react";

interface DotIndicatorProps {
  count: number;
  activeIndex: number;
  onChange: (index: number) => void;
  className?: string;
}

export default function DotIndicator({
  count,
  activeIndex,
  onChange,
  className = "",
}: DotIndicatorProps) {
  if (count <= 1) return null;

  return (
    <div className={`flex items-center justify-center gap-2 ${className}`}>
      {Array.from({ length: count }).map((_, idx) => (
        <button
          type="button"
          key={idx}
          onClick={() => onChange(idx)}
          className={`h-2.5 rounded-full transition-all duration-300 cursor-pointer ${
            activeIndex === idx ? "w-8 bg-brand" : "w-2.5 bg-muted/30 hover:bg-muted/50"
          }`}
          aria-label={`Go to slide ${idx + 1}`}
        />
      ))}
    </div>
  );
}
