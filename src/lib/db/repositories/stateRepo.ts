import { prisma } from "@/lib/db/prisma";
import { type StateItem } from "@/types/state";

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
