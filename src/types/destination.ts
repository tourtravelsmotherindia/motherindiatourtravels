export interface DestinationItem {
  id: string;
  slug: string;
  name: string;
  state_id?: string | null;
  country_id: string;
  is_featured: boolean;
  description: string;
  best_time_to_visit: string;
  top_attractions: string[] | string;
  image: string;
  package_ids?: string[];
  package_count: number;
}

export interface DestinationDisplay {
  slug: string;
  name: string;
  location: string;
  duration: string;
  rating: number;
  ratingCount: string;
  image: string;
}

export interface DestinationsData {
  destinations: DestinationItem[];
}
