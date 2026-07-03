"use client";

import { useState } from "react";
import BlogCard from "./BlogCard";

interface BlogMeta {
  slug: string;
  blog_title: string;
  description: string;
  publish_date: string;
  image: string;
}

interface BlogListClientProps {
  blogs: BlogMeta[];
}

const INITIAL_COUNT = 6;
const LOAD_MORE_COUNT = 6;

export default function BlogListClient({ blogs }: BlogListClientProps) {
  const [visibleCount, setVisibleCount] = useState(INITIAL_COUNT);

  const visibleBlogs = blogs.slice(0, visibleCount);
  const hasMore = visibleCount < blogs.length;

  return (
    <div>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {visibleBlogs.map((blog) => (
          <BlogCard
            key={blog.slug}
            slug={blog.slug}
            title={blog.blog_title}
            description={blog.description}
            publishDate={blog.publish_date}
            image={blog.image}
          />
        ))}
      </div>

      {hasMore && (
        <div className="text-center mt-10">
          <button
            onClick={() =>
              setVisibleCount((prev) => prev + LOAD_MORE_COUNT)
            }
            className="inline-flex items-center gap-2 bg-black text-white px-8 py-3 rounded-full font-medium hover:bg-black/80 transition-colors"
          >
            Load More
            <i className="bi bi-arrow-down" />
          </button>
          <p className="text-xs text-secondary2 mt-2">
            Showing {visibleCount} of {blogs.length} articles
          </p>
        </div>
      )}

      {!hasMore && blogs.length > INITIAL_COUNT && (
        <p className="text-center text-sm text-secondary2 mt-10">
          All {blogs.length} articles loaded
        </p>
      )}
    </div>
  );
}
