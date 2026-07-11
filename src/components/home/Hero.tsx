"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronLeft, ChevronRight, Compass, MapPin, Navigation, Search } from "lucide-react";
import Image from "next/image";
import type React from "react";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";

import DatePickerField from "@/components/shared/DatePickerField";
import TravelersField from "@/components/shared/TravelersField";
import { type HeroData, type Slide } from "@/types/hero";
import { type PackageItem, type PackagesData } from "@/types/package";

const AUTO_ROTATE_INTERVAL = 5000;

const popularSuggestions = [
  { name: "Nearby", desc: "Find what's around you", icon: Navigation },
  { name: "Kashmir", desc: "Charming valleys & lakes", icon: Compass },
  { name: "Kerala", desc: "God's own country backwaters", icon: Compass },
  { name: "Goa", desc: "Sun-kissed beaches & nightlife", icon: Compass },
  { name: "Thailand", desc: "Exotic beaches & culture", icon: Compass },
  { name: "Dubai", desc: "Luxury shopping & skyscrapers", icon: Compass },
];

export default function Hero({
  heroData,
  packagesData,
}: {
  heroData?: HeroData;
  packagesData?: PackagesData;
}) {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [destination, setDestination] = useState("");
  const [isPaused, setIsPaused] = useState(false);

  const slides: Slide[] = heroData?.slides || [];
  const allDestinations = Array.from(
    new Set(
      (packagesData?.packages || []).flatMap((pkg: PackageItem) => [
        pkg.primary_destination,
        ...(pkg.destinations || []),
      ]),
    ),
  )
    .filter(Boolean)
    .sort();

  const [activeDropdown, setActiveDropdown] = useState<"destination" | "dates" | "guests" | null>(
    null,
  );

  const [dateMode, setDateMode] = useState<"calendar" | "flexible">("calendar");
  const [selectedCheckIn, setSelectedCheckIn] = useState<Date | null>(null);
  const [selectedCheckOut, setSelectedCheckOut] = useState<Date | null>(null);

  const [flexibleDurationDays, setFlexibleDurationDays] = useState<
    "any" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10" | "8-10"
  >("7");
  const [selectedFlexibleMonth, setSelectedFlexibleMonth] = useState<Date>(() => {
    const today = new Date();
    return new Date(today.getFullYear(), today.getMonth(), 1);
  });

  const [adults, setAdults] = useState(1);
  const [childrenCount, setChildrenCount] = useState(0);
  const [kids, setKids] = useState(0);

  const destinationRef = useRef<HTMLDivElement>(null);

  const totalSlides = slides.length;

  const goToSlide = useCallback(
    (index: number) => setCurrentSlide((index + totalSlides) % totalSlides),
    [totalSlides],
  );

  const nextSlide = useCallback(() => goToSlide(currentSlide + 1), [currentSlide, goToSlide]);
  const prevSlide = useCallback(() => goToSlide(currentSlide - 1), [currentSlide, goToSlide]);

  useEffect(() => {
    if (isPaused) return;
    const timer = setInterval(nextSlide, AUTO_ROTATE_INTERVAL);
    return () => clearInterval(timer);
  }, [nextSlide, isPaused]);

  // Click outside listener
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        activeDropdown === "destination" &&
        destinationRef.current &&
        !destinationRef.current.contains(event.target as Node)
      ) {
        setActiveDropdown(null);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [activeDropdown]);

  const filteredDestinations = useMemo(() => {
    if (!destination) return [];
    return allDestinations.filter((dest) => dest.toLowerCase().includes(destination.toLowerCase()));
  }, [destination, allDestinations]);

  const handleSuggestionSelect = (suggName: string) => {
    setDestination(suggName);
    setActiveDropdown(null);
  };

  const MONTHS_LONG = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  // Uses a manual formatter instead of toLocaleDateString to avoid
  // hydration mismatches between server and client rendering.

  const toISODate = (date: Date | null) => {
    if (!date) return "";
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, "0");
    const dd = String(date.getDate()).padStart(2, "0");
    return `${yyyy}-${mm}-${dd}`;
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (!destination) {
      alert("Please select a destination");
      return;
    }
    const travelerCount = adults + childrenCount + kids;
    if (dateMode === "calendar") {
      const checkInStr = selectedCheckIn ? toISODate(selectedCheckIn) : "";
      const checkOutStr = selectedCheckOut ? toISODate(selectedCheckOut) : "";
      alert(
        `Searching Calendar: ${destination} | Departure: ${checkInStr} | Return: ${checkOutStr} | Travelers: ${travelerCount} (${adults} Adults, ${childrenCount} Children, ${kids} Kids)`,
      );
    } else {
      const durationLabel =
        flexibleDurationDays === "any"
          ? "Any Duration"
          : flexibleDurationDays === "8-10"
            ? "8-10 Days"
            : `${flexibleDurationDays} Days`;
      const monthStr = `${MONTHS_LONG[selectedFlexibleMonth.getMonth()]} ${selectedFlexibleMonth.getFullYear()}`;
      alert(
        `Searching Flexible: ${destination} | Duration: ${durationLabel} | Travel Month: ${monthStr} | Travelers: ${travelerCount} (${adults} Adults, ${childrenCount} Children, ${kids} Kids)`,
      );
    }
  };

  return (
    <section
      id="home"
      className="relative w-full pt-4 pb-24 layout-container"
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      aria-label="Hero slider"
    >
      <div className="relative h-[550px] md:h-[650px] w-full rounded-[2.5rem] overflow-hidden bg-black">
        <AnimatePresence>
          <motion.div
            key={slides[currentSlide].id}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 1.2, ease: "easeInOut" }}
            className="absolute inset-0"
          >
            <Image
              src={slides[currentSlide].image}
              alt={slides[currentSlide].title}
              fill
              sizes="100vw"
              priority
              className="object-cover object-center"
            />
          </motion.div>
        </AnimatePresence>

        <div className="absolute inset-0 bg-gradient-to-r from-black/40 via-black/15 to-transparent pointer-events-none" />

        {/* Slide Text Content */}
        <AnimatePresence mode="wait">
          <motion.div
            key={`content-${slides[currentSlide].id}`}
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.5, delay: 0.15 }}
            className="absolute inset-0 flex items-center"
          >
            <div className="container mx-auto px-6 lg:px-12">
              <div className="max-w-2xl">
                <span className="inline-block text-white font-semibold tracking-widest text-xs md:text-sm bg-black/30 backdrop-blur-md px-4 py-1.5 rounded-full border border-white/15 mb-4">
                  {slides[currentSlide].tag}
                </span>
                <h1 className="text-4xl md:text-6xl font-extrabold text-white mt-4 leading-tight tracking-tight font-display [text-shadow:0_2px_12px_rgba(0,0,0,0.7)]">
                  {slides[currentSlide].title}
                </h1>
                <p className="text-gray-100 mt-6 text-base md:text-lg max-w-lg leading-relaxed [text-shadow:0_1px_6px_rgba(0,0,0,0.6)]">
                  {slides[currentSlide].description}
                </p>
              </div>
            </div>
          </motion.div>
        </AnimatePresence>

        <button
          type="button"
          onClick={prevSlide}
          className="absolute top-1/2 left-4 md:left-6 transform -translate-y-1/2 z-20 w-10 h-10 md:w-12 md:h-12 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white flex items-center justify-center hover:bg-white/25 transition-all duration-300 cursor-pointer"
          aria-label="Previous slide"
        >
          <ChevronLeft className="w-5 h-5 md:w-6 md:h-6" />
        </button>
        <button
          type="button"
          onClick={nextSlide}
          className="absolute top-1/2 right-4 md:right-6 transform -translate-y-1/2 z-20 w-10 h-10 md:w-12 md:h-12 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white flex items-center justify-center hover:bg-white/25 transition-all duration-300 cursor-pointer"
          aria-label="Next slide"
        >
          <ChevronRight className="w-5 h-5 md:w-6 md:h-6" />
        </button>

        <div className="absolute bottom-6 left-1/2 transform -translate-x-1/2 z-20 flex gap-2.5">
          {slides.map((_, index) => (
            <button
              type="button"
              key={index}
              onClick={() => goToSlide(index)}
              className={`w-2.5 h-2.5 rounded-full transition-all duration-300 cursor-pointer ${
                index === currentSlide
                  ? "bg-white scale-110 shadow-lg shadow-white/30"
                  : "bg-white/40 hover:bg-white/70"
              }`}
              aria-label={`Go to slide ${index + 1}`}
            />
          ))}
        </div>
      </div>

      <div className="relative -mt-16 z-20 max-w-5xl mx-auto px-4 w-full">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="bg-white rounded-3xl p-6 md:p-8 shadow-premium border border-border-light flex flex-col items-center gap-6"
        >
          <form
            onSubmit={handleSearch}
            className="w-full flex flex-col items-center gap-6 relative"
          >
            <div className="w-full grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 items-center divide-y sm:divide-y-0 lg:divide-x divide-border-light relative">
              <div
                ref={destinationRef}
                className="relative flex items-center gap-3.5 pb-4 sm:pb-0 lg:px-4 w-full"
              >
                <MapPin className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <label
                    htmlFor="search-destination"
                    className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5"
                  >
                    Destination
                  </label>
                  <input
                    id="search-destination"
                    type="text"
                    value={destination}
                    onChange={(e) => {
                      setDestination(e.target.value);
                      if (activeDropdown !== "destination") {
                        setActiveDropdown("destination");
                      }
                    }}
                    onFocus={() => setActiveDropdown("destination")}
                    placeholder="Where are you going?"
                    className="w-full text-sm font-semibold text-foreground placeholder:text-muted/65 focus:outline-none bg-transparent"
                    autoComplete="off"
                  />
                </div>

                {/* Destination Dropdown */}
                <AnimatePresence>
                  {activeDropdown === "destination" && (
                    <motion.div
                      initial={{ opacity: 0, y: 10, scale: 0.95 }}
                      animate={{ opacity: 1, y: 0, scale: 1 }}
                      exit={{ opacity: 0, y: 10, scale: 0.95 }}
                      transition={{ duration: 0.15 }}
                      className="absolute top-full left-0 mt-3 w-full sm:w-[320px] bg-white rounded-2xl border border-border-light shadow-2xl p-4 z-40"
                    >
                      {destination.trim() === "" ? (
                        <div>
                          <div className="text-[10px] font-bold text-muted uppercase tracking-wider mb-3 px-2">
                            Popular Suggestions
                          </div>
                          <div className="space-y-1">
                            {popularSuggestions.map((sugg) => {
                              const SuggIcon = sugg.icon;
                              return (
                                <button
                                  type="button"
                                  key={sugg.name}
                                  onClick={() => handleSuggestionSelect(sugg.name)}
                                  className="w-full flex items-center gap-3 p-2 rounded-xl hover:bg-brand-light text-left group transition-all duration-200 cursor-pointer"
                                >
                                  <div className="w-8 h-8 rounded-lg bg-gray-50 group-hover:bg-white border border-border-light flex items-center justify-center text-muted group-hover:text-brand transition-colors duration-200">
                                    <SuggIcon className="w-4 h-4" />
                                  </div>
                                  <div>
                                    <div className="text-sm font-bold text-foreground group-hover:text-brand transition-colors duration-200">
                                      {sugg.name}
                                    </div>
                                    <div className="text-xs text-muted">{sugg.desc}</div>
                                  </div>
                                </button>
                              );
                            })}
                          </div>
                        </div>
                      ) : (
                        <div>
                          <div className="text-[10px] font-bold text-muted uppercase tracking-wider mb-3 px-2">
                            Matched Destinations
                          </div>
                          {filteredDestinations.length > 0 ? (
                            <div className="space-y-1 max-h-[280px] overflow-y-auto no-scrollbar">
                              {filteredDestinations.map((dest) => (
                                <button
                                  type="button"
                                  key={dest}
                                  onClick={() => handleSuggestionSelect(dest)}
                                  className="w-full flex items-center gap-3 p-2.5 rounded-xl hover:bg-brand-light text-left group transition-all duration-200 cursor-pointer"
                                >
                                  <div className="w-8 h-8 rounded-lg bg-gray-50 group-hover:bg-white border border-border-light flex items-center justify-center text-muted group-hover:text-brand transition-colors duration-200">
                                    <MapPin className="w-4 h-4" />
                                  </div>
                                  <div className="text-sm font-bold text-foreground group-hover:text-brand transition-colors duration-200">
                                    {dest}
                                  </div>
                                </button>
                              ))}
                            </div>
                          ) : (
                            <div className="text-center py-6">
                              <MapPin className="w-8 h-8 text-muted mx-auto mb-2 opacity-50" />
                              <div className="text-sm font-semibold text-muted">
                                No matching destinations
                              </div>
                              <div className="text-xs text-muted/80 mt-1">
                                Try searching &quot;Goa&quot; or &quot;Kashmir&quot;
                              </div>
                            </div>
                          )}
                        </div>
                      )}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>

              <DatePickerField
                variant="search"
                dateMode={dateMode}
                setDateMode={setDateMode}
                selectedCheckIn={selectedCheckIn}
                setSelectedCheckIn={setSelectedCheckIn}
                selectedCheckOut={selectedCheckOut}
                setSelectedCheckOut={setSelectedCheckOut}
                flexibleDurationDays={flexibleDurationDays}
                setFlexibleDurationDays={setFlexibleDurationDays}
                selectedFlexibleMonth={selectedFlexibleMonth}
                setSelectedFlexibleMonth={setSelectedFlexibleMonth}
                activeDropdown={activeDropdown}
                setActiveDropdown={setActiveDropdown}
              />

              <TravelersField
                variant="search"
                adults={adults}
                setAdults={setAdults}
                childrenCount={childrenCount}
                setChildrenCount={setChildrenCount}
                kids={kids}
                setKids={setKids}
                activeDropdown={activeDropdown}
                setActiveDropdown={setActiveDropdown}
              />
            </div>

            {/* CTA Button */}
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              type="submit"
              className="px-10 py-4 bg-brand hover:bg-brand-hover text-white rounded-full font-semibold text-sm shadow-premium transition-all duration-300 hover:-translate-y-0.5 flex items-center gap-2 cursor-pointer tracking-wider mt-4"
            >
              <Search className="w-4 h-4 text-white" />
              Find Packages
            </motion.button>
          </form>
        </motion.div>
      </div>
    </section>
  );
}
