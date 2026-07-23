"use client";

import React from "react";

interface SectionHeaderProps {
  title: React.ReactNode;
  subtitle?: string;
  badge?: string; // Optional small text above title
  align?: "left" | "center"; // default "left"
  rightSlot?: React.ReactNode; // Optional right-aligned CTA or Nav
  className?: string;
}

export default function SectionHeader({
  title,
  subtitle,
  badge,
  align = "left",
  rightSlot,
  className = "",
}: SectionHeaderProps) {
  const isCenter = align === "center";

  return (
    <div
      className={`flex ${
        isCenter
          ? "flex-col items-center justify-center text-center"
          : "flex-row items-end justify-between animate-fade-in"
      } mb-8 md:mb-12 gap-4 ${className}`}
    >
      <div className={isCenter ? "max-w-3xl mx-auto" : "max-w-4xl"}>
        {badge && (
          <span className="block text-brand text-xs font-semibold uppercase tracking-wider mb-2">
            {badge}
          </span>
        )}
        <h2 className="text-2xl sm:text-3xl md:text-5xl font-bold text-foreground tracking-tight leading-[1.1]">
          {title}
        </h2>
        {subtitle && <p className="text-muted font-normal mt-2 text-sm md:text-base">{subtitle}</p>}
      </div>

      {rightSlot && <div className="shrink-0">{rightSlot}</div>}
    </div>
  );
}
