import { prisma } from "@/lib/db/prisma";

export async function getBlogs() {
  const blogs = await prisma.blogPost.findMany();
  return {
    total: blogs.length,
    blogs: blogs.map((b) => ({
      id: b.id,
      slug: b.slug,
      title: b.title,
      category: b.category,
      destinations: JSON.parse(b.destinations),
      excerpt: b.excerpt,
      author: b.author,
      tags: JSON.parse(b.tags),
    })),
  };
}
