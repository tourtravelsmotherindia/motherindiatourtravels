"use client";

import { Building2, ChevronRight, Clock, Compass, MapPin, Users } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useMemo } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";
import { type CompanyData } from "@/types/company";
import { type PackageDetailItem, type PackageItem } from "@/types/package";

interface PackageOverviewClientProps {
  packageData: PackageDetailItem;
  allPackages: PackageItem[];
  companyData: CompanyData | null;
}

// Gallery image resolver helper
function getGalleryImages(pkgName: string, heroImage?: string): string[] {
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

  const images = [...pool];
  if (heroImage && heroImage.trim() !== "") {
    images[2] = heroImage;
  }
  return images;
}

const DEFAULT_OVERVIEW =
  "Discover the beauty and charm of this incredible destination with our carefully curated tour package. Mother India Tour Travels provides premium AC vehicles, professional local guides, and hand-picked accommodations to make your holiday seamless, comfortable, and unforgettable.";

const DEFAULT_HIGHLIGHTS = [
  "Comprehensive sightseeing in comfortable AC vehicles",
  "Handpicked premium accommodations with breakfast",
  "Professional local guides at major monuments",
  "Seamless airport/railway station transfers",
  "24/7 on-tour customer support",
];

export default function PackageOverviewClient({
  packageData,
  allPackages,
  companyData,
}: PackageOverviewClientProps) {
  const pkgName = packageData.name || "Tour Package";
  const overviewText = packageData.overview || DEFAULT_OVERVIEW;
  const highlights =
    packageData.highlights && packageData.highlights.length > 0
      ? packageData.highlights
      : DEFAULT_HIGHLIGHTS;

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

  const breadcrumbItems = [
    { label: "Home", href: "/" },
    { label: "Packages", href: "/packages" },
    { label: pkgName },
  ];

  const defaultVariant = packageData.variants.find((v) => v.isDefault) || packageData.variants[0];

  // Fallbacks: default variant takes priority for landing overview if defined
  const heroImage = defaultVariant?.heroImage || packageData.heroImage;
  const galleryImages = useMemo(() => {
    if (defaultVariant?.galleryImages && defaultVariant.galleryImages.length > 0) {
      return defaultVariant.galleryImages;
    }
    return getGalleryImages(pkgName, packageData.heroImage);
  }, [pkgName, packageData.heroImage, defaultVariant]);

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

  // Unified destination union list for package overview sidebar
  const uniqueDestinations = useMemo(() => {
    const map = new Map<string, { id: string; name: string }>();
    packageData.variants.forEach((v) => {
      v.destinations.forEach((d) => {
        map.set(d.destinationId, { id: d.destinationId, name: d.destinationName });
      });
    });
    return Array.from(map.values());
  }, [packageData.variants]);

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
          {/* LEFT COLUMN: Info & Options */}
          <div className="flex flex-col">
            {/* Header Title */}
            <div className="mb-6">
              <div className="flex items-center gap-2.5 mb-3 font-sans text-xs md:text-sm font-medium">
                <span className="inline-block bg-white border border-neutral-300 text-neutral-800 font-semibold px-2.5 py-1 rounded-[8px] uppercase tracking-wider text-[10px]">
                  {packageData.isDomestic ? "Domestic" : "International"}
                </span>
                <span className="text-neutral-500 font-medium select-none">
                  • Trip Code: MI-{packageData.id.toUpperCase().replace(/-/g, "")}
                </span>
              </div>
              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground leading-tight tracking-tight font-display">
                {pkgName}
              </h1>
            </div>

            {/* Hero Description (Marketing Pitch) */}
            {overviewParagraphs.pitch && (
              <div className="text-neutral-900 font-medium text-sm md:text-base leading-relaxed space-y-4 mb-8">
                <p className="whitespace-pre-line">{overviewParagraphs.pitch}</p>
              </div>
            )}

            {/* Summary Metadata Bar */}
            <div className="border-y border-neutral-200 py-6 mb-10 flex flex-wrap items-center justify-between gap-6 md:gap-8 font-sans">
              <div className="flex items-center gap-3">
                <MapPin className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-600 uppercase tracking-wider leading-none mb-1">
                    Destinations
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                    {uniqueDestinations.length} Places Covered
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Users className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-600 uppercase tracking-wider leading-none mb-1">
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
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-600 uppercase tracking-wider leading-none mb-1">
                    Tour Style
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                    {packageData.tourStyle}
                  </span>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <Building2 className="w-5 h-5 text-neutral-800 shrink-0" />
                <div className="flex flex-col">
                  <span className="text-[10px] md:text-[11px] font-medium text-neutral-600 uppercase tracking-wider leading-none mb-1">
                    Accommodation
                  </span>
                  <span className="text-xs md:text-sm font-bold text-neutral-800 leading-snug">
                    {packageData.stayType || "Premium Hotels"}
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
                <p className="whitespace-pre-line">{overviewParagraphs.detailed}</p>
              </div>
            </div>

            {/* Choose Option Grid */}
            <div className="mb-12 border-b border-border-light pb-10">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-xl md:text-2xl font-bold text-foreground font-display">
                  Select Tour
                </h2>
                <span className="text-xs font-semibold uppercase tracking-wider text-neutral-600">
                  Choose duration to see itinerary
                </span>
              </div>

              <div className="flex overflow-x-auto gap-4 sm:gap-6 snap-x snap-mandatory no-scrollbar pb-4 sm:pb-0 sm:grid sm:grid-cols-2">
                {packageData.variants.map((v) => {
                  const destNames = v.destinations.map((d) => d.destinationName).join(", ");
                  return (
                    <Link
                      key={v.id}
                      href={`/packages/${packageData.slug}/${v.slug}`}
                      className="group relative bg-neutral-50 hover:bg-neutral-100/80 border-0 rounded-[2rem] p-6 shadow-sm transition-all duration-300 flex flex-col justify-between cursor-pointer w-[280px] sm:w-auto shrink-0 snap-start"
                    >
                      <div>
                        <div className="flex items-center justify-between mb-4">
                          <span className="text-xs font-bold text-neutral-600 uppercase tracking-wider flex items-center gap-1.5 font-sans">
                            <Clock className="w-3.5 h-3.5" />
                            {v.nights} Nights / {v.days} Days
                          </span>
                        </div>

                        <h3 className="text-lg font-bold text-foreground tracking-tight font-display">
                          {v.label}
                        </h3>

                        {destNames && (
                          <p className="text-xs text-neutral-600 font-medium leading-relaxed mt-2.5 font-sans">
                            Covers:{" "}
                            <span className="text-neutral-700 font-semibold">{destNames}</span>
                          </p>
                        )}
                      </div>

                      <div className="mt-6 flex items-center justify-between text-xs font-bold uppercase tracking-wider text-neutral-900 font-sans">
                        <span>View Full Itinerary</span>
                        <ChevronRight className="w-4 h-4 transform group-hover:translate-x-1 transition-transform duration-300" />
                      </div>
                    </Link>
                  );
                })}
              </div>
            </div>

            {/* Tour Highlights (Restored original bullet style list) */}
            {highlights && highlights.length > 0 && (
              <div className="mb-12">
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
          </div>

          {/* RIGHT COLUMN: Sticky summary of route */}
          <aside className="lg:sticky lg:top-28 z-10 flex flex-col gap-6 font-sans">
            <div className="py-2 animate-fade-in">
              <div className="flex items-center justify-between mb-6 pb-3 border-b border-neutral-200/80">
                <h3 className="font-bold text-base md:text-lg text-foreground tracking-tight font-display flex items-center gap-2">
                  <MapPin className="w-4 h-4 text-neutral-500" />
                  Destinations Covered
                </h3>
                <span className="text-[11px] font-bold uppercase tracking-wider text-neutral-500 bg-neutral-100 px-2.5 py-0.5 rounded-full">
                  {uniqueDestinations.length} Stops
                </span>
              </div>

              <div className="relative pl-4 space-y-5 border-l border-neutral-200">
                {uniqueDestinations.map((dest, idx) => (
                  <div key={dest.id} className="relative flex items-center justify-between group">
                    {/* Timeline Dot */}
                    <div className="absolute -left-[21px] top-1/2 -translate-y-1/2 w-2.5 h-2.5 rounded-full bg-neutral-300 border-2 border-white group-hover:bg-brand transition-colors" />

                    <div className="flex items-center gap-3">
                      <span className="text-xs font-semibold text-neutral-500 font-mono">
                        {String(idx + 1).padStart(2, "0")}
                      </span>
                      <span className="text-sm font-semibold text-foreground group-hover:text-brand transition-colors leading-snug">
                        {dest.name}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
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

          <div className="flex overflow-x-auto gap-4 sm:gap-8 snap-x snap-mandatory no-scrollbar pb-4 sm:pb-0 sm:grid sm:grid-cols-2 lg:grid-cols-3">
            {recommendedPackages.map((pkg) => {
              return (
                <div key={pkg.id} className="w-[280px] sm:w-auto shrink-0 snap-start">
                  <PackageCard
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    heroImage={pkg.heroImage}
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
