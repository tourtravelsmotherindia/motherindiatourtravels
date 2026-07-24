import { Suspense } from "react";

import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getAllCategories } from "@/lib/db/repositories/categoryRepo";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations } from "@/lib/db/repositories/destinationRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

import SearchClient from "./SearchClient";

export const metadata = {
  title: "Search Tour Packages | Mother India Tour Travels",
  description:
    "Find and filter our custom-designed tour packages, premium destinations, and regional holiday plans with Mother India Tour Travels.",
  alternates: {
    canonical: "/search/",
  },
};

export default async function SearchPage() {
  const [packagesData, destinationsData, categoriesData, companyData] = await Promise.all([
    getAllPackages(),
    getAllDestinations(),
    getAllCategories(),
    getCompanyData(),
  ]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading search...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/search" />
      <SearchClient
        packagesData={packagesData}
        destinationsData={destinationsData}
        categoriesData={categoriesData}
        companyData={companyData}
      />
    </Suspense>
  );
}
