import { Metadata } from "next";
import { getAllBlogMeta, getBlogListMeta } from "@/lib/data";
import BlogListClient from "@/components/BlogListClient";

const blogListMeta = getBlogListMeta();

export const metadata: Metadata = {
  title: blogListMeta?.title || "Travel Blog",
  description:
    blogListMeta?.description ||
    "Travel tips, guides, and inspiration for your next adventure",
};

export default function BlogListingPage() {
  const allBlogs = getAllBlogMeta();

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      {/* Header */}
      <div className="text-center mb-12">
        <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-black mb-4">
          {blogListMeta?.h1 || blogListMeta?.title || "Our Travel Blog"}
        </h1>
        {blogListMeta?.description && (
          <p className="text-secondary max-w-2xl mx-auto">
            {blogListMeta.description}
          </p>
        )}
      </div>

      {/* Blog cards with client-side Load More */}
      <BlogListClient blogs={allBlogs} />
    </div>
  );
}
