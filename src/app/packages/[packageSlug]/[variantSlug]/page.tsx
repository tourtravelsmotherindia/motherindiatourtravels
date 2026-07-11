import { Metadata } from "next";
import { notFound } from "next/navigation";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import {
  getAllPackages,
  getAllPackageVariantPaths,
  getVariantBySlug,
} from "@/lib/db/repositories/packageRepo";

import PackageDetailClient from "./PackageDetailClient";

interface PageProps {
  params: Promise<{ packageSlug: string; variantSlug: string }>;
}

/** Pre-render all [packageSlug]/[variantSlug] pages for static export */
export async function generateStaticParams() {
  return getAllPackageVariantPaths();
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { packageSlug, variantSlug } = await params;
  const result = await getVariantBySlug(packageSlug, variantSlug);

  if (!result) {
    return { title: "Package Not Found | Mother India Tour Travels" };
  }

  const { package: pkg, variant } = result;
  const title = pkg.seoTitle || `${pkg.name} ${variant.label}`;
  const description =
    pkg.seoDescription ||
    pkg.overview ||
    `Experience ${pkg.name} ${variant.label} with Mother India Tour Travels.`;

  return {
    title: `${title} | Mother India Tour Travels`,
    description,
    keywords: pkg.seoKeywords?.join(", ") || pkg.tags?.join(", ") || "",
    openGraph: {
      title: `${title} | Mother India Tour Travels`,
      description,
      images: pkg.heroImage ? [{ url: pkg.heroImage }] : [],
    },
  };
}

export default async function PackageVariantPage({ params }: PageProps) {
  const { packageSlug, variantSlug } = await params;

  const [result, allPackages, companyData] = await Promise.all([
    getVariantBySlug(packageSlug, variantSlug),
    getAllPackages(),
    getCompanyData(),
  ]);

  if (!result) notFound();

  const { package: packageData, variant } = result;

  return (
    <PackageDetailClient
      packageData={packageData}
      activeVariant={variant}
      allPackages={allPackages}
      companyData={companyData}
    />
  );
}
