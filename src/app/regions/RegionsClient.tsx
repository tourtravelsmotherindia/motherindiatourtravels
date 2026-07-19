"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronDown, ChevronUp, Compass, Search, SlidersHorizontal, X } from "lucide-react";
import { useSearchParams } from "next/navigation";
import { Suspense, useEffect, useMemo, useState } from "react";

import PageShell from "@/components/layout/PageShell";
import DestinationCard from "@/components/shared/DestinationCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { type CompanyData } from "@/types/company";
import { type RegionWithDestinations } from "@/types/destination";

function RegionsContent({
  regionsData,
  companyData,
}: {
  regionsData: RegionWithDestinations[];
  companyData: CompanyData | null;
}) {
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState(() => searchParams.get("search") ?? "");
  const [selectedType, setSelectedType] = useState(() => searchParams.get("type") ?? "all");
  const [selectedRegion, setSelectedRegion] = useState(() => searchParams.get("region") ?? "all");
  const [sortBy, setSortBy] = useState(() => searchParams.get("sortBy") ?? "default");
  const [showFilters, setShowFilters] = useState(false);

  // Sync search parameters from URL
  const [prevParamsStr, setPrevParamsStr] = useState(() => searchParams.toString());
  const currentParams = searchParams.toString();
  if (currentParams !== prevParamsStr) {
    setPrevParamsStr(currentParams);
    setSearchQuery(searchParams.get("search") ?? "");
    setSelectedType(searchParams.get("type") ?? "all");
    setSelectedRegion(searchParams.get("region") ?? "all");
    setSortBy(searchParams.get("sortBy") ?? "default");
  }

  // Sync local filter states to URL search parameters
  useEffect(() => {
    const params = new URLSearchParams();
    if (searchQuery.trim()) {
      params.set("search", searchQuery);
    }
    if (selectedType !== "all") {
      params.set("type", selectedType);
    }
    if (selectedRegion !== "all") {
      params.set("region", selectedRegion);
    }
    if (sortBy !== "default") {
      params.set("sortBy", sortBy);
    }

    const newQuery = params.toString();
    const currentQuery = window.location.search.replace(/^\?/, "");

    if (newQuery !== currentQuery) {
      const newUrl = `${window.location.pathname}${newQuery ? "?" + newQuery : ""}`;
      window.history.replaceState(null, "", newUrl);
    }
  }, [searchQuery, selectedType, selectedRegion, sortBy]);

  const typeOptions = [
    { value: "all", label: "Any Type" },
    { value: "CITY", label: "City" },
    { value: "REGION", label: "Region" },
    { value: "BEACH", label: "Beach" },
    { value: "HILL_STATION", label: "Hill Station" },
    { value: "WILDLIFE", label: "Wildlife" },
    { value: "PILGRIMAGE", label: "Pilgrimage" },
    { value: "ISLAND", label: "Island" },
    { value: "HERITAGE", label: "Heritage" },
    { value: "ADVENTURE", label: "Adventure" },
  ];

  const regionOptions = useMemo(() => {
    const opts = [{ value: "all", label: "All Regions" }];
    regionsData.forEach((r) => {
      opts.push({ value: r.name, label: r.name });
    });
    return opts;
  }, [regionsData]);

  const sortOptions = [
    { value: "default", label: "Default (Featured First)" },
    { value: "alpha-asc", label: "Name: A to Z" },
    { value: "alpha-desc", label: "Name: Z to A" },
  ];

  const filteredRegions = useMemo(() => {
    return regionsData
      .map((reg) => {
        // Filter by region selection first
        if (selectedRegion !== "all" && reg.name !== selectedRegion) {
          return { ...reg, destinations: [] };
        }

        const filteredDests = reg.destinations.filter((dest) => {
          // Type filter
          if (selectedType !== "all" && dest.type !== selectedType) return false;

          // Search query
          if (searchQuery.trim()) {
            const q = searchQuery.toLowerCase();
            const matchName = dest.name.toLowerCase().includes(q);
            const matchState = dest.stateName?.toLowerCase().includes(q);
            const matchCountry = dest.countryName.toLowerCase().includes(q);
            return matchName || matchState || matchCountry;
          }

          return true;
        });

        // Apply sorting to destinations inside the region
        filteredDests.sort((a, b) => {
          if (sortBy === "alpha-asc") return a.name.localeCompare(b.name);
          if (sortBy === "alpha-desc") return b.name.localeCompare(a.name);

          if (a.isFeatured && !b.isFeatured) return -1;
          if (!a.isFeatured && b.isFeatured) return 1;
          return a.name.localeCompare(b.name);
        });

        return {
          ...reg,
          destinations: filteredDests,
        };
      })
      .filter((reg) => reg.destinations.length > 0);
  }, [regionsData, searchQuery, selectedType, selectedRegion, sortBy]);

  const isFilterActive = selectedType !== "all" || selectedRegion !== "all" || sortBy !== "default";

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container py-24">
        <SectionHeader
          title="Destinations By Region"
          subtitle="Explore adventures across every corner of the incredible Indian subcontinent, automatically grouped and organized by regional state mappings."
          align="left"
        />

        <div className="bg-neutral-50/80 border border-neutral-200/50 rounded-3xl p-5 md:p-6 mb-16 flex flex-col gap-4 shadow-sm">
          {/* Main Search Row */}
          <div className="flex flex-col lg:flex-row gap-4 items-stretch lg:items-center">
            {/* Search Input */}
            <div className="relative flex-1">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4.5 h-4.5 text-neutral-400" />
              <input
                type="text"
                placeholder="Search destinations in regional grids..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/40 focus:ring-1 focus:ring-brand/40 transition-all duration-300 font-semibold text-neutral-600 placeholder:text-neutral-400"
              />
              {searchQuery && (
                <button
                  onClick={() => setSearchQuery("")}
                  className="absolute right-4 top-1/2 -translate-y-1/2 p-0.5 hover:bg-neutral-100 rounded-full text-neutral-400 hover:text-neutral-600 cursor-pointer"
                >
                  <X className="w-4 h-4" />
                </button>
              )}
            </div>

            {/* Advanced Filters Trigger */}
            <div className="flex items-center gap-3">
              <button
                onClick={() => setShowFilters(!showFilters)}
                className={`flex items-center justify-center gap-2 px-5 py-2.5 rounded-full text-xs font-bold uppercase tracking-wider border transition-all duration-300 cursor-pointer select-none w-full sm:w-auto ${
                  showFilters || isFilterActive
                    ? "bg-brand/10 border-brand/35 text-brand"
                    : "bg-white border-neutral-200 text-neutral-600 hover:bg-neutral-50"
                }`}
              >
                <SlidersHorizontal className="w-4 h-4" />
                <span>Filters</span>
                {showFilters ? (
                  <ChevronUp className="w-3.5 h-3.5" />
                ) : (
                  <ChevronDown className="w-3.5 h-3.5" />
                )}
              </button>
            </div>
          </div>

          {/* Advanced Filter Panel */}
          <AnimatePresence>
            {showFilters && (
              <motion.div
                initial={{ height: 0, opacity: 0 }}
                animate={{ height: "auto", opacity: 1 }}
                exit={{ height: 0, opacity: 0 }}
                transition={{ duration: 0.25, ease: "easeInOut" }}
                className="overflow-hidden border-t border-neutral-200/50 pt-4"
              >
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                  {/* Select Region filter */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest pl-1">
                      Filter Region
                    </span>
                    <div className="relative">
                      <select
                        value={selectedRegion}
                        onChange={(e) => setSelectedRegion(e.target.value)}
                        className="w-full bg-white border border-neutral-200 rounded-full px-4 py-2.5 text-xs font-semibold text-neutral-600 focus:outline-none focus:border-brand/40 transition-all appearance-none cursor-pointer"
                      >
                        {regionOptions.map((opt) => (
                          <option key={opt.value} value={opt.value}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-neutral-400 pointer-events-none" />
                    </div>
                  </div>

                  {/* Destination Type Filter */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest pl-1">
                      Destination Type
                    </span>
                    <div className="relative">
                      <select
                        value={selectedType}
                        onChange={(e) => setSelectedType(e.target.value)}
                        className="w-full bg-white border border-neutral-200 rounded-full px-4 py-2.5 text-xs font-semibold text-neutral-600 focus:outline-none focus:border-brand/40 transition-all appearance-none cursor-pointer"
                      >
                        {typeOptions.map((opt) => (
                          <option key={opt.value} value={opt.value}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-neutral-400 pointer-events-none" />
                    </div>
                  </div>

                  {/* Sort Selector */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest pl-1">
                      Sort By
                    </span>
                    <div className="relative">
                      <select
                        value={sortBy}
                        onChange={(e) => setSortBy(e.target.value)}
                        className="w-full bg-white border border-neutral-200 rounded-full px-4 py-2.5 text-xs font-semibold text-neutral-600 focus:outline-none focus:border-brand/40 transition-all appearance-none cursor-pointer"
                      >
                        {sortOptions.map((opt) => (
                          <option key={opt.value} value={opt.value}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-neutral-400 pointer-events-none" />
                    </div>
                  </div>
                </div>

                {/* Filter Summary Actions */}
                {isFilterActive && (
                  <div className="mt-4 flex items-center justify-end">
                    <button
                      onClick={() => {
                        setSelectedType("all");
                        setSelectedRegion("all");
                        setSortBy("default");
                      }}
                      className="text-neutral-400 hover:text-brand text-xs font-bold uppercase tracking-wider flex items-center gap-1 cursor-pointer transition-colors"
                    >
                      <X className="w-3.5 h-3.5" />
                      <span>Clear Filters</span>
                    </button>
                  </div>
                )}
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Grouped Destination Grids by Region */}
        <div className="flex flex-col gap-20">
          {filteredRegions.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
              <Compass className="w-10 h-10 text-neutral-300 mx-auto mb-4" />
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                No regional destinations found
              </h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                We couldn&apos;t find any regional groupings matching your search query or filters.
              </p>
              <button
                onClick={() => {
                  setSearchQuery("");
                  setSelectedType("all");
                  setSelectedRegion("all");
                  setSortBy("default");
                }}
                className="mt-6 bg-brand hover:bg-brand-hover text-white font-bold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer shadow-md select-none"
              >
                Reset Filters
              </button>
            </div>
          ) : (
            filteredRegions.map((region) => (
              <div key={region.name} className="flex flex-col gap-6">
                {/* Region Title Block */}
                <div className="flex flex-col sm:flex-row sm:items-baseline justify-between border-b border-neutral-200/50 pb-3 gap-2">
                  <div className="flex items-center gap-3">
                    <h2 className="text-xl md:text-2xl font-extrabold text-foreground tracking-tight">
                      {region.name}
                    </h2>
                    <span className="text-[9px] font-extrabold tracking-widest text-brand bg-brand/10 border border-brand/20 px-2 py-0.5 rounded uppercase">
                      {region.destinations.length}{" "}
                      {region.destinations.length === 1 ? "dest" : "dests"}
                    </span>
                  </div>
                  <div className="flex items-center gap-1.5 flex-wrap">
                    {region.badges.map((badge, bIdx) => (
                      <span
                        key={bIdx}
                        className="bg-neutral-100 border border-neutral-200/50 text-neutral-500 rounded px-2 py-0.5 text-[9px] font-bold uppercase tracking-wider"
                      >
                        {badge}
                      </span>
                    ))}
                  </div>
                </div>

                {/* Destinations Grid */}
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                  {region.destinations.map((dest) => (
                    <div key={dest.slug} className="h-[360px] md:h-[400px] w-full">
                      <DestinationCard dest={dest} isMobile />
                    </div>
                  ))}
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </PageShell>
  );
}

export default function RegionsClient(props: {
  regionsData: RegionWithDestinations[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading regional packages...
        </div>
      }
    >
      <RegionsContent {...props} />
    </Suspense>
  );
}
