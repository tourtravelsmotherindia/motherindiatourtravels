"use client";

import { AnimatePresence, motion } from "framer-motion";
import {
  Calendar,
  CalendarDays,
  CalendarRange,
  ChevronLeft,
  ChevronRight,
  Timer,
} from "lucide-react";
import React, { useEffect, useMemo, useRef, useState } from "react";

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

interface DatePickerFieldProps {
  variant: "search" | "form";
  dateMode: "calendar" | "flexible";
  setDateMode: (mode: "calendar" | "flexible") => void;
  selectedCheckIn: Date | null;
  setSelectedCheckIn: (date: Date | null) => void;
  selectedCheckOut: Date | null;
  setSelectedCheckOut: (date: Date | null) => void;
  flexibleDurationDays: "any" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10" | "8-10";
  setFlexibleDurationDays: (
    duration: "any" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10" | "8-10",
  ) => void;
  selectedFlexibleMonth: Date;
  setSelectedFlexibleMonth: (date: Date) => void;
  activeDropdown: string | null;
  setActiveDropdown: (dropdown: "dates" | "guests" | null) => void;
}

export default function DatePickerField({
  variant,
  dateMode,
  setDateMode,
  selectedCheckIn,
  setSelectedCheckIn,
  selectedCheckOut,
  setSelectedCheckOut,
  flexibleDurationDays,
  setFlexibleDurationDays,
  selectedFlexibleMonth,
  setSelectedFlexibleMonth,
  activeDropdown,
  setActiveDropdown,
}: DatePickerFieldProps) {
  const [calendarMonth, setCalendarMonth] = useState<Date>(() => {
    const today = new Date();
    return new Date(today.getFullYear(), today.getMonth(), 1);
  });
  const [hoverDate, setHoverDate] = useState<Date | null>(null);

  const datesRef = useRef<HTMLDivElement>(null);
  const checkoutRef = useRef<HTMLDivElement>(null);
  const datesPopoverRef = useRef<HTMLDivElement>(null);

  const active = activeDropdown === "dates";

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      const target = event.target as Node;
      if (
        activeDropdown === "dates" &&
        datesRef.current &&
        !datesRef.current.contains(target) &&
        checkoutRef.current &&
        !checkoutRef.current.contains(target) &&
        datesPopoverRef.current &&
        !datesPopoverRef.current.contains(target)
      ) {
        setActiveDropdown(null);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [activeDropdown, setActiveDropdown]);

  // Date picker helpers
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

  const formatDate = (date: Date | null) => {
    if (!date) return "";
    return `${MONTHS_SHORT[date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`;
  };

  const renderCalendarMonth = (monthDate: Date) => {
    const year = monthDate.getFullYear();
    const month = monthDate.getMonth();
    const days = generateMonthDays(year, month);
    const monthLabel = `${MONTHS_LONG[monthDate.getMonth()]} ${monthDate.getFullYear()}`;

    return (
      <div className="flex-1 min-w-[200px] sm:min-w-[220px] w-full">
        <div className="text-center font-bold text-foreground mb-3 font-sans text-xs sm:text-sm">
          {monthLabel}
        </div>

        {/* Weekdays */}
        <div className="grid grid-cols-7 gap-0.5 text-center text-[10px] font-bold text-neutral-400 mb-1.5 uppercase tracking-wider font-sans">
          <span>Mon</span>
          <span>Tue</span>
          <span>Wed</span>
          <span>Thu</span>
          <span>Fri</span>
          <span>Sat</span>
          <span>Sun</span>
        </div>

        {/* Days Grid */}
        <div className="grid grid-cols-7 gap-y-1 gap-x-0.5 text-center font-sans">
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

  const flexibleTabsContent = (
    <div className="space-y-6">
      {/* How many days */}
      <div>
        <div className="text-sm font-bold text-foreground mb-3 text-center sm:text-left font-sans">
          How many days?
        </div>
        <div className="flex flex-wrap gap-2 justify-center sm:justify-start">
          {(["any", "3", "4", "5", "6", "7", "8", "9", "10", "8-10"] as const).map((dur) => {
            const label = dur === "any" ? "Any" : dur === "8-10" ? "8-10 Days" : `${dur} Days`;
            return (
              <button
                type="button"
                key={dur}
                onClick={() => handleFlexibleSelection(dur, selectedFlexibleMonth)}
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
                      isSelected ? "bg-brand-hover text-white" : "bg-gray-200 text-muted"
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
                  <div className="text-[10px] font-bold text-foreground truncate font-sans font-semibold">
                    {MONTHS_LONG[m.getMonth()]}
                  </div>
                  <div className="text-[8px] text-muted font-sans font-semibold">
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
        <div className="text-xs text-muted font-sans font-semibold">
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
          className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer border-none"
        >
          Apply
        </button>
      </div>
    </div>
  );

  if (variant === "search") {
    return (
      <>
        {/* Departure Trigger */}
        <div
          ref={datesRef}
          className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4 cursor-pointer relative w-full select-none"
          onClick={() => setActiveDropdown(active ? null : "dates")}
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
            <div className="text-sm font-semibold text-foreground truncate">
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

        {/* Return Trigger */}
        <div
          ref={checkoutRef}
          className="flex items-center gap-3.5 pt-4 sm:pt-0 sm:pb-4 lg:pb-0 lg:px-4 cursor-pointer relative w-full select-none"
          onClick={() => setActiveDropdown(active ? null : "dates")}
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
            <div className="text-sm font-semibold text-foreground truncate">
              {dateMode === "calendar"
                ? selectedCheckOut
                  ? `${formatDate(selectedCheckOut)}${getDurationDays() ? ` (${getDurationDays()} Days)` : ""}`
                  : "Add date"
                : `${MONTHS_LONG[selectedFlexibleMonth.getMonth()]} ${selectedFlexibleMonth.getFullYear()}`}
            </div>
          </div>
        </div>

        {/* Absolute Dates Picker Dropdown */}
        <AnimatePresence>
          {active && (
            <motion.div
              ref={datesPopoverRef}
              initial={{ opacity: 0, y: 10, scale: 0.95 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: 10, scale: 0.95 }}
              transition={{ duration: 0.15 }}
              onClick={(e) => e.stopPropagation()}
              className="absolute top-full left-1/2 -translate-x-1/2 mt-3 w-[calc(100vw-32px)] sm:w-auto min-w-[300px] sm:min-w-[560px] bg-white rounded-3xl border border-border-light shadow-2xl p-4 sm:p-6 z-40 cursor-default"
            >
              {/* Selector Switcher */}
              <div className="flex justify-center mb-6">
                <div className="bg-neutral-100 p-1 rounded-full flex gap-1 border border-border-light relative">
                  <button
                    type="button"
                    onClick={() => setDateMode("calendar")}
                    className={`relative px-6 py-2 rounded-full text-xs font-semibold transition-colors duration-200 z-10 cursor-pointer ${
                      dateMode === "calendar"
                        ? "text-foreground"
                        : "text-muted hover:text-foreground"
                    }`}
                  >
                    {dateMode === "calendar" && (
                      <motion.span
                        layoutId="activeDateTabSearch"
                        className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                        transition={{ type: "spring", stiffness: 380, damping: 30 }}
                      />
                    )}
                    Calendar
                  </button>
                  <button
                    type="button"
                    onClick={() => setDateMode("flexible")}
                    className={`relative px-6 py-2 rounded-full text-xs font-semibold transition-colors duration-200 z-10 cursor-pointer ${
                      dateMode === "flexible"
                        ? "text-foreground"
                        : "text-muted hover:text-foreground"
                    }`}
                  >
                    {dateMode === "flexible" && (
                      <motion.span
                        layoutId="activeDateTabSearch"
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
                  {/* Calendar Months Header */}
                  <div className="flex items-center justify-between px-2 mb-4">
                    <button
                      type="button"
                      onClick={prevMonth}
                      className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-muted hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer animate-colors"
                    >
                      <ChevronLeft className="w-4 h-4" />
                    </button>
                    <button
                      type="button"
                      onClick={nextMonth}
                      className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-muted hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer animate-colors"
                    >
                      <ChevronRight className="w-4 h-4" />
                    </button>
                  </div>

                  {/* Side-by-side Monthly Calendars */}
                  <div className="flex flex-col sm:flex-row gap-5 items-center sm:items-start justify-center">
                    {renderCalendarMonth(calendarMonth)}
                    <div className="hidden sm:block border-l border-border-light h-[230px] self-stretch" />
                    <div className="hidden sm:block">{renderCalendarMonth(rightMonthDate)}</div>
                  </div>

                  {/* Footer Actions */}
                  <div className="flex justify-between items-center border-t border-border-light pt-4 mt-6">
                    <div className="text-xs text-muted font-sans font-semibold">
                      {selectedCheckIn && selectedCheckOut ? (
                        <span>
                          Selected: {formatDate(selectedCheckIn)} – {formatDate(selectedCheckOut)}
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
                      className="px-6 py-2 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-premium transition-all duration-200 cursor-pointer border-none"
                    >
                      Apply
                    </button>
                  </div>
                </div>
              ) : (
                flexibleTabsContent
              )}
            </motion.div>
          )}
        </AnimatePresence>
      </>
    );
  }

  // Form variant (Book page form columns layout)
  return (
    <div className="relative">
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
        {/* Departure Input Column */}
        <div
          ref={datesRef}
          className="flex flex-col gap-2 relative cursor-pointer select-none"
          onClick={() => setActiveDropdown(active ? null : "dates")}
        >
          <label className="text-xs font-semibold text-neutral-500 ml-1">
            {dateMode === "calendar" ? "Arrival Date" : "Duration"}
          </label>
          <div className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm font-semibold text-foreground hover:border-brand/40 focus-within:border-brand transition-all duration-200 flex items-center gap-2.5 min-h-[46px]">
            {dateMode === "calendar" ? (
              <Calendar className="w-4 h-4 text-brand shrink-0" />
            ) : (
              <Timer className="w-4 h-4 text-brand shrink-0" />
            )}
            <span className="truncate">
              {dateMode === "calendar"
                ? selectedCheckIn
                  ? formatDate(selectedCheckIn)
                  : "Select Date"
                : flexibleDurationDays === "any"
                  ? "Any Duration"
                  : flexibleDurationDays === "8-10"
                    ? "8-10 Days"
                    : `${flexibleDurationDays} Days`}
            </span>
          </div>
        </div>

        {/* Return Input Column */}
        <div
          ref={checkoutRef}
          className="flex flex-col gap-2 relative cursor-pointer select-none"
          onClick={() => setActiveDropdown(active ? null : "dates")}
        >
          <label className="text-xs font-semibold text-neutral-500 ml-1">
            {dateMode === "calendar" ? "Departure Date" : "Travel Month"}
          </label>
          <div className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm font-semibold text-foreground hover:border-brand/40 focus-within:border-brand transition-all duration-200 flex items-center gap-2.5 min-h-[46px]">
            {dateMode === "calendar" ? (
              <CalendarRange className="w-4 h-4 text-brand shrink-0" />
            ) : (
              <CalendarDays className="w-4 h-4 text-brand shrink-0" />
            )}
            <span className="truncate">
              {dateMode === "calendar"
                ? selectedCheckOut
                  ? `${formatDate(selectedCheckOut)}${getDurationDays() ? ` (${getDurationDays()} Days)` : ""}`
                  : "Select Date"
                : `${MONTHS_LONG[selectedFlexibleMonth.getMonth()]} ${selectedFlexibleMonth.getFullYear()}`}
            </span>
          </div>
        </div>
      </div>

      {/* Popover Calendar for Form Layout */}
      <AnimatePresence>
        {active && (
          <motion.div
            ref={datesPopoverRef}
            initial={{ opacity: 0, y: 10, scale: 0.95 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 10, scale: 0.95 }}
            transition={{ duration: 0.15 }}
            onClick={(e) => e.stopPropagation()}
            className="absolute top-full left-1/2 -translate-x-1/2 lg:left-0 lg:translate-x-0 mt-2 w-[calc(100vw-32px)] sm:w-auto min-w-[280px] sm:min-w-[560px] bg-white rounded-3xl border border-border-light shadow-2xl p-4 sm:p-5 z-40 cursor-default"
          >
            {/* Selector Switcher */}
            <div className="flex justify-center mb-5">
              <div className="bg-neutral-100 p-1 rounded-full flex gap-1 border border-border-light relative">
                <button
                  type="button"
                  onClick={() => setDateMode("calendar")}
                  className={`relative px-5 py-1.5 rounded-full text-xs font-bold transition-colors duration-200 z-10 cursor-pointer ${
                    dateMode === "calendar"
                      ? "text-foreground"
                      : "text-neutral-400 hover:text-foreground"
                  }`}
                >
                  {dateMode === "calendar" && (
                    <motion.span
                      layoutId="activeDateTabForm"
                      className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                      transition={{ type: "spring", stiffness: 380, damping: 30 }}
                    />
                  )}
                  Calendar
                </button>
                <button
                  type="button"
                  onClick={() => setDateMode("flexible")}
                  className={`relative px-5 py-1.5 rounded-full text-xs font-bold transition-colors duration-200 z-10 cursor-pointer ${
                    dateMode === "flexible"
                      ? "text-foreground"
                      : "text-neutral-400 hover:text-foreground"
                  }`}
                >
                  {dateMode === "flexible" && (
                    <motion.span
                      layoutId="activeDateTabForm"
                      className="absolute inset-0 bg-white rounded-full shadow-sm -z-10"
                      transition={{ type: "spring", stiffness: 380, damping: 30 }}
                    />
                  )}
                  Flexible
                </button>
              </div>
            </div>

            {dateMode === "calendar" ? (
              <div>
                {/* Calendar Months Header */}
                <div className="flex items-center justify-between px-2 mb-3">
                  <button
                    type="button"
                    onClick={prevMonth}
                    className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-neutral-400 hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer animate-colors"
                  >
                    <ChevronLeft className="w-4 h-4" />
                  </button>
                  <button
                    type="button"
                    onClick={nextMonth}
                    className="w-8 h-8 rounded-full border border-border-light flex items-center justify-center text-neutral-400 hover:text-brand hover:border-brand/40 transition-colors duration-200 cursor-pointer animate-colors"
                  >
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </div>

                {/* Side-by-side Monthly Calendars */}
                <div className="flex flex-col sm:flex-row gap-5 items-center sm:items-start justify-center">
                  {renderCalendarMonth(calendarMonth)}
                  <div className="hidden sm:block border-l border-border-light h-[210px] self-stretch" />
                  <div className="hidden sm:block">{renderCalendarMonth(rightMonthDate)}</div>
                </div>

                {/* Footer text */}
                <div className="flex justify-between items-center border-t border-border-light pt-3 mt-5">
                  <div className="text-xs text-neutral-400 font-semibold font-sans">
                    {selectedCheckIn && selectedCheckOut ? (
                      <span>
                        Selected: {formatDate(selectedCheckIn)} – {formatDate(selectedCheckOut)}
                        {getDurationDays() ? ` (${getDurationDays()} Days)` : ""}
                      </span>
                    ) : selectedCheckIn ? (
                      <span>Select departure date</span>
                    ) : (
                      <span>Select arrival date</span>
                    )}
                  </div>
                  <button
                    type="button"
                    onClick={() => setActiveDropdown(null)}
                    className="px-5 py-1.5 bg-brand hover:bg-brand-hover text-white rounded-lg font-bold text-xs shadow-md transition-all duration-200 cursor-pointer select-none border-none animate-colors"
                  >
                    Apply
                  </button>
                </div>
              </div>
            ) : (
              flexibleTabsContent
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
