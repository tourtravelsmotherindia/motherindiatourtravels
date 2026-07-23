import { Metadata } from "next";
import { notFound } from "next/navigation";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllPackages, getPackageBySlug } from "@/lib/db/repositories/packageRepo";

import PackageOverviewClient from "./PackageOverviewClient";

interface PageProps {
  params: Promise<{ packageSlug: string }>;
}

/** Pre-render all package overview pages */
export async function generateStaticParams() {
  const packages = await getAllPackages();
  return packages.map((pkg) => ({ packageSlug: pkg.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { packageSlug } = await params;
  const pkg = await getPackageBySlug(packageSlug);

  if (!pkg) {
    return { title: "Package Not Found | Mother India Tour Travels" };
  }

  const title = pkg.seoTitle || `${pkg.name} Tour Package`;
  const description =
    pkg.seoDescription || pkg.overview || `Experience ${pkg.name} with Mother India Tour Travels.`;

  return {
    title: `${title} | Mother India Tour Travels`,
    description,
    keywords: pkg.seoKeywords?.join(", ") || pkg.tags?.join(", ") || "",
    alternates: {
      canonical: `/packages/${packageSlug}/`,
    },
    openGraph: {
      title: `${title} | Mother India Tour Travels`,
      description,
      images: pkg.heroImage ? [{ url: pkg.heroImage }] : [],
    },
  };
}

export default async function PackageOverviewPage({ params }: PageProps) {
  const { packageSlug } = await params;

  const [pkg, allPackages, companyData] = await Promise.all([
    getPackageBySlug(packageSlug),
    getAllPackages(),
    getCompanyData(),
  ]);

  if (!pkg) notFound();

  return (
    <PackageOverviewClient packageData={pkg} allPackages={allPackages} companyData={companyData} />
  );
}
