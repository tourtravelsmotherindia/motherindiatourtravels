export interface CountryItem {
  id: string;
  name: string;
  slug: string;
  continent: string;
  isDomestic: boolean;
  isFeatured: boolean;
  capital: string;
  currency: string;
  languages: string[];
  visaRequiredForIndians: boolean;
  visaOnArrival: boolean;
  description: string;
  seoTitle: string;
  seoDescription: string;
  image: string;
  latitude: number | null;
  longitude: number | null;
}
