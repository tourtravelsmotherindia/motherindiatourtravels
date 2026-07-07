"use client";

import { motion } from "framer-motion";
import { ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";

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

  return (
    <section id="about" className="py-16 px-4 md:px-8 max-w-[1440px] mx-auto">
      {/* Section Header */}
      <div className="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-4">
        <div>
          <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
            Destination By <span className="text-brand">Region</span>
          </h2>
          <p className="text-muted font-medium mt-2">
            Explore adventures across every corner of the incredible Indian subcontinent
          </p>
        </div>
        <Link
          href="#"
          className="flex items-center gap-2 text-brand hover:text-brand-hover font-bold text-sm group shrink-0"
        >
          <span>See All Destinations</span>
          <span className="w-8 h-8 rounded-full border border-brand/20 flex items-center justify-center group-hover:border-brand transition-all duration-300">
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5 duration-300" />
          </span>
        </Link>
      </div>

      {/* Grid of Regions */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {regions.map((region, idx) => (
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.5, delay: idx * 0.08 }}
            key={region.id}
            className="group rounded-[2.5rem] overflow-hidden border border-border-light shadow-card hover:shadow-premium transition-all duration-300 flex flex-col h-[340px] relative bg-white"
          >
            {/* Top Half: Image and Floating Badges */}
            <div className="relative h-56 w-full overflow-hidden">
              <Image
                src={region.image}
                alt={region.name}
                fill
                sizes="(max-width: 768px) 100vw, 550px"
                className="object-cover transition-transform duration-500 group-hover:scale-103"
                priority={idx < 2}
              />
              {/* Floating Badges */}
              <div className="absolute top-5 left-5 flex items-center gap-2">
                {region.badges.map((badge, bIdx) => (
                  <span
                    key={bIdx}
                    className="bg-black/35 backdrop-blur-md border border-white/10 text-white rounded-full px-3 py-1 text-[10px] font-bold uppercase tracking-wider"
                  >
                    {badge}
                  </span>
                ))}
              </div>
            </div>

            {/* Bottom Half: Info Box */}
            <div className="p-6 flex items-center justify-between gap-4 flex-grow bg-white z-10">
              <div className="min-w-0 flex-1">
                <h3 className="text-xl font-extrabold text-foreground group-hover:text-brand transition-colors duration-200">
                  {region.name}
                </h3>
                <p className="text-xs text-muted font-semibold truncate mt-1">{region.states}</p>
              </div>
              <div className="shrink-0 text-right">
                <span className="text-[11px] text-brand font-extrabold tracking-tight bg-brand-light px-3 py-1.5 rounded-full border border-brand/10 group-hover:bg-brand group-hover:text-white transition-all duration-300">
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
