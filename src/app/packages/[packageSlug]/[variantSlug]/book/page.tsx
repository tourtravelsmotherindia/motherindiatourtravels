import { Metadata } from "next";
import { notFound } from "next/navigation";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import {
  getAllPackages,
  getAllPackageVariantPaths,
  getVariantBySlug,
} from "@/lib/db/repositories/packageRepo";

import BookClient from "./BookClient";

interface PageProps {
  params: Promise<{ packageSlug: string; variantSlug: string }>;
}

/** Pre-render all package booking pages for static export */
export async function generateStaticParams() {
  return getAllPackageVariantPaths();
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { packageSlug, variantSlug } = await params;
  const result = await getVariantBySlug(packageSlug, variantSlug);

  if (!result) {
    return { title: "Booking Not Found | Mother India Tour Travels" };
  }

  const { package: pkg, variant } = result;

  return {
    title: `Book ${pkg.name} (${variant.label}) | Mother India Tour Travels`,
    description: `Book your tour package "${pkg.name} - ${variant.label}" with Mother India Tour Travels.`,
  };
}

export default async function PackageBookPage({ params }: PageProps) {
  const { packageSlug, variantSlug } = await params;

  const [result, allPackages, companyData] = await Promise.all([
    getVariantBySlug(packageSlug, variantSlug),
    getAllPackages(),
    getCompanyData(),
  ]);

  if (!result) notFound();

  const { package: packageData, variant } = result;

  return (
    <BookClient
      packageData={packageData}
      activeVariant={variant}
      allPackages={allPackages}
      companyData={companyData}
    />
  );
}
