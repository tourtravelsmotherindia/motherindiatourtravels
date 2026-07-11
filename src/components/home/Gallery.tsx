"use client";

import { motion } from "framer-motion";
import { Eye } from "lucide-react";
import Image from "next/image";
import React from "react";

import SectionHeader from "@/components/shared/SectionHeader";

interface GalleryItem {
  id: number;
  title: string;
  location: string;
  image: string;
}

export default function Gallery() {
  const galleryItems: GalleryItem[] = [
    {
      id: 1,
      title: "Agra (Taj Mahal)",
      location: "Uttar Pradesh",
      image:
        "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 2,
      title: "Houseboat Cruise",
      location: "Alleppey, Kerala",
      image:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 3,
      title: "Pangong Lake",
      location: "Leh Ladakh",
      image:
        "https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 4,
      title: "Thar Desert Safari",
      location: "Jaisalmer, Rajasthan",
      image:
        "https://images.unsplash.com/photo-1542856391-010fb87dcfed?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 5,
      title: "Ganges Aarti",
      location: "Varanasi, Uttar Pradesh",
      image:
        "https://images.unsplash.com/photo-1561361058-c24cecae35ca?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 6,
      title: "Hawa Mahal",
      location: "Jaipur, Rajasthan",
      image:
        "https://images.unsplash.com/photo-1603262110263-fb0112e7cc33?auto=format&fit=crop&w=800&q=80",
    },
  ];

  return (
    <section id="gallery" className="py-24 scroll-mt-24 layout-container">
      <SectionHeader
        title="Our Travel Gallery"
        subtitle="Catch a glimpse of the mesmerizing landscapes, historical monuments, and soulful cultures captured during our curated trips."
      />

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {galleryItems.map((item, idx) => (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, delay: idx * 0.08 }}
            key={item.id}
            className="group relative h-[300px] lg:h-[340px] xl:h-[370px] 2xl:h-[400px] rounded-[2rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-300 border border-border-light cursor-pointer"
          >
            <Image
              src={item.image}
              alt={item.title}
              fill
              sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
              className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
              priority={idx === 0}
            />

            <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/20 to-transparent opacity-80 group-hover:opacity-90 transition-opacity duration-300" />

            <div className="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <span className="w-12 h-12 rounded-full bg-white/20 backdrop-blur-md border border-white/30 flex items-center justify-center text-white shadow-lg transform scale-75 group-hover:scale-100 transition-all duration-300">
                <Eye className="w-5 h-5" />
              </span>
            </div>

            <div className="absolute bottom-0 left-0 right-0 p-6 flex flex-col gap-1 text-white z-10 transform translate-y-1 group-hover:translate-y-0 transition-transform duration-300">
              <span className="text-xs font-semibold text-brand-light/95 uppercase tracking-widest">
                {item.location}
              </span>
              <h3 className="text-lg md:text-xl font-bold tracking-tight">{item.title}</h3>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
