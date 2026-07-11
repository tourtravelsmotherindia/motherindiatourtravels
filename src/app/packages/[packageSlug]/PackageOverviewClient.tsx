"use client";

import { Building2, Calendar, Check, ChevronRight, Clock, Compass, Users } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import { type CompanyData } from "@/types/company";
import { type PackageDetailItem } from "@/types/package";

interface PackageOverviewClientProps {
  packageData: PackageDetailItem;
  companyData: CompanyData | null;
}

export default function PackageOverviewClient({
  packageData,
  companyData,
}: PackageOverviewClientProps) {
  const pkgName = packageData.name || "Tour Package";

  const breadcrumbItems = [
    { label: "Home", href: "/" },
    { label: "Packages", href: "/packages" },
    { label: pkgName, href: `/packages/${packageData.slug}` },
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
          </div>
        </div>
      </section>

      {/* Main Content Layout */}
      <div className="layout-container py-12">
        <Breadcrumbs items={breadcrumbItems} className="mb-10" />

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
          {/* LEFT 2 COLUMNS: Info & Choose Variant */}
          <div className="lg:col-span-2">
            {/* Key details strip */}
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-6 bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 mb-10 shadow-sm">
              <div className="flex items-center gap-3">
                <Compass className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Style
                  </p>
                  <p className="text-sm font-bold text-foreground">{packageData.tourStyle}</p>
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
                <Calendar className="w-5 h-5 text-neutral-400 shrink-0" />
                <div>
                  <p className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider">
                    Variants
                  </p>
                  <p className="text-sm font-bold text-foreground">
                    {packageData.variants.length} Options
                  </p>
                </div>
              </div>
            </div>

            {/* Overview */}
            <div className="mb-12">
              <h2 className="text-xl md:text-2xl font-bold text-foreground mb-4 font-display">
                About the Journey
              </h2>
              <p className="text-neutral-600 text-sm md:text-base leading-relaxed font-medium whitespace-pre-line">
                {packageData.overview}
              </p>
            </div>

            {/* Choose Option Grid */}
            <div className="mb-12">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-xl md:text-2xl font-bold text-foreground font-display">
                  Select Tour Option
                </h2>
                <span className="text-xs font-semibold uppercase tracking-wider text-neutral-400">
                  Choose duration to see itinerary
                </span>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                {packageData.variants.map((v) => (
                  <Link
                    key={v.id}
                    href={`/packages/${packageData.slug}/${v.slug}`}
                    className="group relative bg-white hover:bg-neutral-50/50 border border-neutral-200/60 hover:border-brand/40 rounded-[2rem] p-6 shadow-card hover:shadow-premium transition-all duration-300 flex flex-col justify-between"
                  >
                    <div>
                      <div className="flex items-center justify-between mb-4">
                        <span className="text-xs font-bold text-neutral-400 uppercase tracking-wider flex items-center gap-1.5">
                          <Clock className="w-3.5 h-3.5" />
                          {v.nights} Nights / {v.days} Days
                        </span>
                        {v.isDefault && (
                          <span className="bg-brand/10 text-brand text-[9px] font-extrabold uppercase px-2.5 py-1 rounded-full tracking-wider">
                            Popular Choice
                          </span>
                        )}
                      </div>

                      <h3 className="text-lg font-bold text-foreground mb-3 tracking-tight group-hover:text-brand transition-colors duration-300">
                        {v.label}
                      </h3>

                      {v.basePrice && (
                        <div className="mt-4 flex items-baseline gap-2">
                          <span className="text-2xl font-black text-foreground">
                            ₹{v.discountedPrice || v.basePrice}
                          </span>
                          {v.discountedPrice && (
                            <span className="text-xs text-neutral-400 line-through">
                              ₹{v.basePrice}
                            </span>
                          )}
                          <span className="text-[10px] text-neutral-500 font-semibold tracking-wider uppercase ml-1">
                            Per Person
                          </span>
                        </div>
                      )}
                    </div>

                    <div className="mt-6 pt-4 border-t border-neutral-100 flex items-center justify-between text-xs font-bold uppercase tracking-wider text-neutral-900 group-hover:text-brand transition-colors duration-300">
                      <span>View Full Itinerary</span>
                      <ChevronRight className="w-4 h-4 transform group-hover:translate-x-1 transition-transform duration-300" />
                    </div>
                  </Link>
                ))}
              </div>
            </div>

            {/* Highlights */}
            {packageData.highlights && packageData.highlights.length > 0 && (
              <div className="mb-12">
                <h2 className="text-xl md:text-2xl font-bold text-foreground mb-5 font-display">
                  Tour Highlights
                </h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  {packageData.highlights.map((h, i) => (
                    <div key={i} className="flex items-start gap-3">
                      <span className="w-5 h-5 rounded-full bg-brand/10 text-brand flex items-center justify-center shrink-0 mt-0.5">
                        <Check className="w-3 h-3 stroke-[3px]" />
                      </span>
                      <p className="text-sm font-medium text-neutral-600 leading-relaxed">{h}</p>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* RIGHT COLUMN: Sticky summary of route */}
          <aside className="lg:sticky lg:top-28 z-10 flex flex-col gap-6">
            <div className="bg-white border border-neutral-200/60 rounded-[2.5rem] p-8 shadow-card">
              <h3 className="font-bold text-lg text-foreground mb-4 font-display">
                Tour Destinations
              </h3>

              <div className="flex flex-col gap-4 font-medium text-neutral-600">
                {packageData.destinations.map((dest, idx) => (
                  <div key={dest.destinationId} className="flex items-start gap-4">
                    <span className="w-6 h-6 rounded-full bg-neutral-100 text-neutral-600 text-xs font-bold flex items-center justify-center shrink-0 mt-0.5">
                      {idx + 1}
                    </span>
                    <div>
                      <p className="text-sm font-bold text-foreground leading-snug">
                        {dest.destinationName}
                      </p>
                      <p className="text-[10px] text-neutral-400 font-bold uppercase tracking-wider mt-0.5">
                        Stage {idx + 1}
                      </p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </aside>
        </div>
      </div>
    </PageShell>
  );
}
