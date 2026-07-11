import { Metadata } from "next";
import { notFound } from "next/navigation";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllPackages, getPackageBySlug } from "@/lib/db/repositories/packageRepo";

import BookClient from "./BookClient";

interface PageProps {
  params: Promise<{ slug: string }>;
}

/** Pre-render all package booking pages for static export. */
export async function generateStaticParams() {
  const allPackages = await getAllPackages();
  return allPackages.map((pkg) => ({ slug: pkg.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const pkg = await getPackageBySlug(slug);

  if (!pkg) {
    return {
      title: "Booking Not Found | Mother India Tour Travels",
    };
  }

  return {
    title: `Book ${pkg.name} | Mother India Tour Travels`,
    description: `Book your dream holiday with Mother India Tour Travels: ${pkg.name}.`,
  };
}

export default async function PackageBookPage({ params }: PageProps) {
  const { slug } = await params;
  const [pkg, allPackages, companyData] = await Promise.all([
    getPackageBySlug(slug),
    getAllPackages(),
    getCompanyData(),
  ]);

  if (!pkg) {
    notFound();
  }

  return <BookClient packageData={pkg} allPackages={allPackages} companyData={companyData} />;
}
