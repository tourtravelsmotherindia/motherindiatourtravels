"use client";

import { Search, Star } from "lucide-react";
import Image from "next/image";
import React, { useMemo, useRef, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import { type CompanyData } from "@/types/company";
import { type ReviewItem } from "@/types/review";

const sources = ["All", "Google", "TripAdvisor"] as const;
type Source = (typeof sources)[number];

function SourceLabel(src: Source) {
  return src === "All" ? "All Testimonials" : `${src} Reviews`;
}

export default function TestimonialsClient({
  initialReviews,
  companyData,
}: {
  initialReviews: ReviewItem[];
  companyData: CompanyData | null;
}) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedSource, setSelectedSource] = useState<Source>("All");
  const pillRef = useRef<HTMLDivElement>(null);

  const filteredReviews = useMemo(() => {
    return initialReviews.filter((r) => {
      const matchesSource = selectedSource === "All" || r.source === selectedSource;
      const matchesSearch =
        r.reviewer.toLowerCase().includes(searchQuery.toLowerCase()) ||
        r.review.toLowerCase().includes(searchQuery.toLowerCase());
      return matchesSource && matchesSearch;
    });
  }, [initialReviews, searchQuery, selectedSource]);

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      <div className="pt-12 md:pt-20 pb-section-loose font-sans">
        {/* Header */}
        <div className="layout-container text-left mb-12 md:mb-16">
          <Breadcrumbs
            items={[{ label: "Home", href: "/" }, { label: "Testimonials" }]}
            variant="brackets"
          />
          <h1 className="text-4xl md:text-5xl font-extrabold text-neutral-900 tracking-tight mb-4 leading-tight">
            Traveler Testimonials
          </h1>
          <p className="text-lg md:text-xl text-neutral-900 font-medium leading-relaxed max-w-3xl">
            Hear from our adventurers about their journeys across India. Real reviews collected from
            Google and TripAdvisor.
          </p>
        </div>

        {/* Filter & Search */}
        <div className="layout-container mb-10">
          <div className="flex flex-col md:flex-row gap-4 justify-between items-start md:items-center">
            {/* Desktop: animated sliding pill switch */}
            <div
              className="hidden md:flex relative gap-1 p-1 bg-neutral-100/80 rounded-2xl shrink-0"
              ref={pillRef}
            >
              {sources.map((src) => {
                const isActive = selectedSource === src;
                return (
                  <button
                    key={src}
                    onClick={() => setSelectedSource(src)}
                    className={`relative py-2 px-5 rounded-xl text-sm font-semibold transition-all duration-300 z-10 ${
                      isActive ? "text-black" : "text-neutral-600 hover:text-black"
                    }`}
                  >
                    {/* Sliding background pill */}
                    {isActive && (
                      <span
                        className="absolute inset-0 bg-white rounded-xl shadow-[0_2px_8px_rgba(0,0,0,0.06)]"
                        style={{
                          transition: "all 0.25s cubic-bezier(0.4,0,0.2,1)",
                        }}
                      />
                    )}
                    <span className="relative z-10">{SourceLabel(src)}</span>
                  </button>
                );
              })}
            </div>

            {/* Mobile: badge-style tabs like FAQs page */}
            <div className="flex md:hidden gap-2 overflow-x-auto pb-1 scrollbar-none snap-x -mx-4 px-4">
              {sources.map((src) => {
                const isActive = selectedSource === src;
                return (
                  <button
                    key={src}
                    onClick={() => setSelectedSource(src)}
                    className={`snap-center shrink-0 py-2 px-4 rounded-full text-sm font-semibold transition-all duration-200 ${
                      isActive
                        ? "bg-neutral-100/90 text-black border border-transparent"
                        : "bg-white text-neutral-700 hover:bg-neutral-50/90 hover:text-black border border-neutral-200"
                    }`}
                  >
                    {SourceLabel(src)}
                  </button>
                );
              })}
            </div>

            {/* Search Box */}
            <div className="relative w-full md:max-w-md">
              <input
                type="text"
                placeholder="Search testimonials or reviewers..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-12 pr-4 py-3 bg-white border border-neutral-200 rounded-2xl focus:outline-none focus:border-neutral-300 transition-all duration-200 text-neutral-900 font-medium placeholder-neutral-400 text-sm"
              />
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-neutral-400 w-4 h-4 pointer-events-none z-10" />
            </div>
          </div>
        </div>

        {/* Masonry reviews grid */}
        <div className="layout-container">
          {filteredReviews.length > 0 ? (
            <div className="columns-1 sm:columns-2 lg:columns-3 gap-6 [column-fill:balance]">
              {filteredReviews.map((review) => {
                const profileImg =
                  review.avatar && review.avatar.startsWith("http")
                    ? review.avatar
                    : "https://lh3.googleusercontent.com/a/default-user=s64-c";

                const cardContent = (
                  <div className="break-inside-avoid relative bg-white border border-border-light rounded-2xl p-6 hover:shadow-[0_4px_20px_rgba(0,0,0,0.05)] hover:border-neutral-300 transition-all duration-300 flex flex-col gap-4 mb-6">
                    {/* Header: avatar, name & source badge */}
                    <div className="flex items-start justify-between gap-4">
                      <div className="flex items-center gap-3">
                        <Image
                          className="rounded-full object-cover shrink-0"
                          width={40}
                          height={40}
                          alt=""
                          src={profileImg}
                        />
                        <div className="flex flex-col min-w-0">
                          <h3 className="text-sm font-semibold text-neutral-900 truncate leading-snug">
                            {review.reviewer}
                          </h3>
                          <span className="text-xs text-neutral-500 font-medium leading-none mt-0.5">
                            {review.source} reviewer
                          </span>
                        </div>
                      </div>
                      <span
                        className={`text-xs px-2.5 py-1 rounded-full font-bold tracking-tight shrink-0 uppercase ${
                          review.source === "Google"
                            ? "bg-blue-50 text-blue-600 border border-blue-100"
                            : "bg-emerald-50 text-emerald-600 border border-emerald-100"
                        }`}
                      >
                        {review.source}
                      </span>
                    </div>

                    {/* Star Rating */}
                    <div className="flex gap-0.5">
                      {Array.from({ length: 5 }).map((_, i) => (
                        <Star
                          key={i}
                          className={`w-4 h-4 ${
                            i < review.rating
                              ? "fill-yellow-400 text-yellow-400"
                              : "text-neutral-200"
                          }`}
                        />
                      ))}
                    </div>

                    {/* Review Text */}
                    {review.review && (
                      <p
                        className="text-sm text-neutral-700 leading-relaxed font-normal whitespace-pre-wrap"
                        dangerouslySetInnerHTML={{ __html: review.review }}
                      />
                    )}
                  </div>
                );

                if (review.reviewLink) {
                  return (
                    <a
                      key={review.id}
                      href={review.reviewLink}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="block no-underline outline-none cursor-pointer"
                    >
                      {cardContent}
                    </a>
                  );
                }

                return (
                  <div key={review.id} className="block">
                    {cardContent}
                  </div>
                );
              })}
            </div>
          ) : (
            <div className="text-center py-20 bg-neutral-50 border border-dashed border-neutral-200 rounded-3xl">
              <p className="text-lg text-neutral-500 font-medium">
                No testimonials matching your filters. Try different keywords!
              </p>
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}
