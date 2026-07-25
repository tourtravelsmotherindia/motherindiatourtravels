export interface StateItem {
  id: string;
  name: string;
  slug: string;
  countryId: string;
  capital: string;
  isFeatured: boolean;
  description: string;
  image: string;
  latitude: number | null;
  longitude: number | null;
}
