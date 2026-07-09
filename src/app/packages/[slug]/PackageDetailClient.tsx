"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Building2,
  Calendar,
  Check,
  ChevronDown,
  ChevronRight,
  Clock,
  Compass,
  Heart,
  HelpCircle,
  MapPin,
  Sparkles,
  Users,
  X,
} from "lucide-react";
import dynamic from "next/dynamic";
import Image from "next/image";
import Link from "next/link";
import React, { useMemo, useState } from "react";

import Footer, { type FooterCompanyData } from "@/components/Footer";
import Navbar from "@/components/Navbar";

// Dynamically import map component to avoid SSR errors
const PackageMap = dynamic(() => import("@/components/PackageMap"), {
  ssr: false,
  loading: () => (
    <div className="w-full h-full min-h-[350px] bg-neutral-50 border border-neutral-100 rounded-[2rem] flex items-center justify-center animate-pulse">
      <div className="text-center">
        <Sparkles className="w-8 h-8 text-neutral-300 mx-auto mb-2 animate-bounce" />
        <p className="text-xs font-semibold text-neutral-400 uppercase tracking-wider">
          Loading Route Map...
        </p>
      </div>
    </div>
  ),
});

// TypeScript interfaces
interface ItineraryDay {
  day: number;
  title: string;
  description: string;
}

interface PackageVariant {
  label: string;
  nights: number;
  days: number;
  duration_text: string;
  old_html_file: string;
  itinerary: ItineraryDay[];
}

interface PackageItem {
  id: string;
  slug: string;
  name: string;
  is_popular: boolean;
  is_domestic: boolean;
  destinations: string[];
  destination_ids: string[];
  primary_destination: string;
  category_ids: string[];
  state_id: string | null;
  country_id: string;
  min_nights: number;
  max_nights: number;
  min_days: number;
  max_days: number;
  duration_range: string;
  variant_count: number;
  hero_image: string;
  tags: string[];
}

interface PackageDetailItem extends PackageItem {
  overview: string;
  highlights: string[];
  inclusions: string[];
  exclusions: string[];
  notes: string[];
  variants: PackageVariant[];
  seo: {
    title: string;
    description: string;
    keywords: string[];
  };
}

// Recommended Package Card component (defined at module scope)
interface RecommendedCardProps {
  pkg: PackageItem;
  isFavorite: boolean;
  onToggleFavorite: (slug: string) => void;
}

const RecommendedCard = React.memo(
  ({ pkg, isFavorite, onToggleFavorite }: RecommendedCardProps) => {
    return (
      <div className="group relative bg-white border border-neutral-100 rounded-[2rem] p-4 shadow-card hover:shadow-premium transition-all duration-500 flex flex-col h-full justify-between">
        <div>
          <div className="relative w-full h-[220px] md:h-[260px] rounded-[1.5rem] overflow-hidden bg-neutral-100 z-0">
            <Image
              src={pkg.hero_image || "/images/placeholder-landscape.png"}
              alt={pkg.name}
              fill
              sizes="(max-width: 768px) 100vw, 33vw"
              className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
            />
          </div>

          <div className="flex items-center justify-between mt-5 mb-3 px-1">
            <div className="flex items-center gap-1.5 text-neutral-600 font-normal">
              <Clock className="w-4 h-4 text-neutral-400 shrink-0" />
              <span className="text-sm">{pkg.duration_range || `${pkg.min_days} Days`}</span>
            </div>

            <button
              onClick={(e) => {
                e.preventDefault();
                onToggleFavorite(pkg.slug);
              }}
              className="w-9 h-9 rounded-full bg-white hover:bg-neutral-50 border border-neutral-200/60 flex items-center justify-center text-neutral-600 hover:text-red-500 transition-all duration-300 active:scale-90 group/heart cursor-pointer shadow-sm z-10"
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
            className="block w-full border border-neutral-900 text-neutral-900 hover:bg-brand hover:border-brand hover:text-white font-semibold text-xs uppercase tracking-wider py-3.5 rounded-full transition-all duration-300 text-center select-none cursor-pointer"
          >
            View Details
          </Link>
        </div>
      </div>
    );
  },
);
RecommendedCard.displayName = "RecommendedCard";

