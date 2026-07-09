import { Metadata } from "next";
import { notFound } from "next/navigation";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllPackages, getPackageBySlug } from "@/lib/db/repositories/packageRepo";

import PackageDetailClient from "./PackageDetailClient";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const pkg = await getPackageBySlug(slug);

  if (!pkg) {
    return {
      title: "Package Not Found | Mother India Tour Travels",
    };
  }

  const seoTitle = pkg.seo?.title || `${pkg.name} Tour Package`;
  const seoDescription =
    pkg.seo?.description ||
    pkg.overview ||
    `Experience ${pkg.name} with Mother India Tour Travels. Comfort AC vehicles, expert guides, and handpicked hotels.`;

  return {
    title: `${seoTitle} | Mother India Tour Travels`,
    description: seoDescription,
    keywords: pkg.seo?.keywords?.join(", ") || pkg.tags?.join(", ") || "",
    openGraph: {
      title: `${seoTitle} | Mother India Tour Travels`,
      description: seoDescription,
      images: pkg.hero_image ? [{ url: pkg.hero_image }] : [],
    },
  };
}

export default async function PackageDetailPage({ params }: PageProps) {
  const { slug } = await params;
  const [pkg, allPackages, companyData] = await Promise.all([
    getPackageBySlug(slug),
    getAllPackages(),
    getCompanyData(),
  ]);

  if (!pkg) {
    notFound();
  }

  return (
    <PackageDetailClient packageData={pkg} allPackages={allPackages} companyData={companyData} />
  );
}
