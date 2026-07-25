import { type Metadata } from "next";
import { notFound } from "next/navigation";
import { Suspense } from "react";

import BlogDetailClient from "@/components/blogs/BlogDetailClient";
import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getBlogPostBySlug, getPublishedBlogPosts } from "@/lib/db/repositories/blogRepo";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

interface BlogPostPageProps {
  params: Promise<{
    slug: string;
  }>;
}

export async function generateStaticParams() {
  const posts = await getPublishedBlogPosts();
  return posts.map((post) => ({
    slug: post.slug,
  }));
}

export async function generateMetadata({ params }: BlogPostPageProps): Promise<Metadata> {
  const { slug } = await params;
  const post = await getBlogPostBySlug(slug);

  if (!post) {
    return {
      title: "Post Not Found | Mother India Tour Travels",
      description: "The requested travel blog post could not be found.",
    };
  }

  return {
    title: `${post.seoTitle || post.title} | Mother India Tour Travels`,
    description: post.seoDescription || post.excerpt,
    keywords: post.seoKeywords.length > 0 ? post.seoKeywords : post.tags,
    alternates: {
      canonical: `/blogs/${slug}/`,
    },
  };
}

export default async function BlogPostPage({ params }: BlogPostPageProps) {
  const { slug } = await params;
  const [post, companyData] = await Promise.all([getBlogPostBySlug(slug), getCompanyData()]);

  if (!post) {
    notFound();
  }

  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading post details...
        </div>
      }
    >
      <BreadcrumbJsonLd path={`/blogs/${slug}`} />
      <BlogDetailClient post={post} companyData={companyData} />
    </Suspense>
  );
}
