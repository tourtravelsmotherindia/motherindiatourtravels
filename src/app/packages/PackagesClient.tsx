"use client";

import { motion } from "framer-motion";
import {
  Calendar,
  ChevronLeft,
  ChevronRight,
  Clock,
  Compass,
  Grid,
  Heart,
  MapPin,
  Search,
  SlidersHorizontal,
  Sparkles,
  Sun,
  Trees,
  Users,
  Wallet,
} from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useEffect, useMemo, useRef, useState } from "react";

import Dropdown from "@/components/Dropdown";
import Footer, { type FooterCompanyData } from "@/components/Footer";
import Navbar from "@/components/Navbar";

interface PackageItem {
  id: string;
  slug: string;
  name: string;
  is_popular: boolean;
  is_domestic: boolean;
  destinations: string[];
  duration_range: string;
  hero_image: string;
  min_days: number;
  category_ids: string[];
}

interface PackagesData {
  packages: PackageItem[];
}

export default function PackagesClient({
  packagesData,
  companyData,
}: {
  packagesData: PackagesData;
  companyData: FooterCompanyData | null;
}) {
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState(() => searchParams.get("search") ?? "");
  const [selectedType, setSelectedType] = useState(() => searchParams.get("type") ?? "all");
  const [selectedCategory, setSelectedCategory] = useState(
    () => searchParams.get("category") ?? "all",
  );
  const [currentPage, setCurrentPage] = useState(1);

  // 1. Sync search parameters from URL (e.g. when user clicks a Link in Navbar) to React state
  useEffect(() => {
    const searchVal = searchParams.get("search") ?? "";
    const typeVal = searchParams.get("type") ?? "all";
    const categoryVal = searchParams.get("category") ?? "all";

    setSearchQuery(searchVal);
    setSelectedType(typeVal);
    setSelectedCategory(categoryVal);
    setCurrentPage(1);
  }, [searchParams]);

  // 2. Sync local filter states to URL search parameters (without causing full-page navigation)
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

    // Only update if the URL search query has actually changed
    if (newQuery !== currentQuery) {
      const newUrl = `${window.location.pathname}${newQuery ? "?" + newQuery : ""}`;
      window.history.replaceState(null, "", newUrl);
    }
  }, [searchQuery, selectedType, selectedCategory]);

  const [favorites, setFavorites] = useState<string[]>(() => {
    if (typeof window === "undefined") return [];
    try {
      const saved = localStorage.getItem("mother_india_favorites");
      return saved ? JSON.parse(saved) : [];
    } catch (e) {
      console.error("Failed to parse favorites from localStorage", e);
      return [];
    }
  });

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

  // Toggle favorite helper
  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => {
      const next = prev.includes(slug) ? prev.filter((s) => s !== slug) : [...prev, slug];
      localStorage.setItem("mother_india_favorites", JSON.stringify(next));
      return next;
    });
  };

  // Human-readable labels for categories
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

  // Cast packages data
  const allPackages = useMemo(() => {
    return (packagesData.packages || []) as PackageItem[];
  }, [packagesData]);

  // Extract all categories dynamically
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

  // Map categories to icons
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

  // Apply filters
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

  const paginationPages = useMemo(() => {
    if (totalPages <= 7) {
      return Array.from({ length: totalPages }, (_, i) => i + 1);
    }

    let startPage = Math.max(2, currentPage - 2);
    let endPage = Math.min(totalPages - 1, currentPage + 2);

    if (currentPage <= 3) {
      startPage = 2;
      endPage = 5;
    } else if (currentPage >= totalPages - 2) {
      startPage = totalPages - 4;
      endPage = totalPages - 1;
    }

    const pages: (number | string)[] = [1];

    if (startPage > 2) {
      pages.push("...");
    }

    for (let i = startPage; i <= endPage; i++) {
      pages.push(i);
    }

    if (endPage < totalPages - 1) {
      pages.push("...");
    }

    pages.push(totalPages);

    return pages;
  }, [currentPage, totalPages]);

  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      <Navbar />

      <main className="flex-1 layout-container py-24">
        <div className="mb-12 text-center md:text-left">
          <h1 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight font-display">
            All Tour Packages
          </h1>
          <p className="text-muted font-normal mt-3 text-sm md:text-base max-w-2xl">
            Embark on unforgettable journeys with our premium, custom-designed itineraries. Explore
            majestic sights across India and handpicked international destinations.
          </p>
        </div>

        {/* Filter Controls Bar */}
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
                {paginatedPackages.map((pkg) => {
                  const isFavorite = favorites.includes(pkg.slug);
                  return (
                    <div
                      key={pkg.id}
                      className="group relative bg-white border border-neutral-100 rounded-[2rem] p-4 shadow-card hover:shadow-premium transition-all duration-500 flex flex-col h-full justify-between"
                    >
                      <div>
                        <div className="relative w-full h-[220px] md:h-[260px] lg:h-[280px] z-0 xl:h-[320px] rounded-[1.5rem] overflow-hidden bg-neutral-100 z-0">
                          <Image
                            src={pkg.hero_image || "/images/placeholder-landscape.png"}
                            alt={pkg.name}
                            fill
                            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
                            className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                            priority={pkg.is_popular}
                          />
                        </div>

                        <div className="flex items-center justify-between mt-5 mb-3 px-1">
                          <div className="flex items-center gap-1.5 text-neutral-600 font-normal">
                            <Clock className="w-4 h-4 text-neutral-400 shrink-0" />
                            <span className="text-sm">
                              {pkg.duration_range || `${pkg.min_days} Days`}
                            </span>
                          </div>

                          <button
                            onClick={(e) => {
                              e.preventDefault();
                              toggleFavorite(pkg.slug);
                            }}
                            className="w-9 h-9 rounded-full bg-white hover:bg-neutral-50 border border-neutral-200/60 flex items-center justify-center text-neutral-600 hover:text-red-500 transition-all duration-300 active:scale-90 group/heart cursor-pointer shadow-sm"
                            aria-label={isFavorite ? "Remove from Favorites" : "Add to Favorites"}
                          >
                            <Heart
                              className={`w-4 h-4 transition-transform duration-300 group-hover/heart:scale-110 ${
                                isFavorite
                                  ? "fill-red-500 text-red-500 stroke-red-500"
                                  : "text-neutral-500 stroke-neutral-500"
                              }`}
                            />
                          </button>
                        </div>

                        <h3 className="font-bold text-lg text-foreground leading-snug px-1 line-clamp-1 mb-2">
                          {pkg.name}
                        </h3>

                        <div className="flex items-center gap-1.5 text-neutral-500 text-xs px-1 mb-6 font-normal">
                          <MapPin className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
                          <span className="truncate">{pkg.destinations.join(", ")}</span>
                        </div>
                      </div>

                      <div className="px-1 pb-1">
                        <Link
                          href={`/packages/${pkg.slug}`}
                          className="block w-full border border-neutral-900 text-neutral-900 hover:bg-brand hover:border-brand hover:text-white font-semibold text-xs uppercase tracking-wider py-3.5 rounded-full transition-all duration-300 text-center select-none"
                        >
                          View Details
                        </Link>
                      </div>
                    </div>
                  );
                })}
              </div>

              {totalPages > 1 && (
                <div
                  role="navigation"
                  aria-label="Pagination Navigation"
                  className="flex items-center justify-center gap-1.5 bg-neutral-100/90 backdrop-blur-md p-1.5 rounded-full max-w-fit mx-auto mt-16 shadow-sm border border-neutral-200/30"
                >
                  <button
                    onClick={() => {
                      changePage(Math.max(currentPage - 1, 1));
                    }}
                    disabled={currentPage === 1}
                    className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2"
                    aria-label="Go to previous page"
                  >
                    <ChevronLeft className="w-4 h-4 stroke-[2.5]" />
                  </button>

                  {paginationPages.map((page, idx) => {
                    if (page === "...") {
                      return (
                        <span
                          key={`ellipsis-${idx}`}
                          className="w-9 h-9 flex items-center justify-center text-neutral-400 font-semibold text-sm select-none"
                          aria-hidden="true"
                        >
                          ...
                        </span>
                      );
                    }

                    const isPageActive = page === currentPage;

                    return (
                      <button
                        key={`page-${page}`}
                        onClick={() => {
                          changePage(Number(page));
                        }}
                        aria-label={`Go to page ${page}`}
                        aria-current={isPageActive ? "page" : undefined}
                        className={`w-9 h-9 rounded-full flex items-center justify-center font-semibold text-sm transition-all duration-200 select-none cursor-pointer focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2 ${
                          isPageActive
                            ? "bg-neutral-900 text-white shadow-md scale-105"
                            : "text-neutral-700 hover:bg-neutral-200/50"
                        }`}
                      >
                        {page}
                      </button>
                    );
                  })}

                  <button
                    onClick={() => {
                      changePage(Math.min(currentPage + 1, totalPages));
                    }}
                    disabled={currentPage === totalPages}
                    className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2"
                    aria-label="Go to next page"
                  >
                    <ChevronRight className="w-4 h-4 stroke-[2.5]" />
                  </button>
                </div>
              )}
            </div>
          )}
        </div>
      </main>

      <Footer companyData={companyData} />
    </div>
  );
}
