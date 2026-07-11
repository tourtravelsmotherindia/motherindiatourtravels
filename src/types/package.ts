// Package-related domain types — v2.0 (relational schema)

export interface PackageDestination {
  destinationId: string;
  destinationName: string;
  destinationSlug: string;
  sortOrder: number;
  latitude?: number | null;
  longitude?: number | null;
}

export interface PackageCategory {
  categoryId: string;
  categoryName: string;
  categorySlug: string;
}

export interface PackageAttraction {
  attractionId: string;
  attractionName: string;
  attractionSlug: string;
  latitude?: number | null;
  longitude?: number | null;
}

export interface ItineraryDay {
  id: string;
  day: number;
  title: string;
  description: string;
  images: string[];
}

export interface PackageVariantItem {
  id: string;
  packageId: string;
  slug: string; // e.g. "3n-4d" — used in nested URL
  label: string; // e.g. "3 Nights / 4 Days"
  nights: number;
  days: number;
  durationText: string;
  basePrice: number | null;
  discountedPrice: number | null;
  sortOrder: number;
  isDefault: boolean;
  heroImage: string | null;
  galleryImages: string[];
  destinations: PackageDestination[];
  attractions: PackageAttraction[];
}

export interface PackageVariantDetail extends PackageVariantItem {
  itinerary: ItineraryDay[];
}

/** Lightweight package card data for listings */
export interface PackageItem {
  id: string;
  slug: string;
  name: string;
  overview: string;
  heroImage: string;
  galleryImages: string[];
  tourStyle: string;
  groupSizeMax: number;
  groupSizeAvg: number;
  stayType: string;
  marketingPitch: string;
  isPopular: boolean;
  isDomestic: boolean;
  tags: string[];
  countryId: string;
  stateId: string | null;
  destinations: PackageDestination[]; // Derived from default/first variant for listing cards
  categories: PackageCategory[];
  variants: PackageVariantItem[];
}

/** Full package detail including all variants with itinerary */
export interface PackageDetailItem extends Omit<PackageItem, "variants"> {
  highlights: string[];
  inclusions: string[];
  exclusions: string[];
  notes: string[];
  seoTitle: string;
  seoDescription: string;
  seoKeywords: string[];
  variants: PackageVariantDetail[];
}
