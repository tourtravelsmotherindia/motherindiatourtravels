"use client";

import React, { useEffect, useState } from "react";

import { type CompanyData } from "@/types/company";

import Breadcrumbs from "./Breadcrumbs";
import PageShell from "./PageShell";

interface PolicySection {
  id: string;
  title: string;
  content: React.ReactNode;
}

interface PolicyLayoutProps {
  title: string;
  lastUpdated: string;
  introText: string;
  sections: PolicySection[];
  companyData: CompanyData | null;
}

export default function PolicyLayout({
  title,
  lastUpdated,
  introText,
  sections,
  companyData,
}: PolicyLayoutProps) {
  const [activeId, setActiveId] = useState<string>("");

  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = window.scrollY + 150;

      // Find the current active section
      for (const section of sections) {
        const element = document.getElementById(section.id);
        if (element) {
          const top = element.offsetTop;
          const height = element.offsetHeight;
          if (scrollPosition >= top && scrollPosition < top + height) {
            setActiveId(section.id);
            break;
          }
        }
      }
    };

    window.addEventListener("scroll", handleScroll);
    handleScroll(); // Call once on mount

    return () => window.removeEventListener("scroll", handleScroll);
  }, [sections]);

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      {/* Top Anchor for Back to Top */}
      <div id="top" className="absolute top-0 left-0 w-full h-px" />

      <div className="py-12 md:py-20 font-sans">
        {/* Header Section (Left-aligned, consistent with About Us page) */}
        <div className="layout-container text-left mb-12 md:mb-16">
          <Breadcrumbs
            items={[{ label: "Home", href: "/" }, { label: title }]}
            variant="brackets"
          />
          <h1 className="text-4xl md:text-5xl font-extrabold text-neutral-900 tracking-tight mb-4 leading-tight">
            {title}
          </h1>
          <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-widest">
            Last Updated {lastUpdated}
          </p>
        </div>

        {/* Layout Grid */}
        <div className="layout-container">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            {/* Left Column: Intro + Main Content */}
            <div className="lg:col-span-8">
              {/* Large Intro Paragraph - No brand orange text or highlights */}
              <div className="text-lg md:text-xl text-neutral-700 font-medium leading-relaxed mb-12 border-l-4 border-neutral-200 pl-6">
                {introText}
              </div>

              {/* Table of Contents - Mobile Only (Clean text list, no orange/cream bg cards) */}
              <div className="block lg:hidden mb-10 py-2 border-t border-b border-neutral-100">
                <h2 className="text-sm font-bold text-neutral-900 uppercase tracking-widest mb-4">
                  Table of contents
                </h2>
                <ol className="space-y-3.5 list-decimal list-inside text-sm text-neutral-600 font-medium">
                  {sections.map((sec) => (
                    <li key={sec.id} className="text-neutral-500">
                      <a
                        href={`#${sec.id}`}
                        className="hover:text-neutral-900 transition-colors hover:underline underline-offset-4 decoration-neutral-300 text-neutral-600"
                      >
                        {sec.title}
                      </a>
                    </li>
                  ))}
                </ol>
              </div>

              {/* Main Content Sections (No gray line dividers between sections) */}
              <div className="space-y-12">
                {sections.map((sec) => (
                  <section key={sec.id} id={sec.id} className="scroll-mt-28 pb-4">
                    {/* Section Title - No hashtags (#) and no brand orange text */}
                    <h2 className="text-2xl font-bold text-neutral-900 mb-5">{sec.title}</h2>
                    <div className="prose prose-neutral max-w-none text-neutral-600 leading-relaxed font-medium text-sm md:text-base space-y-4">
                      {sec.content}
                    </div>
                  </section>
                ))}
              </div>
            </div>

            {/* Right Column: Sticky Table of Contents - Desktop Only (No orange/cream bg cards, plain text list) */}
            <div className="hidden lg:block lg:col-span-4 sticky top-28 pl-4">
              <h2 className="text-xs font-bold text-neutral-900 uppercase tracking-widest mb-4">
                Table of contents
              </h2>
              <div className="w-full h-px bg-neutral-200 mb-5" />
              <ol className="space-y-3.5 list-decimal list-inside text-sm font-medium">
                {sections.map((sec) => {
                  const isActive = activeId === sec.id;
                  return (
                    <li key={sec.id} className="text-neutral-400">
                      <a
                        href={`#${sec.id}`}
                        className={`transition-all duration-200 underline-offset-4 decoration-neutral-300 ${
                          isActive
                            ? "text-neutral-900 font-bold underline"
                            : "text-neutral-500 hover:text-neutral-900 hover:underline"
                        }`}
                      >
                        {sec.title}
                      </a>
                    </li>
                  );
                })}
              </ol>
              <div className="w-full h-px bg-neutral-200 mt-6 mb-4" />
              <button
                onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
                className="flex items-center gap-2 text-xs font-bold text-neutral-500 hover:text-neutral-900 transition-colors cursor-pointer group"
              >
                <span className="group-hover:-translate-y-0.5 transition-transform duration-200">
                  Back to top ↑
                </span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
