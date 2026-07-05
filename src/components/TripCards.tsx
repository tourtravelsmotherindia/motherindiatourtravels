"use client";

import React from "react";
import Image from "next/image";
import Link from "next/link";
import { ArrowRight, Clock } from "lucide-react";
import { motion } from "framer-motion";

interface Trip {
  id: number;
  title: string;
  image: string;
  badge: {
    text: string;
    dotColor: string;
    bgColor: string;
    textColor: string;
  };
  price: string;
  duration: string;
}

export default function TripCards() {
  const trips: Trip[] = [
    {
      id: 1,
      title: "Himalayan Heights Retreat",
      image: "/images/trip_ladakh.png",
      badge: {
        text: "Private Guided",
        dotColor: "bg-orange-500",
        bgColor: "bg-orange-50",
        textColor: "text-orange-700",
      },
      price: "$1,450",
      duration: "5 days",
    },
    {
      id: 2,
      title: "Kerala Backwater Escape",
      image: "/images/trip_kerala.png",
      badge: {
        text: "Self-Guided",
        dotColor: "bg-purple-500",
        bgColor: "bg-purple-50",
        textColor: "text-purple-700",
      },
      price: "$1,190",
      duration: "4 days",
    },
    {
      id: 3,
      title: "Rajasthan Desert Safari",
      image: "/images/trip_rajasthan.png",
      badge: {
        text: "Small Group Tour",
        dotColor: "bg-red-500",
        bgColor: "bg-red-50",
        textColor: "text-red-700",
      },
      price: "$950",
      duration: "4 days",
    },
    {
      id: 4,
      title: "Taj Mahal & Golden Triangle",
      image: "/images/trip_tajmahal.png",
      badge: {
        text: "Solo Adventure",
        dotColor: "bg-blue-500",
        bgColor: "bg-blue-50",
        textColor: "text-blue-700",
      },
      price: "$1,200",
      duration: "6 days",
    },
  ];

  return (
    <section id="trips" className="py-16 px-4 md:px-8 max-w-[1440px] mx-auto">
      {/* Section Header */}
      <div className="flex flex-col md:flex-row md:items-end justify-between mb-10 gap-4">
        <div>
          <h2 className="text-3xl md:text-5xl font-extrabold text-foreground tracking-tight leading-[1.1]">
            Find Trips That <span className="font-serif italic font-medium text-brand">Move You</span>
          </h2>
          <p className="text-muted font-medium mt-2">
            Handpicked adventures designed to inspire
          </p>
        </div>
        <Link
          href="#"
          className="flex items-center gap-2 text-brand hover:text-brand-hover font-bold text-sm group shrink-0"
        >
          <span>See All Trips</span>
          <span className="w-8 h-8 rounded-full border border-brand/20 flex items-center justify-center group-hover:border-brand transition-all duration-300">
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5 duration-300" />
          </span>
        </Link>
      </div>

      {/* Grid of Trip Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        {trips.map((trip, idx) => (
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.5, delay: idx * 0.1 }}
            key={trip.id}
            className="group bg-white rounded-[2rem] overflow-hidden border border-border-light shadow-card hover:shadow-premium transition-all duration-300 flex flex-col h-full"
          >
            {/* Image Container */}
            <div className="relative h-56 w-full overflow-hidden p-3 pb-0">
              <div className="relative w-full h-full rounded-[1.5rem] overflow-hidden">
                <Image
                  src={trip.image}
                  alt={trip.title}
                  fill
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>
            </div>

            {/* Content Container */}
            <div className="p-5 pt-4 flex flex-col flex-1">
              {/* Custom Badge */}
              <div className="flex items-center mb-3">
                <div
                  className={`inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider ${trip.badge.bgColor} ${trip.badge.textColor}`}
                >
                  <span className={`w-1.5 h-1.5 rounded-full ${trip.badge.dotColor}`} />
                  {trip.badge.text}
                </div>
              </div>

              {/* Title */}
              <h3 className="text-base font-bold text-foreground line-clamp-2 leading-snug mb-4 group-hover:text-brand transition-colors duration-200">
                {trip.title}
              </h3>

              {/* Spacer pushes the rest to the bottom */}
              <div className="mt-auto" />

              {/* Price & Duration */}
              <div className="flex items-center justify-between pt-4 border-t border-border-light mb-4">
                <div className="flex flex-col">
                  <span className="text-[10px] text-muted font-bold uppercase tracking-wider">Price</span>
                  <span className="text-lg font-extrabold text-foreground leading-none mt-1">
                    {trip.price}
                  </span>
                </div>
                <div className="flex items-center gap-1 text-muted">
                  <Clock className="w-3.5 h-3.5 text-muted/65" />
                  <span className="text-xs font-semibold">{trip.duration}</span>
                </div>
              </div>

              {/* Button */}
              <Link
                href="#"
                className="w-full py-3 bg-brand hover:bg-brand-hover text-white rounded-2xl text-center text-xs font-bold transition-all duration-200 block shadow-sm"
              >
                View Details
              </Link>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
