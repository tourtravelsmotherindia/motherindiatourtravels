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
      className={`flex flex-col md:flex-row ${
        isCenter
          ? "md:items-center md:justify-center text-center"
          : "md:items-end md:justify-between"
      } mb-12 gap-6 ${className}`}
    >
      <div className={isCenter ? "max-w-3xl mx-auto" : "max-w-4xl"}>
        {badge && (
          <span className="block text-brand text-xs font-semibold uppercase tracking-wider mb-2">
            {badge}
          </span>
        )}
        <h2 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight leading-[1.1]">
          {title}
        </h2>
        {subtitle && <p className="text-muted font-normal mt-2 text-sm md:text-base">{subtitle}</p>}
      </div>

      {rightSlot && <div className={`shrink-0 ${isCenter ? "mt-4 md:mt-0" : ""}`}>{rightSlot}</div>}
    </div>
  );
}
