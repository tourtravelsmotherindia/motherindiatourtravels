"use client";

import { motion } from "framer-motion";
import { ArrowUpRight } from "lucide-react";

interface Airline {
  id: number;
  name: string;
  logoColor: string;
  logoLetter: string;
  textColor: string;
}

export default function PartnerAirlines() {
  const airlines: Airline[] = [
    {
      id: 1,
      name: "Air India",
      logoColor: "bg-[#D61F27]",
      logoLetter: "AI",
      textColor: "text-white",
    },
    {
      id: 2,
      name: "Emirates",
      logoColor: "bg-[#D71921]",
      logoLetter: "EK",
      textColor: "text-white",
    },
    {
      id: 3,
      name: "Singapore Airlines",
      logoColor: "bg-[#06205C]",
      logoLetter: "SQ",
      textColor: "text-[#D2A145]",
    },
    {
      id: 4,
      name: "Vistara",
      logoColor: "bg-[#4E1436]",
      logoLetter: "UK",
      textColor: "text-[#DCA54C]",
    },
    { id: 5, name: "IndiGo", logoColor: "bg-[#002B73]", logoLetter: "6E", textColor: "text-white" },
    {
      id: 6,
      name: "AirAsia",
      logoColor: "bg-[#E01E26]",
      logoLetter: "AK",
      textColor: "text-white",
    },
    {
      id: 7,
      name: "Qatar Airways",
      logoColor: "bg-[#5A122C]",
      logoLetter: "QR",
      textColor: "text-[#D0A465]",
    },
    {
      id: 8,
      name: "Turkish Airlines",
      logoColor: "bg-[#E81932]",
      logoLetter: "TK",
      textColor: "text-white",
    },
  ];

  return (
    <section className="py-16 bg-brand-light/35 border-b border-border-light">
      <div className="max-w-[1440px] mx-auto px-4 md:px-8">
        {/* Section Header */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-extrabold text-foreground tracking-tight">
            Search Top Airlines
          </h2>
          <p className="text-muted font-medium mt-2">
            Our trusted partners to fly you to your dream destinations
          </p>
        </div>

        {/* Airlines Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 md:gap-6">
          {airlines.map((airline, idx) => (
            <motion.div
              key={airline.id}
              initial={{ opacity: 0, y: 15 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4, delay: idx * 0.05 }}
              whileHover={{ scale: 1.02 }}
              className="bg-white rounded-full p-4 border border-border-light shadow-card hover:shadow-premium flex items-center justify-between hover:border-brand/20 transition-all duration-300 group cursor-pointer"
            >
              {/* Airline Branding */}
              <div className="flex items-center gap-3.5">
                {/* Custom Logo Badge */}
                <div
                  className={`w-9 h-9 rounded-full ${airline.logoColor} flex items-center justify-center font-extrabold text-xs tracking-wider shrink-0 ${airline.textColor}`}
                >
                  {airline.logoLetter}
                </div>
                <span className="text-sm font-bold text-foreground group-hover:text-brand transition-colors duration-200">
                  {airline.name}
                </span>
              </div>

              {/* Action Indicator */}
              <div className="w-8 h-8 rounded-full border border-border-light group-hover:border-brand/20 flex items-center justify-center text-muted group-hover:text-brand group-hover:bg-brand-light transition-all duration-300 shrink-0">
                <ArrowUpRight className="w-4 h-4 transition-transform group-hover:-translate-y-0.5 group-hover:translate-x-0.5 duration-300" />
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
