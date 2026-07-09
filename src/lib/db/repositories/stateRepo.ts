import { prisma } from "@/lib/db/prisma";

export async function getStates() {
  const states = await prisma.state.findMany();
  return states.map((s) => ({
    id: s.id,
    name: s.name,
    slug: s.slug,
    country_id: s.countryId,
    capital: s.capital,
    is_featured: s.isFeatured,
    package_count: s.packageCount,
  }));
}

export async function getStatesWithPackages() {
  const states = await prisma.state.findMany({
    include: { packages: { select: { id: true } } },
  });
  return states.map((s) => ({
    id: s.id,
    name: s.name,
    slug: s.slug,
    country_id: s.countryId,
    capital: s.capital,
    is_featured: s.isFeatured,
    package_ids: s.packages.map((p) => p.id),
    package_count: s.packageCount,
  }));
}
