"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Calendar as CalendarIcon,
  ChevronLeft,
  ChevronRight,
  Mail,
  MessageSquare,
  User,
  Users,
  X,
} from "lucide-react";
import { usePathname } from "next/navigation";
import React, { useEffect, useRef, useState } from "react";

import PhoneInput from "@/components/ui/PhoneInput";
import { useToast } from "@/context/ToastContext";

export default function PopupModal() {
  const pathname = usePathname();
  const { showToast } = useToast();
  const [isOpen, setIsOpen] = useState(false);
  const [isCalendarOpen, setIsCalendarOpen] = useState(false);
  const [selectedPackage, setSelectedPackage] = useState<string | null>(null);

  // Form State
  const [fullName, setFullName] = useState("");
  const [email, setEmail] = useState("");
  const [countryVal, setCountryVal] = useState("IN:+91"); // format: "CODE:DIAL"
  const [phoneNumber, setPhoneNumber] = useState("");
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [travellers, setTravellers] = useState("1");
  const [message, setMessage] = useState("");

  // Calendar display state
  const [calendarMonth, setCalendarMonth] = useState(new Date());

  // Refs for outside click handling
  const calendarRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const hasSeen = sessionStorage.getItem("hasSeenPopup");
    if (hasSeen === "true") return;

    const timer = setTimeout(() => {
      setIsOpen(true);
    }, 4000);

    return () => clearTimeout(timer);
  }, []);

  // The modal can also be triggered programmatically by dispatching
  // a custom "open-inquiry-modal" event with an optional packageName payload.
  useEffect(() => {
    const handleOpen = (e: Event) => {
      const customEvent = e as CustomEvent<{ packageName?: string }>;
      if (customEvent.detail && customEvent.detail.packageName) {
        setSelectedPackage(customEvent.detail.packageName);
      } else {
        setSelectedPackage(null);
      }
      setIsOpen(true);
    };
    window.addEventListener("open-inquiry-modal", handleOpen);
    return () => {
      window.removeEventListener("open-inquiry-modal", handleOpen);
    };
  }, []);

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (
        isCalendarOpen &&
        calendarRef.current &&
        !calendarRef.current.contains(e.target as Node)
      ) {
        setIsCalendarOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [isCalendarOpen]);

  if (pathname?.startsWith("/manage")) {
    return null;
  }

  const getDaysInMonth = (year: number, month: number) => {
    return new Date(year, month + 1, 0).getDate();
  };

  const getFirstDayOfMonth = (year: number, month: number) => {
    const day = new Date(year, month, 1).getDay();
    return day === 0 ? 6 : day - 1; // Mon = 0, Sun = 6
  };

  const generateMonthDays = (year: number, month: number) => {
    const daysInMonth = getDaysInMonth(year, month);
    const firstDay = getFirstDayOfMonth(year, month);
    const days: (Date | null)[] = [];

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

  const isDateDisabled = (date: Date) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return date < today;
  };

  const handlePrevMonth = () => {
    setCalendarMonth(new Date(calendarMonth.getFullYear(), calendarMonth.getMonth() - 1, 1));
  };

  const handleNextMonth = () => {
    setCalendarMonth(new Date(calendarMonth.getFullYear(), calendarMonth.getMonth() + 1, 1));
  };

  const formatDateLabel = (date: Date | null) => {
    if (!date) return "mm/dd/yyyy";
    const dd = String(date.getDate()).padStart(2, "0");
    const mm = String(date.getMonth() + 1).padStart(2, "0");
    const yyyy = date.getFullYear();
    return `${mm}/${dd}/${yyyy}`;
  };

  const handleClose = () => {
    setIsOpen(false);
    setSelectedPackage(null);
    sessionStorage.setItem("hasSeenPopup", "true");
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!fullName.trim() || !email.trim() || !phoneNumber.trim() || !selectedDate) {
      showToast("error", "Verification Failed", "Please fill in all required fields.");
      return;
    }

    try {
      const dialCode = countryVal.split(":")[1] ?? "";
      const fullPhone = `${dialCode}${phoneNumber}`.trim();

      const { submitBooking } = await import("@/lib/api");
      await submitBooking({
        name: fullName.trim(),
        email: email.trim(),
        phone: fullPhone,
        packageInterest: selectedPackage ?? "",
        travelDate: selectedDate.toISOString(),
        adults: Number(travellers) || 1,
        message: message.trim(),
        source: "POPUP",
      });

      showToast(
        "success",
        "Trip Inquiry Received!",
        "Thank you for sharing your preferences. We will connect shortly!",
      );
    } catch (err) {
      const errMsg = err instanceof Error ? err.message : "Something went wrong. Please try again.";
      showToast("error", "Submission Failed", errMsg);
    } finally {
      setIsOpen(false);
      setSelectedPackage(null);
      sessionStorage.setItem("hasSeenPopup", "true");
    }
  };

  const MONTHS = [
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
  const WEEKDAYS = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  const calendarDays = generateMonthDays(calendarMonth.getFullYear(), calendarMonth.getMonth());

  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-50 overflow-y-auto bg-black/50 backdrop-blur-[3px]">
          <div className="fixed inset-0 cursor-default" onClick={handleClose} />

          <div className="flex min-h-full items-center justify-center p-4 sm:p-6 text-center">
            <motion.div
              initial={{ opacity: 0, scale: 0.93, y: 15 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.93, y: 15 }}
              transition={{ type: "spring", duration: 0.4, bounce: 0.15 }}
              className="relative w-full max-w-[420px] bg-white rounded-[2rem] p-5 sm:p-6 md:p-7 shadow-[0_20px_50px_rgba(0,0,0,0.12)] border border-neutral-100 flex flex-col gap-3.5 sm:gap-4 text-foreground font-sans z-10 text-left"
            >
              <button
                type="button"
                onClick={handleClose}
                className="absolute top-4 right-4 sm:top-5 sm:right-5 p-1.5 rounded-full text-neutral-400 hover:text-neutral-600 hover:bg-neutral-50 transition-colors duration-200 cursor-pointer"
                aria-label="Close popup"
              >
                <X className="w-5 h-5" />
              </button>

              <div className="text-center mt-2">
                <h2 className="font-display text-xl sm:text-2.5xl font-bold text-neutral-900 leading-tight">
                  {selectedPackage ? `Book ${selectedPackage}` : "Planning a Trip?"}
                </h2>
                <p className="font-sans text-neutral-500 text-[11px] sm:text-xs mt-1.5 max-w-[320px] mx-auto leading-relaxed">
                  {selectedPackage
                    ? `Tell us your travel dates and preferences for your custom ${selectedPackage} itinerary!`
                    : "Tell us your preferences and we'll do the rest – it's fast, free, and personalized!."}
                </p>
              </div>

              <form onSubmit={handleSubmit} className="flex flex-col gap-3.5 sm:gap-4 text-left">
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-semibold text-neutral-500 ml-1">Full Name*</label>
                  <div className="relative flex items-center">
                    <User className="absolute left-4.5 w-4 h-4 text-neutral-400" />
                    <input
                      type="text"
                      required
                      value={fullName}
                      onChange={(e) => setFullName(e.target.value)}
                      placeholder="Type your name"
                      className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/50 hover:border-neutral-300 font-sans transition-all duration-200"
                    />
                  </div>
                </div>

                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-semibold text-neutral-500 ml-1">
                    Email Address*
                  </label>
                  <div className="relative flex items-center">
                    <Mail className="absolute left-4.5 w-4 h-4 text-neutral-400" />
                    <input
                      type="email"
                      required
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      placeholder="Type your email address"
                      className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/50 hover:border-neutral-300 font-sans transition-all duration-200"
                    />
                  </div>
                </div>

                <PhoneInput
                  id="phoneNumber"
                  label="Phone Number*"
                  phoneNumber={phoneNumber}
                  onChange={setPhoneNumber}
                  countryCodeVal={countryVal}
                  onChangeCountryCode={setCountryVal}
                  placeholder="Phone Number"
                  required
                />

                <div className="grid grid-cols-2 gap-4">
                  <div className="flex flex-col gap-1.5 relative" ref={calendarRef}>
                    <label className="text-xs font-semibold text-neutral-500 ml-1">
                      Travel Date*
                    </label>
                    <button
                      type="button"
                      onClick={() => setIsCalendarOpen(!isCalendarOpen)}
                      className="w-full flex items-center justify-start gap-2.5 bg-white border border-neutral-200 rounded-full px-4 py-3 text-sm text-left focus:outline-none focus:border-brand/50 hover:border-neutral-300 cursor-pointer transition-all duration-200"
                    >
                      <CalendarIcon className="w-4 h-4 text-neutral-400 shrink-0" />
                      <span
                        className={`truncate text-sm ${selectedDate ? "text-neutral-700 font-medium" : "text-neutral-400"}`}
                      >
                        {formatDateLabel(selectedDate)}
                      </span>
                    </button>

                    <AnimatePresence>
                      {isCalendarOpen && (
                        <motion.div
                          initial={{ opacity: 0, scale: 0.95, y: 5 }}
                          animate={{ opacity: 1, scale: 1, y: 0 }}
                          exit={{ opacity: 0, scale: 0.95, y: 5 }}
                          transition={{ duration: 0.15 }}
                          className="absolute top-full left-0 mt-2 w-68 bg-white border border-neutral-200 rounded-2xl shadow-2xl p-3 z-50 cursor-default"
                          onClick={(e) => e.stopPropagation()}
                        >
                          <div className="flex items-center justify-between mb-3 px-1">
                            <span className="text-xs font-bold text-neutral-800 font-sans select-none">
                              {MONTHS[calendarMonth.getMonth()]} {calendarMonth.getFullYear()}
                            </span>
                            <div className="flex gap-1">
                              <button
                                type="button"
                                onClick={handlePrevMonth}
                                className="w-6 h-6 rounded-full border border-neutral-100 flex items-center justify-center text-neutral-500 hover:text-brand hover:bg-neutral-50 cursor-pointer"
                              >
                                <ChevronLeft className="w-3.5 h-3.5" />
                              </button>
                              <button
                                type="button"
                                onClick={handleNextMonth}
                                className="w-6 h-6 rounded-full border border-neutral-100 flex items-center justify-center text-neutral-500 hover:text-brand hover:bg-neutral-50 cursor-pointer"
                              >
                                <ChevronRight className="w-3.5 h-3.5" />
                              </button>
                            </div>
                          </div>

                          <div className="grid grid-cols-7 gap-0.5 text-center text-[9px] font-bold text-neutral-400 mb-1.5 uppercase select-none">
                            {WEEKDAYS.map((day) => (
                              <span key={day}>{day}</span>
                            ))}
                          </div>

                          <div className="grid grid-cols-7 gap-y-0.5 gap-x-0.5 text-center select-none">
                            {calendarDays.map((day, idx) => {
                              if (!day) {
                                return <div key={`empty-${idx}`} className="h-6 w-6" />;
                              }

                              const disabled = isDateDisabled(day);
                              const isSelected = isSameDay(day, selectedDate);

                              let dayClass =
                                "h-6.5 w-6.5 flex items-center justify-center rounded-full text-[10.5px] font-bold transition-all duration-150 cursor-pointer mx-auto ";

                              if (disabled) {
                                dayClass +=
                                  "text-neutral-200 cursor-not-allowed pointer-events-none";
                              } else if (isSelected) {
                                dayClass += "bg-brand text-white shadow-sm shadow-brand/20";
                              } else {
                                dayClass += "text-neutral-700 hover:bg-neutral-50 hover:text-brand";
                              }

                              return (
                                <button
                                  key={day.toISOString()}
                                  type="button"
                                  disabled={disabled}
                                  onClick={() => {
                                    setSelectedDate(day);
                                    setIsCalendarOpen(false);
                                  }}
                                  className={dayClass}
                                >
                                  {day.getDate()}
                                </button>
                              );
                            })}
                          </div>
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </div>

                  <div className="flex flex-col gap-1.5">
                    <label className="text-xs font-semibold text-neutral-500 ml-1">
                      Travellers*
                    </label>
                    <div className="relative flex items-center">
                      <Users className="absolute left-4.5 w-4 h-4 text-neutral-400" />
                      <input
                        type="number"
                        required
                        min={1}
                        max={99}
                        value={travellers}
                        onChange={(e) => setTravellers(e.target.value)}
                        placeholder="1"
                        className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/50 hover:border-neutral-300 font-sans transition-all duration-200"
                      />
                    </div>
                  </div>
                </div>

                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-semibold text-neutral-500 ml-1">
                    Additional Message
                  </label>
                  <div className="relative flex items-start">
                    <MessageSquare className="absolute left-4.5 top-3.5 w-4 h-4 text-neutral-400" />
                    <textarea
                      value={message}
                      onChange={(e) => setMessage(e.target.value)}
                      placeholder="Describe any special preferences..."
                      className="w-full bg-white border border-neutral-200 rounded-2xl pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/50 hover:border-neutral-300 font-sans transition-all duration-200 h-20 resize-none"
                    />
                  </div>
                </div>

                <div className="flex flex-col gap-2 mt-1 sm:mt-2 shrink-0">
                  <button
                    type="submit"
                    className="w-full bg-brand hover:bg-brand-hover text-white font-bold py-3 sm:py-3.5 rounded-full text-sm cursor-pointer shadow-premium hover:shadow-lg transition-all duration-300 border-none focus:outline-none"
                  >
                    Book Now
                  </button>
                  <button
                    type="button"
                    onClick={handleClose}
                    className="w-full text-center text-neutral-400 hover:text-neutral-600 font-semibold text-xs py-1.5 cursor-pointer transition-colors block border-none bg-transparent outline-none focus:outline-none"
                  >
                    I&apos;ll do it later
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        </div>
      )}
    </AnimatePresence>
  );
}
