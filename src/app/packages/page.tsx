"use client";

import { motion } from "framer-motion";
import {
  ChevronLeft,
  ChevronRight,
  Heart,
  MapPin,
  Search,
  SlidersHorizontal,
} from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useEffect, useMemo, useState } from "react";

import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
import packagesData from "@/data/packages-index.json";

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

export default function PackagesPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedType, setSelectedType] = useState("all"); // "all" | "domestic" | "international"
  const [selectedCategory, setSelectedCategory] = useState("all");
  const [currentPage, setCurrentPage] = useState(1);
  const [favorites, setFavorites] = useState<string[]>([]);

  const itemsPerPage = 9;

  // Load favorites from localStorage on mount
  useEffect(() => {
    const saved = localStorage.getItem("mother_india_favorites");
    if (saved) {
      try {
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setFavorites(JSON.parse(saved));
      } catch (e) {
        console.error("Failed to parse favorites from localStorage", e);
      }
    }
  }, []);

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

  // Cast packages index data
  const allPackages = useMemo(() => {
    return (packagesData.packages || []) as PackageItem[];
  }, []);

  // Extract all categories dynamically (excluding main domestic/international categories)
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

  // Apply filters
  const filteredPackages = useMemo(() => {
    return allPackages.filter((pkg) => {
      // 1. Filter by Type
      if (selectedType === "domestic" && !pkg.is_domestic) return false;
      if (selectedType === "international" && pkg.is_domestic) return false;

      // 2. Filter by Category
      if (selectedCategory !== "all") {
        if (!pkg.category_ids || !pkg.category_ids.includes(selectedCategory)) {
          return false;
        }
      }

      // 3. Filter by Search Query
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

  // Compute pagination parameters
  const totalPages = Math.ceil(filteredPackages.length / itemsPerPage);

  const paginatedPackages = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredPackages.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredPackages, currentPage]);

  // Handle building page numbers in pagination (e.g. `< 1 ... 244 245 246 ... 274 >`)
  const paginationPages = useMemo(() => {
    if (totalPages <= 7) {
      return Array.from({ length: totalPages }, (_, i) => i + 1);
    }

    // Active page is near the start
    if (currentPage <= 4) {
      return [1, 2, 3, 4, 5, "...", totalPages];
    }

    // Active page is near the end
    if (currentPage >= totalPages - 3) {
      return [1, "...", totalPages - 4, totalPages - 3, totalPages - 2, totalPages - 1, totalPages];
    }

    // Active page is somewhere in the middle
    return [1, "...", currentPage - 1, currentPage, currentPage + 1, "...", totalPages];
  }, [currentPage, totalPages]);

  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      {/* Navigation Header */}
      <Navbar />

      {/* Main Layout Content */}
      <main className="flex-1 max-w-[1440px] mx-auto px-4 md:px-8 py-12 w-full">
        {/* Page Title Header */}
        <div className="mb-12 text-center md:text-left">
          <h1 className="text-4xl md:text-6xl font-extrabold text-foreground tracking-tight font-serif">
            All <span className="text-brand">Tour Packages</span>
          </h1>
          <p className="text-neutral-500 font-medium mt-3 text-sm md:text-base max-w-2xl">
            Embark on unforgettable journeys with our premium, custom-designed itineraries. Explore
            majestic sights across India and handpicked international destinations.
          </p>
        </div>

        {/* Filter Controls Bar */}
        <div className="bg-neutral-50/70 border border-neutral-200/50 rounded-3xl p-5 md:p-6 mb-10 flex flex-col lg:flex-row lg:items-center gap-4 shadow-sm">
          {/* Search Box */}
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
              className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/40 focus:ring-1 focus:ring-brand/40 transition-all duration-300 font-semibold text-neutral-700 placeholder:text-neutral-400"
            />
          </div>

          <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-4 shrink-0">
            {/* Pill Switch for Type */}
            <div className="bg-neutral-100/90 p-1 rounded-full flex gap-1 border border-neutral-200/50 relative self-start sm:self-auto shrink-0 select-none">
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

            {/* Category Filter Dropdown */}
            <div className="relative shrink-0 w-full sm:w-52 select-none">
              <select
                value={selectedCategory}
                onChange={(e) => {
                  setSelectedCategory(e.target.value);
                  setCurrentPage(1);
                }}
                className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 pr-10 text-sm focus:outline-none focus:border-brand/40 transition-all duration-300 font-bold text-neutral-700 cursor-pointer appearance-none shadow-sm"
              >
                <option value="all">All Categories</option>
                {availableCategories.map((catId) => (
                  <option key={catId} value={catId}>
                    {getCategoryLabel(catId)}
                  </option>
                ))}
              </select>
              <SlidersHorizontal className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-neutral-400 pointer-events-none" />
            </div>
          </div>
        </div>

        {/* Results Info Bar */}
        <div className="flex items-center justify-between mb-8 px-1">
          <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
            Showing {filteredPackages.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
            {Math.min(currentPage * itemsPerPage, filteredPackages.length)} of{" "}
            {filteredPackages.length} packages
          </p>
        </div>

        {/* Empty State */}
        {filteredPackages.length === 0 ? (
          <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
            <div className="w-16 h-16 bg-neutral-200/50 rounded-full flex items-center justify-center mx-auto mb-5 text-neutral-400">
              <Search className="w-7 h-7" />
            </div>
            <h3 className="text-lg md:text-xl font-bold text-neutral-800">No packages found</h3>
            <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
              We couldn&apos;t find any tour packages matching your search terms or filters. Try adjusting
              your settings.
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
          /* Grid of Cards */
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
                      {/* Image Frame */}
                      <div className="relative w-full h-[220px] rounded-[1.5rem] overflow-hidden bg-neutral-100 z-0">
                        <Image
                          src={pkg.hero_image || "/images/placeholder-landscape.png"}
                          alt={pkg.name}
                          fill
                          sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
                          className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                          priority={pkg.is_popular}
                        />
                      </div>

                      {/* Header metadata row */}
                      <div className="flex items-center justify-between mt-5 mb-3 px-1">
                        <div className="flex items-baseline">
                          <span className="text-xl font-extrabold text-neutral-900 tracking-tight">
                            {pkg.duration_range || `${pkg.min_days} Days`}
                          </span>
                          <span className="text-xs text-neutral-400 font-bold ml-1 uppercase tracking-wider">
                            /Duration
                          </span>
                        </div>

                        {/* Favorite Button */}
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

                      {/* Title */}
                      <h3 className="font-extrabold text-lg text-neutral-900 leading-snug px-1 line-clamp-1 mb-1">
                        {pkg.name}
                      </h3>

                      {/* Locations / Destinations list */}
                      <div className="flex items-center gap-1.5 text-neutral-500 text-xs px-1 mb-5 font-semibold">
                        <MapPin className="w-3.5 h-3.5 text-brand shrink-0" />
                        <span className="truncate">
                          {pkg.destinations.join(", ")}
                        </span>
                      </div>
                    </div>

                    {/* Action Button */}
                    <div className="px-1 pb-1">
                      <Link
                        href={`/packages/${pkg.slug}`}
                        className="block w-full border border-neutral-900 text-neutral-900 hover:bg-brand hover:border-brand hover:text-white font-bold text-xs uppercase tracking-wider py-3.5 rounded-full transition-all duration-300 text-center select-none"
                      >
                        View Details
                      </Link>
                    </div>
                  </div>
                );
              })}
            </div>

            {/* Custom Pagination Panel */}
            {totalPages > 1 && (
              <div className="flex items-center justify-center gap-1.5 bg-neutral-100/90 backdrop-blur-md p-1.5 rounded-full max-w-fit mx-auto mt-16 shadow-sm border border-neutral-200/30">
                {/* Previous Arrow */}
                <button
                  onClick={() => {
                    setCurrentPage((prev) => Math.max(prev - 1, 1));
                  }}
                  disabled={currentPage === 1}
                  className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none"
                  aria-label="Previous Page"
                >
                  <ChevronLeft className="w-4 h-4 stroke-[2.5]" />
                </button>

                {/* Page numbers/ellipses */}
                {paginationPages.map((page, idx) => {
                  if (page === "...") {
                    return (
                      <span
                        key={`ellipsis-${idx}`}
                        className="w-9 h-9 flex items-center justify-center text-neutral-400 font-bold text-sm select-none"
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
                        setCurrentPage(Number(page));
                      }}
                      className={`w-9 h-9 rounded-full flex items-center justify-center font-bold text-sm transition-all duration-200 select-none cursor-pointer ${
                        isPageActive
                          ? "bg-neutral-900 text-white shadow-md scale-105"
                          : "text-neutral-700 hover:bg-neutral-200/50"
                      }`}
                    >
                      {page}
                    </button>
                  );
                })}

                {/* Next Arrow */}
                <button
                  onClick={() => {
                    setCurrentPage((prev) => Math.min(prev + 1, totalPages));
                  }}
                  disabled={currentPage === totalPages}
                  className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none"
                  aria-label="Next Page"
                >
                  <ChevronRight className="w-4 h-4 stroke-[2.5]" />
                </button>
              </div>
            )}
          </div>
        )}
      </main>

      {/* Footer Branding & Links */}
      <Footer />
    </div>
  );
}
