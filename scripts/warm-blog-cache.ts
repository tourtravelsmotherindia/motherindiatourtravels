import "dotenv/config";

import {
  getBlogCategories,
  getBlogPostBySlug,
  getFeaturedBlogPosts,
  getPublishedBlogPosts,
} from "../src/lib/db/repositories/blogRepo";

async function main() {
  console.log("Warming blog cache...");
  // Force the build phase environment so withBuildCache writes cache files
  process.env.NEXT_PHASE = "phase-production-build";

  const categories = await getBlogCategories();
  console.log(`Cached categories: ${categories.length}`);

  const featured = await getFeaturedBlogPosts();
  console.log(`Cached featured posts: ${featured.length}`);

  const posts = await getPublishedBlogPosts();
  console.log(`Cached published posts: ${posts.length}`);

  for (const post of posts) {
    const detail = await getBlogPostBySlug(post.slug);
    console.log(`Cached post detail: ${post.slug} (found: ${!!detail})`);
  }

  console.log("Blog cache warmed successfully!");
}

main().catch(console.error);
