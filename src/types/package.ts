export interface ItineraryDay {
  day: number;
  title: string;
  description: string;
  images?: string[];
}

export interface PackageVariant {
  label: string;
  nights: number;
  days: number;
  duration_text: string;
  old_html_file: string;
  itinerary: ItineraryDay[];
}

export interface PackageItem {
  id: string;
  slug: string;
  name: string;
  is_popular: boolean;
  is_domestic: boolean;
  destinations: string[];
  destination_ids: string[];
  primary_destination: string;
  category_ids: string[];
  state_id: string | null;
  country_id: string;
  min_nights: number;
  max_nights: number;
  min_days: number;
  max_days: number;
  duration_range: string;
  variant_count: number;
  hero_image: string;
  tags: string[];
  gallery_images?: string[];
  tour_style?: string;
  group_size_max?: number;
  group_size_avg?: number;
  stay_type?: string;
  marketing_pitch?: string;
}

export interface PackageDetailItem extends PackageItem {
  overview: string;
  highlights: string[];
  inclusions: string[];
  exclusions: string[];
  notes: string[];
  variants: PackageVariant[];
  seo: {
    title: string;
    description: string;
    keywords: string[];
  };
}

export interface PackagesData {
  packages: PackageItem[];
}
