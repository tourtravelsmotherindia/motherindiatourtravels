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
    <section className="py-24 scroll-mt-24 bg-white layout-container">
      {/* Section Header */}
      <SectionHeader
        title="Why Choose Us?"
        subtitle="We provide exceptional travel experiences with attention to every detail"
        align="center"
        className="mb-16"
      />

      {/* Features Grid */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-12 md:gap-8 max-w-[1100px] mx-auto">
        {features.map((feature, idx) => (
          <div key={idx} className="flex flex-col items-center text-center group">
            {/* Icon Wrapper */}
            <div className="text-slate-800 group-hover:text-brand transition-all duration-300 transform group-hover:scale-105 ease-out mb-5">
              {feature.icon}
            </div>
            {/* Title */}
            <h3 className="text-xl md:text-2xl font-bold text-foreground tracking-tight mb-2.5">
              {feature.title}
            </h3>
            {/* Description */}
            <p className="text-muted text-xs md:text-sm font-normal leading-relaxed max-w-[280px]">
              {feature.description}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
