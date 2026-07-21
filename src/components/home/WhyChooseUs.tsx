"use client";

import { Coins, Compass, Headphones } from "lucide-react";
import React from "react";

import SectionHeader from "@/components/shared/SectionHeader";

export default function WhyChooseUs() {
  const features = [
    {
      icon: <Compass className="w-14 h-14 stroke-[1.25]" />,
      title: "100+ Destinations",
      description: "Explore our wide selection of destinations across all continents.",
    },
    {
      icon: <Coins className="w-14 h-14 stroke-[1.25]" />,
      title: "Best Price Guarantee",
      description: "We offer competitive prices with no hidden fees.",
    },
    {
      icon: <Headphones className="w-14 h-14 stroke-[1.25]" />,
      title: "24/7 Support",
      description: "Our travel experts are available anytime to assist you.",
    },
  ];

  return (
    <section id="why-choose-us" className="py-12 md:py-24 scroll-mt-24 bg-white layout-container">
      <SectionHeader
        title="Why Choose Us?"
        subtitle="We provide exceptional travel experiences with attention to every detail"
        align="center"
        className="mb-8 md:mb-16"
      />

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 md:gap-8 max-w-[1100px] mx-auto">
        {features.map((feature, idx) => (
          <div
            key={idx}
            className="flex flex-row md:flex-col items-center md:items-center text-left md:text-center group bg-neutral-50/60 md:bg-transparent p-4 md:p-0 rounded-2xl md:rounded-none border border-neutral-100 md:border-none gap-4 md:gap-0"
          >
            <div className="text-slate-800 group-hover:text-brand transition-all duration-300 transform group-hover:scale-105 ease-out md:mb-5 shrink-0 p-2.5 md:p-0 bg-white md:bg-transparent rounded-xl shadow-xs md:shadow-none">
              {React.cloneElement(feature.icon, {
                className: "w-6 h-6 md:w-14 md:h-14 stroke-[1.5] md:stroke-[1.25]",
              })}
            </div>
            <div>
              <h3 className="text-base md:text-2xl font-bold text-foreground tracking-tight md:mb-2.5">
                {feature.title}
              </h3>
              <p className="text-muted text-xs md:text-sm font-normal leading-relaxed max-w-[280px] mt-0.5 md:mt-0">
                {feature.description}
              </p>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
