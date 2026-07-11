import { prisma } from "@/lib/db/prisma";
import type { BlogPostDetail, BlogPostItem } from "@/types/blog";

const blogInclude = {
  destination: { select: { name: true, slug: true } },
  category: { select: { name: true, slug: true } },
} as const;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapBlogPost(b: any): BlogPostItem {
  return {
    id: b.id,
    slug: b.slug,
    title: b.title,
    excerpt: b.excerpt,
    coverImage: b.coverImage,
    authorName: b.authorName,
    authorImage: b.authorImage,
    readingTimeMinutes: b.readingTimeMinutes,
    publishedAt: b.publishedAt,
    isPublished: b.isPublished,
    isFeatured: b.isFeatured,
    tags: b.tags,
    destinationId: b.destinationId,
    destinationName: b.destination?.name ?? null,
    destinationSlug: b.destination?.slug ?? null,
    categoryId: b.categoryId,
    categoryName: b.category?.name ?? null,
    categorySlug: b.category?.slug ?? null,
    createdAt: b.createdAt,
    updatedAt: b.updatedAt,
  };
}

export async function getPublishedBlogPosts(): Promise<BlogPostItem[]> {
  const posts = await prisma.blogPost.findMany({
    where: { isPublished: true },
    include: blogInclude,
    orderBy: { publishedAt: "desc" },
  });
  return posts.map(mapBlogPost);
}

export async function getFeaturedBlogPosts(): Promise<BlogPostItem[]> {
  const posts = await prisma.blogPost.findMany({
    where: { isPublished: true, isFeatured: true },
    include: blogInclude,
    orderBy: { publishedAt: "desc" },
  });
  return posts.map(mapBlogPost);
}

export async function getBlogPostBySlug(slug: string): Promise<BlogPostDetail | null> {
  const post = await prisma.blogPost.findUnique({
    where: { slug },
    include: blogInclude,
  });
  if (!post || !post.isPublished) return null;

  return { ...mapBlogPost(post), content: post.content };
}
