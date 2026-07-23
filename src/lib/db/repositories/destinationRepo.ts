import { withBuildCache } from "@/lib/db/buildCache";
import { prisma } from "@/lib/db/prisma";
import type {
  DestinationDisplay,
  DestinationItem,
  DestinationsSectionData,
  RegionWithDestinations,
} from "@/types/destination";

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
    updatedAt: d.updatedAt,
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
  return withBuildCache("featured-destinations", async () => {
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
  });
}

export async function getFeaturedDestinationsSectionData(): Promise<DestinationsSectionData> {
  return withBuildCache("featured-destinations-section", async () => {
    const [destinations, section] = await Promise.all([
      prisma.destination.findMany({
        where: { isFeatured: true },
        include: {
          country: { select: { name: true, slug: true } },
          state: { select: { name: true } },
        },
        orderBy: { name: "asc" },
      }),
      prisma.siteSection.findUnique({
        where: { key: "destinations" },
      }),
    ]);

    return {
      tagline: section?.tagline ?? "Explore Top Destinations",
      subtitle: section?.subtitle ?? "Explore the world's most sought-after travel experiences",
      items: destinations.map((d) => ({
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
      })),
    };
  });
}

export async function getDestinationBySlug(slug: string): Promise<DestinationItem | null> {
  const d = await prisma.destination.findUnique({
    where: { slug },
    include: destinationInclude,
  });
  if (!d) return null;
  return mapDestination(d);
}

export interface RegionDisplay {
  id: number;
  name: string;
  image: string;
  states: string;
  moreCount: string;
  badges: string[];
}

const DEFAULT_REGIONS = [
  {
    id: 1,
    name: "North India",
    image:
      "https://images.unsplash.com/photo-1589308078059-be1415eab4c3?auto=format&fit=crop&w=800&q=80",
    badges: ["All Adventures", "Deals"],
    states: [
      "delhi",
      "uttar pradesh",
      "himachal pradesh",
      "uttarakhand",
      "jammu & kashmir",
      "jammu and kashmir",
      "ladakh",
      "punjab",
      "haryana",
    ],
  },
  {
    id: 2,
    name: "South India",
    image:
      "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
    badges: ["Nature", "Wellness"],
    states: ["kerala", "karnataka", "tamil nadu", "andhra pradesh", "telangana"],
  },
  {
    id: 3,
    name: "West India",
    image:
      "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80",
    badges: ["Beaches", "Heritage"],
    states: ["goa", "rajasthan", "gujarat", "maharashtra"],
  },
  {
    id: 4,
    name: "East India",
    image:
      "https://images.unsplash.com/photo-1555899434-94d1368aa7af?auto=format&fit=crop&w=800&q=80",
    badges: ["Hills", "Tea Gardens"],
    states: ["west bengal", "odisha", "bihar", "jharkhand"],
  },
  {
    id: 5,
    name: "Central India",
    image:
      "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80",
    badges: ["Culture", "History"],
    states: ["madhya pradesh", "chhattisgarh"],
  },
  {
    id: 6,
    name: "Northeast India",
    image:
      "https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&w=800&q=80",
    badges: ["Monasteries", "Scenic"],
    states: [
      "sikkim",
      "meghalaya",
      "assam",
      "arunachal pradesh",
      "nagaland",
      "manipur",
      "mizoram",
      "tripura",
    ],
  },
];

interface RegionConfig {
  id: number;
  name: string;
  image: string;
  badges: string[];
  states: string[];
}

export async function getDestinationsByRegion(): Promise<RegionDisplay[]> {
  return withBuildCache("destinations-by-region", async () => {
    const [destinations, section] = await Promise.all([
      prisma.destination.findMany({
        include: {
          state: { select: { name: true } },
        },
      }),
      prisma.siteSection.findUnique({
        where: { key: "regions" },
      }),
    ]);

    const regionsList = (section?.metaJson as unknown as RegionConfig[]) || DEFAULT_REGIONS;

    const regionsMap = regionsList.map((r: RegionConfig) => ({
      id: r.id,
      name: r.name,
      image: r.image,
      badges: r.badges || [],
      statesPatterns: r.states || [],
      statesList: new Set<string>(),
      count: 0,
    }));

    destinations.forEach((d) => {
      const stateName = d.state?.name;
      if (stateName) {
        const s = stateName.toLowerCase();
        regionsMap.forEach((region) => {
          const matched = region.statesPatterns.some((pattern: string) =>
            s.includes(pattern.toLowerCase()),
          );
          if (matched) {
            region.statesList.add(stateName);
            region.count++;
          }
        });
      }
    });

    return regionsMap.map((r) => ({
      id: r.id,
      name: r.name,
      image: r.image,
      states:
        r.statesList.size > 0
          ? Array.from(r.statesList).join(", ")
          : "Explore regional destinations",
      moreCount: `+ ${r.count} destinations`,
      badges: r.badges,
    }));
  });
}

export async function getRegionsWithDestinations(): Promise<RegionWithDestinations[]> {
  return withBuildCache("regions-with-destinations", async () => {
    const [destinations, section] = await Promise.all([
      prisma.destination.findMany({
        include: {
          country: { select: { name: true, slug: true } },
          state: { select: { name: true } },
        },
        orderBy: { name: "asc" },
      }),
      prisma.siteSection.findUnique({
        where: { key: "regions" },
      }),
    ]);

    const regionsList = (section?.metaJson as unknown as RegionConfig[]) || DEFAULT_REGIONS;

    const regionsMap = regionsList.map((r: RegionConfig) => ({
      name: r.name,
      image: r.image,
      badges: r.badges || [],
      statesPatterns: r.states || [],
      destinations: [] as DestinationDisplay[],
    }));

    destinations.forEach((d) => {
      const stateName = d.state?.name;
      if (stateName) {
        const s = stateName.toLowerCase();
        regionsMap.forEach((region) => {
          const matched = region.statesPatterns.some((pattern: string) =>
            s.includes(pattern.toLowerCase()),
          );
          if (matched) {
            region.destinations.push({
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
            });
          }
        });
      }
    });

    return regionsMap;
  });
}
