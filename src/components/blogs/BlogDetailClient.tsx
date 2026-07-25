"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ArrowLeft, Calendar, Clock, Copy } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import { type CompanyData } from "@/types/company";

interface RelatedPackage {
  id: string;
  name: string;
  slug: string;
  heroImage: string;
  basePrice: number | null;
  discountedPrice: number | null;
}

interface BlogPostDetailItem {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  content: string; // Markdown
  coverImage: string;
  authorName: string;
  authorImage: string;
  readingTimeMinutes: number;
  publishedAt: Date | null;
  categoryName: string | null;
  categorySlug: string | null;
  tags: string[];
  images: string[];
  destinationName: string | null;
  destinationSlug: string | null;
  stateName: string | null;
  stateSlug: string | null;
  countryName: string | null;
  countrySlug: string | null;
  relatedPackages: RelatedPackage[];
}

interface BlogDetailClientProps {
  post: BlogPostDetailItem;
  companyData: CompanyData | null;
}

// Custom simple Markdown to JSX renderer
function parseMarkdownToJSX(markdown: string) {
  if (!markdown) return null;

  const blocks = markdown.split(/\n\n+/);

  return blocks.map((block, idx) => {
    const trimmed = block.trim();
    if (!trimmed) return null;

    // Headers
    if (trimmed.startsWith("### ")) {
      const text = trimmed.replace("### ", "");
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, "-");
      return (
        <h3
          key={idx}
          id={id}
          className="text-xl font-bold text-neutral-900 mt-8 mb-4 scroll-mt-28 font-display"
        >
          {text}
        </h3>
      );
    }
    if (trimmed.startsWith("## ")) {
      const text = trimmed.replace("## ", "");
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, "-");
      return (
        <h2
          key={idx}
          id={id}
          className="text-2xl font-bold text-neutral-900 mt-10 mb-5 scroll-mt-28 font-display"
        >
          {text}
        </h2>
      );
    }
    if (trimmed.startsWith("# ")) {
      const text = trimmed.replace("# ", "");
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, "-");
      return (
        <h1
          key={idx}
          id={id}
          className="text-3xl font-extrabold text-neutral-900 mt-12 mb-6 scroll-mt-28 font-display"
        >
          {text}
        </h1>
      );
    }

    // Unordered List
    if (trimmed.startsWith("- ") || trimmed.startsWith("* ")) {
      const items = trimmed.split(/\n[-*]\s+/).map((item) => item.replace(/^[-*]\s+/, "").trim());
      return (
        <ul key={idx} className="list-disc pl-6 space-y-2.5 my-5 text-neutral-800 font-medium">
          {items.map((item, i) => (
            <li key={i}>{parseInlineMarkdown(item)}</li>
          ))}
        </ul>
      );
    }

    // Ordered List
    if (/^\d+\.\s+/.test(trimmed)) {
      const items = trimmed.split(/\n\d+\.\s+/).map((item) => item.replace(/^\d+\.\s+/, "").trim());
      return (
        <ol key={idx} className="list-decimal pl-6 space-y-2.5 my-5 text-neutral-800 font-medium">
          {items.map((item, i) => (
            <li key={i}>{parseInlineMarkdown(item)}</li>
          ))}
        </ol>
      );
    }

    // Paragraph
    return (
      <p
        key={idx}
        className="text-neutral-800 leading-relaxed font-medium text-sm md:text-base mb-6"
      >
        {parseInlineMarkdown(trimmed)}
      </p>
    );
  });
}

function parseInlineMarkdown(text: string) {
  const html = text
    .replace(/\*\*(.*?)\*\*/g, "<strong>$1</strong>")
    .replace(/\*(.*?)\*/g, "<em>$1</em>")
    .replace(
      /\[(.*?)\]\((.*?)\)/g,
      '<a href="$2" target="_blank" rel="noopener noreferrer" class="text-brand hover:underline font-semibold">$1</a>',
    );

  return <span dangerouslySetInnerHTML={{ __html: html }} />;
}

// Extract headers dynamically for Table of Contents
function extractHeaders(markdown: string) {
  if (!markdown) return [];
  const lines = markdown.split("\n");
  const headers: { id: string; title: string; level: number }[] = [];

  lines.forEach((line) => {
    const trimmed = line.trim();
    if (trimmed.startsWith("## ")) {
      const title = trimmed.replace("## ", "");
      const id = title.toLowerCase().replace(/[^a-z0-9]+/g, "-");
      headers.push({ id, title, level: 2 });
    } else if (trimmed.startsWith("### ")) {
      const title = trimmed.replace("### ", "");
      const id = title.toLowerCase().replace(/[^a-z0-9]+/g, "-");
      headers.push({ id, title, level: 3 });
    }
  });

  return headers;
}

