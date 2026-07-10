"use client";

import { motion } from "framer-motion";
import {
  Check,
  ChevronDown,
  ChevronRight,
  Clock,
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

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import AccordionItem from "@/components/ui/Accordion";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import {
  type ItineraryDay,
  type PackageDetailItem,
  type PackageItem,
  type PackageVariant,
} from "@/types/package";

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
  companyData: CompanyData | null;
}

export default function PackageDetailClient({
  packageData,
  allPackages,
  companyData,
}: PackageDetailClientProps) {
  const [selectedVariantIdx, setSelectedVariantIdx] = useState(0);

  const { isFavorite, toggleFavorite } = useFavorites();

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
    <PageShell companyData={companyData} ptClass="pt-28" bgClass="bg-white">
      <div className="layout-container py-24">
        {/* Breadcrumbs */}
        <Breadcrumbs
          items={[
            { label: "Home", href: "/" },
            { label: "Packages", href: "/packages" },
            { label: pkgName },
          ]}
        />

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
                  priority
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

            {/* Middle Column - Wide Hero Central Image */}
            <div className="relative col-span-12 lg:col-span-6 h-full overflow-hidden rounded-[2rem] lg:rounded-[2.5rem] bg-neutral-100 group border border-neutral-100 shadow-md">
              <Image
                src={galleryImages[2]}
                alt={`${pkgName} Central Feature`}
                fill
                sizes="(max-width: 1024px) 100vw, 50vw"
                className="object-cover transition-transform duration-700 ease-out group-hover:scale-103"
                priority
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent" />
              {/* Overlay Badges */}
              <div className="absolute bottom-6 left-6 z-10 flex flex-wrap gap-2.5">
                <span className="bg-brand text-white text-[10px] font-bold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm">
                  {tourStyle}
                </span>
                <span className="bg-black/35 backdrop-blur-md border border-white/10 text-white text-[10px] font-bold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm">
                  {activeVariant.days} Days / {activeVariant.nights} Nights
                </span>
              </div>
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
        </section>

        {/* TWO-COLUMN DETAILS GRID */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-start mt-12">
          {/* LEFT COLUMN: Main info, highlights, variants tabs, itinerary */}
          <div className="lg:col-span-8 flex flex-col">
            {/* Header info */}
            <div className="border-b border-border-light pb-8 mb-8">
              <span className="text-xs font-bold text-neutral-400 uppercase tracking-widest block mb-2 font-sans">
                {packageData.is_domestic ? "Domestic Getaway" : "International Voyage"}
              </span>
              <h1 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight font-display leading-[1.1] mb-5">
                {pkgName}
              </h1>

              {/* Badges strip */}
              <div className="flex flex-wrap items-center gap-y-3 gap-x-5 text-xs md:text-sm font-semibold text-neutral-600 font-sans">
                <div className="flex items-center gap-1.5">
                  <Clock className="w-4.5 h-4.5 text-neutral-400" />
                  <span>{activeVariant.duration_text}</span>
                </div>
                <span className="w-1.5 h-1.5 rounded-full bg-neutral-300 hidden md:block" />
                <div className="flex items-center gap-1.5">
                  <MapPin className="w-4.5 h-4.5 text-neutral-400" />
                  <span>{packageData.primary_destination}</span>
                </div>
                <span className="w-1.5 h-1.5 rounded-full bg-neutral-300 hidden md:block" />
                <div className="flex items-center gap-1.5">
                  <Users className="w-4.5 h-4.5 text-neutral-400" />
                  <span>Max Group Size: 12</span>
                </div>
              </div>
            </div>

            {/* Overview Section */}
            <div className="mb-12 border-b border-border-light pb-10">
              <p className="text-base md:text-lg font-semibold font-display text-neutral-800 leading-relaxed mb-6">
                {overviewParagraphs.pitch}
              </p>
              <p className="text-neutral-500 text-sm md:text-base font-normal leading-relaxed whitespace-pre-line">
                {overviewParagraphs.detailed}
              </p>
            </div>

            {/* Highlights Section */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6 font-display">
                Tour Highlights
              </h2>
              <ul className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {highlights.map((hl: string, idx: number) => (
                  <li key={idx} className="flex items-start gap-3">
                    <span className="w-5 h-5 rounded-full bg-brand-light flex items-center justify-center shrink-0 mt-0.5">
                      <Check className="w-3 h-3 text-brand stroke-[3]" />
                    </span>
                    <span className="text-neutral-600 text-sm font-medium leading-normal">
                      {hl}
                    </span>
                  </li>
                ))}
              </ul>
            </div>

            {/* Duration Variants Switch Tabs */}
            {variants.length > 1 && (
              <div className="mb-10 border-b border-border-light pb-8">
                <span className="text-xs font-bold text-neutral-400 uppercase tracking-widest block mb-4 font-sans">
                  Available Durations
                </span>
                <div className="bg-neutral-100 p-1.5 rounded-2xl flex flex-wrap gap-1.5 border border-neutral-200/50 max-w-max">
                  {variants.map((v: PackageVariant, idx: number) => {
                    const isSelected = selectedVariantIdx === idx;
                    return (
                      <button
                        key={idx}
                        onClick={() => {
                          setSelectedVariantIdx(idx);
                          if (v.itinerary && v.itinerary.length > 0) {
                            setActiveItineraryDay(v.itinerary[0].day);
                          }
                        }}
                        className={`relative px-5 py-2.5 rounded-xl text-xs font-bold uppercase tracking-wider transition-colors duration-200 z-10 cursor-pointer select-none ${
                          isSelected ? "text-foreground" : "text-muted hover:text-foreground"
                        }`}
                      >
                        {isSelected && (
                          <motion.span
                            layoutId="activeDetailTab"
                            className="absolute inset-0 bg-white rounded-xl shadow-sm -z-10"
                            transition={{ type: "spring", stiffness: 380, damping: 30 }}
                          />
                        )}
                        {v.label}
                      </button>
                    );
                  })}
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
                      {/* Timeline dot */}
                      <div className="absolute -left-[38px] top-1.5 w-3 h-3 rounded-full border-2 border-neutral-400 bg-white z-10 group-hover:border-brand transition-colors duration-300" />

                      {/* Header */}
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

                      {/* Description */}
                      <p
                        className={`text-neutral-500 font-medium text-sm md:text-[14px] leading-relaxed mt-3.5 whitespace-pre-line pr-4 transition-all duration-300 ${
                          isExpanded ? "" : "line-clamp-3"
                        }`}
                      >
                        {day.description}
                      </p>

                      {/* Images Accordion (using shared AccordionItem with empty trigger wrapper) */}
                      <AccordionItem
                        isOpen={isExpanded}
                        onToggle={() => {}}
                        trigger={<></>}
                        duration={0.3}
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
                      </AccordionItem>
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

          {/* RIGHT COLUMN: Book/Inquire card, policy info, trust badges */}
          <div className="lg:col-span-4 lg:sticky lg:top-28 flex flex-col gap-6">
            {/* Inquiry/Booking Sticky Card */}
            <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
              <div className="flex flex-col gap-4">
                <div className="bg-neutral-50 rounded-2xl p-4 flex flex-col border border-neutral-100">
                  <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider font-sans mb-1">
                    Customized Package
                  </span>
                  <div className="flex items-end justify-between gap-1.5 font-display">
                    <span className="text-2xl md:text-3xl font-extrabold text-brand leading-none">
                      Price On Request
                    </span>
                  </div>
                </div>

                <div className="flex flex-col gap-2.5 font-sans mt-2">
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-500 border-b border-neutral-100 pb-2">
                    <span>Tour Style</span>
                    <span className="text-neutral-800 font-bold uppercase">{tourStyle}</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-500 border-b border-neutral-100 pb-2">
                    <span>Duration</span>
                    <span className="text-neutral-800 font-bold">
                      {activeVariant.days} Days / {activeVariant.nights} Nights
                    </span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-500 pb-1">
                    <span>Stops</span>
                    <span className="text-neutral-800 font-bold max-w-[200px] truncate">
                      {packageData.destinations.join(" → ")}
                    </span>
                  </div>
                </div>

                {/* Primary Orange Call To Action Button */}
                <button
                  onClick={handleInquireClick}
                  className="w-full bg-brand hover:bg-brand-hover text-white font-bold py-4 rounded-full text-xs uppercase tracking-wider shadow-md hover:shadow-lg transition-all duration-300 cursor-pointer text-center select-none border-none outline-none mt-2 active:scale-98"
                >
                  Book / Inquire Now
                </button>
              </div>
            </div>

            {/* Travel details / trust card */}
            <div className="bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 flex flex-col gap-4 font-sans text-xs md:text-sm">
              <h4 className="font-bold text-neutral-800 font-display text-sm md:text-base">
                Why book with us?
              </h4>
              <ul className="flex flex-col gap-3 font-semibold text-neutral-600">
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>100% Tailored itineraries</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>Zero hidden costs guaranteed</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>Premium private AC vehicles</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>24/7 Live customer care</span>
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* DETAILS ACCORDION SECTION (Inclusions, Exclusions, Terms, etc.) */}
        <section className="mt-16 border-t border-border-light pt-12">
          <div className="flex flex-col gap-5 max-w-4xl">
            {/* 1. Inclusions Panel */}
            <div className="bg-white border border-border-light rounded-2xl overflow-hidden shadow-[0_2px_8px_rgba(0,0,0,0.01)] transition-all duration-300">
              <AccordionItem
                isOpen={true} // Default open
                onToggle={() => {}}
                trigger={
                  <div className="w-full px-6 py-5 flex items-center justify-between text-left">
                    <span className="text-base md:text-lg font-bold text-foreground font-display flex items-center gap-2">
                      <Check className="w-5 h-5 text-emerald-500 stroke-[3]" /> Inclusions
                    </span>
                  </div>
                }
                className="w-full"
              >
                <div className="px-6 pb-6 text-neutral-500 text-sm leading-relaxed pt-2 border-t border-border-light/60">
                  <ul className="grid grid-cols-1 md:grid-cols-2 gap-3 list-none">
                    {inclusions.map((item, i) => (
                      <li key={i} className="flex items-start gap-2.5 font-medium text-neutral-600">
                        <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0 mt-2" />
                        <span>{item}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </AccordionItem>
            </div>

            {/* 2. Exclusions Panel */}
            <div className="bg-white border border-border-light rounded-2xl overflow-hidden shadow-[0_2px_8px_rgba(0,0,0,0.01)] transition-all duration-300">
              <AccordionItem
                isOpen={true} // Default open
                onToggle={() => {}}
                trigger={
                  <div className="w-full px-6 py-5 flex items-center justify-between text-left">
                    <span className="text-base md:text-lg font-bold text-foreground font-display flex items-center gap-2">
                      <X className="w-5 h-5 text-red-500 stroke-[3]" /> Exclusions
                    </span>
                  </div>
                }
                className="w-full"
              >
                <div className="px-6 pb-6 text-neutral-500 text-sm leading-relaxed pt-2 border-t border-border-light/60">
                  <ul className="grid grid-cols-1 md:grid-cols-2 gap-3 list-none">
                    {exclusions.map((item, i) => (
                      <li key={i} className="flex items-start gap-2.5 font-medium text-neutral-600">
                        <span className="w-1.5 h-1.5 rounded-full bg-red-500 shrink-0 mt-2" />
                        <span>{item}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </AccordionItem>
            </div>

            {/* 3. Important Notes Panel */}
            {packageData.notes && packageData.notes.length > 0 && (
              <div className="bg-white border border-border-light rounded-2xl overflow-hidden shadow-[0_2px_8px_rgba(0,0,0,0.01)] transition-all duration-300">
                <AccordionItem
                  isOpen={true} // Default open
                  onToggle={() => {}}
                  trigger={
                    <div className="w-full px-6 py-5 flex items-center justify-between text-left">
                      <span className="text-base md:text-lg font-bold text-foreground font-display flex items-center gap-2">
                        <HelpCircle className="w-5 h-5 text-brand stroke-[2]" /> Important Notes
                      </span>
                    </div>
                  }
                  className="w-full"
                >
                  <div className="px-6 pb-6 text-neutral-500 text-sm leading-relaxed pt-2 border-t border-border-light/60">
                    <ul className="flex flex-col gap-3 list-none">
                      {packageData.notes.map((item, i) => (
                        <li
                          key={i}
                          className="flex items-start gap-2.5 font-medium text-neutral-600"
                        >
                          <span className="w-1.5 h-1.5 rounded-full bg-brand shrink-0 mt-2" />
                          <span>{item}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </AccordionItem>
              </div>
            )}
          </div>
        </section>

        {/* RECOMMENDED PACKAGES SECTION */}
        <section className="mt-24 border-t border-border-light pt-24">
          <SectionHeader
            title="Recommended for you"
            badge="Explore More"
            rightSlot={
              <Link
                href="/packages"
                className="group inline-flex items-center gap-1.5 text-neutral-900 hover:text-brand font-semibold text-sm transition-colors mt-4 md:mt-0 cursor-pointer"
              >
                View all tours
                <ChevronRight className="w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
              </Link>
            }
          />

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {recommendedPackages.map((pkg) => (
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
              />
            ))}
          </div>
        </section>
      </div>
    </PageShell>
  );
}
