import { Suspense } from "react";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations } from "@/lib/db/repositories/destinationRepo";

import DestinationsClient from "./DestinationsClient";

export default async function DestinationsPage() {
  const [destinationsData, companyData] = await Promise.all([
    getAllDestinations(),
    getCompanyData(),
  ]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading destinations...
        </div>
      }
    >
      <DestinationsClient destinationsData={destinationsData} companyData={companyData} />
    </Suspense>
  );
}