export default function BlogDetailClient({ post, companyData }: BlogDetailClientProps) {
  const [activeId, setActiveId] = useState<string>("");
  const [scrollProgress, setScrollProgress] = useState(0);
  const [copied, setCopied] = useState(false);

  const headers = useMemo(() => extractHeaders(post.content), [post.content]);

  // Handle scroll progress bar
  useEffect(() => {
    const handleScroll = () => {
      const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
      if (totalHeight > 0) {
        const progress = (window.scrollY / totalHeight) * 100;
        setScrollProgress(progress);
      }
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  // Scrollspy for active Table of Contents element
  useEffect(() => {
    if (headers.length === 0) return;

    const handleScrollspy = () => {
      const scrollPosition = window.scrollY + 160;

      for (let i = 0; i < headers.length; i++) {
        const element = document.getElementById(headers[i].id);
        if (element) {
          const top = element.offsetTop;
          const nextElement =
            i < headers.length - 1 ? document.getElementById(headers[i + 1].id) : null;
          const bottom = nextElement
            ? nextElement.offsetTop
            : document.documentElement.scrollHeight;

          if (scrollPosition >= top && scrollPosition < bottom) {
            setActiveId(headers[i].id);
            break;
          }
        }
      }
    };

    window.addEventListener("scroll", handleScrollspy);
    handleScrollspy();

    return () => window.removeEventListener("scroll", handleScrollspy);
  }, [headers]);

  const handleCopyLink = () => {
    navigator.clipboard.writeText(window.location.href);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
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

  const shareUrls = useMemo(() => {
    if (typeof window === "undefined") return { facebook: "", twitter: "", whatsapp: "" };
    const currentUrl = encodeURIComponent(window.location.href);
    const title = encodeURIComponent(post.title);
    return {
      facebook: `https://www.facebook.com/sharer/sharer.php?u=${currentUrl}`,
      twitter: `https://twitter.com/intent/tweet?url=${currentUrl}&text=${title}`,
      whatsapp: `https://api.whatsapp.com/send?text=${title}%20${currentUrl}`,
    };
  }, [post.title]);

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      {/* Reading progress bar */}
      <div
        className="fixed top-0 left-0 h-1 bg-brand z-50 transition-all duration-100"
        style={{ width: `${scrollProgress}%` }}
      />

      <div className="pt-12 md:pt-20 pb-section-loose font-sans">
        {/* Top Header Section */}
        <div className="layout-container text-left mb-8 md:mb-12">
          <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-6">
            <Breadcrumbs
              items={[
                { label: "Home", href: "/" },
                { label: "Blogs", href: "/blogs" },
                { label: post.title.slice(0, 30) + (post.title.length > 30 ? "..." : "") },
              ]}
              variant="brackets"
            />
            <Link
              href="/blogs"
              className="inline-flex items-center gap-1.5 text-xs font-bold text-neutral-500 hover:text-neutral-900 transition-colors uppercase tracking-wider"
            >
              <ArrowLeft className="w-4 h-4" />
              Back to blogs
            </Link>
          </div>

          <h1 className="text-3xl md:text-5xl lg:text-6xl font-extrabold text-neutral-900 tracking-tight leading-[1.1] mb-6 font-display">
            {post.title}
          </h1>

          {/* Author & Read Time Header details */}
          <div className="flex flex-wrap items-center gap-4 pb-6 border-b border-neutral-100">
            <div className="flex items-center gap-3">
              <div className="relative w-10 h-10 rounded-full overflow-hidden bg-neutral-100">
                <Image
                  src={
                    post.authorImage ||
                    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80"
                  }
                  alt={post.authorName}
                  fill
                  sizes="40px"
                  className="object-cover"
                />
              </div>
              <div>
                <span className="block text-sm font-bold text-neutral-900 leading-tight">
                  {post.authorName || "Mother India Editor"}
                </span>
                <span className="block text-[11px] text-neutral-400 font-semibold tracking-wide uppercase mt-0.5">
                  Author
                </span>
              </div>
            </div>

            <div className="hidden sm:block w-px h-6 bg-neutral-200" />

            <div className="flex items-center gap-4 text-xs text-neutral-500 font-semibold">
              <span className="flex items-center gap-1.5">
                <Calendar className="w-4 h-4 text-neutral-400" />
                {formatDate(post.publishedAt)}
              </span>
              <span className="flex items-center gap-1.5">
                <Clock className="w-4 h-4 text-neutral-400" />
                {post.readingTimeMinutes} min read
              </span>
            </div>
          </div>
        </div>

        {/* Layout Grid */}
        <div className="layout-container">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 xl:gap-16 items-start">
            {/* Left Content Area */}
            <div className="lg:col-span-8">
              {/* Cover Image */}
              <div className="relative aspect-[16/9] w-full rounded-[2rem] overflow-hidden mb-12 shadow-premium bg-neutral-100">
                <Image
                  src={
                    post.coverImage ||
                    "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=1200&q=80"
                  }
                  alt={post.title}
                  fill
                  sizes="(max-width: 1024px) 100vw, 850px"
                  className="object-cover"
                  priority
                />
              </div>

              {/* Large Intro Paragraph */}
              <div className="text-lg md:text-xl text-neutral-950 font-semibold leading-relaxed mb-10 border-l-4 border-brand pl-6">
                {post.excerpt}
              </div>

              {/* Table of Contents - Mobile view only */}
              {headers.length > 0 && (
                <div className="block lg:hidden mb-10 py-5 px-6 bg-neutral-50 border border-neutral-150 rounded-2xl">
                  <h2 className="text-lg font-bold text-neutral-950 mb-3 font-display">
                    Table of contents
                  </h2>
                  <ol className="space-y-2 list-decimal list-inside text-sm font-semibold text-neutral-700">
                    {headers.map((h) => (
                      <li key={h.id} style={{ marginLeft: h.level === 3 ? "1rem" : "0" }}>
                        <a
                          href={`#${h.id}`}
                          className="text-neutral-700 hover:text-brand hover:underline transition-colors"
                        >
                          {h.title}
                        </a>
                      </li>
                    ))}
                  </ol>
                </div>
              )}

              {/* Post Body (Markdown) */}
              <article className="prose prose-neutral max-w-none">
                {parseMarkdownToJSX(post.content)}
              </article>

              {/* Blog Gallery Images Section */}
              {post.images && post.images.length > 0 && (
                <div className="mt-12 pt-10 border-t border-neutral-100">
                  <h3 className="text-2xl font-bold text-neutral-950 mb-6 font-display">
                    Trip Gallery & Moments
                  </h3>
                  <div className="grid grid-cols-2 gap-4">
                    {post.images.map((img, i) => (
                      <div
                        key={i}
                        className="relative aspect-[4/3] rounded-2xl overflow-hidden shadow-premium bg-neutral-100 group"
                      >
                        <Image
                          src={img}
                          alt={`Gallery image ${i + 1}`}
                          fill
                          sizes="(max-width: 768px) 50vw, 400px"
                          className="object-cover group-hover:scale-102 transition-transform duration-500"
                        />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Related Tags, Destinations, States & Countries */}
              <div className="mt-12 pt-8 border-t border-neutral-100 flex flex-wrap items-center gap-3">
                <span className="text-xs font-bold text-neutral-400 uppercase tracking-wider mr-2">
                  Tagged:
                </span>
                {post.categoryName && (
                  <span className="px-3.5 py-1 bg-neutral-50 border border-neutral-200 text-xs font-semibold rounded-full text-neutral-800">
                    {post.categoryName}
                  </span>
                )}
                {post.destinationName && (
                  <Link
                    href={`/packages?search=${post.destinationName}`}
                    className="px-3.5 py-1 bg-brand-light text-brand text-xs font-semibold rounded-full hover:bg-brand hover:text-white transition-colors duration-250"
                  >
                    {post.destinationName}
                  </Link>
                )}
                {post.stateName && (
                  <span className="px-3.5 py-1 bg-neutral-50 border border-neutral-200 text-xs font-semibold rounded-full text-neutral-800">
                    {post.stateName}
                  </span>
                )}
                {post.countryName && (
                  <span className="px-3.5 py-1 bg-neutral-50 border border-neutral-200 text-xs font-semibold rounded-full text-neutral-800">
                    {post.countryName}
                  </span>
                )}
                {post.tags.map((tag) => (
                  <span
                    key={tag}
                    className="px-3.5 py-1 bg-neutral-100 text-xs font-medium rounded-full text-neutral-600"
                  >
                    #{tag}
                  </span>
                ))}
              </div>

              {/* Share Post Row */}
              <div className="mt-8 pt-6 border-t border-neutral-100 flex items-center justify-between flex-wrap gap-4">
                <div className="flex items-center gap-2">
                  <span className="text-xs font-bold text-neutral-400 uppercase tracking-wider mr-2">
                    Share:
                  </span>
                  <a
                    href={shareUrls.facebook}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-9 h-9 rounded-full bg-[#3b5998]/5 hover:bg-[#3b5998] hover:text-white text-[#3b5998] flex items-center justify-center transition-all duration-200"
                    aria-label="Share on Facebook"
                  >
                    <svg className="w-4 h-4 fill-current" viewBox="0 0 24 24">
                      <path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1v2h3v3h-3v6.8c4.56-.93 8-4.96 8-9.8z" />
                    </svg>
                  </a>
                  <a
                    href={shareUrls.twitter}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-9 h-9 rounded-full bg-[#1da1f2]/5 hover:bg-[#1da1f2] hover:text-white text-[#1da1f2] flex items-center justify-center transition-all duration-200"
                    aria-label="Share on X"
                  >
                    <svg className="w-4 h-4 fill-current" viewBox="0 0 24 24">
                      <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                    </svg>
                  </a>
                  <a
                    href={shareUrls.whatsapp}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-9 h-9 rounded-full bg-[#25d366]/5 hover:bg-[#25d366] hover:text-white text-[#25d366] flex items-center justify-center transition-all duration-200"
                    aria-label="Share on WhatsApp"
                  >
                    {/* Reusing standard check icon structure with raw SVG or fill circle */}
                    <svg viewBox="0 0 24 24" className="w-4 h-4 fill-current">
                      <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946C.06 5.348 5.397.01 12.008.01c3.202.001 6.212 1.246 8.477 3.514 2.266 2.268 3.507 5.28 3.505 8.484-.004 6.657-5.34 11.997-11.953 11.997-2.005-.001-3.973-.502-5.724-1.458L0 24zm6.59-4.846c1.6.95 3.188 1.449 4.825 1.451 5.436 0 9.859-4.407 9.862-9.83.001-2.628-1.01-5.1-2.861-6.956-1.851-1.855-4.316-2.873-6.947-2.873-5.438 0-9.862 4.41-9.866 9.833-.001 1.742.485 3.446 1.407 4.954L1.87 21.053l4.777-1.253zM16.533 13.9c-.27-.134-1.597-.788-1.846-.879-.25-.09-.431-.134-.612.134-.181.27-.7.879-.858 1.058-.16.179-.318.2-.588.066-.27-.133-1.139-.42-2.17-1.341-.803-.717-1.346-1.603-1.503-1.872-.158-.27-.017-.416.118-.55.121-.12.27-.315.405-.472.135-.158.18-.27.27-.45.09-.18.045-.337-.022-.472-.068-.135-.612-1.474-.839-2.016-.22-.53-.443-.459-.612-.468-.158-.008-.339-.01-.52-.01-.18 0-.472.067-.719.337-.247.27-.943.923-.943 2.253s.967 2.61 1.101 2.79c.134.18 1.902 2.906 4.607 4.072.643.278 1.146.444 1.538.568.647.206 1.237.177 1.702.107.518-.077 1.597-.653 1.822-1.284.225-.63.225-1.17.158-1.284-.068-.113-.25-.179-.52-.315z" />
                    </svg>
                  </a>
                </div>

                <button
                  onClick={handleCopyLink}
                  className="flex items-center gap-1.5 text-xs font-bold text-neutral-500 hover:text-neutral-900 transition-colors uppercase tracking-wider cursor-pointer"
                >
                  <AnimatePresence mode="wait">
                    {copied ? (
                      <motion.span
                        key="copied"
                        initial={{ opacity: 0, scale: 0.8 }}
                        animate={{ opacity: 1, scale: 1 }}
                        exit={{ opacity: 0 }}
                        className="text-emerald-600 font-bold"
                      >
                        Link Copied!
                      </motion.span>
                    ) : (
                      <motion.span
                        key="copy"
                        initial={{ opacity: 0, scale: 0.8 }}
                        animate={{ opacity: 1, scale: 1 }}
                        exit={{ opacity: 0 }}
                        className="flex items-center gap-1.5"
                      >
                        <Copy className="w-4 h-4" />
                        Copy Link
                      </motion.span>
                    )}
                  </AnimatePresence>
                </button>
              </div>
            </div>

            {/* Right Sticky Sidebar (Desktop Only) */}
            <div className="hidden lg:block lg:col-span-4 sticky top-28 pl-4 space-y-10">
              {/* Table of Contents */}
              {headers.length > 0 && (
                <div>
                  <h2 className="text-lg font-bold text-neutral-950 mb-4 font-display">
                    Table of contents
                  </h2>
                  <ol className="space-y-3 list-decimal list-inside text-sm font-semibold text-neutral-700">
                    {headers.map((h) => {
                      const isActive = activeId === h.id;
                      return (
                        <li
                          key={h.id}
                          className="text-neutral-300"
                          style={{ marginLeft: h.level === 3 ? "1rem" : "0" }}
                        >
                          <a
                            href={`#${h.id}`}
                            className={`transition-colors underline decoration-neutral-200 hover:decoration-neutral-800 ${
                              isActive
                                ? "text-neutral-950 font-bold decoration-neutral-800"
                                : "text-neutral-600 hover:text-neutral-950"
                            }`}
                          >
                            {h.title}
                          </a>
                        </li>
                      );
                    })}
                  </ol>
                  <div className="w-full h-px bg-neutral-100 mt-6" />
                </div>
              )}

              {/* Related Tour Packages */}
              {post.relatedPackages && post.relatedPackages.length > 0 && (
                <div>
                  <h2 className="text-lg font-bold text-neutral-950 mb-4 font-display">
                    Related Packages
                  </h2>
                  <div className="space-y-4">
                    {post.relatedPackages.map((pkg) => (
                      <Link
                        key={pkg.id}
                        href={`/packages/${pkg.slug}`}
                        className="flex items-center gap-4 p-3 bg-neutral-50 hover:bg-neutral-100/70 border border-neutral-100 rounded-2xl transition-all duration-300 group"
                      >
                        <div className="relative w-16 h-16 rounded-xl overflow-hidden shrink-0 bg-neutral-100">
                          <Image
                            src={
                              pkg.heroImage ||
                              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=150&q=80"
                            }
                            alt={pkg.name}
                            fill
                            sizes="64px"
                            className="object-cover group-hover:scale-102 transition-transform duration-300"
                          />
                        </div>
                        <div className="flex-1 min-w-0">
                          <h4 className="text-xs font-bold text-neutral-900 group-hover:text-brand transition-colors duration-200 truncate">
                            {pkg.name}
                          </h4>
                          <div className="flex items-center gap-2 mt-1.5">
                            {pkg.discountedPrice ? (
                              <>
                                <span className="text-xs font-bold text-neutral-900">
                                  ₹{pkg.discountedPrice.toLocaleString("en-IN")}
                                </span>
                                <span className="text-[10px] text-neutral-400 line-through">
                                  ₹{pkg.basePrice?.toLocaleString("en-IN")}
                                </span>
                              </>
                            ) : pkg.basePrice ? (
                              <span className="text-xs font-bold text-neutral-900">
                                ₹{pkg.basePrice.toLocaleString("en-IN")}
                              </span>
                            ) : (
                              <span className="text-[10px] text-neutral-400 font-bold uppercase tracking-wider">
                                Price on Inquiry
                              </span>
                            )}
                          </div>
                        </div>
                      </Link>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Related Packages - Mobile view only (Bottom of page) */}
          {post.relatedPackages && post.relatedPackages.length > 0 && (
            <div className="block lg:hidden mt-16 pt-10 border-t border-neutral-100">
              <h2 className="text-2xl font-bold text-neutral-950 mb-6 font-display">
                Related Packages
              </h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {post.relatedPackages.map((pkg) => (
                  <Link
                    key={pkg.id}
                    href={`/packages/${pkg.slug}`}
                    className="flex items-center gap-4 p-4 bg-neutral-50 hover:bg-neutral-100/70 border border-neutral-100 rounded-2xl transition-all duration-300 group"
                  >
                    <div className="relative w-16 h-16 rounded-xl overflow-hidden shrink-0 bg-neutral-100">
                      <Image
                        src={
                          pkg.heroImage ||
                          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=150&q=80"
                        }
                        alt={pkg.name}
                        fill
                        sizes="64px"
                        className="object-cover group-hover:scale-102 transition-transform duration-300"
                      />
                    </div>
                    <div className="flex-1 min-w-0">
                      <h4 className="text-sm font-bold text-neutral-900 group-hover:text-brand transition-colors duration-200 truncate font-display">
                        {pkg.name}
                      </h4>
                      <div className="flex items-center gap-2 mt-1">
                        {pkg.discountedPrice ? (
                          <>
                            <span className="text-xs font-bold text-neutral-900">
                              ₹{pkg.discountedPrice.toLocaleString("en-IN")}
                            </span>
                            <span className="text-[10px] text-neutral-400 line-through">
                              ₹{pkg.basePrice?.toLocaleString("en-IN")}
                            </span>
                          </>
                        ) : pkg.basePrice ? (
                          <span className="text-xs font-bold text-neutral-900">
                            ₹{pkg.basePrice.toLocaleString("en-IN")}
                          </span>
                        ) : (
                          <span className="text-[10px] text-neutral-450 font-bold uppercase tracking-wider">
                            Price on Inquiry
                          </span>
                        )}
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}
