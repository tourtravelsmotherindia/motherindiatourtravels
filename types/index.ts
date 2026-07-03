// ─── Price Tiers ───────────────────────────────────────────
export interface PriceTier {
  rating: string; // "3", "4", or "5" (hotel star rating)
  old_price: string;
  discount: string;
  actual: number;
}

// ─── Media ──────────────────────────────────────────────────
export interface MediaImage {
  path: string;
}

export interface BlogImage {
  alt: string;
  url: string;
}

// ─── Itinerary (double-encoded in source) ───────────────────
export interface DayElementBase {
  element_type: "transfer" | "hotel" | "activity";
}

export interface TransferElement extends DayElementBase {
  element_type: "transfer";
  from?: string;
  to?: string;
  type?: string;
}

export interface HotelElement extends DayElementBase {
  element_type: "hotel";
  name?: string;
  star_rating?: string;
  description?: string;
  images?: string; // double-encoded JSON string of MediaImage[]
}

export interface ActivityElement extends DayElementBase {
  element_type: "activity";
  name?: string;
  images?: string; // double-encoded JSON string of MediaImage[]
  description?: string;
}

export type DayElement = TransferElement | HotelElement | ActivityElement;

export interface DayDetail {
  day_title: string;
  day_summary: string;
  day_element: DayElement[];
}

export interface ItineraryCity {
  city: string;
  country: string;
  banner_image: MediaImage[];
  day_details: DayDetail[];
}

// ─── Hotels (double-encoded in standalone packages) ─────────
export interface HotelData {
  star_rating: string; // "3", "4", or "5"
  name: string;
  location: string;
  images: string; // double-encoded JSON string of MediaImage[]
}

// ─── FAQ (double-encoded in standalone packages) ────────────
export interface FaqItem {
  question: string;
  answer: string;
}

// ─── Collection ─────────────────────────────────────────────
export interface CollectionMeta {
  collection_id: number;
  collectionName: string;
  idealDuration: string;
  idealSession: string;
  overview: string; // HTML content
  status: string;
  packages: string; // JSON-encoded array of package IDs
  url: string;
  thumbneil: string; // JSON-encoded array of MediaImage[]
  seo_data: string | null; // JSON-encoded SEO object or null
  offers: null;
  elelments: null;
  offer_title: null;
  offer_sub_title: null;
}

export interface EmbeddedPackage {
  package_id: number;
  package_name: string;
  overview: string; // HTML content
  web_slug: string;
  header_images: string; // JSON-encoded array of MediaImage[]
  structure_date: string; // deeply nested JSON-encoded ItineraryCity[]
  status: string;
  package_price: string; // JSON-encoded PriceTier[]
  seo_data: string | null; // JSON-encoded SEO object or null
  thumbneil: string; // JSON-encoded array of MediaImage[]
  similar_package: null;
  inclusions: string; // JSON-encoded string array
  exclusions: string; // JSON-encoded string array
  elelments: null;
  offer_title: null;
  offer_sub_title: null;
  tag: null;
  days: number;
}

export interface Review {
  name: string;
  review: string;
}

export interface CollectionPageProps {
  collectiondata: CollectionMeta;
  packages: EmbeddedPackage[];
  minPrice: number;
  maxPrice: number;
  uniqueCitiesCountriesArray: string[];
  reviews: Review[];
}

export interface CollectionData {
  slug: string;
  title: string;
  description: string;
  og_title: string;
  og_description: string;
  og_url: string;
  og_image: string;
  canonical: string;
  page_props: CollectionPageProps;
}

// ─── Standalone Package (packages/*.json) ────────────────────
export interface PackageData {
  slug: string;
  package_name: string;
  seo_title: string;
  description: string;
  og_title: string;
  og_description: string;
  og_url: string;
  canonical: string;
  days: number;
  nights: number;
  price: PriceTier[];
  about: string; // HTML content
  highlights: string; // HTML content
  itinerary: string; // JSON-encoded ItineraryCity[]
  inclusions: string[];
  exclusions: string[];
  hotels: string; // JSON-encoded HotelData[]
  faq: string; // JSON-encoded FaqItem[]
  cover_image: string;
  images: Array<{ path: string }>;
  meta_title: string;
  meta_description: string;
  meta_keywords: string;
  og_image: string;
  status: string;
}

// ─── Blog ────────────────────────────────────────────────────
export interface BlogData {
  slug: string;
  blog_title: string;
  seo_title: string;
  description: string;
  publish_date: string;
  images: BlogImage[];
  related_blogs: string[]; // always empty in current data
  body_content: string; // HTML content
}

export interface BlogMeta {
  slug: string;
  blog_title: string;
  description: string;
  publish_date: string;
  image: string; // First valid image URL
}

// ─── Menu ────────────────────────────────────────────────────
export interface ChildMenu {
  id: number;
  title: string;
  url: string;
  collection: number;
  collectionName: string;
  collectionUrl: string;
}

export interface SubMenu {
  id: number;
  title: string;
  link: string;
  collection: string | number;
  collectionName: string;
  collectionUrl: string;
  childMenus: ChildMenu[];
}

export interface MenuItem {
  id: number;
  title: string;
  link: string;
  collection: string | number;
  collectionName: string;
  collectionUrl: string;
  submenus: SubMenu[];
}

export interface MenuWrapper {
  message: string;
  data: {
    menu_id: number;
    menu_structure: MenuItem[];
  };
}

// ─── Site Config ─────────────────────────────────────────────
export interface SiteConfig {
  site_name: string;
  tagline: string;
  phone: string;
  email: string;
  whatsapp: string;
  facebook: string;
  instagram: string;
  google_verification: string;
  gtm_id: string;
  clarity_id: string;
  base_url: string;
  logo_path: string;
  logo_footer_path: string;
  favicon_path: string;
}

// ─── Slug Mappings ───────────────────────────────────────────
export interface SlugMappings {
  known_package_slugs: string[];
  blog_title_to_slug: Record<string, string>;
}

// ─── Blog List ───────────────────────────────────────────────
export interface BlogListData {
  title: string;
  description: string;
  h1: string;
  blog_cards: string[];
}
