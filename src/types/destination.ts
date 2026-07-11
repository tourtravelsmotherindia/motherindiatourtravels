// Destination and Attraction domain types — v2.0

export interface AttractionItem {
  id: string;
  name: string;
  slug: string;
  destinationId: string;
  description: string;
  image: string;
  latitude: number | null;
  longitude: number | null;
  sortOrder: number;
}

export interface DestinationItem {
  id: string;
  name: string;
  slug: string;
  stateId: string | null;
  stateName: string | null;
  stateSlug: string | null;
  countryId: string;
  countryName: string;
  countrySlug: string;
  type: string; // DestinationType enum string
  isFeatured: boolean;
  description: string;
  bestTimeToVisit: string;
  climate: string;
  latitude: number | null;
  longitude: number | null;
  image: string;
  seoTitle: string;
  seoDescription: string;
  attractions: AttractionItem[];
}

export interface DestinationDisplay {
  id: string;
  name: string;
  slug: string;
  stateName: string | null;
  countryName: string;
  type: string;
  isFeatured: boolean;
  image: string;
  latitude: number | null;
  longitude: number | null;
}
