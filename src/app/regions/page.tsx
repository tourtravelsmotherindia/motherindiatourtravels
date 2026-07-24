import { Suspense } from "react";

import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getRegionsWithDestinations } from "@/lib/db/repositories/destinationRepo";

import RegionsClient from "./RegionsClient";

export const metadata = {
  title: "Regions in India | Mother India Tour Travels",
  description:
    "Discover the geographical regions of India. Explore tour packages and top destinations across North, South, East, West, Central, and Northeast India.",
  alternates: {
    canonical: "/regions/",
  },
};

export default async function RegionsPage() {
  const [regionsData, companyData] = await Promise.all([
    getRegionsWithDestinations(),
    getCompanyData(),
  ]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading regional packages...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/regions" />
      <RegionsClient regionsData={regionsData} companyData={companyData} />
    </Suspense>
  );
}
