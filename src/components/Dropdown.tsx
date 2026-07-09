"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronDown, LucideIcon } from "lucide-react";
import React, { useEffect, useRef, useState } from "react";

export interface DropdownBadge {
  text: string;
  icon?: LucideIcon | React.ComponentType<{ className?: string }>;
  className?: string;
}

export interface DropdownOption {
  value: string;
  label: string;
  icon?: LucideIcon | React.ComponentType<{ className?: string }>;
  badge?: DropdownBadge;
  divider?: boolean;
  onClick?: () => void;
}

interface DropdownProps {
  options: DropdownOption[];
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  triggerClassName?: string;
  menuClassName?: string;
  align?: "left" | "right";
  icon?: LucideIcon | React.ComponentType<{ className?: string }>; // Optional starting icon for trigger
}

export default function Dropdown({
  options,
  value,
  onChange,
  placeholder = "Select an option",
  triggerClassName = "",
  menuClassName = "",
  align = "left",
  icon: TriggerIcon,
}: DropdownProps) {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  // Find the selected option to display its label
  const selectedOption = options.find((opt) => opt.value === value);

  // Handle clicking outside the dropdown to close it
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const handleOptionClick = (option: DropdownOption) => {
    onChange(option.value);
    if (option.onClick) {
      option.onClick();
    }
    setIsOpen(false);
  };

  return (
    <div className="relative inline-block text-left w-full sm:w-auto" ref={dropdownRef}>
      {/* Trigger Button */}
      <button
        type="button"
        onClick={() => setIsOpen(!isOpen)}
        className={`flex items-center justify-between gap-2.5 w-full bg-white border border-neutral-200 rounded-full px-5 py-3 lg:py-3.5 xl:py-4 text-sm font-bold text-neutral-700 cursor-pointer hover:border-brand/35 hover:bg-neutral-50/50 transition-all duration-300 focus:outline-none focus:border-brand/40 ${triggerClassName}`}
        aria-haspopup="true"
        aria-expanded={isOpen}
      >
        <div className="flex items-center gap-2">
          {TriggerIcon && <TriggerIcon className="w-4 h-4 text-neutral-400 shrink-0" />}
          {selectedOption ? (
            <span className="truncate">{selectedOption.label}</span>
          ) : (
            <span className="text-neutral-400 truncate">{placeholder}</span>
          )}
        </div>
        <ChevronDown
          className={`w-4.5 h-4.5 text-neutral-400 transition-transform duration-300 shrink-0 ${
            isOpen ? "rotate-180" : ""
          }`}
        />
      </button>

      {/* Floating Menu */}
      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, scale: 0.96, y: -8 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.96, y: -8 }}
            transition={{
              type: "spring",
              duration: 0.22,
              stiffness: 350,
              damping: 26,
            }}
            style={{ originY: 0 }}
            className={`absolute z-50 mt-2 bg-white border border-neutral-200 rounded-[28px] p-2 focus:outline-none font-sans ${
              align === "right" ? "right-0" : "left-0"
            } ${menuClassName.includes("w-") ? "" : "w-72"} ${menuClassName}`}
          >
            <div className="flex flex-col gap-0.5" role="menu" aria-orientation="vertical">
              {options.map((option, index) => {
                const OptionIcon = option.icon;
                const BadgeIcon = option.badge?.icon;
                const isSelected = option.value === value;

                return (
                  <React.Fragment key={option.value || index}>
                    {/* Optional divider line before item */}
                    {option.divider && <div className="h-[1px] bg-neutral-100 my-1.5 mx-2" />}

                    <button
                      type="button"
                      onClick={() => handleOptionClick(option)}
                      className={`flex items-center justify-between w-full px-4 py-3.5 text-sm font-semibold rounded-2xl cursor-pointer text-left transition-all duration-200 select-none outline-none ${
                        isSelected
                          ? "bg-neutral-100/90 text-foreground"
                          : "text-foreground hover:bg-neutral-50/90 hover:text-foreground"
                      }`}
                      role="menuitem"
                    >
                      <div className="flex items-center gap-3">
                        {OptionIcon && (
                          <OptionIcon
                            className={`w-5 h-5 shrink-0 transition-colors ${
                              isSelected ? "text-foreground" : "text-neutral-700"
                            }`}
                          />
                        )}
                        <span className="truncate">{option.label}</span>
                      </div>

                      {/* Right Badge if present */}
                      {option.badge && (
                        <span
                          className={`flex items-center gap-1 px-2.5 py-1 rounded-[10px] text-[10px] font-bold tracking-wide uppercase select-none ${
                            option.badge.className || "bg-[#ffd3f3] text-[#a100a1]"
                          }`}
                        >
                          {BadgeIcon && <BadgeIcon className="w-3.5 h-3.5" />}
                          <span>{option.badge.text}</span>
                        </span>
                      )}
                    </button>
                  </React.Fragment>
                );
              })}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
