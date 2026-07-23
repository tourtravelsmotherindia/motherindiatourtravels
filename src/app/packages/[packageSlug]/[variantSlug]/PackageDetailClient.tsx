"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Building2,
  Calendar,
  Check,
  ChevronRight,
  Compass,
  HelpCircle,
  MapPin,
  Sparkles,
  Users,
  X,
} from "lucide-react";
import dynamic from "next/dynamic";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type CompanyData } from "@/types/company";
import {
  type PackageDetailItem,
  type PackageItem,
  type PackageVariantDetail,
} from "@/types/package";

// Dynamically import map component to avoid SSR errors
const PackageMap = dynamic(() => import("@/components/packages/PackageMap"), {
  ssr: false,
  loading: () => (
    <div className="w-full h-full min-h-[350px] bg-neutral-50 border border-neutral-100 rounded-[2rem] flex items-center justify-center animate-pulse">
      <div className="text-center">
        <Sparkles className="w-8 h-8 text-neutral-400 mx-auto mb-2 animate-bounce" />
        <p className="text-xs font-semibold text-neutral-600 uppercase tracking-wider">
          Loading Route Map...
        </p>
      </div>
    </div>
  ),
});

const DEFAULT_OVERVIEW =
  "Discover the beauty and charm of this incredible destination with our carefully curated tour package. Mother India Tour Travels provides premium AC vehicles, professional local guides, and hand-picked accommodations to make your holiday seamless, comfortable, and unforgettable.";

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
  activeVariant: PackageVariantDetail;
  allPackages: PackageItem[];
  companyData: CompanyData | null;
}

// Expandable text helper component
const ExpandableText = ({ text, maxLength = 240 }: { text: string; maxLength?: number }) => {
  const [isExpanded, setIsExpanded] = useState(false);

  if (!text) return null;
  if (text.length <= maxLength) {
    return <p className="whitespace-pre-line">{text}</p>;
  }

  const displayText = isExpanded ? text : `${text.slice(0, maxLength)}...`;

  return (
    <div>
      <p className="whitespace-pre-line inline">{displayText}</p>
      <button
        type="button"
        onClick={() => setIsExpanded(!isExpanded)}
        className="text-brand hover:text-brand-hover font-bold text-xs uppercase tracking-wider ml-1.5 inline-block focus:outline-none cursor-pointer"
      >
        {isExpanded ? "see less" : "see more"}
      </button>
    </div>
  );
};

