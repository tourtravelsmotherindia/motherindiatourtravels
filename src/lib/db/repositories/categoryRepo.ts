import { prisma } from "@/lib/db/prisma";

export async function getCategories() {
  const categories = await prisma.category.findMany();
  return categories.map((c) => ({
    id: c.id,
    name: c.name,
    slug: c.slug,
    description: c.description,
    icon: c.icon,
    seo_title: c.seoTitle,
    seo_description: c.seoDescription,
    package_count: c.packageCount,
  }));
}
