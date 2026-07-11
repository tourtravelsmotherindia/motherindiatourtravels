"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Minus, Plus, Users } from "lucide-react";
import React, { useEffect, useRef } from "react";

interface TravelersFieldProps {
  variant: "search" | "form";
  adults: number;
  setAdults: (num: number) => void;
  childrenCount: number;
  setChildrenCount: (num: number) => void;
  kids: number;
  setKids: (num: number) => void;
  activeDropdown: string | null;
  setActiveDropdown: (dropdown: "dates" | "guests" | null) => void;
}

export default function TravelersField({
  variant,
  adults,
  setAdults,
  childrenCount,
  setChildrenCount,
  kids,
  setKids,
  activeDropdown,
  setActiveDropdown,
}: TravelersFieldProps) {
  const guestsRef = useRef<HTMLDivElement>(null);
  const guestsPopoverRef = useRef<HTMLDivElement>(null);

  const active = activeDropdown === "guests";

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      const target = event.target as Node;
      if (
        activeDropdown === "guests" &&
        guestsRef.current &&
        !guestsRef.current.contains(target) &&
        guestsPopoverRef.current &&
        !guestsPopoverRef.current.contains(target)
      ) {
        setActiveDropdown(null);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [activeDropdown, setActiveDropdown]);

  const formatTravelersSummary = () => {
    const total = adults + childrenCount + kids;
    if (total === 0) return "Add travelers";
    const parts = [];
    parts.push(`${adults} Adult${adults > 1 ? "s" : ""}`);
    if (childrenCount > 0) {
      parts.push(`${childrenCount} Child${childrenCount > 1 ? "ren" : ""}`);
    }
    if (kids > 0) {
      parts.push(`${kids} Kid${kids > 1 ? "s" : ""}`);
    }
    return `${total} Traveler${total > 1 ? "s" : ""} (${parts.join(", ")})`;
  };

  const popoverContent = (
    <div className="space-y-6">
      {/* Adults row */}
      <div className="flex items-center justify-between">
        <div>
          <div className="text-sm font-bold text-foreground">Adults</div>
          <div className="text-xs text-muted">12 years & above</div>
        </div>
        <div className="flex items-center gap-3">
          <button
            type="button"
            onClick={() => setAdults(Math.max(1, adults - 1))}
            disabled={adults <= 1}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
          >
            <Minus className="w-4 h-4" />
          </button>
          <span className="text-sm font-bold text-foreground w-4 text-center">{adults}</span>
          <button
            type="button"
            onClick={() => setAdults(adults + 1)}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
          </button>
        </div>
      </div>

      {/* Children row */}
      <div className="flex items-center justify-between">
        <div>
          <div className="text-sm font-bold text-foreground">Children</div>
          <div className="text-xs text-muted font-sans font-medium">From 5 to under 12</div>
        </div>
        <div className="flex items-center gap-3">
          <button
            type="button"
            onClick={() => setChildrenCount(Math.max(0, childrenCount - 1))}
            disabled={childrenCount <= 0}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
          >
            <Minus className="w-4 h-4" />
          </button>
          <span className="text-sm font-bold text-foreground w-4 text-center">{childrenCount}</span>
          <button
            type="button"
            onClick={() => setChildrenCount(childrenCount + 1)}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
          </button>
        </div>
      </div>

      {/* Kids row */}
      <div className="flex items-center justify-between">
        <div>
          <div className="text-sm font-bold text-foreground">Kids</div>
          <div className="text-xs text-muted font-sans font-medium">From 2 to under 5</div>
        </div>
        <div className="flex items-center gap-3">
          <button
            type="button"
            onClick={() => setKids(Math.max(0, kids - 1))}
            disabled={kids <= 0}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
          >
            <Minus className="w-4 h-4" />
          </button>
          <span className="text-sm font-bold text-foreground w-4 text-center">{kids}</span>
          <button
            type="button"
            onClick={() => setKids(kids + 1)}
            className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
          </button>
        </div>
      </div>

      {/* Divider & Apply Button */}
      <div className="border-t border-border-light pt-4 flex justify-end">
        <button
          type="button"
          onClick={() => setActiveDropdown(null)}
          className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer border-none"
        >
          Apply
        </button>
      </div>
    </div>
  );

  if (variant === "search") {
    return (
      <div
        ref={guestsRef}
        className="relative flex items-center gap-3.5 pt-4 sm:pt-0 lg:px-4 cursor-pointer w-full select-none font-sans"
        onClick={() => setActiveDropdown(active ? null : "guests")}
      >
        <Users className="w-5 h-5 text-brand shrink-0" />
        <div className="flex-1 min-w-0 font-sans">
          <span className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5 font-sans">
            Travelers
          </span>
          <div className="text-sm font-semibold text-foreground truncate font-sans">
            {formatTravelersSummary()}
          </div>
        </div>

        {/* Guests Dropdown */}
        <AnimatePresence>
          {active && (
            <motion.div
              ref={guestsPopoverRef}
              initial={{ opacity: 0, y: 10, scale: 0.95 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: 10, scale: 0.95 }}
              transition={{ duration: 0.15 }}
              onClick={(e) => e.stopPropagation()}
              className="absolute top-full right-0 mt-3 w-full sm:w-[320px] bg-white rounded-2xl border border-border-light shadow-2xl p-5 z-40 cursor-default"
            >
              {popoverContent}
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    );
  }

  // Form variant
  return (
    <div className="relative font-sans" ref={guestsRef}>
      <div
        className="flex flex-col gap-2 cursor-pointer select-none"
        onClick={() => setActiveDropdown(active ? null : "guests")}
      >
        <span className="text-xs font-semibold text-neutral-500 ml-1">Travelers</span>
        <div className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm font-semibold text-foreground hover:border-brand/40 focus-within:border-brand transition-all duration-200 flex items-center gap-2.5 min-h-[46px]">
          <Users className="w-4 h-4 text-brand shrink-0" />
          <span className="truncate">{formatTravelersSummary()}</span>
        </div>
      </div>

      {/* Absolute Guests Counters Popover */}
      <AnimatePresence>
        {active && (
          <motion.div
            ref={guestsPopoverRef}
            initial={{ opacity: 0, y: 10, scale: 0.95 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 10, scale: 0.95 }}
            transition={{ duration: 0.15 }}
            onClick={(e) => e.stopPropagation()}
            className="absolute top-full left-1/2 -translate-x-1/2 sm:left-0 sm:translate-x-0 mt-2 w-full sm:w-[320px] bg-white rounded-2xl border border-border-light shadow-2xl p-5 z-40 cursor-default"
          >
            {popoverContent}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
