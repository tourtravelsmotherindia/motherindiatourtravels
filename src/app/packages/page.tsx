import { Suspense } from "react";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

import PackagesClient from "./PackagesClient";

export default async function PackagesPage() {
  const [packagesData, companyData] = await Promise.all([getPackagesIndex(), getCompanyData()]);
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading packages...
        </div>
      }
    >
      <PackagesClient packagesData={packagesData} companyData={companyData} />
    </Suspense>
  );
}
