"use client";

import { motion } from "framer-motion";
import Image from "next/image";
import Link from "next/link";
import React from "react";

import SectionHeader from "@/components/shared/SectionHeader";
import SeeAllLink from "@/components/ui/SeeAllLink";
import { getOptimizedImageUrl } from "@/lib/utils/imageOptimizer";

interface Region {
  id: number;
  name: string;
  image: string;
  states: string;
  moreCount: string;
  badges: string[];
}

export default function RegionsGrid({ regions }: { regions: Region[] }) {
  const rightSlot = <SeeAllLink href="/regions/" label="See All Regions" />;

  return (
    <section id="regions" className="py-24 layout-container">
      <SectionHeader
        title="Destination By Region"
        subtitle="Explore adventures across every corner of the incredible Indian subcontinent"
        rightSlot={rightSlot}
      />

      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">
        {regions.map((region, idx) => {
          return (
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-50px" }}
              transition={{ duration: 0.5, delay: idx * 0.05 }}
              key={region.id}
              className="group relative flex flex-col h-full bg-transparent overflow-hidden rounded-2xl cursor-pointer"
            >
              {/* Image Block */}
              <div className="relative aspect-[4/3] w-full overflow-hidden rounded-2xl shadow-sm">
                <Image
                  src={getOptimizedImageUrl(region.image, 800)}
                  alt={region.name}
                  fill
                  sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
                  className="object-cover"
                  priority={idx < 3}
                />
                <div className="absolute top-4 left-4 flex items-center gap-2 z-20">
                  {region.badges.map((badge, bIdx) => (
                    <span
                      key={bIdx}
                      className="bg-black/35 backdrop-blur-md border border-white/10 text-white rounded-lg px-2.5 py-0.5 text-[9px] font-bold uppercase tracking-wider"
                    >
                      {badge}
                    </span>
                  ))}
                </div>
              </div>

              {/* Text Block below Image */}
              <div className="pt-4 pb-2 px-1 flex flex-col flex-grow">
                <h3 className="text-lg font-bold text-foreground">{region.name}</h3>
                <p className="text-xs text-neutral-500 font-normal truncate mt-1">
                  {region.states}
                </p>
                <div className="mt-3">
                  <span className="text-[10px] text-neutral-600 font-semibold bg-neutral-100 px-3 py-1 rounded-full">
                    {region.moreCount}
                  </span>
                </div>
              </div>

              {/* Clickable Overlay Link */}
              <Link
                href={`/regions?region=${encodeURIComponent(region.name)}`}
                className="absolute inset-0 z-10 cursor-pointer"
                aria-label={`Explore packages in ${region.name}`}
              />
            </motion.div>
          );
        })}
      </div>
    </section>
  );
}
