"use client";

import { motion } from "framer-motion";
import { Calendar, Clock, Search } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import Pagination from "@/components/shared/Pagination";
import { type CompanyData } from "@/types/company";

interface BlogItem {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  coverImage: string;
  authorName: string;
  authorImage: string;
  readingTimeMinutes: number;
  publishedAt: Date | null;
  categoryName: string | null;
  categorySlug: string | null;
  tags: string[];
}

interface CategoryItem {
  id: string;
  name: string;
  slug: string;
  sortOrder?: number;
}

interface BlogsClientProps {
  initialBlogs: BlogItem[];
  categories: CategoryItem[];
  companyData: CompanyData | null;
}

const CardDecoration = ({ index }: { index: number }) => {
  if (index % 3 === 0) {
    // Card 1: Orange bottom-left, green top-right
    return (
      <>
        <div className="absolute -bottom-6 -left-6 w-16 h-16 bg-[#ff5a36] rounded-full z-10 pointer-events-none" />
        <div className="absolute -top-6 -right-6 w-12 h-12 bg-[#10b981] rounded-full z-10 pointer-events-none" />
      </>
    );
  } else if (index % 3 === 1) {
    // Card 2: Orange top-left, blue bottom-left
    return (
      <>
        <div className="absolute -top-8 -left-8 w-16 h-16 bg-[#f97316] rounded-full z-10 pointer-events-none" />
        <div className="absolute -bottom-6 -left-6 w-12 h-12 bg-[#3b82f6] rounded-full z-10 pointer-events-none" />
      </>
    );
  } else {
    // Card 3: Orange top-left, purple bottom-right
    return (
      <>
        <div className="absolute -top-6 -left-6 w-12 h-12 bg-[#ef4444] rounded-full z-10 pointer-events-none" />
        <div className="absolute -bottom-8 -right-8 w-16 h-16 bg-[#8b5cf6] rounded-full z-10 pointer-events-none" />
      </>
    );
  }
};

