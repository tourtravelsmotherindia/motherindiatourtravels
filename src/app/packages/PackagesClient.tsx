"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Calendar,
  ChevronDown,
  ChevronUp,
  Compass,
  Filter,
  Grid,
  Heart,
  Search,
  SlidersHorizontal,
  Sparkles,
  Sun,
  Trees,
  Users,
  Wallet,
  X,
} from "lucide-react";
import { useSearchParams } from "next/navigation";
import { Suspense, useEffect, useMemo, useRef, useState } from "react";

import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import Pagination from "@/components/shared/Pagination";
import SectionHeader from "@/components/shared/SectionHeader";
import Dropdown from "@/components/ui/Dropdown";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import { type PackageItem } from "@/types/package";

function PackagesContent({
  packagesData,
  companyData,
}: {
  packagesData: PackageItem[];
  companyData: CompanyData | null;
}) {
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState(() => searchParams.get("search") ?? "");
  const [selectedType, setSelectedType] = useState(() => searchParams.get("type") ?? "all");
  const [selectedCategory, setSelectedCategory] = useState(
    () => searchParams.get("category") ?? "all",
  );
  const [selectedDuration, setSelectedDuration] = useState(
    () => searchParams.get("duration") ?? "all",
  );
  const [sortBy, setSortBy] = useState(() => searchParams.get("sortBy") ?? "default");
  const [showFilters, setShowFilters] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);

  // Sync search parameters from URL
  const [prevParamsStr, setPrevParamsStr] = useState(() => searchParams.toString());
  const currentParams = searchParams.toString();
  if (currentParams !== prevParamsStr) {
    setPrevParamsStr(currentParams);
    setSearchQuery(searchParams.get("search") ?? "");
    setSelectedType(searchParams.get("type") ?? "all");
    setSelectedCategory(searchParams.get("category") ?? "all");
    setSelectedDuration(searchParams.get("duration") ?? "all");
    setSortBy(searchParams.get("sortBy") ?? "default");
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
    if (selectedDuration !== "all") {
      params.set("duration", selectedDuration);
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
  }, [searchQuery, selectedType, selectedCategory, selectedDuration, sortBy]);

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

  const allPackages = useMemo(() => {
    return packagesData || [];
  }, [packagesData]);

  const availableCategories = useMemo(() => {
    const categoriesMap = new Map<string, string>();
    allPackages.forEach((pkg) => {
      if (pkg.categories && Array.isArray(pkg.categories)) {
        pkg.categories.forEach((cat) => {
          if (
            cat.categorySlug !== "domestic-tour-packages" &&
            cat.categorySlug !== "international-tour-packages"
          ) {
            categoriesMap.set(cat.categorySlug, cat.categoryName);
          }
        });
      }
    });
    return Array.from(categoriesMap.entries()).map(([slug, name]) => ({ slug, name }));
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
    availableCategories.forEach((cat) => {
      opts.push({
        value: cat.slug,
        label: cat.name,
        icon: getCategoryIcon(cat.slug),
      });
    });
    return opts;
  }, [availableCategories]);

  const durationOptions = [
    { value: "all", label: "Any Duration" },
    { value: "short", label: "Short (1-5 Days)" },
    { value: "medium", label: "Medium (6-9 Days)" },
    { value: "long", label: "Long (10+ Days)" },
  ];

  const sortOptions = [
    { value: "default", label: "Default Sort" },
    { value: "price-asc", label: "Price: Low to High" },
    { value: "price-desc", label: "Price: High to Low" },
    { value: "duration-asc", label: "Duration: Short to Long" },
    { value: "duration-desc", label: "Duration: Long to Short" },
  ];

  const filteredPackages = useMemo(() => {
    const list = allPackages.filter((pkg) => {
      if (selectedType === "domestic" && !pkg.isDomestic) return false;
      if (selectedType === "international" && pkg.isDomestic) return false;

      if (selectedCategory !== "all") {
        if (!pkg.categories || !pkg.categories.some((c) => c.categorySlug === selectedCategory)) {
          return false;
        }
      }

      const defaultVar = pkg.variants?.find((v) => v.isDefault) || pkg.variants?.[0];
      const days = defaultVar?.days || 0;

      if (selectedDuration !== "all") {
        if (selectedDuration === "short" && days > 5) return false;
        if (selectedDuration === "medium" && (days < 6 || days > 9)) return false;
        if (selectedDuration === "long" && days < 10) return false;
      }

      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase();
        const matchName = pkg.name?.toLowerCase().includes(q);
        const matchDestinations = pkg.destinations?.some((d) =>
          d.destinationName.toLowerCase().includes(q),
        );
        const matchCategories = pkg.categories?.some((c) =>
          c.categoryName.toLowerCase().includes(q),
        );
        const matchTags = pkg.tags?.some((t) => t.toLowerCase().includes(q));
        return matchName || matchDestinations || matchCategories || matchTags;
      }

      return true;
    });

    // Apply sorting
    if (sortBy !== "default") {
      list.sort((a, b) => {
        const varA = a.variants?.find((v) => v.isDefault) || a.variants?.[0];
        const varB = b.variants?.find((v) => v.isDefault) || b.variants?.[0];

        const priceA = varA?.discountedPrice || varA?.basePrice || 0;
        const priceB = varB?.discountedPrice || varB?.basePrice || 0;

        const daysA = varA?.days || 0;
        const daysB = varB?.days || 0;

        if (sortBy === "price-asc") return priceA - priceB;
        if (sortBy === "price-desc") return priceB - priceA;
        if (sortBy === "duration-asc") return daysA - daysB;
        if (sortBy === "duration-desc") return daysB - daysA;
        return 0;
      });
    }

    return list;
  }, [allPackages, selectedType, selectedCategory, selectedDuration, searchQuery, sortBy]);

  const totalPages = Math.ceil(filteredPackages.length / itemsPerPage);

  const paginatedPackages = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredPackages.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredPackages, currentPage]);

  const isFilterActive =
    selectedCategory !== "all" || selectedDuration !== "all" || sortBy !== "default";

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container py-24">
        <SectionHeader
          title="All Tour Packages"
          subtitle="Embark on unforgettable journeys with our premium, custom-designed itineraries. Explore majestic sights across India and handpicked international destinations."
          align="left"
        />

        <div className="bg-neutral-50/50 border border-neutral-200/50 rounded-3xl p-5 md:p-6 mb-10 flex flex-col gap-4">
          {/* Main Search and Type Row */}
          <div className="flex flex-col lg:flex-row gap-4 items-stretch lg:items-center">
            {/* Search Input */}
            <div className="relative flex-1">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4.5 h-4.5 text-neutral-400" />
              <input
                type="text"
                placeholder="Search destinations, packages, tags..."
                value={searchQuery}
                onChange={(e) => {
                  setSearchQuery(e.target.value);
                  setCurrentPage(1);
                }}
                className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-neutral-300 transition-all duration-300 font-semibold text-neutral-600 placeholder:text-neutral-400"
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

            {/* Type selector (All, Domestic, International) & Advanced Filter Toggle */}
            <div className="flex flex-wrap items-center gap-3">
              <div className="bg-neutral-100/90 p-1 rounded-full flex gap-1 border border-neutral-200/50 relative select-none">
                {["all", "domestic", "international"].map((type) => (
                  <button
                    key={type}
                    onClick={() => {
                      setSelectedType(type);
                      setCurrentPage(1);
                    }}
                    className={`relative px-4 py-2 rounded-full text-xs font-bold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
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

              {/* Advanced Filter Toggle Button */}
              <button
                onClick={() => setShowFilters(!showFilters)}
                className={`flex items-center gap-2 px-5 py-2.5 rounded-full text-xs font-bold uppercase tracking-wider border transition-all duration-300 cursor-pointer select-none ${
                  showFilters || isFilterActive
                    ? "bg-brand/10 border-brand/35 text-brand"
                    : "bg-white border-neutral-200 text-neutral-600 hover:bg-neutral-50"
                }`}
              >
                <Filter className="w-4 h-4" />
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
                  {/* Category Dropdown */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest pl-1">
                      Category
                    </span>
                    <Dropdown
                      options={categoryOptions}
                      value={selectedCategory}
                      onChange={(val) => {
                        setSelectedCategory(val);
                        setCurrentPage(1);
                      }}
                      icon={SlidersHorizontal}
                    />
                  </div>

                  {/* Duration Selector */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest pl-1">
                      Duration
                    </span>
                    <div className="relative">
                      <select
                        value={selectedDuration}
                        onChange={(e) => {
                          setSelectedDuration(e.target.value);
                          setCurrentPage(1);
                        }}
                        className="w-full bg-white border border-neutral-200 rounded-full px-4 py-2.5 text-xs font-semibold text-neutral-600 focus:outline-none focus:border-brand/40 transition-all appearance-none cursor-pointer"
                      >
                        {durationOptions.map((opt) => (
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
                        onChange={(e) => {
                          setSortBy(e.target.value);
                          setCurrentPage(1);
                        }}
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
                        setSelectedCategory("all");
                        setSelectedDuration("all");
                        setSortBy("default");
                        setCurrentPage(1);
                      }}
                      className="text-neutral-400 hover:text-brand text-xs font-bold uppercase tracking-wider flex items-center gap-1 cursor-pointer transition-colors"
                    >
                      <X className="w-3.5 h-3.5" />
                      <span>Clear Advanced Filters</span>
                    </button>
                  </div>
                )}
              </motion.div>
            )}
          </AnimatePresence>
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
                  setSelectedDuration("all");
                  setSortBy("default");
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
                {paginatedPackages.map((pkg) => {
                  return (
                    <PackageCard
                      key={pkg.id}
                      id={pkg.id}
                      slug={pkg.slug}
                      name={pkg.name}
                      heroImage={pkg.heroImage}
                      destinations={pkg.destinations}
                      variant="white"
                      isFavorite={isFavorite(pkg.slug)}
                      onToggleFavorite={toggleFavorite}
                      priority={pkg.isPopular}
                    />
                  );
                })}
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

export default function PackagesClient(props: {
  packagesData: PackageItem[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading packages...
        </div>
      }
    >
      <PackagesContent {...props} />
    </Suspense>
  );
}
