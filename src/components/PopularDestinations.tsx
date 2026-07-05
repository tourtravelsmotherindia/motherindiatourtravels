"use client";

import React, { useRef, useState } from "react";
import Image from "next/image";
import { motion } from "framer-motion";

interface Destination {
  id: number;
  name: string;
  hotels: string;
  image: string;
}

export default function PopularDestinations() {
  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0);

  const destinations: Destination[] = [
    {
      id: 1,
      name: "Goa Beaches",
      hotels: "1,200+ Hotels Available",
      image: "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 2,
      name: "Leh Ladakh",
      hotels: "480 Hotels Available",
      image: "https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 3,
      name: "Agra (Taj Mahal)",
      hotels: "850 Hotels Available",
      image: "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 4,
      name: "Kerala Backwaters",
      hotels: "950 Hotels Available",
      image: "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
    },
    {
      id: 5,
      name: "Varanasi Ghats",
      hotels: "510 Hotels Available",
      image: "https://images.unsplash.com/photo-1561361058-c24cecae35ca?auto=format&fit=crop&w=800&q=80",
    },
  ];

  const handleScroll = () => {
    if (!containerRef.current) return;
    const scrollLeft = containerRef.current.scrollLeft;
    const width = containerRef.current.offsetWidth;
    const index = Math.round(scrollLeft / (width / 2.5)); // Approx card width
    setActiveIndex(Math.min(Math.max(index, 0), destinations.length - 1));
  };

  const scrollToCard = (idx: number) => {
    if (!containerRef.current) return;
    const cardWidth = containerRef.current.scrollWidth / destinations.length;
    containerRef.current.scrollTo({
      left: idx * cardWidth,
      behavior: "smooth",
    });
    setActiveIndex(idx);
  };

  return (
    <section className="py-16 bg-brand-light/35 border-y border-border-light">
      <div className="max-w-[1440px] mx-auto px-4 md:px-8">
        {/* Section Header */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
            Most Popular <span className="font-serif italic font-medium text-brand">Destinations</span>
          </h2>
          <p className="text-muted font-medium mt-2">
            Explore the world&apos;s most sought-after travel experiences
          </p>
        </div>

        {/* Carousel Container */}
        <div
          ref={containerRef}
          onScroll={handleScroll}
          className="flex gap-6 overflow-x-auto pb-8 snap-x snap-mandatory no-scrollbar cursor-grab active:cursor-grabbing"
          style={{ scrollBehavior: "smooth" }}
        >
          {destinations.map((dest, idx) => (
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: idx * 0.08 }}
              key={dest.id}
              className="relative h-[420px] w-[260px] shrink-0 snap-start rounded-[2.5rem] overflow-hidden group shadow-card border border-border-light"
            >
              {/* Full Background Image */}
              <Image
                src={dest.image}
                alt={dest.name}
                fill
                sizes="(max-width: 768px) 100vw, 280px"
                className="object-cover transition-transform duration-500 group-hover:scale-105"
              />

              {/* Bottom dark gradient overlay */}
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent" />

              {/* Top/Badge Overlay (optional) */}
              <div className="absolute top-5 right-5 bg-white/10 backdrop-blur-md border border-white/20 text-white rounded-full px-3.5 py-1 text-[10px] font-bold uppercase tracking-wider">
                Trending
              </div>

              {/* Text content absolute positioning */}
              <div className="absolute bottom-6 left-6 right-6 text-white">
                <h3 className="text-xl font-extrabold tracking-tight leading-tight group-hover:translate-x-1 transition-transform duration-300">
                  {dest.name}
                </h3>
                <p className="text-xs text-white/80 font-medium mt-1">
                  {dest.hotels}
                </p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* Navigation Dot Indicators */}
        <div className="flex items-center justify-center gap-2 mt-6">
          {destinations.map((_, idx) => (
            <button
              key={idx}
              onClick={() => scrollToCard(idx)}
              className={`h-2.5 rounded-full transition-all duration-300 ${
                activeIndex === idx
                  ? "w-8 bg-brand"
                  : "w-2.5 bg-muted/30 hover:bg-muted/50"
              }`}
              aria-label={`Go to slide ${idx + 1}`}
            />
          ))}
        </div>
      </div>
    </section>
  );
}
