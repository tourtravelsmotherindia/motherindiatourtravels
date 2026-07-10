"use client";

import { ChevronRight } from "lucide-react";
import Link from "next/link";
import React from "react";

interface BreadcrumbItem {
  label: string;
  href?: string;
}

interface BreadcrumbsProps {
  items: BreadcrumbItem[];
  variant?: "brackets" | "chevrons"; // default "chevrons"
  className?: string;
}

export default function Breadcrumbs({
  items,
  variant = "chevrons",
  className = "",
}: BreadcrumbsProps) {
  if (items.length === 0) return null;

  if (variant === "brackets") {
    return (
      <div className={`text-xs font-semibold text-neutral-400 mb-6 tracking-wider ${className}`}>
        [
        {items.map((item, idx) => {
          const isLast = idx === items.length - 1;
          return (
            <React.Fragment key={idx}>
              {idx > 0 && <span className="mx-1 text-neutral-300">/</span>}
              {isLast || !item.href ? (
                <span className="text-brand">{item.label}</span>
              ) : (
                <Link href={item.href} className="hover:text-brand transition-colors duration-200">
                  {item.label}
                </Link>
              )}
            </React.Fragment>
          );
        })}
        ]
      </div>
    );
  }

  return (
    <nav
      className={`flex items-center gap-2 text-xs md:text-sm font-medium text-neutral-400 mb-8 font-sans ${className}`}
      aria-label="Breadcrumb"
    >
      {items.map((item, idx) => {
        const isLast = idx === items.length - 1;
        return (
          <React.Fragment key={idx}>
            {idx > 0 && <ChevronRight className="w-3 h-3 text-neutral-300" />}
            {isLast || !item.href ? (
              <span className="text-neutral-500 font-semibold truncate max-w-[200px] md:max-w-none">
                {item.label}
              </span>
            ) : (
              <Link href={item.href} className="hover:text-brand transition-colors">
                {item.label}
              </Link>
            )}
          </React.Fragment>
        );
      })}
    </nav>
  );
}
