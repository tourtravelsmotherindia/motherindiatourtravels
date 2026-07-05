"use client";

import React, { useState } from "react";
import Image from "next/image";
import { ArrowDown } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import companyData from "@/data/company.json";
import faqData from "@/data/faq.json";

interface FAQItem {
  question: string;
  answer: string;
}

export default function FAQ() {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);

  const faqs: FAQItem[] = faqData.faqs.map((faq) => ({
    question: faq.question,
    answer: faq.answer
      .replace("{phone}", companyData.phone[0])
      .replace("{email}", companyData.email),
  }));

  const toggleAccordion = (index: number) => {
    setActiveIndex(activeIndex === index ? null : index);
  };

  return (
    <section id="faq" className="w-full py-20 px-4 md:px-8 max-w-[1440px] mx-auto scroll-mt-24">
      {/* Section Header */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-16 items-end">
        {/* Left/Heading Column */}
        <div className="lg:col-span-2 text-left">
          <div className="text-xs font-bold text-gray-400 uppercase tracking-widest mb-3">
            FAQ
          </div>
          <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1] max-w-2xl">
            {faqData.tagline}
          </h2>
        </div>
        {/* Right/Muted Text Column */}
        <div className="text-left lg:pl-8 border-l-0 lg:border-l lg:border-border-light">
          <h4 className="text-base font-bold text-foreground mb-1">
            Didn't see your question?
          </h4>
          <p className="text-sm text-gray-500 leading-relaxed font-medium">
            Our team is here to help &mdash; just reach out and we'll reply shortly.
          </p>
        </div>
      </div>

      {/* Main Grid: Image + Accordion */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        {/* Left Column: Image (Fixed Aspect/Height, does not stretch) */}
        <div className="lg:col-span-5 relative w-full h-[320px] sm:h-[400px] lg:h-[500px]">
          <Image
            src="/images/trip_ladakh.png"
            alt="Majestic mountain lake in Ladakh"
            fill
            className="object-cover rounded-[32px]"
            sizes="(max-w: 1024px) 100vw, 40vw"
            priority
          />
        </div>

        {/* Right Column: Accordion */}
        <div className="lg:col-span-7 flex flex-col gap-4">
          {faqs.map((faq, index) => {
            const isOpen = activeIndex === index;
            return (
              <div
                key={index}
                className="bg-white border border-border-light rounded-2xl shadow-[0_2px_8px_rgba(0,0,0,0.01)] transition-all duration-300 overflow-hidden"
              >
                <button
                  onClick={() => toggleAccordion(index)}
                  className="w-full px-6 py-5 flex items-center justify-between text-left cursor-pointer group"
                  aria-expanded={isOpen}
                >
                  <span className="text-sm md:text-base font-semibold text-gray-800 tracking-tight transition-colors duration-200 group-hover:text-brand">
                    {faq.question}
                  </span>
                  <span className={`w-8 h-8 rounded-full flex items-center justify-center transition-all duration-300 shrink-0 ml-4 ${
                    isOpen ? "bg-brand text-white" : "bg-gray-50 text-gray-800 group-hover:bg-gray-100"
                  }`}>
                    <ArrowDown className={`w-4 h-4 transition-transform duration-300 ${isOpen ? "rotate-180" : ""}`} />
                  </span>
                </button>

                <AnimatePresence initial={false}>
                  {isOpen && (
                    <motion.div
                      initial={{ height: 0, opacity: 0 }}
                      animate={{ height: "auto", opacity: 1 }}
                      exit={{ height: 0, opacity: 0 }}
                      transition={{ duration: 0.25, ease: "easeInOut" }}
                      className="overflow-hidden"
                    >
                      <div className="px-6 pb-6 text-sm text-gray-500 leading-relaxed pt-2 border-t border-border-light/60">
                        {faq.answer}
                      </div>
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
