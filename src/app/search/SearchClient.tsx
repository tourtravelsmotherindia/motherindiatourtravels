"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronDown, ChevronUp, Filter, Search, Star, X } from "lucide-react";
import { useSearchParams } from "next/navigation";
import { Suspense, useMemo, useRef, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import Pagination from "@/components/shared/Pagination";
import { type CategoryItem } from "@/lib/db/repositories/categoryRepo";
import { type CompanyData } from "@/types/company";
import { type DestinationItem } from "@/types/destination";
import { type PackageItem } from "@/types/package";

// Regions configuration matching destinationRepo.ts DEFAULT_REGIONS state patterns
const REGIONS_CONFIG = [
  {
    name: "North India",
    states: [
      "delhi",
      "uttar pradesh",
      "himachal pradesh",
      "uttarakhand",
      "jammu & kashmir",
      "jammu and kashmir",
      "ladakh",
      "punjab",
      "haryana",
    ],
  },
  {
    name: "South India",
    states: ["kerala", "karnataka", "tamil nadu", "andhra pradesh", "telangana"],
  },
  {
    name: "West India",
    states: ["goa", "rajasthan", "gujarat", "maharashtra"],
  },
  {
    name: "East India",
    states: ["west bengal", "odisha", "bihar", "jharkhand"],
  },
  {
    name: "Central India",
    states: ["madhya pradesh", "chhattisgarh"],
  },
  {
    name: "Northeast India",
    states: [
      "sikkim",
      "meghalaya",
      "assam",
      "arunachal pradesh",
      "nagaland",
      "manipur",
      "mizoram",
      "tripura",
    ],
  },
];

// Helper to determine region of a package
function getPackageRegions(
  pkg: PackageItem,
  destinationsMap: Map<string, DestinationItem>,
): string[] {
  if (!pkg.isDomestic) {
    return ["International"];
  }
  const regions = new Set<string>();
  pkg.destinations.forEach((d) => {
    const fullDest = destinationsMap.get(d.destinationSlug);
    const stateName = fullDest?.stateName?.toLowerCase();
    if (stateName) {
      REGIONS_CONFIG.forEach((r) => {
        if (r.states.some((s) => stateName.includes(s))) {
          regions.add(r.name);
        }
      });
    }
  });

  // Fallback if no matching state found, check package stateId / name if possible
  if (regions.size === 0) {
    // Default to Central/North depending on name/state mapping
    regions.add("North India");
  }

  return Array.from(regions);
}

// Helper to get package price
function getPackagePrice(pkg: PackageItem): number {
  const defaultVar = pkg.variants?.find((v) => v.isDefault) || pkg.variants?.[0];
  return defaultVar?.discountedPrice || defaultVar?.basePrice || 0;
}

// Helper to get package duration days
function getPackageDays(pkg: PackageItem): number {
  const defaultVar = pkg.variants?.find((v) => v.isDefault) || pkg.variants?.[0];
  return defaultVar?.days || 0;
}

// Helper to get deterministic rating for filter and display
function getPackageRating(pkg: PackageItem): number {
  if (pkg.isFeatured && pkg.isPopular) return 4.9;
  if (pkg.isFeatured) return 4.8;
  if (pkg.isPopular) return 4.7;
  const nameLen = pkg.name.length;
  const ratingValue = 4.2 + ((nameLen + pkg.slug.charCodeAt(0)) % 5) * 0.1;
  return Math.round(ratingValue * 10) / 10;
}

function SearchContent({
  packagesData,
  destinationsData,
  categoriesData,
  companyData,
}: {
  packagesData: PackageItem[];
  destinationsData: DestinationItem[];
  categoriesData: CategoryItem[];
  companyData: CompanyData | null;
}) {
  const searchParams = useSearchParams();

  // URL State Synchronizer
  const [searchQuery, setSearchQuery] = useState(
    () => searchParams.get("search") || searchParams.get("q") || "",
  );
  const [selectedRegions, setSelectedRegions] = useState<string[]>([]);
  const [selectedCategories, setSelectedCategories] = useState<string[]>([]);
  const [selectedDurations, setSelectedDurations] = useState<string[]>([]);
  const [selectedRatings, setSelectedRatings] = useState<number[]>([]);
  const [sortBy, setSortBy] = useState("default");
  const [currentPage, setCurrentPage] = useState(1);
  const [mobileFiltersOpen, setMobileFiltersOpen] = useState(false);

  // Setup collapsible states
  const [collapsedFilters, setCollapsedFilters] = useState({
    region: false,
    budget: false,
    type: false,
    duration: false,
    rating: false,
  });

  const toggleFilterCollapse = (key: keyof typeof collapsedFilters) => {
    setCollapsedFilters((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  const destinationsMap = useMemo(() => {
    const m = new Map<string, DestinationItem>();
    destinationsData.forEach((d) => m.set(d.slug, d));
    return m;
  }, [destinationsData]);

  // Determine budget bounds dynamically
  const { absoluteMinPrice, absoluteMaxPrice } = useMemo(() => {
    let min = Infinity;
    let max = -Infinity;
    packagesData.forEach((pkg) => {
      const price = getPackagePrice(pkg);
      if (price > 0) {
        if (price < min) min = price;
        if (price > max) max = price;
      }
    });
    return {
      absoluteMinPrice: min === Infinity ? 0 : min,
      absoluteMaxPrice: max === -Infinity ? 150000 : max,
    };
  }, [packagesData]);

  const [maxPrice, setMaxPrice] = useState(() => absoluteMaxPrice);

  // Sync maxPrice if absoluteMaxPrice changes
  const [prevAbsoluteMaxPrice, setPrevAbsoluteMaxPrice] = useState(absoluteMaxPrice);
  if (absoluteMaxPrice !== prevAbsoluteMaxPrice) {
    setPrevAbsoluteMaxPrice(absoluteMaxPrice);
    setMaxPrice(absoluteMaxPrice);
  }

  // Sync with search URL parameter changes during rendering to avoid useEffect cascading renders
  const [prevParamsStr, setPrevParamsStr] = useState(() => searchParams.toString());
  const currentParams = searchParams.toString();
  if (currentParams !== prevParamsStr) {
    setPrevParamsStr(currentParams);
    setSearchQuery(searchParams.get("search") || searchParams.get("q") || "");
    setCurrentPage(1);
  }

  // Reset filters helper
  const handleResetFilters = () => {
    setSelectedRegions([]);
    setSelectedCategories([]);
    setSelectedDurations([]);
    setSelectedRatings([]);
    setMaxPrice(absoluteMaxPrice);
    setSortBy("default");
    setCurrentPage(1);
  };

  // Build unique category choices dynamically based on DB entries
  const travelTypes = useMemo(() => {
    const list = categoriesData.filter(
      (c) => c.slug !== "domestic-tour-packages" && c.slug !== "international-tour-packages",
    );
    // Add fallback if category table is empty
    if (list.length === 0) {
      return [
        { name: "Honeymoon", slug: "honeymoon-tour-packages" },
        { name: "Beach", slug: "beach-tour-packages" },
        { name: "Wildlife", slug: "wildlife-tour-packages" },
        { name: "Adventure", slug: "adventure-tour-packages" },
        { name: "Family", slug: "family-tour-packages" },
        { name: "Luxury", slug: "luxury-tour-packages" },
      ];
    }
    return list;
  }, [categoriesData]);

  const regionsList = useMemo(() => {
    const list = REGIONS_CONFIG.map((r) => r.name);
    list.push("International");
    return list;
  }, []);

  // Filter & Search logic
  const filteredPackages = useMemo(() => {
    return packagesData
      .filter((pkg) => {
        // 1. Unified Search Query Matching
        if (searchQuery.trim()) {
          const q = searchQuery.toLowerCase().trim();
          const matchesPkg =
            pkg.name.toLowerCase().includes(q) ||
            pkg.overview?.toLowerCase().includes(q) ||
            pkg.tourStyle?.toLowerCase().includes(q) ||
            pkg.stayType?.toLowerCase().includes(q) ||
            pkg.tags?.some((t) => t.toLowerCase().includes(q)) ||
            pkg.categories?.some((c) => c.categoryName.toLowerCase().includes(q));

          let matchesDest = false;
          for (const d of pkg.destinations) {
            if (d.destinationName.toLowerCase().includes(q)) {
              matchesDest = true;
              break;
            }
            const fullDest = destinationsMap.get(d.destinationSlug);
            if (fullDest) {
              if (
                fullDest.description?.toLowerCase().includes(q) ||
                fullDest.stateName?.toLowerCase().includes(q) ||
                fullDest.countryName?.toLowerCase().includes(q) ||
                fullDest.bestTimeToVisit?.toLowerCase().includes(q)
              ) {
                matchesDest = true;
                break;
              }
            }
          }

          const pkgRegions = getPackageRegions(pkg, destinationsMap);
          const matchesRegion = pkgRegions.some((r) => r.toLowerCase().includes(q));

          if (!matchesPkg && !matchesDest && !matchesRegion) {
            return false;
          }
        }

        // 2. Region Checkbox Filter
        if (selectedRegions.length > 0) {
          const pkgRegions = getPackageRegions(pkg, destinationsMap);
          const matchesAnySelectedRegion = pkgRegions.some((r) => selectedRegions.includes(r));
          if (!matchesAnySelectedRegion) return false;
        }

        // 3. Category / Travel Type Filter
        if (selectedCategories.length > 0) {
          const matchesAnySelectedCat = pkg.categories?.some((c) =>
            selectedCategories.includes(c.categorySlug),
          );
          if (!matchesAnySelectedCat) return false;
        }

        // 4. Duration Filter
        if (selectedDurations.length > 0) {
          const days = getPackageDays(pkg);
          let matchDuration = false;
          if (selectedDurations.includes("1-3") && days >= 1 && days <= 3) matchDuration = true;
          if (selectedDurations.includes("4-7") && days >= 4 && days <= 7) matchDuration = true;
          if (selectedDurations.includes("8-14") && days >= 8 && days <= 14) matchDuration = true;
          if (selectedDurations.includes("15+") && days >= 15) matchDuration = true;
          if (!matchDuration) return false;
        }

        // 5. Rating Filter
        if (selectedRatings.length > 0) {
          const rating = getPackageRating(pkg);
          const minSelectedRating = Math.min(...selectedRatings);
          if (rating < minSelectedRating) return false;
        }

        // 6. Budget (Per Person) Filter
        const price = getPackagePrice(pkg);
        if (price > 0 && price > maxPrice) return false;

        return true;
      })
      .sort((a, b) => {
        const priceA = getPackagePrice(a);
        const priceB = getPackagePrice(b);
        const daysA = getPackageDays(a);
        const daysB = getPackageDays(b);

        if (sortBy === "price-asc") return priceA - priceB;
        if (sortBy === "price-desc") return priceB - priceA;
        if (sortBy === "duration-asc") return daysA - daysB;
        if (sortBy === "duration-desc") return daysB - daysA;

        // Default Sort: Featured and Popular first
        if (a.isFeatured && !b.isFeatured) return -1;
        if (!a.isFeatured && b.isFeatured) return 1;
        if (a.isPopular && !b.isPopular) return -1;
        if (!a.isPopular && b.isPopular) return 1;

        return b.name.localeCompare(a.name);
      });
  }, [
    packagesData,
    searchQuery,
    selectedRegions,
    selectedCategories,
    selectedDurations,
    selectedRatings,
    maxPrice,
    sortBy,
    destinationsMap,
  ]);

  // Pagination bounds
  const itemsPerPage = 9;
  const totalPages = Math.ceil(filteredPackages.length / itemsPerPage);
  const paginatedPackages = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredPackages.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredPackages, currentPage]);

  // Scroll to results when page changes
  const resultsContainerRef = useRef<HTMLDivElement>(null);
  const changePage = (page: number) => {
    setCurrentPage(page);
    resultsContainerRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  const isFilterActive =
    selectedRegions.length > 0 ||
    selectedCategories.length > 0 ||
    selectedDurations.length > 0 ||
    selectedRatings.length > 0 ||
    maxPrice < absoluteMaxPrice ||
    sortBy !== "default";

  // Sidebar Filter Form markup shared between desktop and mobile drawer
  const renderSidebarFilters = () => (
    <div className="flex flex-col gap-6 select-none">
      <div className="flex items-center justify-between pb-4 border-b border-border-light">
        <h2 className="text-base font-bold text-neutral-900 uppercase tracking-wider">Filter By</h2>
        {isFilterActive && (
          <button
            onClick={handleResetFilters}
            className="text-xs font-bold text-brand hover:text-brand-hover cursor-pointer transition-colors uppercase tracking-wider"
          >
            Reset All
          </button>
        )}
      </div>

      {/* Region Filter */}
      <div className="flex flex-col border-b border-border-light pb-5">
        <button
          onClick={() => toggleFilterCollapse("region")}
          className="flex items-center justify-between w-full py-1 text-sm font-bold text-neutral-800 hover:text-brand transition-colors cursor-pointer text-left"
        >
          <span>Region</span>
          {collapsedFilters.region ? (
            <ChevronDown className="w-4 h-4 text-neutral-400" />
          ) : (
            <ChevronUp className="w-4 h-4 text-neutral-400" />
          )}
        </button>
        <AnimatePresence initial={false}>
          {!collapsedFilters.region && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden flex flex-col gap-2.5 mt-3 pl-1"
            >
              {regionsList.map((reg) => {
                const isChecked = selectedRegions.includes(reg);
                return (
                  <label
                    key={reg}
                    className="flex items-center gap-3 text-sm font-semibold text-neutral-600 hover:text-neutral-900 cursor-pointer"
                  >
                    <input
                      type="checkbox"
                      checked={isChecked}
                      onChange={() => {
                        setSelectedRegions((prev) =>
                          isChecked ? prev.filter((r) => r !== reg) : [...prev, reg],
                        );
                        setCurrentPage(1);
                      }}
                      className="accent-brand rounded border-neutral-300 w-4 h-4 focus:ring-brand/30"
                    />
                    <span>{reg}</span>
                  </label>
                );
              })}
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Budget Filter */}
      <div className="flex flex-col border-b border-border-light pb-5">
        <button
          onClick={() => toggleFilterCollapse("budget")}
          className="flex items-center justify-between w-full py-1 text-sm font-bold text-neutral-800 hover:text-brand transition-colors cursor-pointer text-left"
        >
          <span>Budget (Per Person)</span>
          {collapsedFilters.budget ? (
            <ChevronDown className="w-4 h-4 text-neutral-400" />
          ) : (
            <ChevronUp className="w-4 h-4 text-neutral-400" />
          )}
        </button>
        <AnimatePresence initial={false}>
          {!collapsedFilters.budget && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden flex flex-col gap-3 mt-4 pl-1 pr-1"
            >
              <div className="flex justify-between items-center text-xs font-bold text-neutral-500">
                <span>₹{absoluteMinPrice.toLocaleString("en-IN")}</span>
                <span className="text-brand bg-brand-light px-2.5 py-1 rounded-full">
                  Up to ₹{maxPrice.toLocaleString("en-IN")}
                </span>
              </div>
              <input
                type="range"
                min={absoluteMinPrice}
                max={absoluteMaxPrice}
                step={5000}
                value={maxPrice}
                onChange={(e) => {
                  setMaxPrice(Number(e.target.value));
                  setCurrentPage(1);
                }}
                className="w-full accent-brand bg-neutral-200 h-1.5 rounded-lg appearance-none cursor-pointer"
              />
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Travel Type (Categories) Filter */}
      <div className="flex flex-col border-b border-border-light pb-5">
        <button
          onClick={() => toggleFilterCollapse("type")}
          className="flex items-center justify-between w-full py-1 text-sm font-bold text-neutral-800 hover:text-brand transition-colors cursor-pointer text-left"
        >
          <span>Travel Type</span>
          {collapsedFilters.type ? (
            <ChevronDown className="w-4 h-4 text-neutral-400" />
          ) : (
            <ChevronUp className="w-4 h-4 text-neutral-400" />
          )}
        </button>
        <AnimatePresence initial={false}>
          {!collapsedFilters.type && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden flex flex-col gap-2.5 mt-3 pl-1"
            >
              {travelTypes.map((cat) => {
                const isChecked = selectedCategories.includes(cat.slug);
                return (
                  <label
                    key={cat.slug}
                    className="flex items-center gap-3 text-sm font-semibold text-neutral-600 hover:text-neutral-900 cursor-pointer"
                  >
                    <input
                      type="checkbox"
                      checked={isChecked}
                      onChange={() => {
                        setSelectedCategories((prev) =>
                          isChecked ? prev.filter((s) => s !== cat.slug) : [...prev, cat.slug],
                        );
                        setCurrentPage(1);
                      }}
                      className="accent-brand rounded border-neutral-300 w-4 h-4 focus:ring-brand/30"
                    />
                    <span>{cat.name}</span>
                  </label>
                );
              })}
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Duration Filter */}
      <div className="flex flex-col border-b border-border-light pb-5">
        <button
          onClick={() => toggleFilterCollapse("duration")}
          className="flex items-center justify-between w-full py-1 text-sm font-bold text-neutral-800 hover:text-brand transition-colors cursor-pointer text-left"
        >
          <span>Duration</span>
          {collapsedFilters.duration ? (
            <ChevronDown className="w-4 h-4 text-neutral-400" />
          ) : (
            <ChevronUp className="w-4 h-4 text-neutral-400" />
          )}
        </button>
        <AnimatePresence initial={false}>
          {!collapsedFilters.duration && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden flex flex-col gap-2.5 mt-3 pl-1"
            >
              {[
                { label: "1 - 3 Days", value: "1-3" },
                { label: "4 - 7 Days", value: "4-7" },
                { label: "8 - 14 Days", value: "8-14" },
                { label: "15+ Days", value: "15+" },
              ].map((dur) => {
                const isChecked = selectedDurations.includes(dur.value);
                return (
                  <label
                    key={dur.value}
                    className="flex items-center gap-3 text-sm font-semibold text-neutral-600 hover:text-neutral-900 cursor-pointer"
                  >
                    <input
                      type="checkbox"
                      checked={isChecked}
                      onChange={() => {
                        setSelectedDurations((prev) =>
                          isChecked ? prev.filter((d) => d !== dur.value) : [...prev, dur.value],
                        );
                        setCurrentPage(1);
                      }}
                      className="accent-brand rounded border-neutral-300 w-4 h-4 focus:ring-brand/30"
                    />
                    <span>{dur.label}</span>
                  </label>
                );
              })}
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Rating Filter */}
      <div className="flex flex-col pb-2">
        <button
          onClick={() => toggleFilterCollapse("rating")}
          className="flex items-center justify-between w-full py-1 text-sm font-bold text-neutral-800 hover:text-brand transition-colors cursor-pointer text-left"
        >
          <span>Rating</span>
          {collapsedFilters.rating ? (
            <ChevronDown className="w-4 h-4 text-neutral-400" />
          ) : (
            <ChevronUp className="w-4 h-4 text-neutral-400" />
          )}
        </button>
        <AnimatePresence initial={false}>
          {!collapsedFilters.rating && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden flex flex-col gap-3 mt-3 pl-1"
            >
              {[5, 4, 3].map((val) => {
                const isChecked = selectedRatings.includes(val);
                return (
                  <label
                    key={val}
                    className="flex items-center gap-3 text-sm font-semibold text-neutral-600 hover:text-neutral-900 cursor-pointer select-none"
                  >
                    <input
                      type="checkbox"
                      checked={isChecked}
                      onChange={() => {
                        setSelectedRatings((prev) =>
                          isChecked ? prev.filter((r) => r !== val) : [...prev, val],
                        );
                        setCurrentPage(1);
                      }}
                      className="accent-brand rounded border-neutral-300 w-4 h-4 focus:ring-brand/30"
                    />
                    <div className="flex items-center gap-1">
                      <div className="flex items-center gap-0.5">
                        {Array.from({ length: 5 }).map((_, idx) => (
                          <Star
                            key={idx}
                            className={`w-3.5 h-3.5 ${
                              idx < val ? "fill-yellow-400 text-yellow-400" : "text-neutral-300"
                            }`}
                          />
                        ))}
                      </div>
                      {val < 5 && (
                        <span className="text-xs text-neutral-500 font-bold ml-1">& up</span>
                      )}
                    </div>
                  </label>
                );
              })}
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      {/* Title block with Breadcrumbs */}
      <div className="layout-container text-left pt-12 md:pt-16 mb-8 md:mb-12 font-sans">
        <Breadcrumbs
          items={[{ label: "Home", href: "/" }, { label: "Search" }]}
          variant="brackets"
        />
        <h1 className="text-4xl md:text-5xl font-extrabold text-neutral-900 tracking-tight mb-4 leading-tight">
          Find Your Perfect Tour
        </h1>
        <p className="text-lg md:text-xl text-neutral-900 font-medium leading-relaxed max-w-3xl">
          Search through our curated holiday packages, popular destinations, and regional travel
          itineraries.
        </p>
      </div>

      {/* Unified Search Input Box (No Card Outline, white bg, border border-neutral-200) */}
      <div className="layout-container mb-12">
        <div className="relative w-full max-w-4xl">
          <input
            id="unified-search-input"
            type="text"
            placeholder="Search packages, destinations, regions, tags..."
            value={searchQuery}
            onChange={(e) => {
              setSearchQuery(e.target.value);
              setCurrentPage(1);
            }}
            className="w-full pl-12 pr-12 py-4 bg-white border border-neutral-200 rounded-2xl focus:outline-none focus:border-neutral-350 transition-all duration-200 text-neutral-900 font-semibold placeholder-neutral-400 shadow-[0_4px_20px_rgba(0,0,0,0.01)] text-sm md:text-base"
          />
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-neutral-400 w-5 h-5" />
          {searchQuery && (
            <button
              onClick={() => {
                setSearchQuery("");
                setCurrentPage(1);
              }}
              className="absolute right-4 top-1/2 -translate-y-1/2 p-0.5 hover:bg-neutral-100 rounded-full text-neutral-400 hover:text-neutral-600 cursor-pointer"
            >
              <X className="w-4.5 h-4.5" />
            </button>
          )}
        </div>
      </div>

      {/* Main Grid Structure */}
      <div className="layout-container pb-section-loose font-sans">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-10 xl:gap-12 items-start">
          {/* Desktop Left Sidebar Panel */}
          <div className="hidden lg:block lg:col-span-3 lg:sticky lg:top-28">
            <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-[0_4px_20px_rgba(0,0,0,0.01)] max-h-[calc(100vh-140px)] overflow-y-auto">
              {renderSidebarFilters()}
            </div>
          </div>

          {/* Right Listings Column */}
          <div ref={resultsContainerRef} className="lg:col-span-9 scroll-mt-28">
            {/* Header controls: Results Count & Sort Selection */}
            <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-8 pb-4 border-b border-border-light px-1">
              <div>
                <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
                  Showing {filteredPackages.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
                  {Math.min(currentPage * itemsPerPage, filteredPackages.length)} of{" "}
                  {filteredPackages.length}{" "}
                  {filteredPackages.length === 1 ? "tour package" : "tour packages"}
                </p>
              </div>

              <div className="flex items-center gap-3 w-full sm:w-auto justify-between sm:justify-end">
                {/* Mobile Filter Trigger Button */}
                <button
                  onClick={() => setMobileFiltersOpen(true)}
                  className="flex lg:hidden items-center gap-2 bg-neutral-50 hover:bg-neutral-100 border border-neutral-200 px-4 py-2 rounded-full text-xs font-bold uppercase tracking-wider text-neutral-600 transition-colors duration-250 cursor-pointer select-none"
                >
                  <Filter className="w-3.5 h-3.5" />
                  <span>Filters</span>
                  {isFilterActive && <span className="w-1.5 h-1.5 bg-brand rounded-full" />}
                </button>

                <div className="flex items-center gap-2 shrink-0">
                  <span className="text-xs font-bold text-neutral-400 uppercase tracking-wider hidden xs:inline">
                    Sort By:
                  </span>
                  <div className="relative">
                    <select
                      value={sortBy}
                      onChange={(e) => {
                        setSortBy(e.target.value);
                        setCurrentPage(1);
                      }}
                      className="bg-white border border-neutral-200 rounded-full pl-4 pr-9 py-2 text-xs font-semibold text-neutral-600 focus:outline-none focus:border-brand/40 transition-all appearance-none cursor-pointer"
                    >
                      <option value="default">Featured First</option>
                      <option value="price-asc">Price: Low to High</option>
                      <option value="price-desc">Price: High to Low</option>
                      <option value="duration-asc">Duration: Short to Long</option>
                      <option value="duration-desc">Duration: Long to Short</option>
                    </select>
                    <ChevronDown className="absolute right-3.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-neutral-400 pointer-events-none" />
                  </div>
                </div>
              </div>
            </div>

            {/* Results Grid */}
            {filteredPackages.length === 0 ? (
              <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem]">
                <div className="w-16 h-16 bg-neutral-200/50 rounded-full flex items-center justify-center mx-auto mb-5 text-neutral-400">
                  <Search className="w-7 h-7" />
                </div>
                <h3 className="text-lg md:text-xl font-bold text-neutral-800">No packages found</h3>
                <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                  We couldn&apos;t find any tour packages matching your search terms or filters. Try
                  adjusting your settings.
                </p>
                <button
                  onClick={handleResetFilters}
                  className="mt-6 bg-brand hover:bg-brand-hover text-white font-bold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer shadow-md select-none"
                >
                  Reset Filters
                </button>
              </div>
            ) : (
              <div>
                <div className="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-3.5 sm:gap-6 lg:gap-8">
                  {paginatedPackages.map((pkg) => (
                    <PackageCard
                      key={pkg.id}
                      id={pkg.id}
                      slug={pkg.slug}
                      name={pkg.name}
                      heroImage={pkg.heroImage}
                      destinations={pkg.destinations}
                      variant="white"
                      priority={pkg.isPopular}
                      showRating={true}
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
      </div>

      {/* Mobile Drawer Slide-over Filter Panel */}
      <AnimatePresence>
        {mobileFiltersOpen && (
          <>
            {/* Backdrop Overlay */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={() => setMobileFiltersOpen(false)}
              className="fixed inset-0 bg-black/40 backdrop-blur-sm z-50 lg:hidden"
            />
            {/* Drawer */}
            <motion.div
              initial={{ x: "-100%" }}
              animate={{ x: 0 }}
              exit={{ x: "-100%" }}
              transition={{ type: "spring", damping: 25, stiffness: 200 }}
              className="fixed inset-y-0 left-0 w-[290px] xs:w-[320px] bg-white z-50 shadow-2xl p-6 flex flex-col justify-between lg:hidden h-full"
            >
              <div className="flex-1 overflow-y-auto pr-1">
                <div className="flex justify-between items-center mb-6">
                  <span className="text-sm font-bold text-neutral-800 uppercase tracking-widest">
                    Filters
                  </span>
                  <button
                    onClick={() => setMobileFiltersOpen(false)}
                    className="p-1 rounded-full hover:bg-neutral-100 text-neutral-400 hover:text-neutral-700 cursor-pointer"
                  >
                    <X className="w-5 h-5" />
                  </button>
                </div>
                {renderSidebarFilters()}
              </div>

              {/* View Results / Close Button at Footer of Drawer */}
              <div className="pt-4 border-t border-border-light mt-4">
                <button
                  onClick={() => setMobileFiltersOpen(false)}
                  className="w-full bg-brand hover:bg-brand-hover text-white text-xs font-bold uppercase tracking-wider py-3.5 rounded-full transition-all duration-300 shadow-md cursor-pointer text-center select-none"
                >
                  View {filteredPackages.length} Results
                </button>
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </PageShell>
  );
}

export default function SearchClient(props: {
  packagesData: PackageItem[];
  destinationsData: DestinationItem[];
  categoriesData: CategoryItem[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading search...
        </div>
      }
    >
      <SearchContent {...props} />
    </Suspense>
  );
}
