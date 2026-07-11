import { prisma } from "@/lib/db/prisma";

export interface CategoryItem {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon: string;
  sortOrder: number;
  seoTitle: string;
  seoDescription: string;
}

export async function getAllCategories(): Promise<CategoryItem[]> {
  const categories = await prisma.category.findMany({
    orderBy: { sortOrder: "asc" },
  });

  return categories.map((c) => ({
    id: c.id,
    name: c.name,
    slug: c.slug,
    description: c.description,
    icon: c.icon,
    sortOrder: c.sortOrder,
    seoTitle: c.seoTitle,
    seoDescription: c.seoDescription,
  }));
}

export async function getCategoryBySlug(slug: string): Promise<CategoryItem | null> {
  const c = await prisma.category.findUnique({ where: { slug } });
  if (!c) return null;

  return {
    id: c.id,
    name: c.name,
    slug: c.slug,
    description: c.description,
    icon: c.icon,
    sortOrder: c.sortOrder,
    seoTitle: c.seoTitle,
    seoDescription: c.seoDescription,
  };
}
