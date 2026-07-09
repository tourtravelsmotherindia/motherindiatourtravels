import { prisma } from "@/lib/db/prisma";

/** Shape of a Package row as returned by Prisma (JSON fields stored as strings). */
interface PackageRow {
  id: string;
  slug: string;
  name: string;
  isPopular: boolean;
  isDomestic: boolean;
  destinations: string;
  destinationIds: string;
  primaryDestination: string;
  categoryIds: string;
  stateId: string | null;
  countryId: string;
  minNights: number;
  maxNights: number;
  minDays: number;
  maxDays: number;
  durationRange: string;
  variantCount: number;
  heroImage: string;
  tags: string;
}

interface PackageDetailRow extends PackageRow {
  overview: string | null;
  highlights: string;
  inclusions: string;
  exclusions: string;
  notes: string;
  seoTitle: string | null;
  seoDescription: string | null;
  seoKeywords: string;
  variants?: PackageVariantRow[];
}

interface PackageVariantRow {
  label: string;
  nights: number;
  days: number;
  durationText: string;
  oldHtmlFile: string;
  itinerary?: ItineraryDayRow[];
}

interface ItineraryDayRow {
  day: number;
  title: string;
  description: string;
}

export async function getAllPackages() {
  const packages = await prisma.package.findMany();
  return packages.map(mapPackage);
}

export async function getPopularPackages() {
  const packages = await prisma.package.findMany({
    where: { isPopular: true },
  });
  return packages.map(mapPackage);
}

export async function getDomesticPackages() {
  const packages = await prisma.package.findMany({
    where: { isDomestic: true },
  });
  return packages.map(mapPackage);
}

export async function getInternationalPackages() {
  const packages = await prisma.package.findMany({
    where: { isDomestic: false },
  });
  return packages.map(mapPackage);
}

export async function getPackageBySlug(slug: string) {
  const pkg = await prisma.package.findUnique({
    where: { slug },
    include: {
      variants: {
        include: { itinerary: { orderBy: { day: "asc" } } },
      },
    },
  });
  if (!pkg) return null;
  return mapPackageDetail(pkg as PackageDetailRow);
}

export async function getPackagesIndex() {
  const packages = await prisma.package.findMany({
    select: {
      id: true,
      slug: true,
      name: true,
      isPopular: true,
      isDomestic: true,
      destinations: true,
      destinationIds: true,
      primaryDestination: true,
      categoryIds: true,
      stateId: true,
      countryId: true,
      minNights: true,
      maxNights: true,
      minDays: true,
      maxDays: true,
      durationRange: true,
      variantCount: true,
      heroImage: true,
      tags: true,
    },
  });
  return {
    total: packages.length,
    updated_at: "2025-01-01",
    packages: packages.map(mapPackage),
  };
}

function mapPackage(pkg: PackageRow) {
  return {
    id: pkg.id,
    slug: pkg.slug,
    name: pkg.name,
    is_popular: pkg.isPopular,
    is_domestic: pkg.isDomestic,
    destinations: safeParse(pkg.destinations),
    destination_ids: safeParse(pkg.destinationIds),
    primary_destination: pkg.primaryDestination,
    category_ids: safeParse(pkg.categoryIds),
    state_id: pkg.stateId,
    country_id: pkg.countryId,
    min_nights: pkg.minNights,
    max_nights: pkg.maxNights,
    min_days: pkg.minDays,
    max_days: pkg.maxDays,
    duration_range: pkg.durationRange,
    variant_count: pkg.variantCount,
    hero_image: pkg.heroImage,
    tags: safeParse(pkg.tags),
  };
}

function mapPackageDetail(pkg: PackageDetailRow) {
  return {
    ...mapPackage(pkg),
    overview: pkg.overview || "",
    highlights: safeParse(pkg.highlights),
    inclusions: safeParse(pkg.inclusions),
    exclusions: safeParse(pkg.exclusions),
    notes: safeParse(pkg.notes),
    variants:
      pkg.variants?.map((v: PackageVariantRow) => ({
        label: v.label,
        nights: v.nights,
        days: v.days,
        duration_text: v.durationText,
        old_html_file: v.oldHtmlFile,
        itinerary:
          v.itinerary?.map((d: ItineraryDayRow) => ({
            day: d.day,
            title: d.title,
            description: d.description,
          })) || [],
      })) || [],
    seo: {
      title: pkg.seoTitle || "",
      description: pkg.seoDescription || "",
      keywords: safeParse(pkg.seoKeywords),
    },
  };
}

function safeParse(val: string): string[] {
  try {
    return JSON.parse(val || "[]");
  } catch {
    return [];
  }
}
