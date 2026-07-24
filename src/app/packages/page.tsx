import { Suspense } from "react";

import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

import PackagesClient from "./PackagesClient";

export default async function PackagesPage() {
  const [packagesData, companyData] = await Promise.all([getAllPackages(), getCompanyData()]);
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading packages...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/packages" />
      <PackagesClient packagesData={packagesData} companyData={companyData} />
    </Suspense>
  );
}
