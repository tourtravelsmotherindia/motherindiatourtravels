"use client";

import React, { useState } from "react";
import Image from "next/image";
import { Search, Calendar, Users, MapPin } from "lucide-react";
import { motion } from "framer-motion";

export default function Hero() {
  const [destination, setDestination] = useState("");
  const [checkIn, setCheckIn] = useState("");
  const [checkOut, setCheckOut] = useState("");
  const [guests, setGuests] = useState(1);

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    alert(`Searching for: ${destination} | Dates: ${checkIn} to ${checkOut} | Guests: ${guests}`);
  };

  return (
    <section className="relative w-full px-4 md:px-8 pt-4 pb-20 max-w-[1440px] mx-auto">
      {/* Hero Banner Container */}
      <div className="relative h-[550px] md:h-[650px] w-full rounded-[2.5rem] overflow-hidden bg-brand-dark flex items-center justify-center">
        {/* Background Image */}
        <Image
          src="/images/hero_banner.png"
          alt="Paragliding in the Himalayas"
          fill
          priority
          className="object-cover object-center opacity-85"
        />

        {/* Dark overlay for readability */}
        <div className="absolute inset-0 bg-gradient-to-t from-brand-dark/40 via-transparent to-brand-dark/25" />

        {/* Text Content */}
        <div className="relative z-10 text-center px-4 max-w-4xl flex flex-col items-center">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="flex flex-col gap-3"
          >
            <span className="text-white/90 uppercase tracking-widest text-xs md:text-sm font-bold bg-white/10 backdrop-blur-md px-4 py-1.5 rounded-full border border-white/10">
              Escape the City,
            </span>
            <h1 className="text-4xl sm:text-5xl md:text-7xl font-extrabold text-white tracking-tight leading-[1.1] font-sans">
              Discover Peace, <br />
              <span className="font-serif italic font-medium text-brand-light tracking-wide">
                Explore the World
              </span>
            </h1>
          </motion.div>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.15 }}
            className="mt-6 text-sm md:text-lg text-white/90 font-medium leading-relaxed max-w-xl"
          >
            Curated travel packages & customized budget tours designed by <span className="font-bold text-white">Mother India Tour Travels</span>.
          </motion.p>
        </div>
      </div>

      {/* Floating Search Panel */}
      <div className="relative -mt-16 z-20 max-w-5xl mx-auto px-4 w-full">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="bg-white rounded-3xl p-6 md:p-8 shadow-premium border border-border-light flex flex-col items-center gap-6"
        >
          <form onSubmit={handleSearch} className="w-full flex flex-col items-center gap-6">
            {/* Grid of Inputs */}
            <div className="w-full grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 items-center divide-y sm:divide-y-0 lg:divide-x divide-border-light">
              
              {/* Destination Column */}
              <div className="flex items-center gap-3.5 pb-4 sm:pb-0 lg:px-4">
                <MapPin className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    Destination
                  </label>
                  <input
                    type="text"
                    value={destination}
                    onChange={(e) => setDestination(e.target.value)}
                    placeholder="Where are you going?"
                    className="w-full text-sm font-semibold text-foreground placeholder:text-muted/65 focus:outline-none bg-transparent"
                  />
                </div>
              </div>

              {/* Check-in Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4">
                <Calendar className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    Check-in Date
                  </label>
                  <input
                    type="date"
                    value={checkIn}
                    onChange={(e) => setCheckIn(e.target.value)}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer"
                  />
                </div>
              </div>

              {/* Check-out Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4">
                <Calendar className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    Check-out Date
                  </label>
                  <input
                    type="date"
                    value={checkOut}
                    onChange={(e) => setCheckOut(e.target.value)}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer"
                  />
                </div>
              </div>

              {/* Guests Column */}
              <div className="flex items-center gap-3.5 pt-4 sm:pt-0 lg:px-4">
                <Users className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    Add Guests
                  </label>
                  <select
                    value={guests}
                    onChange={(e) => setGuests(Number(e.target.value))}
                    className="w-full text-sm font-semibold text-foreground focus:outline-none bg-transparent cursor-pointer appearance-none"
                  >
                    {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((num) => (
                      <option key={num} value={num}>
                        {num} Guest{num > 1 ? "s" : ""}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

            </div>

            {/* CTA Button */}
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              type="submit"
              className="px-10 py-4 bg-brand hover:bg-brand-hover text-white rounded-full font-bold text-sm shadow-premium transition-all duration-300 hover:-translate-y-0.5 flex items-center gap-2 cursor-pointer tracking-wider"
            >
              <Search className="w-4 h-4 text-white" />
              Find Your Escape
            </motion.button>
          </form>
        </motion.div>
      </div>
    </section>
  );
}
