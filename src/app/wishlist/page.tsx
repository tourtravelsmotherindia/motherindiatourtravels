import { Suspense } from "react";

import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations } from "@/lib/db/repositories/destinationRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

import WishlistClient from "./WishlistClient";

export const metadata = {
  title: "My Wishlist | Mother India Tour Travels",
  description:
    "View and manage your saved tour packages and favorite destinations with Mother India Tour Travels.",
  alternates: {
    canonical: "/wishlist/",
  },
};

export default async function WishlistPage() {
  const [packagesData, destinationsData, companyData] = await Promise.all([
    getAllPackages(),
    getAllDestinations(),
    getCompanyData(),
  ]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading wishlist...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/wishlist" />
      <WishlistClient
        packagesData={packagesData}
        destinationsData={destinationsData}
        companyData={companyData}
      />
    </Suspense>
  );
}
