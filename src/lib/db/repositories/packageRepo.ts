import { prisma } from "@/lib/db/prisma";
import type {
  ItineraryDay,
  PackageAttraction,
  PackageCategory,
  PackageDestination,
  PackageDetailItem,
  PackageItem,
  PackageVariantDetail,
  PackageVariantItem,
} from "@/types/package";

// ─── Mapping helpers ──────────────────────────────────────────────────────────

function mapDestination(pd: {
  sortOrder: number;
  destination: {
    id: string;
    name: string;
    slug: string;
    latitude: number | null;
    longitude: number | null;
  };
}): PackageDestination {
  return {
    destinationId: pd.destination.id,
    destinationName: pd.destination.name,
    destinationSlug: pd.destination.slug,
    sortOrder: pd.sortOrder,
    latitude: pd.destination.latitude,
    longitude: pd.destination.longitude,
  };
}

function mapCategory(pc: {
  category: { id: string; name: string; slug: string };
}): PackageCategory {
  return {
    categoryId: pc.category.id,
    categoryName: pc.category.name,
    categorySlug: pc.category.slug,
  };
}

function mapAttraction(pa: {
  attraction: {
    id: string;
    name: string;
    slug: string;
    latitude: number | null;
    longitude: number | null;
  };
}): PackageAttraction {
  return {
    attractionId: pa.attraction.id,
    attractionName: pa.attraction.name,
    attractionSlug: pa.attraction.slug,
    latitude: pa.attraction.latitude,
    longitude: pa.attraction.longitude,
  };
}

function mapVariant(v: {
  id: string;
  packageId: string;
  slug: string;
  label: string;
  nights: number;
  days: number;
  durationText: string;
  basePrice: number | null;
  discountedPrice: number | null;
  sortOrder: number;
  isDefault: boolean;
}): PackageVariantItem {
  return {
    id: v.id,
    packageId: v.packageId,
    slug: v.slug,
    label: v.label,
    nights: v.nights,
    days: v.days,
    durationText: v.durationText,
    basePrice: v.basePrice,
    discountedPrice: v.discountedPrice,
    sortOrder: v.sortOrder,
    isDefault: v.isDefault,
  };
}

function mapVariantDetail(v: {
  id: string;
  packageId: string;
  slug: string;
  label: string;
  nights: number;
  days: number;
  durationText: string;
  basePrice: number | null;
  discountedPrice: number | null;
  sortOrder: number;
  isDefault: boolean;
  itinerary: {
    id: string;
    day: number;
    title: string;
    description: string;
    images: string[];
  }[];
}): PackageVariantDetail {
  return {
    ...mapVariant(v),
    itinerary: v.itinerary.map((d): ItineraryDay => ({
      id: d.id,
      day: d.day,
      title: d.title,
      description: d.description,
      images: d.images,
    })),
  };
}

// The common include for listing queries (no itinerary for performance)
const packageListInclude = {
  destinations: {
    orderBy: { sortOrder: "asc" as const },
    include: {
      destination: {
        select: { id: true, name: true, slug: true, latitude: true, longitude: true },
      },
    },
  },
  categories: {
    include: {
      category: { select: { id: true, name: true, slug: true } },
    },
  },
  attractions: {
    include: {
      attraction: {
        select: { id: true, name: true, slug: true, latitude: true, longitude: true },
      },
    },
  },
  variants: {
    orderBy: { sortOrder: "asc" as const },
  },
} as const;

// Maps a raw Prisma package row (with includes) to PackageItem
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapPackage(pkg: any): PackageItem {
  return {
    id: pkg.id,
    slug: pkg.slug,
    name: pkg.name,
    overview: pkg.overview,
    heroImage: pkg.heroImage,
    galleryImages: pkg.galleryImages,
    tourStyle: pkg.tourStyle,
    groupSizeMax: pkg.groupSizeMax,
    groupSizeAvg: pkg.groupSizeAvg,
    stayType: pkg.stayType,
    marketingPitch: pkg.marketingPitch,
    isPopular: pkg.isPopular,
    isDomestic: pkg.isDomestic,
    tags: pkg.tags,
    countryId: pkg.countryId,
    stateId: pkg.stateId,
    destinations: pkg.destinations.map(mapDestination),
    categories: pkg.categories.map(mapCategory),
    attractions: pkg.attractions.map(mapAttraction),
    variants: pkg.variants.map(mapVariant),
  };
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapPackageDetail(pkg: any): PackageDetailItem {
  return {
    ...mapPackage(pkg),
    highlights: pkg.highlights,
    inclusions: pkg.inclusions,
    exclusions: pkg.exclusions,
    notes: pkg.notes,
    seoTitle: pkg.seoTitle,
    seoDescription: pkg.seoDescription,
    seoKeywords: pkg.seoKeywords,
    variants: pkg.variants.map(mapVariantDetail),
  };
}

// ─── Public API ───────────────────────────────────────────────────────────────

export async function getAllPackages(): Promise<PackageItem[]> {
  const packages = await prisma.package.findMany({
    include: packageListInclude,
    orderBy: { createdAt: "desc" },
  });
  return packages.map(mapPackage);
}

export async function getPopularPackages(): Promise<PackageItem[]> {
  const packages = await prisma.package.findMany({
    where: { isPopular: true },
    include: packageListInclude,
    orderBy: { createdAt: "desc" },
  });
  return packages.map(mapPackage);
}

export async function getDomesticPackages(): Promise<PackageItem[]> {
  const packages = await prisma.package.findMany({
    where: { isDomestic: true },
    include: packageListInclude,
  });
  return packages.map(mapPackage);
}

export async function getInternationalPackages(): Promise<PackageItem[]> {
  const packages = await prisma.package.findMany({
    where: { isDomestic: false },
    include: packageListInclude,
  });
  return packages.map(mapPackage);
}

/** Get package overview + variants (no itinerary) for the base package page */
export async function getPackageBySlug(slug: string): Promise<PackageDetailItem | null> {
  const pkg = await prisma.package.findUnique({
    where: { slug },
    include: {
      ...packageListInclude,
      variants: {
        orderBy: { sortOrder: "asc" as const },
        include: {
          itinerary: { orderBy: { day: "asc" } },
        },
      },
    },
  });
  if (!pkg) return null;
  return mapPackageDetail(pkg);
}

/** Get a specific variant by its slug for the nested URL detail page */
export async function getVariantBySlug(
  packageSlug: string,
  variantSlug: string,
): Promise<{ package: PackageDetailItem; variant: PackageVariantDetail } | null> {
  const pkg = await prisma.package.findUnique({
    where: { slug: packageSlug },
    include: {
      ...packageListInclude,
      variants: {
        orderBy: { sortOrder: "asc" as const },
        include: {
          itinerary: { orderBy: { day: "asc" } },
        },
      },
    },
  });

  if (!pkg) return null;

  const variantRaw = pkg.variants.find((v: { slug: string }) => v.slug === variantSlug);
  if (!variantRaw) return null;

  const packageDetail = mapPackageDetail(pkg);
  const variant = mapVariantDetail(variantRaw);

  return { package: packageDetail, variant };
}

/** Generate static params for all [packageSlug]/[variantSlug] paths */
export async function getAllPackageVariantPaths(): Promise<
  { packageSlug: string; variantSlug: string }[]
> {
  const packages = await prisma.package.findMany({
    select: {
      slug: true,
      variants: { select: { slug: true } },
    },
  });

  return packages.flatMap((pkg) =>
    pkg.variants.map((v) => ({
      packageSlug: pkg.slug,
      variantSlug: v.slug,
    })),
  );
}
