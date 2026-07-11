"use client";

import { motion } from "framer-motion";
import {
  Calendar,
  Compass,
  Grid,
  Heart,
  Search,
  SlidersHorizontal,
  Sparkles,
  Sun,
  Trees,
  Users,
  Wallet,
} from "lucide-react";
import { useSearchParams } from "next/navigation";
import { useEffect, useMemo, useRef, useState } from "react";

import Dropdown from "@/components/ui/Dropdown";
import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import Pagination from "@/components/shared/Pagination";
import SectionHeader from "@/components/shared/SectionHeader";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import { type PackageItem, type PackagesData } from "@/types/package";

export default function PackagesClient({
  packagesData,
  companyData,
}: {
  packagesData: PackagesData;
  companyData: CompanyData | null;
}) {
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState(() => searchParams.get("search") ?? "");
  const [selectedType, setSelectedType] = useState(() => searchParams.get("type") ?? "all");
  const [selectedCategory, setSelectedCategory] = useState(
    () => searchParams.get("category") ?? "all",
  );
  const [currentPage, setCurrentPage] = useState(1);

  // Sync search parameters from URL
  const [prevParamsStr, setPrevParamsStr] = useState(() => searchParams.toString());
  const currentParams = searchParams.toString();
  if (currentParams !== prevParamsStr) {
    setPrevParamsStr(currentParams);
    setSearchQuery(searchParams.get("search") ?? "");
    setSelectedType(searchParams.get("type") ?? "all");
    setSelectedCategory(searchParams.get("category") ?? "all");
    setCurrentPage(1);
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
    if (selectedCategory !== "all") {
      params.set("category", selectedCategory);
    }

    const newQuery = params.toString();
    const currentQuery = window.location.search.replace(/^\?/, "");

    if (newQuery !== currentQuery) {
      const newUrl = `${window.location.pathname}${newQuery ? "?" + newQuery : ""}`;
      window.history.replaceState(null, "", newUrl);
    }
  }, [searchQuery, selectedType, selectedCategory]);

  const { isFavorite, toggleFavorite } = useFavorites();

  const resultsContainerRef = useRef<HTMLDivElement>(null);
  const shouldScrollRef = useRef(false);

  useEffect(() => {
    if (shouldScrollRef.current) {
      shouldScrollRef.current = false;
      resultsContainerRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  }, [currentPage]);

  const changePage = (page: number) => {
    shouldScrollRef.current = true;
    setCurrentPage(page);
  };

  const itemsPerPage = 9;

  const getCategoryLabel = (id: string) => {
    const customMapping: Record<string, string> = {
      "domestic-tour-packages": "Domestic Tours",
      "international-tour-packages": "International Tours",
      "beach-tour-packages": "Beach Tours",
      "honeymoon-tour-packages": "Honeymoon Tours",
      "north-india-tour-packages": "North India Tours",
      "south-india-tour-packages": "South India Tours",
      "luxury-tour-packages": "Luxury Tours",
      "family-tour-packages": "Family Tours",
      "spiritual-tour-packages": "Spiritual Tours",
      "wildlife-tour-packages": "Wildlife Tours",
      "budget-tour-packages": "Budget Tours",
      "weekend-tour-packages": "Weekend Tours",
    };

    if (customMapping[id]) return customMapping[id];

    return (
      id
        .replace("-packages", "")
        .replace("-tour", "")
        .split("-")
        .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ") + " Tours"
    );
  };

  const allPackages = useMemo(() => {
    return (packagesData.packages || []) as PackageItem[];
  }, [packagesData]);

  const availableCategories = useMemo(() => {
    const categoriesSet = new Set<string>();
    allPackages.forEach((pkg) => {
      if (pkg.category_ids && Array.isArray(pkg.category_ids)) {
        pkg.category_ids.forEach((id) => {
          if (id !== "domestic-tour-packages" && id !== "international-tour-packages") {
            categoriesSet.add(id);
          }
        });
      }
    });
    return Array.from(categoriesSet).sort();
  }, [allPackages]);

  const getCategoryIcon = (id: string) => {
    switch (id) {
      case "all":
        return Grid;
      case "beach-tour-packages":
        return Sun;
      case "honeymoon-tour-packages":
        return Heart;
      case "luxury-tour-packages":
        return Sparkles;
      case "family-tour-packages":
        return Users;
      case "spiritual-tour-packages":
        return Sun;
      case "wildlife-tour-packages":
        return Trees;
      case "budget-tour-packages":
        return Wallet;
      case "weekend-tour-packages":
        return Calendar;
      default:
        return Compass;
    }
  };

  const categoryOptions = useMemo(() => {
    const opts = [
      {
        value: "all",
        label: "All Categories",
        icon: Grid,
      },
    ];
    availableCategories.forEach((catId) => {
      opts.push({
        value: catId,
        label: getCategoryLabel(catId),
        icon: getCategoryIcon(catId),
      });
    });
    return opts;
  }, [availableCategories]);

  const filteredPackages = useMemo(() => {
    return allPackages.filter((pkg) => {
      if (selectedType === "domestic" && !pkg.is_domestic) return false;
      if (selectedType === "international" && pkg.is_domestic) return false;

      if (selectedCategory !== "all") {
        if (!pkg.category_ids || !pkg.category_ids.includes(selectedCategory)) {
          return false;
        }
      }

      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase();
        const matchName = pkg.name?.toLowerCase().includes(q);
        const matchDestinations = pkg.destinations?.some((d) => d.toLowerCase().includes(q));
        const matchTags = pkg.category_ids?.some((c) => c.toLowerCase().includes(q));
        return matchName || matchDestinations || matchTags;
      }

      return true;
    });
  }, [allPackages, selectedType, selectedCategory, searchQuery]);

  const totalPages = Math.ceil(filteredPackages.length / itemsPerPage);

  const paginatedPackages = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredPackages.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredPackages, currentPage]);

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container py-24">
        <SectionHeader
          title="All Tour Packages"
          subtitle="Embark on unforgettable journeys with our premium, custom-designed itineraries. Explore majestic sights across India and handpicked international destinations."
          align="left"
        />

        <div className="bg-neutral-50/70 border border-neutral-200/50 rounded-3xl p-5 md:p-6 mb-10 flex flex-col lg:flex-row lg:items-center gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4.5 h-4.5 text-neutral-400" />
            <input
              type="text"
              placeholder="Search destinations or packages..."
              value={searchQuery}
              onChange={(e) => {
                setSearchQuery(e.target.value);
                setCurrentPage(1);
              }}
              className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-2.5 lg:py-3 text-sm focus:outline-none focus:border-brand/40 focus:ring-1 focus:ring-brand/40 transition-all duration-300 font-semibold text-neutral-600 placeholder:text-neutral-400"
            />
          </div>

          <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-4 shrink-0">
            <div className="bg-neutral-100/90 p-1 rounded-full flex gap-1 border border-neutral-200/50 relative self-start sm:self-auto shrink-0 select-none">
              {["all", "domestic", "international"].map((type) => (
                <button
                  key={type}
                  onClick={() => {
                    setSelectedType(type);
                    setCurrentPage(1);
                  }}
                  className={`relative px-4 lg:px-5 py-2 lg:py-2.5 rounded-full text-xs font-semibold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
                    selectedType === type ? "text-foreground" : "text-muted hover:text-foreground"
                  }`}
                >
                  {selectedType === type && (
                    <motion.span
                      layoutId="activeFilterTab"
                      className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                      transition={{ type: "spring", stiffness: 380, damping: 30 }}
                    />
                  )}
                  {type}
                </button>
              ))}
            </div>

            <div className="shrink-0 w-full sm:w-60 select-none">
              <Dropdown
                options={categoryOptions}
                value={selectedCategory}
                onChange={(val) => {
                  setSelectedCategory(val);
                  setCurrentPage(1);
                }}
                align="right"
                icon={SlidersHorizontal}
              />
            </div>
          </div>
        </div>

        <div ref={resultsContainerRef} className="scroll-mt-28">
          <div className="flex items-center justify-between mb-8 px-1">
            <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
              Showing {filteredPackages.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
              {Math.min(currentPage * itemsPerPage, filteredPackages.length)} of{" "}
              {filteredPackages.length} packages
            </p>
          </div>

          {filteredPackages.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
              <div className="w-16 h-16 bg-neutral-200/50 rounded-full flex items-center justify-center mx-auto mb-5 text-neutral-400">
                <Search className="w-7 h-7" />
              </div>
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">No packages found</h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                We couldn&apos;t find any tour packages matching your search terms or filters. Try
                adjusting your settings.
              </p>
              <button
                onClick={() => {
                  setSearchQuery("");
                  setSelectedType("all");
                  setSelectedCategory("all");
                  setCurrentPage(1);
                }}
                className="mt-6 bg-brand hover:bg-brand-hover text-white font-bold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer shadow-md select-none"
              >
                Reset Filters
              </button>
            </div>
          ) : (
            <div>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                {paginatedPackages.map((pkg) => (
                  <PackageCard
                    key={pkg.id}
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    hero_image={pkg.hero_image}
                    duration_range={pkg.duration_range}
                    min_days={pkg.min_days}
                    destinations={pkg.destinations}
                    variant="white"
                    isFavorite={isFavorite(pkg.slug)}
                    onToggleFavorite={toggleFavorite}
                    priority={pkg.is_popular}
                  />
                ))}
              </div>

              <Pagination
                currentPage={currentPage}
                totalPages={totalPages}
                onPageChange={changePage}
                className="mt-16"
              />
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}
