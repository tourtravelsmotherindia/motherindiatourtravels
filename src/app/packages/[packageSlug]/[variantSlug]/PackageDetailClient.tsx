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
        <Sparkles className="w-8 h-8 text-neutral-300 mx-auto mb-2 animate-bounce" />
        <p className="text-xs font-semibold text-neutral-400 uppercase tracking-wider">
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

  // Images fallback logic: variant level takes priority independently per field
  const heroImage = activeVariant.heroImage || packageData.heroImage;
  const galleryImages = useMemo(() => {
    if (activeVariant.galleryImages && activeVariant.galleryImages.length > 0) {
      return activeVariant.galleryImages;
    }
    return packageData.galleryImages;
  }, [packageData.galleryImages, activeVariant.galleryImages]);

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
        <section className="mb-12 animate-fade-in">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 h-[300px] md:h-[450px] lg:h-[550px]">
            {/* Left Column - 2 stacked images */}
            <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
              <div className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                <Image
                  src={getOptimizedImageUrl(galleryImages[0] || heroImage, 800)}
                  alt={`${pkgName} Gallery 1`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover"
                />
              </div>
              <div className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                <Image
                  src={getOptimizedImageUrl(galleryImages[1] || heroImage, 800)}
                  alt={`${pkgName} Gallery 2`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover"
                />
              </div>
            </div>

            {/* Center Column - 1 huge main image */}
            <div className="relative col-span-12 lg:col-span-6 h-full overflow-hidden rounded-[2rem] lg:rounded-[2.5rem] bg-neutral-100 group shadow-sm border border-neutral-100">
              <Image
                src={getOptimizedImageUrl(heroImage, 1200)}
                alt={`${pkgName} Main Gallery`}
                fill
                sizes="(max-width: 1024px) 100vw, 50vw"
                className="object-cover"
                priority
              />
            </div>

            {/* Right Column - 2 stacked images */}
            <div className="hidden lg:flex flex-col gap-4 col-span-3 h-full">
              <div className="relative flex-[2] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                <Image
                  src={getOptimizedImageUrl(galleryImages[3] || galleryImages[2] || heroImage, 800)}
                  alt={`${pkgName} Gallery 3`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover"
                />
              </div>
              <div className="relative flex-[3] overflow-hidden rounded-[1.5rem] bg-neutral-100 group border border-neutral-100">
                <Image
                  src={getOptimizedImageUrl(galleryImages[4] || galleryImages[2] || heroImage, 800)}
                  alt={`${pkgName} Gallery 4`}
                  fill
                  sizes="(max-width: 1024px) 25vw, 15vw"
                  className="object-cover"
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
                  src={getOptimizedImageUrl(img, 800)}
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
          {/* LEFT COLUMN: Info & Itinerary */}
          <div className="flex flex-col">
            {/* Header Title */}
            <div className="mb-6">
              <div className="flex items-center gap-2.5 mb-3 font-sans text-xs md:text-sm font-medium">
                <span className="inline-block bg-white border border-neutral-200 text-neutral-700 font-semibold px-2.5 py-1 rounded-[8px] uppercase tracking-wider text-[10px]">
                  {packageData.isDomestic ? "Domestic" : "International"}
                </span>
                <span className="text-neutral-400 font-medium select-none">
                  • Trip Code: MI-{packageData.id.toUpperCase().replace(/-/g, "")}
                </span>
              </div>
              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground leading-tight tracking-tight font-display">
                {pkgName}
              </h1>
              <p className="text-neutral-500 font-sans text-xs md:text-sm font-semibold tracking-wide uppercase mt-1.5 leading-none">
                {activeVariant.label}
              </p>
            </div>

            {/* Hero Description (Marketing Pitch) */}
            {overviewParagraphs.pitch && (
              <div className="text-neutral-800 font-medium text-sm md:text-base leading-relaxed space-y-4 mb-8">
                <p className="whitespace-pre-line">{overviewParagraphs.pitch}</p>
              </div>
            )}

            {/* Summary Metadata Bar */}
            <div className="border-y border-neutral-200 py-6 mb-10 flex flex-wrap items-center justify-between gap-6 md:gap-8 font-sans">
              <div className="flex items-center gap-3">
                <Calendar className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                    Duration
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                    {activeVariant.days} Days / {activeVariant.nights} Nights
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Users className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-400 uppercase tracking-wider leading-none mb-1">
                    Group Size
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                    Max {packageData.groupSizeMax || 12}, Avg {packageData.groupSizeAvg || 10}
                  </span>
                </div>
              </div>

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

            {/* Trip Overview */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                Trip Overview
              </h2>
              <div className="text-neutral-800 font-medium text-sm md:text-base leading-relaxed space-y-4">
                <p className="whitespace-pre-line">{overviewParagraphs.detailed}</p>
              </div>
            </div>

            {/* Tour Highlights (Restored original bullet style list) */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4">
                Tour Highlights
              </h2>
              <ul className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3.5 list-disc pl-5 text-neutral-800 font-medium text-sm md:text-base">
                {highlights.map((highlight, idx) => (
                  <li key={idx} className="leading-relaxed">
                    {highlight}
                  </li>
                ))}
              </ul>
            </div>

            {/* What's Included (Restored original rounded check style) */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6">
                What&apos;s Included
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {inclusions.map((inc, idx) => (
                  <div key={idx} className="flex gap-3">
                    <div className="w-5 h-5 rounded-full bg-neutral-100 flex items-center justify-center shrink-0 mt-0.5">
                      <Check className="w-3.5 h-3.5 text-neutral-500" />
                    </div>
                    <span className="text-neutral-800 font-medium text-sm leading-snug">{inc}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* What's Excluded (Restored original rounded X style) */}
            <div className="mb-12 border-b border-border-light pb-10">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6">Exclusions</h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {exclusions.map((exc, idx) => (
                  <div key={idx} className="flex gap-3">
                    <div className="w-5 h-5 rounded-full bg-neutral-100/50 flex items-center justify-center shrink-0 mt-0.5">
                      <X className="w-3.5 h-3.5 text-neutral-400" />
                    </div>
                    <span className="text-neutral-800 font-medium text-sm leading-snug">{exc}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* Important Notes (Restored original bullet style list) */}
            {packageData.notes && packageData.notes.length > 0 && (
              <div className="mb-12 border-b border-border-light pb-10">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6">
                  Important Notes
                </h2>
                <ul className="flex flex-col gap-3.5 pl-5 list-disc text-neutral-800 font-medium text-sm md:text-base">
                  {packageData.notes.map((item, idx) => (
                    <li key={idx} className="leading-relaxed">
                      {item}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {/* Daily Itinerary Section (Restored original vertical timeline style) */}
            <div className="mb-12 border-b border-border-light pb-10">
              <div className="flex items-center justify-between mb-8">
                <h2 className="text-xl md:text-2xl font-bold text-foreground">Itinerary</h2>
                <span className="text-xs md:text-sm font-bold text-neutral-400 uppercase tracking-wider font-sans">
                  {activeVariant.days} Days / {activeVariant.nights} Nights
                </span>
              </div>

              <div className="relative pl-8 border-l border-neutral-200/80 ml-4 space-y-12 py-2">
                {itinerary.map((day, idx) => {
                  const isExpanded = activeItineraryDay === day.day;
                  // Deterministic timeline fallback images if day images list is empty
                  const dayImages =
                    day.images && day.images.length > 0
                      ? day.images
                      : [
                          "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=400&q=80",
                          "https://images.unsplash.com/photo-1480796927426-f609979314bd?auto=format&fit=crop&w=400&q=80",
                          "https://images.unsplash.com/photo-1503899036084-c55cdd92da26?auto=format&fit=crop&w=400&q=80",
                        ];

                  return (
                    <div key={idx} className="relative group">
                      {/* Timeline dot */}
                      <div className="absolute -left-[38px] top-1.5 w-3 h-3 rounded-full border-2 border-neutral-400 bg-white z-10 group-hover:border-brand transition-colors duration-300" />

                      {/* Accordion Header */}
                      <div
                        onClick={() => setActiveItineraryDay(isExpanded ? null : day.day)}
                        className="flex items-start justify-between gap-4 cursor-pointer select-none"
                      >
                        <div className="flex flex-col items-start gap-1">
                          <span className="inline-block bg-neutral-100 text-neutral-600 font-semibold text-[11px] uppercase tracking-wider px-2.5 py-1 rounded-[10px]">
                            Day {day.day}
                          </span>
                          <h3 className="font-bold text-lg md:text-xl text-foreground font-display mt-1.5 leading-snug">
                            {day.title}
                          </h3>
                        </div>

                        <div className="w-8 h-8 rounded-full border border-neutral-200 flex items-center justify-center text-neutral-400 group-hover:text-brand group-hover:border-brand/40 transition-colors shrink-0 mt-1">
                          <ChevronDown
                            className={`w-4 h-4 transition-transform duration-300 ${isExpanded ? "rotate-180" : ""}`}
                          />
                        </div>
                      </div>

                      {/* Description */}
                      <p
                        className={`text-neutral-800 font-medium text-sm md:text-[14px] leading-relaxed mt-3.5 whitespace-pre-line pr-4 transition-all duration-300 ${
                          isExpanded ? "" : "line-clamp-3"
                        }`}
                      >
                        {day.description}
                      </p>

                      {/* Expanded day images */}
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
                              {dayImages.slice(0, 3).map((img, i) => (
                                <div
                                  key={i}
                                  className="relative aspect-[4/3] rounded-[1.5rem] overflow-hidden bg-neutral-100 shadow-sm border border-neutral-100 group/img"
                                >
                                  <Image
                                    src={getOptimizedImageUrl(img, 600)}
                                    alt={`Itinerary Day ${day.day} Image ${i + 1}`}
                                    fill
                                    sizes="(max-width: 768px) 33vw, 20vw"
                                    className="object-cover"
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

            {/* Where you'll be Section (Map) */}
            {mapMarkers.length > 0 && (
              <div className="mb-12">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                  Where you&apos;ll be
                </h2>
                <div className="w-full h-[350px] md:h-[450px] rounded-[2.5rem] overflow-hidden border border-border-light shadow-sm bg-neutral-50">
                  <PackageMap markers={mapMarkers} />
                </div>
              </div>
            )}
          </div>

          {/* RIGHT COLUMN: Sticky booking trigger */}
          <aside className="lg:sticky lg:top-28 z-10 flex flex-col gap-6">
            <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
              <div className="mb-6">
                {/* Route Path (UX Optimized) */}
                {activeVariant.destinations.length > 0 && (
                  <div className="mt-3">
                    <span className="text-[10px] font-bold uppercase tracking-wider text-neutral-400 block mb-2.5">
                      Tour Route
                    </span>
                    <div className="flex flex-wrap items-center gap-y-2 gap-x-1">
                      {activeVariant.destinations.map((dest, idx) => (
                        <div key={dest.destinationId} className="flex items-center gap-1">
                          <span className="bg-neutral-50 text-[11px] font-bold text-neutral-700 border border-neutral-200/80 px-2.5 py-1 rounded-full whitespace-nowrap shadow-xs">
                            {dest.destinationName}
                          </span>
                          {idx < activeVariant.destinations.length - 1 && (
                            <ChevronRight className="w-3.5 h-3.5 text-neutral-300 shrink-0" />
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>

              {/* Pricing hidden - shown as Price On Request */}
              <div className="mb-6 flex items-baseline gap-2">
                <span className="text-3xl font-black text-foreground font-display leading-none">
                  Price On Request
                </span>
              </div>

              <div className="border-t border-b border-border-light py-5 mb-6 space-y-3.5">
                <div className="flex items-center gap-3">
                  <Check className="w-4 h-4 text-neutral-400 shrink-0" />
                  <span className="text-xs font-medium text-neutral-500">
                    Premium Stays Included
                  </span>
                </div>
                <div className="flex items-center gap-3">
                  <MapPin className="w-4 h-4 text-neutral-400 shrink-0" />
                  <span className="text-xs font-medium text-neutral-500">
                    Sightseeing by Private AC Vehicle
                  </span>
                </div>
                <div className="flex items-center gap-3">
                  <Users className="w-4 h-4 text-neutral-400 shrink-0" />
                  <span className="text-xs font-medium text-neutral-500">
                    24/7 Ground Tour Coordinator
                  </span>
                </div>
              </div>

              {/* Book Now button routing directly to nested booking page */}
              <Link
                href={`/packages/${packageData.slug}/${activeVariant.slug}/book`}
                className="block w-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs tracking-wider uppercase py-4 rounded-full transition-all duration-300 shadow-md hover:shadow-lg cursor-pointer text-center select-none border-none outline-none mt-2 active:scale-98"
              >
                Book Now
              </Link>
            </div>

            <div className="bg-neutral-50/50 border border-border-light rounded-[2rem] p-6 text-center">
              <HelpCircle className="w-6 h-6 text-neutral-400 mx-auto mb-3" />
              <h4 className="font-bold text-foreground text-base mb-2">Need Custom Itinerary?</h4>
              <p className="text-xs text-neutral-500 font-medium leading-relaxed mb-4">
                Let our travel specialists design a tailored package just for you.
              </p>
              {companyData?.whatsappNumber && (
                <a
                  href={`https://wa.me/${companyData.whatsappNumber}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 border border-neutral-900 text-neutral-900 hover:bg-neutral-900 hover:text-white font-semibold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer select-none"
                >
                  WhatsApp Specialists
                </a>
              )}
            </div>
          </aside>
        </div>
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
            {recommendedPackages.map((pkg) => {
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
                />
              );
            })}
          </div>
        </section>
      </div>
    </PageShell>
  );
}
