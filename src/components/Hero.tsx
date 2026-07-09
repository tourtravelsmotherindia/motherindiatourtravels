"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Calendar,
  CalendarDays,
  CalendarRange,
  ChevronLeft,
  ChevronRight,
  Compass,
  MapPin,
  Minus,
  Navigation,
  Plus,
  Search,
  Timer,
  Users,
} from "lucide-react";
import Image from "next/image";
import type React from "react";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";

import { useToast } from "@/context/ToastContext";

interface Slide {
  id: number;
  image: string;
  tag: string;
  title: string;
  description: string;
}

interface HeroData {
  slides: Slide[];
}

interface PackageItem {
  primary_destination: string;
  destinations?: string[];
}

interface PackagesData {
  packages: PackageItem[];
}

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
  const { showToast } = useToast();
  const [currentSlide, setCurrentSlide] = useState(0);
  const [destination, setDestination] = useState("");
  const [isPaused, setIsPaused] = useState(false);

  // Derive slides and destinations from props
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

  // Dropdown UI states
  const [activeDropdown, setActiveDropdown] = useState<"destination" | "dates" | "guests" | null>(
    null,
  );

  // Date selection states
  const [dateMode, setDateMode] = useState<"calendar" | "flexible">("calendar");
  const [selectedCheckIn, setSelectedCheckIn] = useState<Date | null>(null);
  const [selectedCheckOut, setSelectedCheckOut] = useState<Date | null>(null);
  const [hoverDate, setHoverDate] = useState<Date | null>(null);
  const [calendarMonth, setCalendarMonth] = useState<Date>(() => {
    const today = new Date();
    return new Date(today.getFullYear(), today.getMonth(), 1);
  });

  // Flexible date selection states
  const [flexibleDurationDays, setFlexibleDurationDays] = useState<
    "any" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10" | "8-10"
  >("7");
  const [selectedFlexibleMonth, setSelectedFlexibleMonth] = useState<Date>(() => {
    const today = new Date();
    return new Date(today.getFullYear(), today.getMonth(), 1);
  });

  // Guest count states
  const [adults, setAdults] = useState(1);
  const [childrenCount, setChildrenCount] = useState(0);
  const [kids, setKids] = useState(0);

  // Refs for outside click detection
  const destinationRef = useRef<HTMLDivElement>(null);
  const datesRef = useRef<HTMLDivElement>(null);
  const checkoutRef = useRef<HTMLDivElement>(null);
  const datesPopoverRef = useRef<HTMLDivElement>(null);
  const guestsRef = useRef<HTMLDivElement>(null);

  const totalSlides = slides.length;

  const goToSlide = useCallback(
    (index: number) => setCurrentSlide((index + totalSlides) % totalSlides),
    [totalSlides],
  );

  const nextSlide = useCallback(() => goToSlide(currentSlide + 1), [currentSlide, goToSlide]);
  const prevSlide = useCallback(() => goToSlide(currentSlide - 1), [currentSlide, goToSlide]);

  // Auto-rotate slides
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
      if (
        activeDropdown === "dates" &&
        datesRef.current &&
        !datesRef.current.contains(event.target as Node) &&
        checkoutRef.current &&
        !checkoutRef.current.contains(event.target as Node) &&
        datesPopoverRef.current &&
        !datesPopoverRef.current.contains(event.target as Node)
      ) {
        setActiveDropdown(null);
      }
      if (
        activeDropdown === "guests" &&
        guestsRef.current &&
        !guestsRef.current.contains(event.target as Node)
      ) {
        setActiveDropdown(null);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [activeDropdown]);

  // Destination filtering
  const filteredDestinations = useMemo(() => {
    if (!destination) return [];
    return allDestinations.filter((dest) => dest.toLowerCase().includes(destination.toLowerCase()));
  }, [destination, allDestinations]);

  // Calendar Helpers
  const getDaysInMonth = (year: number, month: number) => {
    return new Date(year, month + 1, 0).getDate();
  };

  const getFirstDayOfMonth = (year: number, month: number) => {
    const day = new Date(year, month, 1).getDay();
    return day === 0 ? 6 : day - 1; // Adjust to Monday = 0
  };

  const generateMonthDays = (year: number, month: number) => {
    const daysInMonth = getDaysInMonth(year, month);
    const firstDay = getFirstDayOfMonth(year, month);
    const days = [];

    for (let i = 0; i < firstDay; i++) {
      days.push(null);
    }

    for (let d = 1; d <= daysInMonth; d++) {
      days.push(new Date(year, month, d));
    }

    return days;
  };

  const isSameDay = (d1: Date | null, d2: Date | null) => {
    if (!d1 || !d2) return false;
    return (
      d1.getFullYear() === d2.getFullYear() &&
      d1.getMonth() === d2.getMonth() &&
      d1.getDate() === d2.getDate()
    );
  };

  const isDateInRange = (date: Date) => {
    if (!selectedCheckIn || !selectedCheckOut) return false;
    return date > selectedCheckIn && date < selectedCheckOut;
  };

  const getDurationDays = () => {
    if (!selectedCheckIn || !selectedCheckOut) return null;
    const diffTime = Math.abs(selectedCheckOut.getTime() - selectedCheckIn.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays;
  };

  const isDateInHoverRange = (date: Date) => {
    if (!selectedCheckIn || selectedCheckOut || !hoverDate) return false;
    return date > selectedCheckIn && date < hoverDate;
  };

  const todayRef = useMemo(() => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return today;
  }, []);

  const isDateDisabled = (date: Date) => {
    return date < todayRef;
  };

  const handleDateClick = (date: Date) => {
    if (!selectedCheckIn || (selectedCheckIn && selectedCheckOut)) {
      setSelectedCheckIn(date);
      setSelectedCheckOut(null);
    } else {
      if (date < selectedCheckIn) {
        setSelectedCheckIn(date);
      } else {
        // Calculate duration in days
        const diffTime = Math.abs(date.getTime() - selectedCheckIn.getTime());
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        if (diffDays > 10) {
          showToast(
            "error",
            "Maximum duration exceeded",
            "Tours are limited to a maximum of 10 days",
          );
          return;
        }

        setSelectedCheckOut(date);
      }
    }
  };

  const prevMonth = () => {
    setCalendarMonth(new Date(calendarMonth.getFullYear(), calendarMonth.getMonth() - 1, 1));
  };

  const nextMonth = () => {
    setCalendarMonth(new Date(calendarMonth.getFullYear(), calendarMonth.getMonth() + 1, 1));
  };

  const rightMonthDate = new Date(calendarMonth.getFullYear(), calendarMonth.getMonth() + 1, 1);

  // Flexible duration & month calculation
  const flexibleMonths = useMemo(() => {
    const months = [];
    const today = new Date();
    for (let i = 0; i < 8; i++) {
      months.push(new Date(today.getFullYear(), today.getMonth() + i, 1));
    }
    return months;
  }, []);

  const handleFlexibleSelection = (durationDays: typeof flexibleDurationDays, month: Date) => {
    setFlexibleDurationDays(durationDays);
    setSelectedFlexibleMonth(month);

    const year = month.getFullYear();
    const m = month.getMonth();
    let start = new Date(year, m, 1);
    let end = new Date(year, m, 8);

    if (durationDays === "any") {
      start = new Date(year, m, 1);
      end = new Date(year, m + 1, 0);
    } else if (durationDays === "8-10") {
      start = new Date(year, m, 1);
      end = new Date(year, m, 10);
    } else {
      const days = parseInt(durationDays, 10);
      start = new Date(year, m, 1);
      end = new Date(year, m, days + 1);
    }

    setSelectedCheckIn(start);
    setSelectedCheckOut(end);
  };

  const handleSuggestionSelect = (suggName: string) => {
    setDestination(suggName);
    setActiveDropdown(null);
  };

  const MONTHS_SHORT = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

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

  // Date Formatting for Display — deterministic, no toLocaleDateString (avoids hydration mismatches)
  const formatDate = (date: Date | null) => {
    if (!date) return "";
    return `${MONTHS_SHORT[date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`;
  };

  const toISODate = (date: Date | null) => {
    if (!date) return "";
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, "0");
    const dd = String(date.getDate()).padStart(2, "0");
    return `${yyyy}-${mm}-${dd}`;
  };

  const formatTravelersSummary = () => {
    const total = adults + childrenCount + kids;
    if (total === 0) return "Add travelers";
    const parts = [];
    parts.push(`${adults} Adult${adults > 1 ? "s" : ""}`);
    if (childrenCount > 0) {
      parts.push(`${childrenCount} Child${childrenCount > 1 ? "ren" : ""}`);
    }
    if (kids > 0) {
      parts.push(`${kids} Kid${kids > 1 ? "s" : ""}`);
    }
    return `${total} Traveler${total > 1 ? "s" : ""} (${parts.join(", ")})`;
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

  // Helper to render one calendar month
  const renderCalendarMonth = (monthDate: Date) => {
    const year = monthDate.getFullYear();
    const month = monthDate.getMonth();
    const days = generateMonthDays(year, month);

    const monthLabel = `${MONTHS_LONG[monthDate.getMonth()]} ${monthDate.getFullYear()}`;

    return (
      <div className="flex-1 min-w-[220px] sm:min-w-[240px]">
        <div className="text-center font-bold text-foreground mb-3 font-sans text-sm">
          {monthLabel}
        </div>

        {/* Weekdays */}
        <div className="grid grid-cols-7 gap-0.5 text-center text-[10px] font-bold text-muted mb-1.5 uppercase tracking-wider">
          <span>Mon</span>
          <span>Tue</span>
          <span>Wed</span>
          <span>Thu</span>
          <span>Fri</span>
          <span>Sat</span>
          <span>Sun</span>
        </div>

        {/* Days Grid */}
        <div className="grid grid-cols-7 gap-y-1 gap-x-0.5 text-center">
          {days.map((day, idx) => {
            if (!day) {
              return <div key={`empty-${idx}`} className="h-7 w-7 sm:h-8 sm:w-8" />;
            }

            const disabled = isDateDisabled(day);
            const startSelected = isSameDay(day, selectedCheckIn);
            const endSelected = isSameDay(day, selectedCheckOut);
            const selected = startSelected || endSelected;
            const inRange = isDateInRange(day);
            const inHoverRange = isDateInHoverRange(day);

            let dayClass =
              "h-7 w-7 sm:h-8 sm:w-8 flex items-center justify-center rounded-full text-xs font-bold transition-all duration-150 cursor-pointer relative ";

            if (disabled) {
              dayClass += "text-gray-300 cursor-not-allowed pointer-events-none";
            } else if (selected) {
              dayClass += "bg-brand text-white shadow-sm shadow-brand/20 z-10";
            } else if (inRange) {
              dayClass += "bg-brand-light text-brand rounded-none w-full";
            } else if (inHoverRange) {
              dayClass += "bg-brand-light/70 text-brand/80 rounded-none w-full";
            } else {
              dayClass += "text-foreground hover:bg-gray-100 hover:text-brand";
            }

            let containerClass = "relative flex justify-center py-0.5 w-full ";
            if (inRange) {
              containerClass += "bg-brand-light";
            } else if (startSelected && selectedCheckOut) {
              containerClass += "bg-brand-light rounded-l-full";
            } else if (endSelected && selectedCheckIn) {
              containerClass += "bg-brand-light rounded-r-full";
            }

            return (
              <div
                key={day.toISOString()}
                className={containerClass}
                onMouseEnter={() => !disabled && setHoverDate(day)}
                onMouseLeave={() => setHoverDate(null)}
              >
                <button
                  type="button"
                  onClick={() => !disabled && handleDateClick(day)}
                  disabled={disabled}
                  className={dayClass}
                >
                  {day.getDate()}
                </button>
              </div>
            );
          })}
        </div>
      </div>
    );
  };

  return (
    <section
      id="home"
      className="relative w-full px-4 md:px-8 pt-4 pb-20 max-w-[1440px] mx-auto"
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      aria-label="Hero slider"
    >
      {/* Hero Banner Container */}
      <div className="relative h-[550px] md:h-[650px] w-full rounded-[2.5rem] overflow-hidden bg-black">
        {/* Slides — simultaneous enter/exit for smooth crossfade, no black flash */}
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

        {/* Subtle gradient behind text only — keeps light images readable */}
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

        {/* Navigation Arrows */}
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

        {/* Navigation Dots */}
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

      {/* Floating Search Panel */}
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
            {/* Grid of Inputs */}
            <div className="w-full grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 items-center divide-y sm:divide-y-0 lg:divide-x divide-border-light relative">
              {/* Destination Column */}
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

              {/* Column 2: Departure / Duration */}
              <div
                ref={datesRef}
                className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4 cursor-pointer relative w-full"
                onClick={() => setActiveDropdown("dates")}
              >
                {dateMode === "calendar" ? (
                  <Calendar className="w-5 h-5 text-brand shrink-0" />
                ) : (
                  <Timer className="w-5 h-5 text-brand shrink-0" />
                )}
                <div className="flex-1 min-w-0">
                  <span className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    {dateMode === "calendar" ? "Departure" : "Duration"}
                  </span>
                  <div className="text-sm font-semibold text-foreground">
                    {dateMode === "calendar"
                      ? selectedCheckIn
                        ? formatDate(selectedCheckIn)
                        : "Add date"
                      : flexibleDurationDays === "any"
                        ? "Any Duration"
                        : flexibleDurationDays === "8-10"
                          ? "8-10 Days"
                          : `${flexibleDurationDays} Days`}
                  </div>
                </div>
              </div>

              {/* Column 3: Return / Travel Month */}
              <div
                ref={checkoutRef}
                className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4 cursor-pointer relative w-full"
                onClick={() => setActiveDropdown("dates")}
              >
                {dateMode === "calendar" ? (
                  <CalendarRange className="w-5 h-5 text-brand shrink-0" />
                ) : (
                  <CalendarDays className="w-5 h-5 text-brand shrink-0" />
                )}
                <div className="flex-1 min-w-0">
                  <span className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    {dateMode === "calendar" ? "Return" : "Travel Month"}
                  </span>
                  <div className="text-sm font-semibold text-foreground">
                    {dateMode === "calendar"
                      ? selectedCheckOut
                        ? `${formatDate(selectedCheckOut)}${getDurationDays() ? ` (${getDurationDays()} Days)` : ""}`
                        : "Add date"
                      : `${MONTHS_LONG[selectedFlexibleMonth.getMonth()]} ${selectedFlexibleMonth.getFullYear()}`}
                  </div>
                </div>
              </div>

              {/* Travelers Column */}
              <div
                ref={guestsRef}
                className="relative flex items-center gap-3.5 pt-4 sm:pt-0 lg:px-4 cursor-pointer w-full"
                onClick={() => setActiveDropdown("guests")}
              >
                <Users className="w-5 h-5 text-brand shrink-0" />
                <div className="flex-1 min-w-0">
                  <span className="block text-[10px] text-muted font-bold uppercase tracking-wider mb-0.5">
                    Travelers
                  </span>
                  <div className="text-sm font-semibold text-foreground truncate">
                    {formatTravelersSummary()}
                  </div>
                </div>

                {/* Guests Dropdown */}
                <AnimatePresence>
                  {activeDropdown === "guests" && (
                    <motion.div
                      initial={{ opacity: 0, y: 10, scale: 0.95 }}
                      animate={{ opacity: 1, y: 0, scale: 1 }}
                      exit={{ opacity: 0, y: 10, scale: 0.95 }}
                      transition={{ duration: 0.15 }}
                      onClick={(e) => e.stopPropagation()} // Prevent close on clicking inside popup
                      className="absolute top-full right-0 mt-3 w-full sm:w-[320px] bg-white rounded-2xl border border-border-light shadow-2xl p-5 z-40 cursor-default"
                    >
                      <div className="space-y-6">
                        {/* Adults */}
                        <div className="flex items-center justify-between">
                          <div>
                            <div className="text-sm font-bold text-foreground">Adults</div>
                            <div className="text-xs text-muted">12 years & above</div>
                          </div>
                          <div className="flex items-center gap-3">
                            <button
                              type="button"
                              onClick={() => setAdults(Math.max(1, adults - 1))}
                              disabled={adults <= 1}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
                            >
                              <Minus className="w-4 h-4" />
                            </button>
                            <span className="text-sm font-bold text-foreground w-4 text-center">
                              {adults}
                            </span>
                            <button
                              type="button"
                              onClick={() => setAdults(adults + 1)}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
                            >
                              <Plus className="w-4 h-4" />
                            </button>
                          </div>
                        </div>

                        {/* Children */}
                        <div className="flex items-center justify-between">
                          <div>
                            <div className="text-sm font-bold text-foreground">Children</div>
                            <div className="text-xs text-muted">From 5 to under 12</div>
                          </div>
                          <div className="flex items-center gap-3">
                            <button
                              type="button"
                              onClick={() => setChildrenCount(Math.max(0, childrenCount - 1))}
                              disabled={childrenCount <= 0}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
                            >
                              <Minus className="w-4 h-4" />
                            </button>
                            <span className="text-sm font-bold text-foreground w-4 text-center">
                              {childrenCount}
                            </span>
                            <button
                              type="button"
                              onClick={() => setChildrenCount(childrenCount + 1)}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
                            >
                              <Plus className="w-4 h-4" />
                            </button>
                          </div>
                        </div>

                        {/* Kids */}
                        <div className="flex items-center justify-between">
                          <div>
                            <div className="text-sm font-bold text-foreground">Kids</div>
                            <div className="text-xs text-muted">From 2 to under 5</div>
                          </div>
                          <div className="flex items-center gap-3">
                            <button
                              type="button"
                              onClick={() => setKids(Math.max(0, kids - 1))}
                              disabled={kids <= 0}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand disabled:opacity-30 disabled:pointer-events-none transition-colors duration-200 cursor-pointer"
                            >
                              <Minus className="w-4 h-4" />
                            </button>
                            <span className="text-sm font-bold text-foreground w-4 text-center">
                              {kids}
                            </span>
                            <button
                              type="button"
                              onClick={() => setKids(kids + 1)}
                              className="w-8 h-8 rounded-full border border-border-light hover:border-brand/40 flex items-center justify-center text-muted hover:text-brand transition-colors duration-200 cursor-pointer"
                            >
                              <Plus className="w-4 h-4" />
                            </button>
                          </div>
                        </div>

                        {/* Divider & Apply Button */}
                        <div className="border-t border-border-light pt-4 flex justify-end">
                          <button
                            type="button"
                            onClick={() => setActiveDropdown(null)}
                            className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer"
                          >
                            Apply
                          </button>
                        </div>
                      </div>
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>

              {/* Dates Popover (placed inside relative grid container to align at high level) */}
              <AnimatePresence>
                {activeDropdown === "dates" && (
                  <motion.div
                    ref={datesPopoverRef}
                    initial={{ opacity: 0, y: 10, scale: 0.95 }}
                    animate={{ opacity: 1, y: 0, scale: 1 }}
                    exit={{ opacity: 0, y: 10, scale: 0.95 }}
                    transition={{ duration: 0.15 }}
                    onClick={(e) => e.stopPropagation()} // Prevent close on clicking inside popup
                    className="absolute top-full left-1/2 -translate-x-1/2 mt-3 w-[calc(100vw-32px)] sm:w-auto min-w-[300px] sm:min-w-[560px] bg-white rounded-3xl border border-border-light shadow-2xl p-4 z-40 cursor-default"
                  >
                    {/* Segmented Tab Control */}
                    <div className="flex justify-center mb-6">
                      <div className="bg-gray-100 p-1 rounded-full flex gap-1 border border-border-light relative">
                        <button
                          type="button"
                          onClick={() => setDateMode("calendar")}
                          className={`relative px-6 py-2 rounded-full text-xs font-bold transition-colors duration-200 z-10 cursor-pointer ${
                            dateMode === "calendar"
                              ? "text-foreground"
                              : "text-muted hover:text-foreground"
                          }`}
                        >
                          {dateMode === "calendar" && (
                            <motion.span
                              layoutId="activeDateTab"
                              className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                              transition={{ type: "spring", stiffness: 380, damping: 30 }}
                            />
                          )}
                          Calendar
                        </button>
                        <button
                          type="button"
                          onClick={() => setDateMode("flexible")}
                          className={`relative px-6 py-2 rounded-full text-xs font-bold transition-colors duration-200 z-10 cursor-pointer ${
                            dateMode === "flexible"
                              ? "text-foreground"
                              : "text-muted hover:text-foreground"
                          }`}
                        >
                          {dateMode === "flexible" && (
                            <motion.span
                              layoutId="activeDateTab"
                              className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                              transition={{ type: "spring", stiffness: 380, damping: 30 }}
                            />
                          )}
                          {"I'm flexible"}
                        </button>
                      </div>
                    </div>

                    {dateMode === "calendar" ? (
                      <div>
                        {/* Double Calendar Header with arrows */}
                        <div className="flex items-center justify-between px-2 mb-4">
                          <button
                            type="button"
                            onClick={prevMonth}
                            className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-muted hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer"
                          >
                            <ChevronLeft className="w-4 h-4" />
                          </button>
                          <button
                            type="button"
                            onClick={nextMonth}
                            className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-muted hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer"
                          >
                            <ChevronRight className="w-4 h-4" />
                          </button>
                        </div>

                        {/* Side-by-side Monthly Calendars */}
                        <div className="flex flex-col sm:flex-row gap-5 items-start justify-center">
                          {renderCalendarMonth(calendarMonth)}
                          <div className="hidden sm:block border-l border-border-light h-[230px] self-stretch" />
                          <div className="hidden sm:block">
                            {renderCalendarMonth(rightMonthDate)}
                          </div>
                        </div>

                        {/* Footer Actions */}
                        <div className="flex justify-between items-center border-t border-border-light pt-4 mt-6">
                          <div className="text-xs text-muted">
                            {selectedCheckIn && selectedCheckOut ? (
                              <span>
                                Selected: {formatDate(selectedCheckIn)} –{" "}
                                {formatDate(selectedCheckOut)}
                                {getDurationDays() ? ` (${getDurationDays()} Days)` : ""}
                              </span>
                            ) : selectedCheckIn ? (
                              <span>Select return date</span>
                            ) : (
                              <span>Select departure date</span>
                            )}
                          </div>
                          <button
                            type="button"
                            onClick={() => setActiveDropdown(null)}
                            className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer"
                          >
                            Apply
                          </button>
                        </div>
                      </div>
                    ) : (
                      <div>
                        {/* I'm flexible view */}
                        <div className="space-y-6">
                          {/* How many days */}
                          <div>
                            <div className="text-sm font-bold text-foreground mb-3 text-center sm:text-left font-sans">
                              How many days?
                            </div>
                            <div className="flex flex-wrap gap-2 justify-center sm:justify-start">
                              {(
                                ["any", "3", "4", "5", "6", "7", "8", "9", "10", "8-10"] as const
                              ).map((dur) => {
                                const label =
                                  dur === "any"
                                    ? "Any"
                                    : dur === "8-10"
                                      ? "8-10 Days"
                                      : `${dur} Days`;
                                return (
                                  <button
                                    type="button"
                                    key={dur}
                                    onClick={() =>
                                      handleFlexibleSelection(dur, selectedFlexibleMonth)
                                    }
                                    className={`px-4 py-2 rounded-full border text-xs font-semibold transition-all duration-200 cursor-pointer ${
                                      flexibleDurationDays === dur
                                        ? "border-brand bg-brand-light/35 text-brand font-semibold shadow-premium"
                                        : "border-border-light bg-white hover:border-brand/40 hover:bg-brand-light/10 text-muted"
                                    }`}
                                  >
                                    {label}
                                  </button>
                                );
                              })}
                            </div>
                          </div>

                          {/* Travel Month */}
                          <div>
                            <div className="text-sm font-bold text-foreground mb-3 text-center sm:text-left font-sans">
                              Travel Month
                            </div>
                            <div className="w-full flex gap-3 overflow-x-auto pb-4 snap-x no-scrollbar">
                              {flexibleMonths.map((m) => {
                                const isSelected =
                                  selectedFlexibleMonth.getMonth() === m.getMonth() &&
                                  selectedFlexibleMonth.getFullYear() === m.getFullYear();
                                return (
                                  <button
                                    type="button"
                                    key={m.toISOString()}
                                    onClick={() => handleFlexibleSelection(flexibleDurationDays, m)}
                                    className={`flex-shrink-0 snap-start flex flex-col items-center gap-2 p-3.5 rounded-2xl border transition-all duration-200 w-24 cursor-pointer ${
                                      isSelected
                                        ? "border-brand bg-brand-light/35 text-brand font-semibold shadow-premium"
                                        : "border-border-light bg-white hover:border-brand/40 hover:bg-brand-light/10 text-muted"
                                    }`}
                                  >
                                    {/* Calendar sheet icon */}
                                    <div
                                      className={`w-8 h-8 rounded-lg flex flex-col overflow-hidden border transition-colors duration-200 ${
                                        isSelected
                                          ? "border-brand/30 bg-brand text-white"
                                          : "border-border-light bg-gray-50 text-muted"
                                      }`}
                                    >
                                      <div
                                        className={`text-[7px] font-bold uppercase text-center py-0.5 transition-colors duration-200 ${
                                          isSelected
                                            ? "bg-brand-hover text-white"
                                            : "bg-gray-200 text-muted"
                                        }`}
                                      >
                                        {MONTHS_SHORT[m.getMonth()]}
                                      </div>
                                      <div className="flex-1 flex items-center justify-center text-[10px] font-bold font-sans">
                                        1
                                      </div>
                                    </div>

                                    {/* Month Labels */}
                                    <div className="text-center">
                                      <div className="text-[10px] font-bold text-foreground truncate font-sans">
                                        {MONTHS_LONG[m.getMonth()]}
                                      </div>
                                      <div className="text-[8px] text-muted font-sans">
                                        {m.getFullYear()}
                                      </div>
                                    </div>
                                  </button>
                                );
                              })}
                            </div>
                          </div>

                          {/* Footer Actions */}
                          <div className="flex justify-between items-center border-t border-border-light pt-4">
                            <div className="text-xs text-muted font-sans">
                              Selected:{" "}
                              {flexibleDurationDays === "any"
                                ? "Any Duration"
                                : flexibleDurationDays === "8-10"
                                  ? "8-10 Days"
                                  : `${flexibleDurationDays} Days`}{" "}
                              •{" "}
                              {`${MONTHS_LONG[selectedFlexibleMonth.getMonth()]} ${selectedFlexibleMonth.getFullYear()}`}
                            </div>
                            <button
                              type="button"
                              onClick={() => setActiveDropdown(null)}
                              className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer"
                            >
                              Apply
                            </button>
                          </div>
                        </div>
                      </div>
                    )}
                  </motion.div>
                )}
              </AnimatePresence>
            </div>

            {/* CTA Button */}
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              type="submit"
              className="px-10 py-4 bg-brand hover:bg-brand-hover text-white rounded-full font-bold text-sm shadow-premium transition-all duration-300 hover:-translate-y-0.5 flex items-center gap-2 cursor-pointer tracking-wider mt-4"
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
