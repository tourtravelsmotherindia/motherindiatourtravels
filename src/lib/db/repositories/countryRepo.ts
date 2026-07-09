import { prisma } from "@/lib/db/prisma";

export async function getCountries() {
  const countries = await prisma.country.findMany();
  return countries.map((c) => ({
    ...c,
    language: JSON.parse(c.languages),
    popular_destinations: JSON.parse(c.popularDestinations),
    is_domestic: c.isDomestic,
    is_featured: c.isFeatured,
    visa_required_for_indians: c.visaRequiredForIndians,
    visa_on_arrival: c.visaOnArrival,
    seo_title: c.seoTitle,
    seo_description: c.seoDescription,
    package_count: c.packageCount,
    package_ids: [], // computed below
  }));
}

export async function getCountriesWithPackages() {
  const countries = await prisma.country.findMany({
    include: { packages: { select: { id: true } } },
  });
  return countries.map((c) => ({
    id: c.id,
    name: c.name,
    slug: c.slug,
    continent: c.continent,
    is_domestic: c.isDomestic,
    is_featured: c.isFeatured,
    capital: c.capital,
    currency: c.currency,
    language: JSON.parse(c.languages),
    visa_required_for_indians: c.visaRequiredForIndians,
    visa_on_arrival: c.visaOnArrival,
    description: c.description,
    popular_destinations: JSON.parse(c.popularDestinations),
    seo_title: c.seoTitle,
    seo_description: c.seoDescription,
    image: c.image,
    package_ids: c.packages.map((p) => p.id),
    package_count: c.packageCount,
  }));
}
