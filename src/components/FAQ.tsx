"use client";

import React, { useState } from "react";
import { ChevronDown, HelpCircle } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

interface FAQItem {
  question: string;
  answer: string;
}

export default function FAQ() {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);

  const faqs: FAQItem[] = [
    {
      question: "Do you offer customized tour packages?",
      answer: "Yes, absolutely! We specialize in crafting tailor-made itineraries designed around your preferences, travel pace, and budget. Whether you're looking for a luxury honeymoon in Kerala, a family trip to Rajasthan, or an adventure trek in Ladakh, our travel experts will design it for you.",
    },
    {
      question: "What services are typically included in your packages?",
      answer: "Our standard packages cover handpicked hotel accommodations, guided sightseeing tours, daily breakfast, private air-conditioned vehicles with professional drivers, and select local activities. Flights, lunches, dinners, and personal expenses can be added upon request.",
    },
    {
      question: "Can I make changes to my itinerary after booking?",
      answer: "Yes, we accommodate modifications to your travel itinerary before the trip begins, subject to hotel and transport availability. Some amendments may incur fees depending on how close we are to the departure date and the policies of our partner hotels.",
    },
    {
      question: "What is your cancellation and refund policy?",
      answer: "We offer flexible cancellation. Cancellations made 30 days or more prior to departure are eligible for a full refund minus nominal administrative fees. Cancellations between 15-29 days are charged 25%, and cancellations under 14 days are subject to standard cancellation charges depending on bookings made.",
    },
    {
      question: "Do you assist with travel insurance and visas?",
      answer: "Yes, we provide visa assistance services for domestic and international tours, helping you prepare documentation and schedule appointments. We also highly recommend and offer comprehensive travel insurance packages to protect your journey against unforeseen events.",
    },
    {
      question: "How can I book a tour with Mother India Tour Travels?",
      answer: "Booking is simple! You can use our search bar to find packages and send an inquiry, call or WhatsApp our hotline at +91 98765 43210, or email us at contact@motherindiatravels.com. Our representative will contact you within 24 hours to finalize your plans.",
    },
  ];

  const toggleAccordion = (index: number) => {
    setActiveIndex(activeIndex === index ? null : index);
  };

  return (
    <section id="faq" className="py-20 px-4 md:px-8 max-w-[1000px] mx-auto scroll-mt-24">
      {/* Section Header */}
      <div className="text-center mb-14">
        <div className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-brand-light text-brand text-xs font-bold uppercase tracking-wider mb-3">
          <HelpCircle className="w-3.5 h-3.5" />
          <span>Have Questions?</span>
        </div>
        <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
          Frequently Asked <span className="font-serif italic font-medium text-brand">Questions</span>
        </h2>
        <p className="text-muted font-medium mt-3 text-sm md:text-base">
          Find answers to common queries about our tour packages, booking process, and travel services
        </p>
      </div>

      {/* Accordion Container */}
      <div className="flex flex-col gap-4">
        {faqs.map((faq, index) => {
          const isOpen = activeIndex === index;
          return (
            <div
              key={index}
              className={`border rounded-2xl transition-all duration-300 ${
                isOpen
                  ? "bg-gray-50/60 border-border-light shadow-sm"
                  : "bg-white border-border-light hover:shadow-sm"
              }`}
            >
              <button
                onClick={() => toggleAccordion(index)}
                className="w-full px-6 py-5 flex items-center justify-between text-left cursor-pointer group"
                aria-expanded={isOpen}
              >
                <span className={`text-base md:text-lg font-bold transition-colors duration-200 ${
                  isOpen ? "text-brand" : "text-foreground"
                }`}>
                  {faq.question}
                </span>
                <span className={`w-8 h-8 rounded-full border flex items-center justify-center transition-all duration-300 shrink-0 ml-4 ${
                  isOpen
                    ? "bg-brand border-brand text-white rotate-180"
                    : "border-border-light text-muted"
                }`}>
                  <ChevronDown className="w-4 h-4" />
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
                    <div className="px-6 pb-6 text-sm md:text-base text-muted leading-relaxed border-t border-dashed border-border-light/60 pt-4">
                      {faq.answer}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          );
        })}
      </div>
    </section>
  );
}