export default function BlogsClient({ initialBlogs, categories, companyData }: BlogsClientProps) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 9;

  // Filter blog posts based on search query and category
  const filteredBlogs = useMemo(() => {
    return initialBlogs.filter((blog) => {
      const matchesCategory = selectedCategory === "All" || blog.categorySlug === selectedCategory;
      const matchesSearch =
        blog.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        blog.excerpt.toLowerCase().includes(searchQuery.toLowerCase()) ||
        blog.tags.some((tag) => tag.toLowerCase().includes(searchQuery.toLowerCase()));

      return matchesCategory && matchesSearch;
    });
  }, [initialBlogs, selectedCategory, searchQuery]);

  // Pagination logic
  const totalPages = Math.ceil(filteredBlogs.length / itemsPerPage);
  const paginatedBlogs = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredBlogs.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredBlogs, currentPage]);

  const handlePageChange = (page: number) => {
    setCurrentPage(page);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const handleCategorySelect = (slug: string) => {
    setSelectedCategory(slug);
    setCurrentPage(1);
  };

  const formatDate = (date: Date | null | string) => {
    if (!date) return "";
    const d = new Date(date);
    return d.toLocaleDateString("en-US", {
      month: "long",
      day: "numeric",
      year: "numeric",
    });
  };

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      <div className="pt-12 md:pt-20 pb-section-loose font-sans">
        {/* Header Block matching Policy, FAQ, and About pages layout */}
        <div className="layout-container text-left mb-12 md:mb-16">
          <Breadcrumbs
            items={[{ label: "Home", href: "/" }, { label: "Blogs" }]}
            variant="brackets"
          />
          <h1 className="text-4xl md:text-5xl font-extrabold text-neutral-900 tracking-tight mb-4 leading-tight">
            Travel Blogs & Inspiration
          </h1>
          <p className="text-lg md:text-xl text-neutral-900 font-medium leading-relaxed max-w-3xl">
            Explore guides, local tips, and stories designed to help you plan your next
            unforgettable vacation.
          </p>
        </div>

        {/* Filter Bar & Search Row */}
        <div className="layout-container mb-12">
          <div className="flex flex-col md:flex-row gap-6 justify-between items-stretch md:items-center border-b border-neutral-100 pb-8">
            {/* Horizontal Scroll Categories */}
            <div className="flex items-center gap-2 overflow-x-auto pb-2 md:pb-0 scrollbar-none snap-x flex-1 max-w-3xl">
              <button
                onClick={() => handleCategorySelect("All")}
                className={`snap-center shrink-0 py-2.5 px-6 rounded-full text-sm font-semibold transition-all duration-300 ${
                  selectedCategory === "All"
                    ? "bg-brand text-white shadow-premium"
                    : "bg-neutral-50 text-neutral-600 hover:bg-neutral-100 hover:text-black border border-neutral-200/50"
                }`}
              >
                All
              </button>
              {categories.map((cat) => (
                <button
                  key={cat.id}
                  onClick={() => handleCategorySelect(cat.slug)}
                  className={`snap-center shrink-0 py-2.5 px-6 rounded-full text-sm font-semibold transition-all duration-300 ${
                    selectedCategory === cat.slug
                      ? "bg-brand text-white shadow-premium"
                      : "bg-neutral-50 text-neutral-600 hover:bg-neutral-100 hover:text-black border border-neutral-200/50"
                  }`}
                >
                  {cat.name}
                </button>
              ))}
            </div>

            {/* Search Input */}
            <div className="relative w-full md:w-80 shrink-0">
              <input
                type="text"
                placeholder="Search blogs..."
                value={searchQuery}
                onChange={(e) => {
                  setSearchQuery(e.target.value);
                  setCurrentPage(1);
                }}
                className="w-full pl-11 pr-4 py-3.5 bg-neutral-50 border border-neutral-200 rounded-full focus:outline-none focus:border-brand focus:bg-white transition-all duration-200 text-neutral-900 font-medium placeholder-neutral-400 text-sm shadow-[0_2px_8px_rgba(0,0,0,0.01)]"
              />
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-neutral-400 w-4 h-4 pointer-events-none" />
            </div>
          </div>
        </div>

        {/* Blogs Grid */}
        <div className="layout-container">
          {filteredBlogs.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2rem] max-w-4xl mx-auto">
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">No blog posts found</h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                Try searching for other terms or selecting a different category.
              </p>
            </div>
          ) : (
            <div>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 md:gap-10">
                {paginatedBlogs.map((blog, idx) => (
                  <motion.article
                    key={blog.id}
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    transition={{ duration: 0.5, delay: Math.min(idx * 0.05, 0.3) }}
                    className="group flex flex-col bg-white overflow-hidden"
                  >
                    {/* Image Wrapper with clipped corner decoration elements */}
                    <div className="relative aspect-[16/10] w-full rounded-[1.75rem] md:rounded-[2.25rem] overflow-hidden mb-5 bg-neutral-100 shadow-[0_4px_24px_rgba(0,0,0,0.02)]">
                      <Image
                        src={
                          blog.coverImage ||
                          "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80"
                        }
                        alt={blog.title}
                        fill
                        sizes="(max-width: 768px) 100vw, (max-width: 1024px) 50vw, 33vw"
                        className="object-cover transition-transform duration-700 group-hover:scale-103"
                        priority={idx < 3}
                      />
                      {/* Interactive hover overlays/decorations matching references */}
                      <CardDecoration index={idx} />
                    </div>

                    {/* Blog Content */}
                    <div className="flex-1 flex flex-col items-start">
                      {/* Category Pill */}
                      {blog.categoryName && (
                        <span className="px-3.5 py-1 bg-neutral-100 text-[10px] font-bold uppercase tracking-wider rounded-full text-neutral-500 mb-3 group-hover:bg-brand-light group-hover:text-brand transition-colors duration-300">
                          {blog.categoryName}
                        </span>
                      )}

                      {/* Date & Reading Time */}
                      <div className="flex items-center gap-3 text-xs text-neutral-400 font-semibold mb-3">
                        <span className="flex items-center gap-1.5">
                          <Calendar className="w-3.5 h-3.5" />
                          {formatDate(blog.publishedAt)}
                        </span>
                        <span>•</span>
                        <span className="flex items-center gap-1.5">
                          <Clock className="w-3.5 h-3.5" />
                          {blog.readingTimeMinutes} min read
                        </span>
                      </div>

                      {/* Title */}
                      <h3 className="text-xl md:text-2xl font-bold font-display text-neutral-900 tracking-tight leading-[1.2] mb-3 group-hover:text-brand transition-colors duration-200">
                        <Link href={`/blogs/${blog.slug}`}>{blog.title}</Link>
                      </h3>

                      {/* Excerpt */}
                      <p className="text-sm md:text-base text-neutral-500 leading-relaxed font-normal line-clamp-3 mb-4">
                        {blog.excerpt}
                      </p>

                      {/* Read More Link */}
                      <Link
                        href={`/blogs/${blog.slug}`}
                        className="text-sm font-bold text-brand hover:text-brand-hover inline-flex items-center gap-1 mt-auto group/link"
                      >
                        Read Post
                        <span className="transform translate-x-0 group-hover/link:translate-x-1 transition-transform duration-200">
                          →
                        </span>
                      </Link>
                    </div>
                  </motion.article>
                ))}
              </div>

              {totalPages > 1 && (
                <Pagination
                  currentPage={currentPage}
                  totalPages={totalPages}
                  onPageChange={handlePageChange}
                  className="mt-16"
                />
              )}
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}
