"use client";

import React, { useEffect, useState } from "react";

import { type CompanyData } from "@/types/company";

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
        {/* Header Section */}
        <div className="layout-container text-center mb-12 md:mb-16">
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
              {/* Large Intro Paragraph */}
              <div className="text-lg md:text-xl text-neutral-700 font-medium leading-relaxed mb-12 border-l-4 border-brand pl-6">
                {introText}
              </div>

              {/* Table of Contents - Mobile Only */}
              <div className="block lg:hidden mb-10 bg-brand-light/35 border border-brand-light/70 p-6 md:p-8 rounded-[2rem] shadow-premium">
                <h2 className="text-sm font-bold text-neutral-900 uppercase tracking-widest mb-4">
                  Table of contents
                </h2>
                <div className="w-full h-px bg-neutral-200/80 mb-5" />
                <ol className="space-y-3.5 list-decimal list-inside text-sm text-neutral-700 font-medium">
                  {sections.map((sec) => (
                    <li key={sec.id}>
                      <a
                        href={`#${sec.id}`}
                        className="hover:text-brand transition-colors hover:underline underline-offset-4 decoration-brand/35 text-neutral-800"
                      >
                        {sec.title}
                      </a>
                    </li>
                  ))}
                </ol>
              </div>

              {/* Main Content Sections */}
              <div className="space-y-12">
                {sections.map((sec) => (
                  <section
                    key={sec.id}
                    id={sec.id}
                    className="scroll-mt-28 border-b border-neutral-100 pb-8 last:border-0 last:pb-0"
                  >
                    <h2 className="text-2xl font-bold text-neutral-900 mb-5 flex gap-2">
                      <span className="text-brand font-display font-black">#</span>
                      {sec.title}
                    </h2>
                    <div className="prose prose-neutral max-w-none text-neutral-600 leading-relaxed font-medium text-sm md:text-base space-y-4">
                      {sec.content}
                    </div>
                  </section>
                ))}
              </div>
            </div>

            {/* Right Column: Sticky Table of Contents - Desktop Only */}
            <div className="hidden lg:block lg:col-span-4 sticky top-28">
              <div className="bg-brand-light/35 backdrop-blur-md border border-brand-light/60 p-8 rounded-[2.5rem] shadow-premium">
                <h2 className="text-xs font-bold text-neutral-800 uppercase tracking-widest mb-4">
                  Table of contents
                </h2>
                <div className="w-full h-px bg-neutral-200/80 mb-5" />
                <ol className="space-y-3.5 list-decimal list-inside text-sm text-neutral-600 font-semibold">
                  {sections.map((sec) => {
                    const isActive = activeId === sec.id;
                    return (
                      <li key={sec.id}>
                        <a
                          href={`#${sec.id}`}
                          className={`hover:text-brand transition-all duration-200 underline-offset-4 decoration-brand/35 ${
                            isActive
                              ? "text-brand font-bold underline"
                              : "text-neutral-600 hover:underline"
                          }`}
                        >
                          {sec.title}
                        </a>
                      </li>
                    );
                  })}
                </ol>
                <div className="w-full h-px bg-neutral-200/80 mt-6 mb-4" />
                <button
                  onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
                  className="flex items-center gap-2 text-xs font-bold text-neutral-500 hover:text-brand transition-colors cursor-pointer group"
                >
                  <span className="group-hover:-translate-y-0.5 transition-transform duration-200">
                    Back to top ↑
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
