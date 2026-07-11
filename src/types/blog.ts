// Blog domain types — v2.0

export interface BlogPostCategoryItem {
  id: string;
  name: string;
  slug: string;
}

export interface BlogPostItem {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  coverImage: string;
  authorName: string;
  authorImage: string;
  readingTimeMinutes: number;
  publishedAt: Date | null;
  isPublished: boolean;
  isFeatured: boolean;
  tags: string[];
  destinationId: string | null;
  destinationName: string | null;
  destinationSlug: string | null;
  categoryId: string | null;
  categoryName: string | null;
  categorySlug: string | null;
  createdAt: Date;
  updatedAt: Date;
}

export interface BlogPostDetail extends BlogPostItem {
  content: string; // Markdown
}
