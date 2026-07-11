"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Building2,
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
import React, { useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import { type CompanyData } from "@/types/company";
import { type PackageDetailItem, type PackageVariantDetail } from "@/types/package";

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
  activeVariant: PackageVariantDetail;
  companyData: CompanyData | null;
}

export default function PackageDetailClient({
  packageData,
  activeVariant,
  companyData,
}: PackageDetailClientProps) {
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

  const itinerary = activeVariant.itinerary || [];

  const [activeItineraryDay, setActiveItineraryDay] = useState<number | null>(() => {
    return itinerary.length > 0 ? itinerary[0].day : null;
  });

  const mapMarkers = useMemo(() => {
    // Collect coordinates from package attractions or destinations
    const list =
      (packageData.attractions || []).length > 0
        ? packageData.attractions
            .filter((attr) => attr.latitude && attr.longitude)
            .map((attr) => ({
              name: attr.attractionName,
              latitude: attr.latitude!,
              longitude: attr.longitude!,
            }))
        : packageData.destinations
            .filter((dest) => dest.latitude && dest.longitude)
            .map((dest) => ({
              name: dest.destinationName,
              latitude: dest.latitude!,
              longitude: dest.longitude!,
            }));
    return list;
  }, [packageData]);

  const breadcrumbItems = [
    { label: "Home", href: "/" },
    { label: "Packages", href: "/packages" },
    { label: pkgName, href: `/packages/${packageData.slug}` },
    { label: activeVariant.label, href: `/packages/${packageData.slug}/${activeVariant.slug}` },
  ];

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      {/* Hero Banner Section */}
      <section className="relative w-full h-[40dvh] md:h-[50dvh] min-h-[300px] overflow-hidden bg-neutral-900">
        <Image
          src={packageData.heroImage || "/images/placeholder-landscape.png"}
          alt={pkgName}
          fill
          priority
          className="object-cover object-center"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-black/20 pointer-events-none" />
        <div className="absolute inset-0 flex items-end pb-12 layout-container">
          <div className="max-w-4xl text-left text-white z-10">
            <span className="inline-block text-brand-light font-bold tracking-[0.25em] text-[10px] uppercase bg-white/10 backdrop-blur-md px-4 py-2 rounded-full border border-white/15 mb-4">
              {packageData.tourStyle} Tour
            </span>
            <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-extrabold tracking-tight font-display">
              {pkgName}
            </h1>
            <p className="text-white/80 mt-3 text-sm sm:text-base font-medium max-w-xl">
              {activeVariant.label} Choice
            </p>
          </div>
        </div>
      </section>

      {/* Main Content Layout */}
      <div className="layout-container py-12">
        <Breadcrumbs items={breadcrumbItems} className="mb-10" />

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
          {/* LEFT 2 COLUMNS: Info & Itinerary */}
          <div className="lg:col-span-2">
            {/* Key details strip */}
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-6 bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 mb-10 shadow-sm">
              <div className="flex items-center gap-3">
                <Clock className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Duration
                  </p>
                  <p className="text-sm font-bold text-foreground">{activeVariant.days} Days</p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <Building2 className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Stays
                  </p>
                  <p className="text-sm font-bold text-foreground truncate max-w-[120px]">
                    {packageData.stayType}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <Users className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Group Size
                  </p>
                  <p className="text-sm font-bold text-foreground">
                    Max {packageData.groupSizeMax}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <Compass className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Style
                  </p>
                  <p className="text-sm font-bold text-foreground">{packageData.tourStyle}</p>
                </div>
              </div>
            </div>

            {/* Overview */}
            <div className="mb-12">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                About the Journey
              </h2>
              <p className="text-neutral-600 text-sm md:text-base leading-relaxed font-medium whitespace-pre-line">
                {overviewText}
              </p>
            </div>

            {/* Highlights */}
            <div className="mb-12">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-5 font-display">
                Tour Highlights
              </h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {highlights.map((h, i) => (
                  <div key={i} className="flex items-start gap-3">
                    <span className="w-5 h-5 rounded-full bg-brand/10 text-brand flex items-center justify-center shrink-0 mt-0.5">
                      <Check className="w-3 h-3 stroke-[3px]" />
                    </span>
                    <p className="text-sm font-medium text-neutral-600 leading-relaxed">{h}</p>
                  </div>
                ))}
              </div>
            </div>

            {/* Daily Itinerary Accordions */}
            <div className="mb-12">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-6 font-display">
                Day-by-Day Itinerary
              </h2>

              <div className="flex flex-col gap-4">
                {itinerary.map((day) => {
                  const isOpen = activeItineraryDay === day.day;
                  return (
                    <div
                      key={day.id}
                      className="bg-white border border-neutral-100 rounded-[2rem] shadow-sm overflow-hidden"
                    >
                      <button
                        onClick={() => setActiveItineraryDay(isOpen ? null : day.day)}
                        className="w-full px-6 py-5 flex items-center justify-between text-left cursor-pointer group"
                      >
                        <div className="flex items-center gap-4">
                          <span
                            className={`w-10 h-10 rounded-full flex items-center justify-center font-bold text-sm transition-all duration-300 ${
                              isOpen ? "bg-brand text-white" : "bg-neutral-50 text-neutral-600"
                            }`}
                          >
                            {day.day}
                          </span>
                          <span className="font-bold text-sm md:text-base text-neutral-800 group-hover:text-brand transition-colors">
                            {day.title}
                          </span>
                        </div>
                        <span className="text-neutral-400 shrink-0">
                          <ChevronDown
                            className={`w-5 h-5 transition-transform duration-300 ${isOpen ? "rotate-180" : ""}`}
                          />
                        </span>
                      </button>

                      <AnimatePresence initial={false}>
                        {isOpen && (
                          <motion.div
                            initial={{ height: 0 }}
                            animate={{ height: "auto" }}
                            exit={{ height: 0 }}
                            transition={{ duration: 0.25, ease: "easeInOut" }}
                            className="overflow-hidden"
                          >
                            <div className="px-6 pb-6 pt-2 border-t border-neutral-50 text-sm text-neutral-500 leading-relaxed font-medium">
                              <p className="mb-6 whitespace-pre-line">{day.description}</p>

                              {/* Daily images */}
                              {day.images && day.images.length > 0 && (
                                <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
                                  {day.images.map((img, i) => (
                                    <div
                                      key={i}
                                      className="relative aspect-[4/3] rounded-[1.5rem] overflow-hidden bg-neutral-50 border border-neutral-100 group/img"
                                    >
                                      <Image
                                        src={img}
                                        alt={`Day ${day.day} Image ${i + 1}`}
                                        fill
                                        sizes="(max-width: 768px) 33vw, 20vw"
                                        className="object-cover transition-transform duration-500 group-hover/img:scale-105"
                                      />
                                    </div>
                                  ))}
                                </div>
                              )}
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

            {/* Inclusions / Exclusions */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
              <div className="bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 shadow-sm">
                <h3 className="font-bold text-base text-foreground mb-4 font-display">
                  Inclusions
                </h3>
                <ul className="space-y-3">
                  {inclusions.map((inc, i) => (
                    <li
                      key={i}
                      className="flex items-start gap-2.5 text-xs text-neutral-600 font-medium leading-relaxed"
                    >
                      <Check className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                      <span>{inc}</span>
                    </li>
                  ))}
                </ul>
              </div>
              <div className="bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 shadow-sm">
                <h3 className="font-bold text-base text-foreground mb-4 font-display">
                  Exclusions
                </h3>
                <ul className="space-y-3">
                  {exclusions.map((exc, i) => (
                    <li
                      key={i}
                      className="flex items-start gap-2.5 text-xs text-neutral-600 font-medium leading-relaxed"
                    >
                      <X className="w-4 h-4 text-rose-500 shrink-0 mt-0.5" />
                      <span>{exc}</span>
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          </div>

          {/* RIGHT COLUMN: Sticky booking trigger */}
          <aside className="lg:sticky lg:top-28 z-10 flex flex-col gap-6">
            <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
              <div className="mb-6">
                <div className="flex items-center gap-1.5 text-neutral-400 text-xs font-bold uppercase tracking-wider mb-2">
                  <Clock className="w-3.5 h-3.5" />
                  <span>{activeVariant.label}</span>
                </div>
                <div className="font-bold text-foreground text-sm flex flex-wrap items-center gap-1.5 leading-snug">
                  {packageData.destinations.map((dest, idx) => (
                    <React.Fragment key={dest.destinationId}>
                      {idx > 0 && <ChevronRight className="w-3 h-3 text-neutral-300 shrink-0" />}
                      <span className="text-foreground">{dest.destinationName}</span>
                    </React.Fragment>
                  ))}
                </div>
              </div>

              {activeVariant.discountedPrice || activeVariant.basePrice ? (
                <div className="mb-6 flex items-baseline gap-2">
                  <span className="text-3xl font-black text-foreground">
                    ₹{activeVariant.discountedPrice || activeVariant.basePrice}
                  </span>
                  {activeVariant.discountedPrice && (
                    <span className="text-sm text-neutral-400 line-through">
                      ₹{activeVariant.basePrice}
                    </span>
                  )}
                  <span className="text-[10px] text-neutral-500 font-bold tracking-wider uppercase ml-1">
                    Per Person
                  </span>
                </div>
              ) : null}

              <div className="border-t border-border-light py-5 mb-6 space-y-3.5">
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

              <button
                onClick={() => {
                  window.dispatchEvent(
                    new CustomEvent("open-inquiry-modal", {
                      detail: { packageName: `${packageData.name} (${activeVariant.label})` },
                    }),
                  );
                }}
                className="block w-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs tracking-wider uppercase py-4 rounded-full transition-all duration-300 shadow-md hover:shadow-lg cursor-pointer text-center select-none border-none outline-none mt-2"
              >
                Inquire & Book
              </button>
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
      </div>
    </PageShell>
  );
}
