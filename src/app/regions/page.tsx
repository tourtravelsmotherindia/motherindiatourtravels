import { Suspense } from "react";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getRegionsWithDestinations } from "@/lib/db/repositories/destinationRepo";

import RegionsClient from "./RegionsClient";

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
      <RegionsClient regionsData={regionsData} companyData={companyData} />
    </Suspense>
  );
}
