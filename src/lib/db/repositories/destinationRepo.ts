import { prisma } from "@/lib/db/prisma";
import type { DestinationDisplay, DestinationItem } from "@/types/destination";

const destinationInclude = {
  country: { select: { id: true, name: true, slug: true } },
  state: { select: { id: true, name: true, slug: true } },
  attractions: { orderBy: { sortOrder: "asc" as const } },
} as const;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapDestination(d: any): DestinationItem {
  return {
    id: d.id,
    name: d.name,
    slug: d.slug,
    stateId: d.stateId,
    stateName: d.state?.name ?? null,
    stateSlug: d.state?.slug ?? null,
    countryId: d.countryId,
    countryName: d.country.name,
    countrySlug: d.country.slug,
    type: d.type,
    isFeatured: d.isFeatured,
    description: d.description,
    bestTimeToVisit: d.bestTimeToVisit,
    climate: d.climate,
    latitude: d.latitude,
    longitude: d.longitude,
    image: d.image,
    seoTitle: d.seoTitle,
    seoDescription: d.seoDescription,
    attractions: d.attractions.map(
      (a: {
        id: string;
        name: string;
        slug: string;
        description: string;
        image: string;
        latitude: number | null;
        longitude: number | null;
        sortOrder: number;
        destinationId: string;
      }) => ({
        id: a.id,
        name: a.name,
        slug: a.slug,
        destinationId: a.destinationId,
        description: a.description,
        image: a.image,
        latitude: a.latitude,
        longitude: a.longitude,
        sortOrder: a.sortOrder,
      }),
    ),
  };
}

export async function getAllDestinations(): Promise<DestinationItem[]> {
  const destinations = await prisma.destination.findMany({
    include: destinationInclude,
    orderBy: { name: "asc" },
  });
  return destinations.map(mapDestination);
}

export async function getFeaturedDestinations(): Promise<DestinationDisplay[]> {
  const destinations = await prisma.destination.findMany({
    where: { isFeatured: true },
    include: {
      country: { select: { name: true, slug: true } },
      state: { select: { name: true } },
    },
    orderBy: { name: "asc" },
  });

  return destinations.map((d) => ({
    id: d.id,
    name: d.name,
    slug: d.slug,
    stateName: d.state?.name ?? null,
    countryName: d.country.name,
    type: d.type,
    isFeatured: d.isFeatured,
    image: d.image,
    latitude: d.latitude,
    longitude: d.longitude,
  }));
}

export async function getDestinationBySlug(slug: string): Promise<DestinationItem | null> {
  const d = await prisma.destination.findUnique({
    where: { slug },
    include: destinationInclude,
  });
  if (!d) return null;
  return mapDestination(d);
}