// Gallery image resolver helper
function getGalleryImages(pkgName: string, heroImage: string): string[] {
  const beachPool = [
    "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1473116763269-255ea760754e?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1540206351-d6465b3ac5c1?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1505118380757-91f5f5632de0?auto=format&fit=crop&w=800&q=80",
  ];

  const mountainPool = [
    "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1472791108050-e82fc522cfcc?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1486873249359-2731bd6dafc7?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1454496522488-7a8e488e8606?auto=format&fit=crop&w=800&q=80",
  ];

  const heritagePool = [
    "https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1585135497273-1a86b09fe707?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1598977123418-45f04b615e52?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1545224933-7305bbb7ea24?auto=format&fit=crop&w=800&q=80",
  ];

  const generalPool = [
    "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1501555088652-021faa106b9b?auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?auto=format&fit=crop&w=800&q=80",
  ];

  const lowName = pkgName.toLowerCase();
  let pool = generalPool;

  if (
    lowName.includes("goa") ||
    lowName.includes("beach") ||
    lowName.includes("andaman") ||
    lowName.includes("kerala")
  ) {
    pool = beachPool;
  } else if (
    lowName.includes("kashmir") ||
    lowName.includes("himachal") ||
    lowName.includes("manali") ||
    lowName.includes("shimla") ||
    lowName.includes("himalay") ||
    lowName.includes("uttarakhand") ||
    lowName.includes("mussoorie") ||
    lowName.includes("nainital")
  ) {
    pool = mountainPool;
  } else if (
    lowName.includes("agra") ||
    lowName.includes("delhi") ||
    lowName.includes("heritage") ||
    lowName.includes("rajasthan") ||
    lowName.includes("varanasi") ||
    lowName.includes("spiritual") ||
    lowName.includes("temple") ||
    lowName.includes("triangle")
  ) {
    pool = heritagePool;
  }

  // Use heroImage as the large central banner image (index 2 in masonry grid)
  const images = [...pool];
  if (heroImage && heroImage.trim() !== "") {
    images[2] = heroImage;
  }
  return images;
}

// Default Fallback Contents
const DEFAULT_OVERVIEW =
  "Discover the beauty and charm of this incredible destination with our carefully curated tour package. Mother India Tour Travels provides premium AC vehicles, professional local guides, and hand-picked accommodations to make your holiday seamless, comfortable, and unforgettable. From breathtaking views to rich cultural experiences, this tour covers the absolute highlights of the region.";

const DEFAULT_HIGHLIGHTS = [
  "Comprehensive sightseeing in comfortable AC vehicles",
  "Handpicked premium accommodations with breakfast",
  "Professional local guides at major monuments",
  "Seamless airport/railway station transfers",
  "24/7 on-tour customer support",
];

const DEFAULT_INCLUSIONS = [
  "Accommodation in listed or similar hotels",
  "Daily breakfast at the hotel",
  "All transfers and sightseeing by private AC vehicle",
  "All parking fees, toll taxes, and driver allowance",
  "State taxes and fuel charges",
  "Welcome drink on arrival (Non-alcoholic)",
];

const DEFAULT_EXCLUSIONS = [
  "Airfare or train tickets",
  "Lunch and dinner unless specified in the itinerary",
  "Monument entrance fees and camera charges",
  "Personal expenses (laundry, tips, mineral water, etc.)",
  "GST (5% on tour cost)",
];

interface PackageDetailClientProps {
  packageData: PackageDetailItem;
  allPackages: PackageItem[];
  companyData: FooterCompanyData | null;
}

