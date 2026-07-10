import { prisma } from "@/lib/db/prisma";

export async function getDestinations() {
  const destinations = await prisma.destination.findMany();
  return destinations.map((d) => ({
    id: d.id,
    name: d.name,
    slug: d.slug,
    state_id: d.stateId,
    country_id: d.countryId,
    type: d.type,
    is_featured: d.isFeatured,
    description: d.description,
    best_time_to_visit: d.bestTimeToVisit,
    climate: d.climate,
    top_attractions: JSON.parse(d.topAttractions),
    nearby_destinations: JSON.parse(d.nearbyDestinations),
    seo_title: d.seoTitle,
    seo_description: d.seoDescription,
    image: d.image,
    package_count: d.packageCount,
    latitude: d.latitude,
    longitude: d.longitude,
  }));
}

export async function getFeaturedDestinations() {
  const destinations = await prisma.destination.findMany({
    where: { isFeatured: true },
  });
  return destinations.map((d) => ({
    id: d.id,
    name: d.name,
    slug: d.slug,
    state_id: d.stateId,
    country_id: d.countryId,
    type: d.type,
    is_featured: d.isFeatured,
    description: d.description,
    best_time_to_visit: d.bestTimeToVisit,
    climate: d.climate,
    top_attractions: JSON.parse(d.topAttractions),
    nearby_destinations: JSON.parse(d.nearbyDestinations),
    seo_title: d.seoTitle,
    seo_description: d.seoDescription,
    image: d.image,
    package_count: d.packageCount,
    latitude: d.latitude,
    longitude: d.longitude,
  }));
}

export async function getDestinationBySlug(slug: string) {
  const d = await prisma.destination.findUnique({ where: { slug } });
  if (!d) return null;
  return {
    id: d.id,
    name: d.name,
    slug: d.slug,
    state_id: d.stateId,
    country_id: d.countryId,
    type: d.type,
    is_featured: d.isFeatured,
    description: d.description,
    best_time_to_visit: d.bestTimeToVisit,
    climate: d.climate,
    top_attractions: JSON.parse(d.topAttractions),
    nearby_destinations: JSON.parse(d.nearbyDestinations),
    seo_title: d.seoTitle,
    seo_description: d.seoDescription,
    image: d.image,
    package_count: d.packageCount,
    latitude: d.latitude,
    longitude: d.longitude,
  };
}
