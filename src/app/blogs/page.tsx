import { type Metadata } from "next";
import { Suspense } from "react";

import BlogsClient from "@/components/blogs/BlogsClient";
import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getBlogCategories, getPublishedBlogPosts } from "@/lib/db/repositories/blogRepo";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

export const metadata: Metadata = {
  title: "Travel Blogs & Stories | Mother India Tour Travels",
  description:
    "Read travel guides, expert tips, itineraries, and stories from Mother India Tour Travels. Get inspired for your next holiday package in India and abroad.",
  alternates: {
    canonical: "/blogs/",
  },
};

export default async function BlogsPage() {
  const [blogs, categories, companyData] = await Promise.all([
    getPublishedBlogPosts(),
    getBlogCategories(),
    getCompanyData(),
  ]);

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading travel blogs...
        </div>
      }
    >
      <BreadcrumbJsonLd path="/blogs" />
      <BlogsClient initialBlogs={blogs} categories={categories} companyData={companyData} />
    </Suspense>
  );
}
