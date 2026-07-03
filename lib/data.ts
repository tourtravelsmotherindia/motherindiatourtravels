import fs from "fs";
import path from "path";
import type {
  CollectionData,
  PackageData,
  BlogData,
  BlogMeta,
  SiteConfig,
  MenuWrapper,
  SlugMappings,
  BlogListData,
} from "@/types";

// Re-export pure utilities for convenience
export { decodeJsonField, resolveMediaUrl } from "@/lib/utils";

// ─── Paths ───────────────────────────────────────────────────
const DATA_DIR = path.join(process.cwd(), "data");
const COLLECTIONS_DIR = path.join(DATA_DIR, "collections");
const PACKAGES_DIR = path.join(DATA_DIR, "packages");
const BLOGS_DIR = path.join(DATA_DIR, "blogs");

// ─── Collections ─────────────────────────────────────────────
export function getCollection(slug: string): CollectionData | null {
  try {
    const filePath = path.join(COLLECTIONS_DIR, `${slug}.json`);
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as CollectionData;
  } catch {
    return null;
  }
}

export function getAllCollectionSlugs(): string[] {
  try {
    const files = fs.readdirSync(COLLECTIONS_DIR);
    return files
      .filter((f) => f.endsWith(".json"))
      .map((f) => f.replace(/\.json$/, ""));
  } catch {
    return [];
  }
}

// ─── Packages ────────────────────────────────────────────────
export function getPackage(slug: string): PackageData | null {
  try {
    const filePath = path.join(PACKAGES_DIR, `${slug}.json`);
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as PackageData;
  } catch {
    return null;
  }
}

export function getAllPackageSlugs(): string[] {
  try {
    const mappingsPath = path.join(DATA_DIR, "slug-mappings.json");
    const raw = fs.readFileSync(mappingsPath, "utf-8");
    const mappings: SlugMappings = JSON.parse(raw);
    return mappings.known_package_slugs || [];
  } catch {
    return [];
  }
}

// ─── Blogs ───────────────────────────────────────────────────
export function getBlog(slug: string): BlogData | null {
  try {
    const filePath = path.join(BLOGS_DIR, `${slug}.json`);
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as BlogData;
  } catch {
    return null;
  }
}

export function getAllBlogSlugs(): string[] {
  try {
    const files = fs.readdirSync(BLOGS_DIR);
    return files
      .filter((f) => f.endsWith(".json"))
      .map((f) => f.replace(/\.json$/, ""));
  } catch {
    return [];
  }
}

/**
 * Get blog metadata for all blogs, sorted by publish_date descending.
 * Used by the blog listing page.
 */
export function getAllBlogMeta(): BlogMeta[] {
  try {
    const slugs = getAllBlogSlugs();
    const blogs: BlogMeta[] = [];

    for (const slug of slugs) {
      const blog = getBlog(slug);
      if (!blog) continue;

      // Find first valid image (prefer uploads_media/blog/ paths)
      const firstImage =
        blog.images?.find(
          (img) =>
            img.url?.includes("uploads_media/blog/") ||
            img.url?.startsWith("http")
        ) || blog.images?.[0];

      blogs.push({
        slug: blog.slug,
        blog_title: blog.blog_title,
        description: blog.description,
        publish_date: blog.publish_date,
        image: firstImage?.url || "",
      });
    }

    // Sort by publish_date descending
    blogs.sort((a, b) => {
      const dateA = new Date(a.publish_date).getTime();
      const dateB = new Date(b.publish_date).getTime();
      return dateB - dateA;
    });

    return blogs;
  } catch {
    return [];
  }
}

/**
 * Get a few recent blog posts for use as "related blogs" fallback
 * (since related_blogs is always empty in the data).
 */
export function getRecentBlogs(count: number = 6): BlogMeta[] {
  return getAllBlogMeta().slice(0, count);
}

// ─── Site Config ─────────────────────────────────────────────
export function getSiteConfig(): SiteConfig | null {
  try {
    const filePath = path.join(DATA_DIR, "site-config.json");
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as SiteConfig;
  } catch {
    return null;
  }
}

// ─── Menu ────────────────────────────────────────────────────
export function getMenu(): MenuWrapper | null {
  try {
    const filePath = path.join(DATA_DIR, "menu.json");
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as MenuWrapper;
  } catch {
    return null;
  }
}

// ─── Blog List Meta ──────────────────────────────────────────
export function getBlogListMeta(): BlogListData | null {
  try {
    const filePath = path.join(DATA_DIR, "blog-list", "index.json");
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as BlogListData;
  } catch {
    return null;
  }
}

// ─── Slug Mappings ───────────────────────────────────────────
export function getSlugMappings(): SlugMappings | null {
  try {
    const filePath = path.join(DATA_DIR, "slug-mappings.json");
    const raw = fs.readFileSync(filePath, "utf-8");
    return JSON.parse(raw) as SlugMappings;
  } catch {
    return null;
  }
}

// ─── Resolve Blog Slug from Title ────────────────────────────
/**
 * Given a blog title, resolve to URL-safe slug using slug-mappings.
 */
export function resolveBlogSlug(title: string): string | null {
  const mappings = getSlugMappings();
  if (!mappings) return null;
  return mappings.blog_title_to_slug[title] || null;
}
