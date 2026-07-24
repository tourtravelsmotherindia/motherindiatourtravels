"use client";

import { Suspense } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import DestinationCard from "@/components/shared/DestinationCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { type CompanyData } from "@/types/company";
import { type RegionWithDestinations } from "@/types/destination";

function RegionsContent({
  regionsData,
  companyData,
}: {
  regionsData: RegionWithDestinations[];
  companyData: CompanyData | null;
}) {
  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container pt-12 md:pt-16 pb-section-loose font-sans">
        <Breadcrumbs
          items={[{ label: "Home", href: "/" }, { label: "Regions" }]}
          variant="brackets"
        />
        <SectionHeader
          title="Destinations By Region"
          subtitle="Explore adventures across every corner of the incredible Indian subcontinent, automatically grouped and organized by regional state mappings."
          align="left"
        />

        {/* Grouped Destination Grids by Region */}
        <div className="flex flex-col gap-20">
          {regionsData.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                No regional destinations found
              </h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                There are currently no regional configurations available.
              </p>
            </div>
          ) : (
            regionsData.map((region) => (
              <div key={region.name} className="flex flex-col gap-6">
                {/* Region Title Block */}
                <div className="flex flex-col sm:flex-row sm:items-baseline justify-between border-b border-neutral-200/50 pb-3 gap-2">
                  <div className="flex items-center gap-3">
                    <h2 className="text-xl md:text-2xl font-extrabold text-foreground tracking-tight">
                      {region.name}
                    </h2>
                    <span className="text-[9px] font-extrabold tracking-widest text-brand bg-brand/10 border border-brand/20 px-2 py-0.5 rounded uppercase">
                      {region.destinations.length}{" "}
                      {region.destinations.length === 1 ? "dest" : "dests"}
                    </span>
                  </div>
                  <div className="flex items-center gap-1.5 flex-wrap">
                    {region.badges.map((badge, bIdx) => (
                      <span
                        key={bIdx}
                        className="bg-neutral-100 border border-neutral-200/50 text-neutral-500 rounded px-2 py-0.5 text-[9px] font-bold uppercase tracking-wider"
                      >
                        {badge}
                      </span>
                    ))}
                  </div>
                </div>

                {/* Destinations Grid */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-3.5 sm:gap-6 lg:gap-8">
                  {region.destinations.map((dest) => (
                    <div key={dest.slug} className="h-[280px] sm:h-[360px] md:h-[400px] w-full">
                      <DestinationCard dest={dest} isMobile />
                    </div>
                  ))}
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </PageShell>
  );
}

export default function RegionsClient(props: {
  regionsData: RegionWithDestinations[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading regional packages...
        </div>
      }
    >
      <RegionsContent {...props} />
    </Suspense>
  );
}
