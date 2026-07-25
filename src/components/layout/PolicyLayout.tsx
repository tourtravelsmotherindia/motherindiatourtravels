"use client";

import React, { useEffect, useState } from "react";

import TableOfContents from "@/components/shared/TableOfContents";
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
    handleScroll();

    return () => window.removeEventListener("scroll", handleScroll);
  }, [sections]);

  // Sections are flat — no sub-items for policy pages
  const tocItems = sections.map((sec) => ({ id: sec.id, title: sec.title }));

  return (
    <PageShell companyData={companyData} bgClass="bg-white">
      <div id="top" className="absolute top-0 left-0 w-full h-px" />

      <div className="pt-12 md:pt-20 pb-section-loose font-sans">
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

        <div className="layout-container">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            {/* Left Column: Intro + Main Content */}
            <div className="lg:col-span-8">
              <div className="text-lg md:text-xl text-neutral-900 font-medium leading-relaxed mb-12 border-l-4 border-neutral-200 pl-6">
                {introText}
              </div>

              {/* Mobile ToC */}
              <div className="block lg:hidden mb-10 py-4 border-t border-b border-neutral-100">
                <TableOfContents
                  items={tocItems}
                  activeId={activeId}
                  size="md"
                  showBackToTop={false}
                />
              </div>

              <div className="space-y-12">
                {sections.map((sec) => (
                  <section key={sec.id} id={sec.id} className="scroll-mt-28 pb-4">
                    <h2 className="text-2xl font-bold text-neutral-900 mb-5">{sec.title}</h2>
                    <div className="prose prose-neutral max-w-none text-neutral-900 leading-relaxed font-medium text-sm md:text-base space-y-4">
                      {sec.content}
                    </div>
                  </section>
                ))}
              </div>
            </div>

            {/* Right Column: Sticky Desktop ToC */}
            <div className="hidden lg:block lg:col-span-4 sticky top-28 pl-4">
              <TableOfContents items={tocItems} activeId={activeId} size="md" showBackToTop />
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
