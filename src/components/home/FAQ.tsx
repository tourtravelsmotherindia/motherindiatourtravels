"use client";

import { ArrowDown } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useState } from "react";

import AccordionItem from "@/components/ui/Accordion";
import { type CompanyData } from "@/types/company";
import { type FAQSectionData } from "@/types/faq";

export default function FAQ({
  faqData,
  companyData,
}: {
  faqData: FAQSectionData;
  companyData?: CompanyData | null;
}) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);

  const faqs = (faqData?.items || []).map((faq) => ({
    question: faq.question,
    answer: faq.answer
      .replace("{phone}", companyData?.phones?.[0] || "")
      .replace("{email}", companyData?.email || ""),
  }));

  const tagline = faqData?.tagline || "Have Questions?";

  const toggleAccordion = (index: number) => {
    setActiveIndex(activeIndex === index ? null : index);
  };

  return (
    <section id="faq" className="py-24 scroll-mt-24 layout-container">
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-16 items-end">
        <div className="lg:col-span-2 text-left">
          <div className="text-xs font-bold text-gray-400 uppercase tracking-widest mb-3">FAQ</div>
          <h2 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight leading-[1.1] max-w-2xl">
            {tagline}
          </h2>
        </div>
        <div className="text-left lg:pl-8 border-l-0 lg:border-l lg:border-border-light">
          <h4 className="text-base font-bold text-foreground mb-1">
            Didn&apos;t see your question?
          </h4>
          <p className="text-sm text-gray-500 leading-relaxed font-normal">
            See more{" "}
            <Link
              href="/faqs"
              className="text-neutral-900 font-bold underline hover:text-brand transition-colors duration-200"
            >
              FAQs
            </Link>{" "}
            or Our team is here to help &mdash; just{" "}
            <Link
              href="/contact"
              className="text-neutral-900 font-bold underline hover:text-brand transition-colors duration-200"
            >
              reach out
            </Link>{" "}
            and we&apos;ll reply shortly.
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        <div className="hidden lg:block lg:col-span-5 relative w-full h-[500px]">
          <Image
            src={faqData?.image || "/images/trip_ladakh.png"}
            alt="FAQ section illustration"
            fill
            className="object-cover rounded-[32px]"
            sizes="40vw"
            priority
          />
        </div>

        <div className="col-span-1 lg:col-span-7 flex flex-col gap-4">
          {faqs.map((faq, index) => {
            const isOpen = activeIndex === index;
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
                    className={`w-4 h-4 transition-transform duration-300 ${isOpen ? "rotate-180" : ""}`}
                  />
                </span>
              </div>
            );

            return (
              <AccordionItem
                key={index}
                isOpen={isOpen}
                onToggle={() => toggleAccordion(index)}
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
      </div>
    </section>
  );
}
