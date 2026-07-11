"use client";

import { motion } from "framer-motion";
import Image from "next/image";
import React from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import SeeAllLink from "@/components/ui/SeeAllLink";

interface Region {
  id: number;
  name: string;
  image: string;
  states: string;
  moreCount: string;
  badges: string[];
}

export default function RegionsGrid() {
  const regions: Region[] = [
    {
      id: 1,
      name: "North India",
      image:
        "https://images.unsplash.com/photo-1589308078059-be1415eab4c3?auto=format&fit=crop&w=800&q=80",
      states: "Ladakh, Himachal Pradesh, Uttarakhand, Kashmir",
      moreCount: "+ 10 more destinations",
      badges: ["All Adventures", "Deals"],
    },
    {
      id: 2,
      name: "South India",
      image:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
      states: "Kerala, Tamil Nadu, Karnataka, Andhra Pradesh",
      moreCount: "+ 5 more destinations",
      badges: ["All Adventures", "Deals"],
    },
    {
      id: 3,
      name: "West India",
      image:
        "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80",
      states: "Rajasthan, Goa, Gujarat, Maharashtra",
      moreCount: "+ 20 more destinations",
      badges: ["All Adventures", "Deals"],
    },
    {
      id: 4,
      name: "East India",
      image:
        "https://images.unsplash.com/photo-1555899434-94d1368aa7af?auto=format&fit=crop&w=800&q=80",
      states: "West Bengal, Odisha, Bihar, Jharkhand",
      moreCount: "+ 7 more destinations",
      badges: ["All Adventures", "Deals"],
    },
    {
      id: 5,
      name: "Central India",
      image:
        "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80",
      states: "Madhya Pradesh, Chhattisgarh, Uttar Pradesh (Agra)",
      moreCount: "+ 10 more destinations",
      badges: ["All Adventures", "Deals"],
    },
    {
      id: 6,
      name: "Northeast India",
      image:
        "https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&w=800&q=80",
      states: "Meghalaya, Assam, Sikkim, Arunachal Pradesh",
      moreCount: "+ 13 more destinations",
      badges: ["All Adventures", "Deals"],
    },
  ];

  const rightSlot = <SeeAllLink href="#" label="See All Destinations" />;

  return (
    <section id="regions" className="py-24 layout-container">
      <SectionHeader
        title="Destination By Region"
        subtitle="Explore adventures across every corner of the incredible Indian subcontinent"
        rightSlot={rightSlot}
      />

      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {regions.map((region, idx) => (
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.5, delay: idx * 0.08 }}
            key={region.id}
            className="group rounded-2xl overflow-hidden border border-border-light shadow-card hover:shadow-premium transition-all duration-300 flex flex-col h-[340px] lg:h-[370px] xl:h-[400px] 2xl:h-[420px] relative bg-white"
          >
            <div className="relative h-56 lg:h-64 xl:h-72 2xl:h-80 w-full overflow-hidden">
              <Image
                src={region.image}
                alt={region.name}
                fill
                sizes="(max-width: 768px) 100vw, 550px"
                className="object-cover transition-transform duration-500 group-hover:scale-103"
                priority={idx < 2}
              />
              <div className="absolute top-5 left-5 flex items-center gap-2">
                {region.badges.map((badge, bIdx) => (
                  <span
                    key={bIdx}
                    className="bg-black/35 backdrop-blur-md border border-white/10 text-white rounded-xl px-3 py-1 text-[10px] font-semibold uppercase tracking-wider"
                  >
                    {badge}
                  </span>
                ))}
              </div>
            </div>

            <div className="p-6 flex items-center justify-between gap-4 flex-grow bg-white z-10">
              <div className="min-w-0 flex-1">
                <h3 className="text-xl font-bold text-foreground group-hover:text-brand transition-colors duration-200">
                  {region.name}
                </h3>
                <p className="text-xs text-muted font-normal truncate mt-1">{region.states}</p>
              </div>
              <div className="shrink-0 text-right">
                <span className="text-[11px] text-neutral-600 font-semibold tracking-tight bg-neutral-50 px-3 py-1.5 rounded-xl border border-neutral-200/50 group-hover:bg-neutral-100 transition-all duration-300">
                  {region.moreCount}
                </span>
              </div>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
