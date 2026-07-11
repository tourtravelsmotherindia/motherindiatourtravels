import { prisma } from "@/lib/db/prisma";

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

export async function getAllCountries(): Promise<CountryItem[]> {
  const countries = await prisma.country.findMany({ orderBy: { name: "asc" } });
  return countries as CountryItem[];
}

export async function getFeaturedCountries(): Promise<CountryItem[]> {
  const countries = await prisma.country.findMany({
    where: { isFeatured: true },
    orderBy: { isDomestic: "desc" },
  });
  return countries as CountryItem[];
}

export async function getCountryBySlug(slug: string): Promise<CountryItem | null> {
  const country = await prisma.country.findUnique({ where: { slug } });
  return country as CountryItem | null;
}
