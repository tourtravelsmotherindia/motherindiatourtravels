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

export interface RegionDisplay {
  id: number;
  name: string;
  image: string;
  states: string;
  moreCount: string;
  badges: string[];
}

function checkStateRegion(stateName: string, regionName: string): boolean {
  const s = stateName.toLowerCase();
  if (regionName === "North India") {
    return [
      "delhi",
      "uttar pradesh",
      "himachal pradesh",
      "uttarakhand",
      "jammu & kashmir",
      "jammu and kashmir",
      "ladakh",
      "punjab",
      "haryana",
    ].some((x) => s.includes(x));
  }
  if (regionName === "South India") {
    return ["kerala", "karnataka", "tamil nadu", "andhra pradesh", "telangana"].some((x) =>
      s.includes(x),
    );
  }
  if (regionName === "West India") {
    return ["goa", "rajasthan", "gujarat", "maharashtra"].some((x) => s.includes(x));
  }
  if (regionName === "East India") {
    return ["west bengal", "odisha", "bihar", "jharkhand"].some((x) => s.includes(x));
  }
  if (regionName === "Central India") {
    return ["madhya pradesh", "chhattisgarh"].some((x) => s.includes(x));
  }
  if (regionName === "Northeast India") {
    return [
      "sikkim",
      "meghalaya",
      "assam",
      "arunachal pradesh",
      "nagaland",
      "manipur",
      "mizoram",
      "tripura",
    ].some((x) => s.includes(x));
  }
  return false;
}

export async function getDestinationsByRegion(): Promise<RegionDisplay[]> {
  const destinations = await prisma.destination.findMany({
    include: {
      state: { select: { name: true } },
    },
  });

  const regionsMap: Record<
    string,
    {
      id: number;
      name: string;
      image: string;
      statesList: Set<string>;
      count: number;
      badges: string[];
    }
  > = {
    "North India": {
      id: 1,
      name: "North India",
      image:
        "https://images.unsplash.com/photo-1589308078059-be1415eab4c3?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["All Adventures", "Deals"],
    },
    "South India": {
      id: 2,
      name: "South India",
      image:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["Nature", "Wellness"],
    },
    "West India": {
      id: 3,
      name: "West India",
      image:
        "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["Beaches", "Heritage"],
    },
    "East India": {
      id: 4,
      name: "East India",
      image:
        "https://images.unsplash.com/photo-1555899434-94d1368aa7af?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["Hills", "Tea Gardens"],
    },
    "Central India": {
      id: 5,
      name: "Central India",
      image:
        "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["Culture", "History"],
    },
    "Northeast India": {
      id: 6,
      name: "Northeast India",
      image:
        "https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&w=800&q=80",
      statesList: new Set(),
      count: 0,
      badges: ["Monasteries", "Scenic"],
    },
  };

  destinations.forEach((d) => {
    const stateName = d.state?.name;
    if (stateName) {
      for (const region of Object.values(regionsMap)) {
        if (checkStateRegion(stateName, region.name)) {
          region.statesList.add(stateName);
          region.count++;
        }
      }
    }
  });

  return Object.values(regionsMap).map((r) => ({
    id: r.id,
    name: r.name,
    image: r.image,
    states:
      r.statesList.size > 0 ? Array.from(r.statesList).join(", ") : "Explore regional destinations",
    moreCount: `+ ${r.count} destinations`,
    badges: r.badges,
  }));
}
