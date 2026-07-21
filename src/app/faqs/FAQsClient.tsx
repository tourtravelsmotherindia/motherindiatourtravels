"use client";

import { ArrowDown, Search } from "lucide-react";
import React, { useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import AccordionItem from "@/components/ui/Accordion";
import { type CompanyData } from "@/types/company";

interface FAQItem {
  id: string;
  question: string;
  answer: string;
  sortOrder: number;
}

export default function FAQsClient({
  initialFaqs,
  companyData,
}: {
  initialFaqs: FAQItem[];
  companyData: CompanyData | null;
}) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [activeIndex, setActiveIndex] = useState<string | null>(null);

  // Categorize questions dynamically
  const getCategory = (faq: FAQItem): string => {
    const q = faq.question.toLowerCase();
    const a = faq.answer.toLowerCase();
    if (
      q.includes("cancel") ||
      q.includes("refund") ||
      a.includes("refund") ||
      a.includes("cancel")
    ) {
      return "Cancellations & Refunds";
    }
    if (
      q.includes("cookie") ||
      q.includes("privacy") ||
      q.includes("dispute") ||
      q.includes("jurisdiction") ||
      q.includes("personal data") ||
      q.includes("third-party") ||
      q.includes("photos") ||
      q.includes("videos")
    ) {
      return "Cookies & Privacy";
    }
    if (q.includes("book") || q.includes("pay") || q.includes("payment") || q.includes("deposit")) {
      return "Bookings & Payments";
    }
    return "General & Packages";
  };

  const categories = [
    "All",
    "General & Packages",
    "Bookings & Payments",
    "Cancellations & Refunds",
    "Cookies & Privacy",
  ];

  // Process FAQs with placeholders replaced
  const processedFaqs = initialFaqs.map((faq) => ({
    ...faq,
    category: getCategory(faq),
    answer: faq.answer
      .replace("{phone}", companyData?.phones?.[0] || "")
      .replace("{email}", companyData?.email || ""),
  }));

  // Filter FAQs based on category and search query
  const filteredFaqs = processedFaqs.filter((faq) => {
    const matchesCategory = selectedCategory === "All" || faq.category === selectedCategory;
    const matchesSearch =
      faq.question.toLowerCase().includes(searchQuery.toLowerCase()) ||
      faq.answer.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  const toggleAccordion = (id: string) => {
    setActiveIndex(activeIndex === id ? null : id);
  };

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      <div className="py-12 md:py-20 font-sans">
        {/* Left-aligned Header block consistent with Policy and About pages */}
        <div className="layout-container text-left mb-12 md:mb-16">
          <Breadcrumbs
            items={[{ label: "Home", href: "/" }, { label: "FAQs" }]}
            variant="brackets"
          />
          <h1 className="text-4xl md:text-5xl font-extrabold text-neutral-900 tracking-tight mb-4 leading-tight">
            Frequently Asked Questions
          </h1>
          <p className="text-lg md:text-xl text-neutral-900 font-medium leading-relaxed max-w-3xl">
            Find answers to the most common queries about booking holiday packages, customizations,
            refund rules, and data privacy policies.
          </p>
        </div>

        {/* Main Grid Section */}
        <div className="layout-container">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            {/* Sidebar Column - Category Tabs */}
            <div className="lg:col-span-3 lg:sticky lg:top-28">
              <h2 className="text-xl md:text-2xl font-bold text-neutral-900 mb-5">Categories</h2>
              {/* Category Tab List - Desktop view */}
              <div className="hidden lg:flex flex-col gap-2 font-semibold text-base">
                {categories.map((cat) => {
                  const isActive = selectedCategory === cat;
                  return (
                    <button
                      key={cat}
                      onClick={() => {
                        setSelectedCategory(cat);
                        setActiveIndex(null);
                      }}
                      className={`text-left py-2.5 px-4 rounded-xl transition-all duration-200 ${
                        isActive
                          ? "bg-neutral-100/90 text-black font-semibold"
                          : "text-neutral-700 hover:bg-neutral-50/90 hover:text-black font-semibold"
                      }`}
                    >
                      {cat}
                    </button>
                  );
                })}
              </div>

              {/* Horizontal Scroll tabs - Mobile view */}
              <div className="flex lg:hidden gap-2 overflow-x-auto pb-4 scrollbar-none snap-x -mx-4 px-4">
                {categories.map((cat) => {
                  const isActive = selectedCategory === cat;
                  return (
                    <button
                      key={cat}
                      onClick={() => {
                        setSelectedCategory(cat);
                        setActiveIndex(null);
                      }}
                      className={`snap-center shrink-0 py-2 px-4 rounded-full text-sm font-semibold transition-all duration-200 ${
                        isActive
                          ? "bg-neutral-100/90 text-black border border-transparent"
                          : "bg-white text-neutral-700 hover:bg-neutral-50/90 hover:text-black border border-neutral-200"
                      }`}
                    >
                      {cat}
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Content Column - Search Input & FAQ Accordions */}
            <div className="lg:col-span-9">
              {/* Search Box */}
              <div className="relative mb-8 shadow-sm rounded-2xl">
                <input
                  type="text"
                  placeholder="Search questions or keywords..."
                  value={searchQuery}
                  onChange={(e) => {
                    setSearchQuery(e.target.value);
                    setActiveIndex(null);
                  }}
                  className="w-full pl-12 pr-4 py-4 bg-neutral-50 border border-neutral-200 rounded-2xl focus:outline-none focus:border-neutral-300 transition-all duration-200 text-neutral-900 font-medium placeholder-neutral-400"
                />
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-neutral-400 w-5 h-5" />
              </div>

              {/* FAQ Accordions List */}
              {filteredFaqs.length > 0 ? (
                <div className="space-y-4">
                  {filteredFaqs.map((faq) => {
                    const isOpen = activeIndex === faq.id;
                    const trigger = (
                      <div className="w-full px-6 py-5 flex items-center justify-between text-left group">
                        <span className="text-sm md:text-base font-semibold text-gray-800 tracking-tight transition-colors duration-200 group-hover:text-brand">
                          {faq.question}
                        </span>
                        <span
                          className={`w-8 h-8 rounded-full flex items-center justify-center transition-all duration-300 shrink-0 ml-4 ${
                            isOpen
                              ? "bg-brand text-white"
                              : "bg-gray-50 text-gray-800 group-hover:bg-gray-100"
                          }`}
                        >
                          <ArrowDown
                            className={`w-4 h-4 transition-transform duration-300 ${
                              isOpen ? "rotate-180" : ""
                            }`}
                          />
                        </span>
                      </div>
                    );

                    return (
                      <AccordionItem
                        key={faq.id}
                        isOpen={isOpen}
                        onToggle={() => toggleAccordion(faq.id)}
                        trigger={trigger}
                        duration={0.25}
                        className="bg-white border border-border-light rounded-2xl shadow-[0_2px_8px_rgba(0,0,0,0.01)] transition-all duration-300 overflow-hidden"
                      >
                        <div className="px-6 pb-6 text-sm text-gray-500 leading-relaxed pt-2 border-t border-border-light/60">
                          {faq.answer}
                        </div>
                      </AccordionItem>
                    );
                  })}
                </div>
              ) : (
                <div className="text-center py-16 bg-neutral-50 border border-dashed border-neutral-200 rounded-2xl">
                  <p className="text-lg text-neutral-500 font-medium">
                    No FAQs matching your search query. Try other keywords!
                  </p>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