export default function PackageDetailClient({
  packageData,
  allPackages,
  companyData,
}: PackageDetailClientProps) {
  const [selectedVariantIdx, setSelectedVariantIdx] = useState(0);

  // Sync favorites from LocalStorage (using pure lazy state initializer)
  const [favorites, setFavorites] = useState<string[]>(() => {
    if (typeof window === "undefined") return [];
    try {
      const saved = localStorage.getItem("mother_india_favorites");
      return saved ? JSON.parse(saved) : [];
    } catch {
      return [];
    }
  });

  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => {
      const next = prev.includes(slug) ? prev.filter((s) => s !== slug) : [...prev, slug];
      localStorage.setItem("mother_india_favorites", JSON.stringify(next));
      return next;
    });
  };

  // Derive static details with fallbacks
  const pkgName = packageData.name || "Tour Package";
  const overviewText = packageData.overview || DEFAULT_OVERVIEW;
  const highlights =
    packageData.highlights && packageData.highlights.length > 0
      ? packageData.highlights
      : DEFAULT_HIGHLIGHTS;
  const inclusions =
    packageData.inclusions && packageData.inclusions.length > 0
      ? packageData.inclusions
      : DEFAULT_INCLUSIONS;
  const exclusions =
    packageData.exclusions && packageData.exclusions.length > 0
      ? packageData.exclusions
      : DEFAULT_EXCLUSIONS;

  // Split overview into marketing pitch (first paragraph) and detailed overview (the rest)
  const overviewParagraphs = useMemo(() => {
    if (!overviewText) return { pitch: "", detailed: "" };
    const parts = overviewText
      .split(/\n\n+/)
      .map((p) => p.trim())
      .filter(Boolean);
    if (parts.length > 1) {
      return {
        pitch: parts[0],
        detailed: parts.slice(1).join("\n\n"),
      };
    }
    return {
      pitch: parts[0] || "",
      detailed: DEFAULT_OVERVIEW,
    };
  }, [overviewText]);

  // Derive tour style from category slugs or tags
  const tourStyle = useMemo(() => {
    const stylesMap: Record<string, string> = {
      "domestic-tour-packages": "Classic",
      "beach-tour-packages": "Beach",
      "pilgrimage-tour-packages": "Pilgrimage",
      "adventure-tour-packages": "Adventure",
      "hill-station-packages": "Hill Station",
      "wildlife-tour-packages": "Wildlife",
      "nature-tour-packages": "Nature",
      "weekend-tour-packages": "Leisure",
    };
    const categoryIds = packageData.category_ids || [];
    for (const id of categoryIds) {
      if (stylesMap[id]) return stylesMap[id];
    }
    const tags = packageData.tags || [];
    for (const tag of tags) {
      const lowTag = tag.toLowerCase();
      if (lowTag.includes("beach")) return "Beach";
      if (lowTag.includes("heritage") || lowTag.includes("history")) return "Heritage";
      if (lowTag.includes("temple") || lowTag.includes("pilgrim") || lowTag.includes("spiritual"))
        return "Pilgrimage";
      if (lowTag.includes("adventure") || lowTag.includes("trek")) return "Adventure";
      if (lowTag.includes("wildlife") || lowTag.includes("safari")) return "Wildlife";
    }
    return "Classic"; // Fallback style
  }, [packageData.category_ids, packageData.tags]);

  // Resolve gallery images
  const galleryImages = useMemo(() => {
    return getGalleryImages(pkgName, packageData.hero_image);
  }, [pkgName, packageData.hero_image]);

  // Handle variants and itineraries
  const variants = useMemo(() => {
    if (packageData.variants && packageData.variants.length > 0) {
      return packageData.variants;
    }
    // Fallback single variant based on min/max days
    const fallbackDays = packageData.min_days || 5;
    const fallbackNights = packageData.min_nights || 4;

    // Generate dummy itinerary days
    const fallbackItinerary = Array.from({ length: fallbackDays }, (_, i) => {
      const dayNum = i + 1;
      if (dayNum === 1) {
        return {
          day: 1,
          title: "Arrival and Sightseeing",
          description:
            "Welcome to your tour! Our representative will assist you with transfer to your hotel. Rest of the day is free for leisure or exploring local markets.",
        };
      }
      if (dayNum === fallbackDays) {
        return {
          day: dayNum,
          title: "Departure",
          description:
            "After breakfast, check out of your hotel and transfer to the airport or railway station for your onward journey.",
        };
      }
      return {
        day: dayNum,
        title: `Sightseeing Tour - Day ${dayNum}`,
        description:
          "Enjoy a full day of sightseeing at popular attractions, heritage sites, and scenic viewpoints with private AC vehicle.",
      };
    });

    return [
      {
        label: packageData.duration_range || `${fallbackNights}N/${fallbackDays}D`,
        nights: fallbackNights,
        days: fallbackDays,
        duration_text: packageData.duration_range || `${fallbackNights}N/${fallbackDays}D`,
        old_html_file: "",
        itinerary: fallbackItinerary,
      },
    ];
  }, [packageData]);

  // Selected Variant
  const activeVariant = variants[selectedVariantIdx] || variants[0];
  const itinerary = activeVariant.itinerary || [];

  // Active Day - Initialize to first day of first variant
  const [activeItineraryDay, setActiveItineraryDay] = useState<number | null>(() => {
    const firstVariant = variants[0];
    return firstVariant && firstVariant.itinerary && firstVariant.itinerary.length > 0
      ? firstVariant.itinerary[0].day
      : null;
  });

  // Recommended Packages (3 packages, pure and deterministic offset selection)
  const recommendedPackages = useMemo(() => {
    const others = allPackages.filter((p) => p.slug !== packageData.slug);

    // Match domestic vs international first
    const matchType = others.filter((p) => p.is_domestic === packageData.is_domestic);
    const pool = matchType.length >= 3 ? matchType : others;

    // Pick 3 stable packages based on the current package slug length to satisfy purity rules
    const offset = packageData.slug.length % pool.length;
    const result = [];
    for (let i = 0; i < 3; i++) {
      const index = (offset + i * 2) % pool.length;
      result.push(pool[index]);
    }
    return result;
  }, [allPackages, packageData]);

  // Trigger inquiry popup modal with personalized package name
  const handleInquireClick = () => {
    window.dispatchEvent(
      new CustomEvent("open-inquiry-modal", {
        detail: { packageName: pkgName },
      }),
    );
  };

  // Itinerary day images (static pool of beautiful sightseeing images)
  const itineraryDayImagesPool = [
    "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1480796927426-f609979314bd?auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1503899036084-c55cdd92da26?auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1561361513-2d000a50f0db?auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1590050752117-238cb0612b1b?auto=format&fit=crop&w=400&q=80",
  ];

  return (
    <div className="flex flex-col min-h-screen">
      <Navbar />

      {/* Main Container */}
      <main className="flex-1 bg-white pt-28 pb-24">
        <div className="layout-container">
          {/* Breadcrumbs */}
          <nav className="flex items-center gap-2 text-xs md:text-sm font-medium text-neutral-400 mb-8 font-sans">
            <Link href="/" className="hover:text-brand transition-colors">
              Home
            </Link>
            <ChevronRight className="w-3 h-3 text-neutral-300" />
            <Link href="/packages" className="hover:text-brand transition-colors">
              Packages
            </Link>
            <ChevronRight className="w-3 h-3 text-neutral-300" />
            <span className="text-neutral-500 font-semibold truncate max-w-[200px] md:max-w-none">
              {pkgName}
            </span>
          </nav>

          {/* ASYMMETRIC MASONRY GALLERY */}
          <section className="mb-12 animate-fade-in">
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 h-[300px] md:h-[450px] lg:h-[550px]">
              {/* Left Column - 2 stacked images (60% / 40% height ratios) */}
              <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
                <div className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                  <Image
                    src={galleryImages[0]}
                    alt={`${pkgName} Gallery 1`}
                    fill
                    sizes="(max-width: 1024px) 25vw, 15vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                  />
                </div>
                <div className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                  <Image
                    src={galleryImages[1]}
                    alt={`${pkgName} Gallery 2`}
                    fill
                    sizes="(max-width: 1024px) 25vw, 15vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                  />
                </div>
              </div>

              {/* Center Column - 1 huge main image (100% height) */}
              <div className="relative col-span-12 lg:col-span-6 h-[250px] md:h-full overflow-hidden rounded-[2rem] lg:rounded-[2.5rem] bg-neutral-100 group shadow-sm border border-neutral-100">
                <Image
                  src={galleryImages[2]}
                  alt={`${pkgName} Main Gallery`}
                  fill
                  sizes="(max-width: 1024px) 100vw, 50vw"
                  className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                  priority
                />
              </div>

              {/* Right Column - 2 stacked images (40% / 60% height ratios) */}
              <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
                <div className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                  <Image
                    src={galleryImages[3]}
                    alt={`${pkgName} Gallery 3`}
                    fill
                    sizes="(max-width: 1024px) 25vw, 15vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                  />
                </div>
                <div className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                  <Image
                    src={galleryImages[4]}
                    alt={`${pkgName} Gallery 4`}
                    fill
                    sizes="(max-width: 1024px) 25vw, 15vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-105"
                  />
                </div>
              </div>
            </div>

            {/* Mobile horizontal gallery scrollbar */}
            <div className="flex lg:hidden gap-3 overflow-x-auto no-scrollbar py-2 mt-4 px-1">
              {galleryImages.map((img, idx) => (
                <div
                  key={idx}
                  className="relative w-52 h-36 shrink-0 overflow-hidden rounded-[1.5rem] bg-neutral-100 shadow-sm border border-neutral-100"
                >
                  <Image
                    src={img}
                    alt={`${pkgName} Mobile Gallery ${idx + 1}`}
                    fill
                    sizes="208px"
                    className="object-cover"
                  />
                </div>
              ))}
            </div>
          </section>

          {/* TWO COLUMN GRID CONTENT */}
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-12 lg:gap-16 items-start">
            {/* LEFT COLUMN: Main Package Info */}
            <div className="flex flex-col">
              {/* Header Title */}
              <div className="mb-6">
                <div className="flex items-center gap-2.5 mb-3 font-sans text-xs md:text-sm font-medium">
                  <span className="inline-block bg-white border border-neutral-200 text-neutral-700 font-semibold px-2.5 py-1 rounded-[8px] uppercase tracking-wider text-[10px]">
                    {packageData.is_domestic ? "Domestic" : "International"}
                  </span>
                  <span className="text-neutral-400 font-medium select-none">
                    • Trip Code: MI-{packageData.id.toUpperCase().replace(/-/g, "")}
                  </span>
                </div>
                <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground leading-tight tracking-tight">
                  {pkgName}
                </h1>
              </div>

              {/* Hero Description (Marketing Pitch) */}
              {overviewParagraphs.pitch && (
                <div className="text-neutral-500 font-medium text-sm md:text-base leading-relaxed space-y-4 mb-8">
                  <p className="whitespace-pre-line">{overviewParagraphs.pitch}</p>
                </div>
              )}

              {/* Summary Metadata Bar (Divided by lines as in reference design) */}
              <div className="border-y border-neutral-200 py-6 mb-10 flex flex-wrap items-center justify-between gap-6 md:gap-8 font-sans">
                {/* Duration */}
                <div className="flex items-center gap-3">
                  <Calendar className="w-5 h-5 text-neutral-800 shrink-0" />
                  <div className="flex flex-col">
                    <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                      Duration
                    </span>
                    <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                      {activeVariant.duration_text || `${activeVariant.days} Days`}
                    </span>
                  </div>
                </div>

                {/* Group Size */}
                <div className="flex items-center gap-3">
                  <Users className="w-5 h-5 text-neutral-800 shrink-0" />
                  <div className="flex flex-col">
                    <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                      Group Size
                    </span>
                    <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                      Max 12, Avg 10
                    </span>
                  </div>
                </div>

                {/* Tour Style */}
                <div className="flex items-center gap-3">
                  <Compass className="w-5 h-5 text-neutral-800 shrink-0" />
                  <div className="flex flex-col">
                    <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                      Tour Style
                    </span>
                    <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                      {tourStyle}
                    </span>
                  </div>
                </div>

                {/* Accommodation */}
                <div className="flex items-center gap-3">
                  <Building2 className="w-5 h-5 text-neutral-800 shrink-0" />
                  <div className="flex flex-col">
                    <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                      Accommodation
                    </span>
                    <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                      Hotels ({activeVariant.nights} nts)
                    </span>
                  </div>
                </div>
              </div>

              {/* Trip Overview (Detailed Explanation) */}
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4">
                  Trip Overview
                </h2>
                <div className="text-neutral-500 font-medium text-sm md:text-base leading-relaxed space-y-4">
                  <p className="whitespace-pre-line">{overviewParagraphs.detailed}</p>
                </div>
              </div>

              {/* Highlights */}
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4">
                  Tour Highlights
                </h2>
                <ul className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3.5 list-disc pl-5 text-neutral-500 font-medium text-sm md:text-base">
                  {highlights.map((highlight: string, idx: number) => (
                    <li key={idx} className="leading-relaxed">
                      {highlight}
                    </li>
                  ))}
                </ul>
              </div>

              {/* What's Included */}
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6">
                  What&apos;s Included
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {inclusions.map((inc: string, idx: number) => (
                    <div key={idx} className="flex gap-3">
                      <div className="w-5 h-5 rounded-full bg-neutral-100 flex items-center justify-center shrink-0 mt-0.5">
                        <Check className="w-3.5 h-3.5 text-neutral-500" />
                      </div>
                      <span className="text-neutral-600 font-medium text-sm leading-snug">
                        {inc}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              {/* What's Excluded */}
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6">Exclusions</h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {exclusions.map((exc: string, idx: number) => (
                    <div key={idx} className="flex gap-3">
                      <div className="w-5 h-5 rounded-full bg-neutral-100/50 flex items-center justify-center shrink-0 mt-0.5">
                        <X className="w-3.5 h-3.5 text-neutral-400" />
                      </div>
                      <span className="text-neutral-500 font-normal text-sm leading-snug">
                        {exc}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Duration Switcher (if multiple variants) */}
              {variants.length > 1 && (
                <div className="mb-8 p-6 bg-neutral-50/50 border border-border-light rounded-[2rem]">
                  <h3 className="text-sm font-bold text-neutral-500 uppercase tracking-wider mb-4">
                    Choose Duration
                  </h3>
                  <div className="flex flex-wrap gap-2">
                    {variants.map((v: PackageVariant, idx: number) => (
                      <button
                        key={idx}
                        onClick={() => {
                          setSelectedVariantIdx(idx);
                          const nextVariant = variants[idx];
                          if (
                            nextVariant &&
                            nextVariant.itinerary &&
                            nextVariant.itinerary.length > 0
                          ) {
                            setActiveItineraryDay(nextVariant.itinerary[0].day);
                          } else {
                            setActiveItineraryDay(null);
                          }
                        }}
                        className={`px-5 py-2.5 rounded-full font-semibold text-xs tracking-wider uppercase transition-all duration-300 cursor-pointer ${
                          selectedVariantIdx === idx
                            ? "bg-brand text-white shadow-premium"
                            : "bg-white border border-border-light text-neutral-600 hover:bg-neutral-50"
                        }`}
                      >
                        {v.label} ({v.days} Days)
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {/* Itinerary Section */}
              <div className="mb-12 border-b border-border-light pb-10">
                <div className="flex items-center justify-between mb-8">
                  <h2 className="text-xl md:text-2xl font-bold text-foreground">Itinerary</h2>
                  <span className="text-xs md:text-sm font-bold text-neutral-400 uppercase tracking-wider">
                    {activeVariant.days} Days / {activeVariant.nights} Nights
                  </span>
                </div>

                <div className="relative pl-8 border-l border-neutral-200/80 ml-4 space-y-12 py-2">
                  {itinerary.map((day: ItineraryDay, idx: number) => {
                    const isExpanded = activeItineraryDay === day.day;

                    // Select 3 deterministic images for the expanded day's photo row
                    const dayImages = [
                      itineraryDayImagesPool[(day.day * 1) % itineraryDayImagesPool.length],
                      itineraryDayImagesPool[(day.day * 2) % itineraryDayImagesPool.length],
                      itineraryDayImagesPool[(day.day * 3) % itineraryDayImagesPool.length],
                    ];

                    return (
                      <div key={idx} className="relative group">
                        {/* Timeline dot (aligned center with left border) */}
                        <div className="absolute -left-[38px] top-1.5 w-3 h-3 rounded-full border-2 border-neutral-400 bg-white z-10 group-hover:border-brand transition-colors duration-300" />

                        {/* Accordion Header */}
                        <div
                          onClick={() => setActiveItineraryDay(isExpanded ? null : day.day)}
                          className="flex items-start justify-between gap-4 cursor-pointer select-none"
                        >
                          <div className="flex flex-col items-start gap-1">
                            {/* Day Pill */}
                            <span className="inline-block bg-neutral-100 text-neutral-600 font-semibold text-[11px] uppercase tracking-wider px-2.5 py-1 rounded-[10px]">
                              Day {day.day}
                            </span>
                            {/* Title */}
                            <h3 className="font-bold text-lg md:text-xl text-foreground font-display mt-1.5 leading-snug">
                              {day.title}
                            </h3>
                          </div>

                          <div className="w-8 h-8 rounded-full border border-neutral-200 flex items-center justify-center text-neutral-400 group-hover:text-brand group-hover:border-brand/40 transition-colors shrink-0 mt-1">
                            <ChevronDown
                              className={`w-4 h-4 transition-transform duration-300 ${
                                isExpanded ? "rotate-180" : ""
                              }`}
                            />
                          </div>
                        </div>

                        {/* Description (Truncated when collapsed, full when expanded) */}
                        <p
                          className={`text-neutral-500 font-medium text-sm md:text-[14px] leading-relaxed mt-3.5 whitespace-pre-line pr-4 transition-all duration-300 ${
                            isExpanded ? "" : "line-clamp-3"
                          }`}
                        >
                          {day.description}
                        </p>

                        {/* Images (Only visible when expanded) */}
                        <AnimatePresence initial={false}>
                          {isExpanded && (
                            <motion.div
                              initial={{ height: 0, opacity: 0 }}
                              animate={{ height: "auto", opacity: 1 }}
                              exit={{ height: 0, opacity: 0 }}
                              transition={{ duration: 0.3, ease: "easeInOut" }}
                              className="overflow-hidden"
                            >
                              <div className="grid grid-cols-3 gap-3 mt-6 pt-2">
                                {dayImages.map((img, i) => (
                                  <div
                                    key={i}
                                    className="relative aspect-[4/3] rounded-[1.5rem] overflow-hidden bg-neutral-100 shadow-sm border border-neutral-100 group/img"
                                  >
                                    <Image
                                      src={img}
                                      alt={`Itinerary Day ${day.day} Image ${i + 1}`}
                                      fill
                                      sizes="(max-width: 768px) 33vw, 20vw"
                                      className="object-cover transition-transform duration-500 group-hover/img:scale-105"
                                    />
                                  </div>
                                ))}
                              </div>
                            </motion.div>
                          )}
                        </AnimatePresence>
                      </div>
                    );
                  })}
                </div>
              </div>

              {/* Where you'll be Section */}
              <div className="mb-12">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                  Where you&apos;ll be
                </h2>
                <div className="w-full h-[350px] md:h-[450px] rounded-[2rem] overflow-hidden border border-border-light shadow-sm bg-neutral-50">
                  <PackageMap destinations={packageData.destinations} />
                </div>
              </div>
            </div>

            {/* RIGHT COLUMN: Sticky booking form */}
            <aside className="lg:sticky lg:top-28 z-10 flex flex-col gap-6">
              {/* Floating Booking Card */}
              <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
                {/* Header route summary */}
                <div className="mb-6">
                  <div className="flex items-center gap-1.5 text-neutral-400 text-xs font-bold uppercase tracking-wider mb-2">
                    <Clock className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
                    <span>{activeVariant.duration_text || `${activeVariant.days} Days`}</span>
                  </div>
                  <div className="font-bold text-foreground text-sm flex flex-wrap items-center gap-1.5 leading-snug">
                    {packageData.destinations.map((dest: string, idx: number) => (
                      <React.Fragment key={idx}>
                        {idx > 0 && <ChevronRight className="w-3 h-3 text-neutral-300 shrink-0" />}
                        <span className="text-foreground">{dest}</span>
                      </React.Fragment>
                    ))}
                  </div>
                </div>

                {/* Feature Inclusions Summary */}
                <div className="border-t border-b border-border-light py-5 mb-6 space-y-3.5">
                  <div className="flex items-center gap-3">
                    <Check className="w-4 h-4 text-neutral-400 shrink-0" />
                    <span className="text-xs font-medium text-neutral-500">
                      Handpicked Premium Hotels Included
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <MapPin className="w-4 h-4 text-neutral-400 shrink-0" />
                    <span className="text-xs font-medium text-neutral-500">
                      Sightseeing in Private AC Vehicle
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <Users className="w-4 h-4 text-neutral-400 shrink-0" />
                    <span className="text-xs font-medium text-neutral-500">
                      24/7 Dedicated Chauffeur & Support
                    </span>
                  </div>
                </div>

                {/* Booking Button */}
                <button
                  onClick={handleInquireClick}
                  className="w-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs tracking-wider uppercase py-4 rounded-full transition-all duration-300 shadow-md hover:shadow-lg cursor-pointer text-center select-none"
                >
                  Book Now
                </button>

                <p className="text-[10px] text-neutral-400 text-center font-medium mt-3">
                  No instant charges. Connect directly with our tour experts.
                </p>
              </div>

              {/* Help & Support Card */}
              <div className="bg-neutral-50/50 border border-border-light rounded-[2rem] p-6 text-center">
                <HelpCircle className="w-6 h-6 text-neutral-400 mx-auto mb-3" />
                <h4 className="font-bold text-foreground text-base mb-2">Need Help Planning?</h4>
                <p className="text-xs text-neutral-500 font-medium leading-relaxed mb-4">
                  Talk to our travel specialists for custom itineraries, group discounts, or special
                  requirements.
                </p>
                {companyData && companyData.whatsapp_number && (
                  <a
                    href={`https://wa.me/${companyData.whatsapp_number}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-2 border border-neutral-900 text-neutral-900 hover:bg-neutral-900 hover:text-white font-semibold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer select-none"
                  >
                    WhatsApp Experts
                  </a>
                )}
              </div>
            </aside>
          </div>

          {/* RECOMMENDED PACKAGES SECTION */}
          <section className="mt-24 border-t border-border-light pt-24">
            <div className="flex flex-col md:flex-row md:items-end justify-between mb-12">
              <div>
                <span className="block text-brand text-xs font-semibold uppercase tracking-wider mb-2">
                  Explore More
                </span>
                <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-foreground tracking-tight">
                  Recommended for you
                </h2>
              </div>
              <Link
                href="/packages"
                className="group inline-flex items-center gap-1.5 text-neutral-900 hover:text-brand font-semibold text-sm transition-colors mt-4 md:mt-0 cursor-pointer"
              >
                View all tours
                <ChevronRight className="w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
              </Link>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {recommendedPackages.map((pkg) => {
                const isFavorite = favorites.includes(pkg.slug);
                return (
                  <RecommendedCard
                    key={pkg.id}
                    pkg={pkg}
                    isFavorite={isFavorite}
                    onToggleFavorite={toggleFavorite}
                  />
                );
              })}
            </div>
          </section>
        </div>
      </main>

      <Footer companyData={companyData} />
    </div>
  );
}
