"use client";

import { countries } from "countries-list";
import { AnimatePresence, motion } from "framer-motion";
import { Phone } from "lucide-react";
import React, { useEffect, useMemo, useRef, useState } from "react";

// Generate flag emoji dynamically from 2-letter ISO code
function getEmojiFlag(countryCode: string) {
  const codePoints = countryCode
    .toUpperCase()
    .split("")
    .map((char) => 127397 + char.charCodeAt(0));
  return String.fromCodePoint(...codePoints);
}

interface PhoneInputProps {
  id: string;
  label: string;
  phoneNumber: string;
  onChange: (value: string) => void;
  countryCodeVal: string; // format: "CODE:DIAL" (e.g. "IN:+91")
  onChangeCountryCode: (value: string) => void;
  placeholder?: string;
  required?: boolean;
}

export default function PhoneInput({
  id,
  label,
  phoneNumber,
  onChange,
  countryCodeVal,
  onChangeCountryCode,
  placeholder = "Phone Number",
  required = false,
}: PhoneInputProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const dropdownRef = useRef<HTMLDivElement>(null);

  const [selectedCode, selectedDialCode] = countryCodeVal.split(":");
  const selectedFlag = getEmojiFlag(selectedCode);

  const countryList = useMemo(() => {
    const raw = Object.entries(countries).map(([code, data]) => {
      const phoneVal = data.phone;
      const dial = Array.isArray(phoneVal) ? phoneVal[0] : phoneVal;
      return {
        code,
        name: data.name,
        dialCode: `+${dial}`,
        flag: getEmojiFlag(code),
      };
    });

    raw.sort((a, b) => a.name.localeCompare(b.name));

    // India is the primary market, pin it to the top
    const indiaIndex = raw.findIndex((c) => c.code === "IN");
    if (indiaIndex > -1) {
      const [india] = raw.splice(indiaIndex, 1);
      raw.unshift(india);
    }
    return raw;
  }, []);

  const filteredCountries = useMemo(() => {
    if (!searchQuery.trim()) return countryList;
    const q = searchQuery.toLowerCase();
    return countryList.filter(
      (c) =>
        c.name.toLowerCase().includes(q) ||
        c.dialCode.includes(q) ||
        c.code.toLowerCase().includes(q),
    );
  }, [countryList, searchQuery]);

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (isOpen && dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [isOpen]);

  return (
    <div className="flex flex-col gap-2 w-full">
      <label htmlFor={id} className="text-xs font-semibold text-neutral-500 ml-1">
        {label}
      </label>
      <div className="flex gap-2">
        <div className="relative" ref={dropdownRef}>
          <button
            type="button"
            onClick={() => setIsOpen(!isOpen)}
            className="flex items-center justify-between gap-1 w-26 bg-white border border-neutral-200 rounded-full px-3.5 py-3 text-sm font-semibold text-neutral-700 hover:border-neutral-300 hover:bg-neutral-50/50 cursor-pointer transition-all duration-200 h-[46px]"
          >
            <span className="text-base leading-none select-none">{selectedFlag}</span>
            <span className="text-xs">{selectedDialCode}</span>
          </button>

          <AnimatePresence>
            {isOpen && (
              <motion.div
                initial={{ opacity: 0, scale: 0.95, y: 5 }}
                animate={{ opacity: 1, scale: 1, y: 0 }}
                exit={{ opacity: 0, scale: 0.95, y: 5 }}
                transition={{ duration: 0.15 }}
                className="absolute top-full left-0 mt-2 w-64 bg-white border border-neutral-200 rounded-2xl shadow-2xl p-2 z-50"
              >
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Search country/code..."
                  className="w-full border border-neutral-100 bg-neutral-50/50 rounded-lg px-2.5 py-1.5 text-xs focus:outline-none focus:border-brand/35 mb-2 placeholder-neutral-400 font-sans text-foreground"
                />
                <div className="max-h-48 overflow-y-auto flex flex-col gap-0.5 pr-1 dropdown-scrollbar select-none">
                  {filteredCountries.length > 0 ? (
                    filteredCountries.map((c) => (
                      <button
                        key={c.code}
                        type="button"
                        onClick={() => {
                          onChangeCountryCode(`${c.code}:${c.dialCode}`);
                          setIsOpen(false);
                          setSearchQuery("");
                        }}
                        className={`flex items-center justify-between w-full px-2.5 py-2 text-xs font-semibold rounded-lg cursor-pointer transition-colors text-left ${
                          selectedCode === c.code
                            ? "bg-brand-light text-brand"
                            : "text-neutral-700 hover:bg-neutral-50"
                        }`}
                      >
                        <span className="flex items-center gap-2 truncate">
                          <span className="text-sm select-none shrink-0">{c.flag}</span>
                          <span className="truncate">{c.name}</span>
                        </span>
                        <span className="text-neutral-400 font-medium shrink-0 ml-1">
                          {c.dialCode}
                        </span>
                      </button>
                    ))
                  ) : (
                    <div className="text-center text-[10px] text-neutral-400 py-3">
                      No countries found
                    </div>
                  )}
                </div>
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        <div className="relative flex items-center flex-1">
          <Phone className="absolute left-4.5 w-4 h-4 text-neutral-400" />
          <input
            id={id}
            type="tel"
            required={required}
            value={phoneNumber}
            onChange={(e) => onChange(e.target.value)}
            placeholder={placeholder}
            className="w-full bg-white border border-neutral-200 rounded-full pl-11 pr-5 py-3 text-sm focus:outline-none focus:border-brand/50 hover:border-neutral-300 font-sans transition-all duration-200 h-[46px] text-foreground"
          />
        </div>
      </div>
    </div>
  );
}
