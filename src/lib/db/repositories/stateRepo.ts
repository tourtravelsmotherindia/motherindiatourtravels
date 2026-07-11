import { prisma } from "@/lib/db/prisma";

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

export async function getAllStates(countryId?: string): Promise<StateItem[]> {
  const states = await prisma.state.findMany({
    where: countryId ? { countryId } : undefined,
    orderBy: { name: "asc" },
  });
  return states as StateItem[];
}

export async function getFeaturedStates(): Promise<StateItem[]> {
  const states = await prisma.state.findMany({
    where: { isFeatured: true },
    orderBy: { name: "asc" },
  });
  return states as StateItem[];
}

export async function getStateBySlug(slug: string): Promise<StateItem | null> {
  const state = await prisma.state.findUnique({ where: { slug } });
  return state as StateItem | null;
}
