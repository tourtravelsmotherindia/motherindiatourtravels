import { notFound } from "next/navigation";
import { Suspense } from "react";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations, getDestinationBySlug } from "@/lib/db/repositories/destinationRepo";
import { getPackagesByDestinationSlug } from "@/lib/db/repositories/packageRepo";

import DestinationDetailClient from "./DestinationDetailClient";

export async function generateStaticParams() {
  const destinations = await getAllDestinations();
  return destinations.map((d) => ({
    destinationSlug: d.slug,
  }));
}

interface PageProps {
  params: Promise<{ destinationSlug: string }>;
}

export default async function DestinationDetailPage({ params }: PageProps) {
  const { destinationSlug } = await params;
  const [destinationData, packagesData, companyData] = await Promise.all([
    getDestinationBySlug(destinationSlug),
    getPackagesByDestinationSlug(destinationSlug),
    getCompanyData(),
  ]);

  if (!destinationData) {
    notFound();
  }

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading destination details...
        </div>
      }
    >
      <DestinationDetailClient
        destination={destinationData}
        packages={packagesData}
        companyData={companyData}
      />
    </Suspense>
  );
}
