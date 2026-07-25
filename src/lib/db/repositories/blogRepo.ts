import { withBuildCache } from "@/lib/db/buildCache";
import { prisma } from "@/lib/db/prisma";
import type { BlogPostCategoryItem, BlogPostDetail, BlogPostItem } from "@/types/blog";

const blogInclude = {
  destination: { select: { name: true, slug: true } },
  category: { select: { name: true, slug: true } },
  state: { select: { name: true, slug: true } },
  country: { select: { name: true, slug: true } },
  relatedPackages: {
    include: {
      package: {
        select: {
          id: true,
          name: true,
          slug: true,
          heroImage: true,
          variants: {
            where: { isDefault: true },
            select: { basePrice: true, discountedPrice: true },
          },
        },
      },
    },
  },
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
    stateId: b.stateId,
    stateName: b.state?.name ?? null,
    stateSlug: b.state?.slug ?? null,
    countryId: b.countryId,
    countryName: b.country?.name ?? null,
    countrySlug: b.country?.slug ?? null,
    seoTitle: b.seoTitle ?? "",
    seoDescription: b.seoDescription ?? "",
    seoKeywords: b.seoKeywords ?? [],
    images: b.images ?? [],
    createdAt: b.createdAt,
    updatedAt: b.updatedAt,
  };
}

export async function getPublishedBlogPosts(): Promise<BlogPostItem[]> {
  return withBuildCache("published-blog-posts", async () => {
    const posts = await prisma.blogPost.findMany({
      where: { isPublished: true },
      include: blogInclude,
      orderBy: { publishedAt: "desc" },
    });
    return posts.map(mapBlogPost);
  });
}

export async function getFeaturedBlogPosts(): Promise<BlogPostItem[]> {
  return withBuildCache("featured-blog-posts", async () => {
    const posts = await prisma.blogPost.findMany({
      where: { isPublished: true, isFeatured: true },
      include: blogInclude,
      orderBy: { publishedAt: "desc" },
    });
    return posts.map(mapBlogPost);
  });
}

export async function getBlogPostBySlug(slug: string): Promise<BlogPostDetail | null> {
  return withBuildCache(`blog-post-detail-${slug}`, async () => {
    const post = await prisma.blogPost.findUnique({
      where: { slug },
      include: blogInclude,
    });
    if (!post || !post.isPublished) return null;

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const relatedPackages = (post.relatedPackages || []).map((rp: any) => {
      const pkg = rp.package;
      const defaultVariant = pkg.variants?.[0] ?? null;
      return {
        id: pkg.id,
        name: pkg.name,
        slug: pkg.slug,
        heroImage: pkg.heroImage,
        basePrice: defaultVariant?.basePrice ?? null,
        discountedPrice: defaultVariant?.discountedPrice ?? null,
      };
    });

    return {
      ...mapBlogPost(post),
      content: post.content,
      relatedPackages,
    };
  });
}

export async function getBlogCategories(): Promise<BlogPostCategoryItem[]> {
  return withBuildCache("blog-categories", async () => {
    return prisma.blogPostCategory.findMany({
      orderBy: { sortOrder: "asc" },
      select: {
        id: true,
        name: true,
        slug: true,
        sortOrder: true,
      },
    });
  });
}
