"use client";

import { motion } from "framer-motion";
import { Calendar, Clock, Search } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import Pagination from "@/components/shared/Pagination";
import Dropdown from "@/components/ui/Dropdown";
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
  isFeatured: boolean;
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

export default function BlogsClient({ initialBlogs, categories, companyData }: BlogsClientProps) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [sortBy, setSortBy] = useState("featured");
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

  // Sort blogs based on selected sort criteria
  const sortedBlogs = useMemo(() => {
    const cloned = [...filteredBlogs];
    if (sortBy === "featured") {
      cloned.sort((a, b) => {
        if (a.isFeatured && !b.isFeatured) return -1;
        if (!a.isFeatured && b.isFeatured) return 1;
        const dateA = a.publishedAt ? new Date(a.publishedAt).getTime() : 0;
        const dateB = b.publishedAt ? new Date(b.publishedAt).getTime() : 0;
        return dateB - dateA;
      });
    } else if (sortBy === "newest") {
      cloned.sort((a, b) => {
        const dateA = a.publishedAt ? new Date(a.publishedAt).getTime() : 0;
        const dateB = b.publishedAt ? new Date(b.publishedAt).getTime() : 0;
        return dateB - dateA;
      });
    } else if (sortBy === "oldest") {
      cloned.sort((a, b) => {
        const dateA = a.publishedAt ? new Date(a.publishedAt).getTime() : 0;
        const dateB = b.publishedAt ? new Date(b.publishedAt).getTime() : 0;
        return dateA - dateB;
      });
    }
    return cloned;
  }, [filteredBlogs, sortBy]);

  // Pagination logic
  const totalPages = Math.ceil(sortedBlogs.length / itemsPerPage);
  const paginatedBlogs = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return sortedBlogs.slice(startIndex, startIndex + itemsPerPage);
  }, [sortedBlogs, currentPage]);

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

        {/* Main Grid Section (Matches FAQ Page Structure) */}
        <div className="layout-container">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            {/* Sidebar Column - Category Tabs */}
            <div className="lg:col-span-3 lg:sticky lg:top-28">
              <h2 className="text-xl md:text-2xl font-bold text-neutral-900 mb-5">Categories</h2>

              {/* Category Tab List - Desktop view */}
              <div className="hidden lg:flex flex-col gap-2 font-semibold text-base">
                <button
                  onClick={() => handleCategorySelect("All")}
                  className={`text-left py-2.5 px-4 rounded-xl transition-all duration-200 cursor-pointer ${
                    selectedCategory === "All"
                      ? "bg-neutral-100/90 text-black font-semibold"
                      : "text-neutral-700 hover:bg-neutral-50/90 hover:text-black font-semibold"
                  }`}
                >
                  All Categories
                </button>
                {categories.map((cat) => {
                  const isActive = selectedCategory === cat.slug;
                  return (
                    <button
                      key={cat.id}
                      onClick={() => handleCategorySelect(cat.slug)}
                      className={`text-left py-2.5 px-4 rounded-xl transition-all duration-200 cursor-pointer ${
                        isActive
                          ? "bg-neutral-100/90 text-black font-semibold"
                          : "text-neutral-700 hover:bg-neutral-50/90 hover:text-black font-semibold"
                      }`}
                    >
                      {cat.name}
                    </button>
                  );
                })}
              </div>

              {/* Horizontal Scroll tabs - Mobile view */}
              <div className="flex lg:hidden gap-2 overflow-x-auto pb-4 scrollbar-none snap-x -mx-4 px-4">
                <button
                  onClick={() => handleCategorySelect("All")}
                  className={`snap-center shrink-0 py-2 px-4 rounded-full text-sm font-semibold transition-all duration-200 cursor-pointer ${
                    selectedCategory === "All"
                      ? "bg-neutral-100/90 text-black border border-transparent"
                      : "bg-white text-neutral-700 hover:bg-neutral-50/90 hover:text-black border border-neutral-200"
                  }`}
                >
                  All
                </button>
                {categories.map((cat) => {
                  const isActive = selectedCategory === cat.slug;
                  return (
                    <button
                      key={cat.id}
                      onClick={() => handleCategorySelect(cat.slug)}
                      className={`snap-center shrink-0 py-2 px-4 rounded-full text-sm font-semibold transition-all duration-200 cursor-pointer ${
                        isActive
                          ? "bg-neutral-100/90 text-black border border-transparent"
                          : "bg-white text-neutral-700 hover:bg-neutral-50/90 hover:text-black border border-neutral-200"
                      }`}
                    >
                      {cat.name}
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Content Column - Search Input & Blogs Grid */}
            <div className="lg:col-span-9">
              {/* Search Box (FAQ page style) */}
              <div className="relative mb-8">
                <input
                  type="text"
                  placeholder="Search blogs..."
                  value={searchQuery}
                  onChange={(e) => {
                    setSearchQuery(e.target.value);
                    setCurrentPage(1);
                  }}
                  className="w-full pl-12 pr-4 py-4 bg-white border border-neutral-200 rounded-2xl focus:outline-none focus:border-neutral-300 transition-all duration-200 text-neutral-900 font-medium placeholder-neutral-400 text-base shadow-[0_2px_8px_rgba(0,0,0,0.01)]"
                />
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-neutral-400 w-5 h-5 pointer-events-none z-10" />
              </div>

              {/* Header controls: Results Count & Sort Selection */}
              <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-8 px-1">
                <div>
                  <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
                    Showing {sortedBlogs.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
                    {Math.min(currentPage * itemsPerPage, sortedBlogs.length)} of{" "}
                    {sortedBlogs.length} {sortedBlogs.length === 1 ? "blog post" : "blog posts"}
                  </p>
                </div>

                <div className="flex items-center gap-3 w-full sm:w-auto justify-end">
                  <Dropdown
                    options={[
                      { value: "featured", label: "Featured" },
                      { value: "newest", label: "Newest First" },
                      { value: "oldest", label: "Oldest First" },
                    ]}
                    value={sortBy}
                    onChange={(val) => {
                      setSortBy(val);
                      setCurrentPage(1);
                    }}
                    variant="slim"
                    label="Sort"
                  />
                </div>
              </div>

              {/* Blogs Grid */}
              {sortedBlogs.length === 0 ? (
                <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2rem] max-w-4xl mx-auto">
                  <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                    No blog posts found
                  </h3>
                  <p className="text-neutral-505 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                    Try searching for other terms or selecting a different category.
                  </p>
                </div>
              ) : (
                <div>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-8 md:gap-10">
                    {paginatedBlogs.map((blog, idx) => (
                      <motion.article
                        key={blog.id}
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.5, delay: Math.min(idx * 0.05, 0.3) }}
                        className="group relative flex flex-col bg-white overflow-hidden"
                      >
                        {/* Image Wrapper (Clean rounded design without corner color cycle decorations) */}
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
                            priority={idx < 2}
                          />
                        </div>

                        {/* Blog Content */}
                        <div className="flex-1 flex flex-col items-start">
                          {/* Category Pill */}
                          {blog.categoryName && (
                            <span className="px-3.5 py-1 bg-neutral-105 text-[10px] font-bold uppercase tracking-wider rounded-full text-neutral-500 mb-3 group-hover:bg-neutral-100 group-hover:text-black transition-colors duration-300">
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
                          <p className="text-sm md:text-base text-neutral-500 leading-relaxed font-normal line-clamp-3">
                            {blog.excerpt}
                          </p>
                        </div>

                        {/* Full Clickable Card Overlay */}
                        <Link
                          href={`/blogs/${blog.slug}`}
                          className="absolute inset-0 z-10 cursor-pointer"
                          aria-label={`View details for ${blog.title}`}
                        />
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
        </div>
      </div>
    </PageShell>
  );
}