export default function PackageDetailClient({
  packageData,
  activeVariant,
  allPackages,
  companyData,
}: PackageDetailClientProps) {
  const pkgName = packageData.name || "Tour Package";
  const overviewText = packageData.overview || DEFAULT_OVERVIEW;

  const { isFavorite, toggleFavorite } = useFavorites();

  // Recommended packages selection (ensuring absolute uniqueness of keys)
  const recommendedPackages = useMemo(() => {
    const others = allPackages.filter((p) => p.slug !== packageData.slug);
    const matchType = others.filter((p) => p.isPopular);
    const pool = matchType.length >= 3 ? matchType : others;

    const unique = Array.from(new Set(pool.map((p) => p.id)))
      .map((id) => pool.find((p) => p.id === id))
      .filter((p): p is PackageItem => !!p);

    const offset = packageData.slug.length % unique.length;
    const result = [];
    for (let i = 0; i < Math.min(3, unique.length); i++) {
      result.push(unique[(offset + i) % unique.length]);
    }
    return result;
  }, [allPackages, packageData]);

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

  const itinerary = activeVariant.itinerary || [];

  const [activeItineraryDay, setActiveItineraryDay] = useState<number | null>(() => {
    return itinerary.length > 0 ? itinerary[0].day : null;
  });

  // Dynamic hero image and gallery list swap functionality
  const initialHeroImage = activeVariant.heroImage || packageData.heroImage;
  const initialGalleryImages = useMemo(() => {
    if (activeVariant.galleryImages && activeVariant.galleryImages.length > 0) {
      return activeVariant.galleryImages;
    }
    return packageData.galleryImages;
  }, [packageData.galleryImages, activeVariant.galleryImages]);

  const [prevHero, setPrevHero] = useState(initialHeroImage);
  const [currentHeroImage, setCurrentHeroImage] = useState(initialHeroImage);
  const [currentGalleryImages, setCurrentGalleryImages] = useState<string[]>(initialGalleryImages);

  if (initialHeroImage !== prevHero) {
    setPrevHero(initialHeroImage);
    setCurrentHeroImage(initialHeroImage);
    setCurrentGalleryImages(initialGalleryImages);
  }

  const handleGalleryClick = (clickedImg: string, index: number) => {
    const previousHero = currentHeroImage;
    setCurrentHeroImage(clickedImg);
    setCurrentGalleryImages((prev) => {
      const next = [...prev];
      next[index] = previousHero;
      return next;
    });
  };

  const mapMarkers = useMemo(() => {
    const list =
      (activeVariant.attractions || []).length > 0
        ? activeVariant.attractions
            .filter((attr) => attr.latitude && attr.longitude)
            .map((attr) => ({
              name: attr.attractionName,
              latitude: attr.latitude!,
              longitude: attr.longitude!,
            }))
        : activeVariant.destinations
            .filter((dest) => dest.latitude && dest.longitude)
            .map((dest) => ({
              name: dest.destinationName,
              latitude: dest.latitude!,
              longitude: dest.longitude!,
            }));
    return list;
  }, [activeVariant]);

  const breadcrumbItems = [
    { label: "Home", href: "/" },
    { label: "Packages", href: "/packages" },
    { label: pkgName, href: `/packages/${packageData.slug}` },
    { label: activeVariant.label },
  ];

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

  // Derived style info
  const tourStyle = packageData.tourStyle || "Classic";

  return (
    <PageShell companyData={companyData} ptClass="pt-28" bgClass="bg-white" className="pb-24">
      <div className="layout-container">
        {/* Breadcrumbs */}
        <Breadcrumbs items={breadcrumbItems} />

        {/* ASYMMETRIC MASONRY GALLERY */}
        <section className="mb-12 animate-fade-in font-sans">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 h-[300px] md:h-[450px] lg:h-[550px]">
            {/* Left Column - 2 stacked images */}
            <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
              <div
                onClick={() => handleGalleryClick(currentGalleryImages[0] || currentHeroImage, 0)}
                className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100 cursor-pointer select-none"
              >
                <Image
                  src={getOptimizedImageUrl(currentGalleryImages[0] || currentHeroImage, 800)}
                  alt={`${pkgName} Gallery 1`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>
              <div
                onClick={() => handleGalleryClick(currentGalleryImages[1] || currentHeroImage, 1)}
                className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100 cursor-pointer select-none"
              >
                <Image
                  src={getOptimizedImageUrl(currentGalleryImages[1] || currentHeroImage, 800)}
                  alt={`${pkgName} Gallery 2`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>
            </div>

            {/* Center Column - 1 huge main image */}
            <div className="relative col-span-12 lg:col-span-6 h-full overflow-hidden rounded-[2rem] lg:rounded-[2.5rem] bg-neutral-100 group shadow-sm border border-neutral-100 select-none">
              <Image
                src={getOptimizedImageUrl(currentHeroImage, 1200)}
                alt={`${pkgName} Main Gallery`}
                fill
                sizes="(max-width: 1024px) 100vw, 50vw"
                className="object-cover transition-transform duration-700 group-hover:scale-[1.02]"
                priority
              />
            </div>

            {/* Right Column - 2 stacked images */}
            <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
              <div
                onClick={() =>
                  handleGalleryClick(
                    currentGalleryImages[3] || currentGalleryImages[2] || currentHeroImage,
                    3,
                  )
                }
                className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100 cursor-pointer select-none"
              >
                <Image
                  src={getOptimizedImageUrl(
                    currentGalleryImages[3] || currentGalleryImages[2] || currentHeroImage,
                    800,
                  )}
                  alt={`${pkgName} Gallery 3`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>
              <div
                onClick={() =>
                  handleGalleryClick(
                    currentGalleryImages[4] || currentGalleryImages[2] || currentHeroImage,
                    4,
                  )
                }
                className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100 cursor-pointer select-none"
              >
                <Image
                  src={getOptimizedImageUrl(
                    currentGalleryImages[4] || currentGalleryImages[2] || currentHeroImage,
                    800,
                  )}
                  alt={`${pkgName} Gallery 4`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>
            </div>
          </div>

          {/* Mobile horizontal gallery scrollbar */}
          <div className="flex lg:hidden gap-3 overflow-x-auto no-scrollbar py-2 mt-4 px-1">
            {currentGalleryImages.map((img, idx) => (
              <div
                key={idx}
                onClick={() => handleGalleryClick(img, idx)}
                className="relative w-52 h-36 shrink-0 overflow-hidden rounded-[1.5rem] bg-neutral-100 shadow-sm border border-neutral-100 cursor-pointer select-none"
              >
                <Image
                  src={getOptimizedImageUrl(img, 800)}
                  alt={`${pkgName} Mobile Gallery ${idx + 1}`}
                  fill
                  sizes="208px"
                  className="object-cover transition-transform duration-500 hover:scale-105"
                />
              </div>
            ))}
          </div>
        </section>

        {/* TWO COLUMN GRID CONTENT */}
        <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-12 lg:gap-16 items-start">
          {/* LEFT COLUMN: Info & Accordions */}
          <div className="flex flex-col">
            {/* Header Title */}
            <div className="mb-6">
              <div className="flex items-center gap-2.5 mb-3 font-sans text-xs md:text-sm font-medium">
                <span className="inline-block bg-white border border-neutral-300 text-neutral-800 font-semibold px-2.5 py-1 rounded-[8px] uppercase tracking-wider text-[10px]">
                  {packageData.isDomestic ? "Domestic" : "International"}
                </span>
                <span className="text-neutral-500 font-medium select-none">
                  • Trip Code: MI-{packageData.id.substring(0, 8).toUpperCase()}
                </span>
              </div>
              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground leading-tight tracking-tight font-display">
                {pkgName}
              </h1>
              <p className="text-neutral-600 font-sans text-xs md:text-sm font-semibold tracking-wide uppercase mt-1.5 leading-none">
                {activeVariant.label}
              </p>
            </div>

            {/* Hero Description (Marketing Pitch) */}
            {overviewParagraphs.pitch && (
              <div className="text-neutral-900 font-medium text-sm md:text-base leading-relaxed space-y-4 mb-8">
                <ExpandableText text={overviewParagraphs.pitch} maxLength={240} />
              </div>
            )}

            {/* Summary Metadata Bar */}
            <div className="border-y border-neutral-200 py-6 mb-10 grid grid-cols-2 md:grid-cols-4 gap-6 md:gap-8 font-sans">
              <div className="flex items-center gap-3">
                <Calendar className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-700 uppercase tracking-wider leading-none mb-1">
                    Duration
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-900 leading-snug">
                    {activeVariant.days} Days / {activeVariant.nights} Nights
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Users className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-700 uppercase tracking-wider leading-none mb-1">
                    Group Size
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-900 leading-snug">
                    Max {packageData.groupSizeMax || 12}, Avg {packageData.groupSizeAvg || 10}
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Compass className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-700 uppercase tracking-wider leading-none mb-1">
                    Tour Style
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-900 leading-snug">
                    {tourStyle}
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Building2 className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-700 uppercase tracking-wider leading-none mb-1">
                    Accommodation
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-900 leading-snug">
                    Hotels ({activeVariant.nights} nts)
                  </span>
                </div>
              </div>
            </div>

            {/* Trip Overview */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                Trip Overview
              </h2>
              <div className="text-neutral-900 font-medium text-sm md:text-base leading-relaxed space-y-4">
                <ExpandableText text={overviewParagraphs.detailed} maxLength={320} />
              </div>
            </div>

            {/* Detailed Day-by-Day Itinerary Layout */}
            {itinerary.length > 0 && (
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6 font-display">
                  Day-by-Day Itinerary
                </h2>

                <div className="flex flex-col gap-6 md:gap-8 items-stretch">
                  {/* Left-Rail Day Switchers */}
                  <div className="flex overflow-x-auto no-scrollbar gap-2.5 pb-2 select-none border-b border-neutral-100">
                    {itinerary.map((day) => (
                      <button
                        key={day.day}
                        onClick={() => setActiveItineraryDay(day.day)}
                        className={`px-5 py-3 rounded-full text-xs font-bold uppercase tracking-wider transition-all duration-300 shrink-0 border outline-none cursor-pointer ${
                          activeItineraryDay === day.day
                            ? "bg-brand text-white border-brand shadow-sm"
                            : "bg-white text-neutral-600 hover:text-neutral-900 hover:bg-neutral-50 border-neutral-200"
                        }`}
                      >
                        Day {day.day}
                      </button>
                    ))}
                  </div>

                  {/* Right-Rail Active Day Details Block */}
                  <div className="flex-1 font-sans">
                    <AnimatePresence mode="wait">
                      {itinerary
                        .filter((day) => day.day === activeItineraryDay)
                        .map((day) => (
                          <motion.div
                            key={day.day}
                            initial={{ opacity: 0, y: 15 }}
                            animate={{ opacity: 1, y: 0 }}
                            exit={{ opacity: 0, y: -15 }}
                            transition={{ duration: 0.25 }}
                            className="bg-neutral-50/50 border border-neutral-200/50 rounded-[2rem] p-6 sm:p-8"
                          >
                            <div className="flex flex-col gap-1.5 mb-6">
                              <span className="text-[10px] font-bold text-brand uppercase tracking-widest pl-0.5">
                                Day {day.day} Activity
                              </span>
                              <h3 className="text-lg md:text-xl font-bold text-foreground tracking-tight font-display">
                                {day.title}
                              </h3>
                            </div>
                            <p className="text-neutral-800 font-medium text-sm md:text-base leading-relaxed whitespace-pre-line mb-0">
                              {day.description}
                            </p>
                          </motion.div>
                        ))}
                    </AnimatePresence>
                  </div>
                </div>
              </div>
            )}

            {/* Tour Highlights */}
            {highlights && highlights.length > 0 && (
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4">
                  Tour Highlights
                </h2>
                <ul className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3.5 list-disc pl-5 text-neutral-900 font-medium text-sm md:text-base">
                  {highlights.map((highlight, idx) => (
                    <li key={idx} className="leading-relaxed">
                      {highlight}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {/* Inclusions & Exclusions Accordions */}
            <div className="mb-12 border-b border-border-light pb-10 space-y-4">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                Terms & Conditions
              </h2>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                {/* Inclusions Card */}
                <div className="bg-neutral-50/40 border border-neutral-100 rounded-[2rem] p-6 sm:p-8">
                  <h3 className="font-bold text-neutral-800 text-sm md:text-base mb-4 font-display">
                    Inclusions
                  </h3>
                  <ul className="space-y-3">
                    {inclusions.map((inc, idx) => (
                      <li key={idx} className="flex gap-2.5 items-start text-xs sm:text-sm">
                        <Check className="w-4 h-4 text-brand shrink-0 stroke-[2.5] mt-0.5" />
                        <span className="text-neutral-900 font-medium leading-relaxed">{inc}</span>
                      </li>
                    ))}
                  </ul>
                </div>

                {/* Exclusions Card */}
                <div className="bg-neutral-50/40 border border-neutral-100 rounded-[2rem] p-6 sm:p-8">
                  <h3 className="font-bold text-neutral-800 text-sm md:text-base mb-4 font-display">
                    Exclusions
                  </h3>
                  <ul className="space-y-3">
                    {exclusions.map((exc, idx) => (
                      <li key={idx} className="flex gap-2.5 items-start text-xs sm:text-sm">
                        <X className="w-4 h-4 text-neutral-400 shrink-0 stroke-[2.5] mt-0.5" />
                        <span className="text-neutral-900 font-medium leading-relaxed">{exc}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            </div>

            {/* Interactive Route Map */}
            {mapMarkers.length > 0 && (
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                  Where you&apos;ll be
                </h2>
                <div className="w-full h-[350px] md:h-[450px] rounded-[2.5rem] overflow-hidden border border-border-light shadow-sm bg-neutral-50">
                  <PackageMap markers={mapMarkers} />
                </div>
              </div>
            )}

            {/* Mobile Custom Itinerary Banner (Flat/Inline layout) */}
            <div className="lg:hidden my-8 flex flex-col gap-2 font-sans">
              <div className="flex items-center gap-2">
                <HelpCircle className="w-5 h-5 text-brand shrink-0" />
                <h4 className="font-bold text-foreground text-sm">Need Custom Itinerary?</h4>
              </div>
              <p className="text-xs text-neutral-600 font-medium leading-relaxed">
                Let our travel specialists design a tailored package just for you.
              </p>
              <Link
                href="/contact"
                className="inline-flex items-center justify-center gap-2 border border-neutral-900 text-neutral-900 hover:bg-neutral-900 hover:text-white font-semibold text-xs uppercase tracking-wider py-3.5 px-5 rounded-full transition-all duration-300 cursor-pointer select-none mt-1 w-fit"
              >
                Contact Us
              </Link>
            </div>
          </div>

          {/* RIGHT COLUMN: Sticky booking trigger (Desktop Only) */}
          <aside className="hidden lg:flex lg:sticky lg:top-28 z-10 flex-col font-sans">
            <div className="py-2 space-y-6">
              {/* Tour Route Path */}
              {activeVariant.destinations.length > 0 && (
                <div className="pb-4 border-b border-neutral-200/80">
                  <span className="text-[10px] font-bold uppercase tracking-wider text-neutral-600 block mb-2.5">
                    Tour Route
                  </span>
                  <div className="flex flex-wrap items-center gap-y-2 gap-x-1">
                    {activeVariant.destinations.map((dest, idx) => (
                      <div key={dest.destinationId} className="flex items-center gap-1">
                        <span className="bg-neutral-100 text-[11px] font-bold text-neutral-800 px-2.5 py-1 rounded-full whitespace-nowrap">
                          {dest.destinationName}
                        </span>
                        {idx < activeVariant.destinations.length - 1 && (
                          <ChevronRight className="w-3.5 h-3.5 text-neutral-400 shrink-0" />
                        )}
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Price & Inclusions */}
              <div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-neutral-600 block mb-1.5">
                  Pricing Overview
                </span>
                <div className="flex items-baseline gap-2 mb-4">
                  <span className="text-2xl md:text-3xl font-black text-foreground font-display leading-none">
                    Price On Request
                  </span>
                </div>

                <div className="border-t border-b border-neutral-200/80 py-4 space-y-3">
                  <div className="flex items-center gap-3">
                    <Check className="w-4 h-4 text-neutral-500 shrink-0" />
                    <span className="text-xs font-semibold text-neutral-700">
                      Premium Stays Included
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <MapPin className="w-4 h-4 text-neutral-500 shrink-0" />
                    <span className="text-xs font-semibold text-neutral-700">
                      Sightseeing by Private AC Vehicle
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <Users className="w-4 h-4 text-neutral-500 shrink-0" />
                    <span className="text-xs font-semibold text-neutral-700">
                      24/7 Ground Tour Coordinator
                    </span>
                  </div>
                </div>
              </div>

              {/* Book Now button routing directly to nested booking page */}
              <Link
                href={`/packages/${packageData.slug}/${activeVariant.slug}/book`}
                className="hidden lg:block w-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs tracking-wider uppercase py-4 rounded-full transition-all duration-300 shadow-md hover:shadow-lg cursor-pointer text-center select-none border-none outline-none active:scale-98"
              >
                Book Now
              </Link>

              {/* Need Custom Itinerary - Seamless Inline Integration */}
              <div className="pt-6 border-t border-neutral-200/80 flex flex-col gap-2">
                <div className="flex items-center gap-2">
                  <HelpCircle className="w-4 h-4 text-neutral-500 shrink-0" />
                  <h4 className="font-bold text-foreground text-sm">Need Custom Itinerary?</h4>
                </div>
                <p className="text-xs text-neutral-600 font-medium leading-relaxed">
                  Let our travel specialists design a tailored package just for you.
                </p>
                <Link
                  href="/contact"
                  className="inline-flex items-center justify-center gap-2 border border-neutral-900 text-neutral-900 hover:bg-neutral-900 hover:text-white font-semibold text-xs uppercase tracking-wider py-3.5 px-5 rounded-full transition-all duration-300 cursor-pointer select-none mt-2 text-center"
                >
                  Contact Us
                </Link>
              </div>
            </div>
          </aside>
        </div>

        {/* RECOMMENDED PACKAGES SECTION */}
        <section className="mt-24 border-t border-border-light pt-24">
          <SectionHeader
            title="Recommended for you"
            badge="Explore More"
            mobileLayout="row"
            rightSlot={
              <Link
                href="/packages"
                className="group inline-flex items-center gap-1.5 text-neutral-900 hover:text-brand font-semibold text-sm transition-colors cursor-pointer"
              >
                View all tours
                <ChevronRight className="w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
              </Link>
            }
          />

          <div className="flex overflow-x-auto gap-4 sm:gap-8 snap-x snap-mandatory no-scrollbar pb-4 sm:pb-0 sm:grid sm:grid-cols-2 lg:grid-cols-3">
            {recommendedPackages.map((pkg) => {
              const defaultVariant = pkg.variants.find((v) => v.isDefault) || pkg.variants[0];
              return (
                <div key={pkg.id} className="w-[280px] sm:w-auto shrink-0 snap-start">
                  <PackageCard
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    heroImage={pkg.heroImage}
                    durationText={defaultVariant ? defaultVariant.label : undefined}
                    destinations={pkg.destinations}
                    variant="white"
                    isFavorite={isFavorite(pkg.slug)}
                    onToggleFavorite={toggleFavorite}
                  />
                </div>
              );
            })}
          </div>
        </section>
      </div>
    </PageShell>
  );
}
