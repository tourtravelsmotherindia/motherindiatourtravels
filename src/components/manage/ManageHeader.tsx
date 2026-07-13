"use client";

import { ChevronRight, Menu } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import React from "react";

import { ADMIN_TABLES } from "@/lib/adminSchema";

interface ManageHeaderProps {
  onOpenMobile: () => void;
  title?: string;
  subtitle?: string;
}

export default function ManageHeader({ onOpenMobile, title, subtitle }: ManageHeaderProps) {
  const pathname = usePathname();

  // Generate breadcrumbs from pathname
  const generateBreadcrumbs = () => {
    const segments = pathname.split("/").filter(Boolean);
    const breadcrumbs = [];

    // Base Manage link
    breadcrumbs.push(
      <Link key="manage" href="/manage/" className="hover:text-brand transition-colors">
        Manage
      </Link>,
    );

    // Dynamic segments
    let currentPath = "/manage";
    segments.slice(1).forEach((segment, idx) => {
      // Clean up segment if it's table slug
      const tableConfig = ADMIN_TABLES[segment];
      const label = tableConfig
        ? tableConfig.label
        : segment.charAt(0).toUpperCase() + segment.slice(1);
      currentPath += `/${segment}`;

      breadcrumbs.push(
        <React.Fragment key={segment}>
          <ChevronRight className="w-3 h-3 text-neutral-400 mx-1 flex-shrink-0" />
          {idx === segments.length - 2 ? (
            <span className="text-neutral-900 font-semibold truncate">{label}</span>
          ) : (
            <Link href={currentPath} className="hover:text-brand transition-colors truncate">
              {label}
            </Link>
          )}
        </React.Fragment>,
      );
    });

    return breadcrumbs;
  };

  // Determine page headings
  const getHeadings = () => {
    if (title) return { heading: title, sub: subtitle };

    const segments = pathname.split("/").filter(Boolean);
    const tableSlug = segments[1];

    if (!tableSlug) {
      return {
        heading: "Dashboard Overview",
        sub: "Welcome to the Mother India Tour Travels control center. Here's what's happening today.",
      };
    }

    const tableConfig = ADMIN_TABLES[tableSlug];
    if (tableConfig) {
      return {
        heading: `${tableConfig.label} Management`,
        sub: `Browse, search, edit, and create records inside the ${tableConfig.label} database table.`,
      };
    }

    return {
      heading: tableSlug.charAt(0).toUpperCase() + tableSlug.slice(1),
      sub: "Manage your database records dynamically.",
    };
  };

  const { heading, sub } = getHeadings();

  return (
    <header className="sticky top-0 bg-white/80 backdrop-blur-md border-b border-border-light px-6 py-4 flex flex-col gap-3 z-10 lg:z-0">
      <div className="flex items-center justify-between">
        {/* Left: Mobile hamburger & Breadcrumbs */}
        <div className="flex items-center gap-3 min-w-0">
          <button
            onClick={onOpenMobile}
            className="lg:hidden p-2 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-500 hover:text-neutral-800 transition-colors"
          >
            <Menu className="w-5 h-5" />
          </button>

          <div className="flex items-center text-xs font-medium text-neutral-500 min-w-0 overflow-x-auto no-scrollbar">
            {generateBreadcrumbs()}
          </div>
        </div>

        {/* Right: Quick Action or Status */}
        <div className="hidden sm:flex items-center gap-4">
          <div className="flex items-center gap-2 text-xs text-neutral-500 bg-neutral-100 px-3.5 py-1.5 rounded-full font-medium border border-neutral-200">
            <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
            <span>API Server Live</span>
          </div>
        </div>
      </div>

      {/* Main Heading Text */}
      <div className="mt-1">
        <h1 className="text-xl md:text-2xl font-bold font-display text-foreground leading-tight">
          {heading}
        </h1>
        {sub && (
          <p className="text-xs md:text-sm text-neutral-500 font-normal mt-1 leading-relaxed max-w-3xl">
            {sub}
          </p>
        )}
      </div>
    </header>
  );
}
