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
  className?: string;
  theme?: "light" | "dark";
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
  className = "w-full sm:w-auto",
  theme = "light",
}: DropdownProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [openUpwards, setOpenUpwards] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  const selectedOption = options.find((opt) => opt.value === value);

  const isDark = theme === "dark";
  const isTransparent = triggerClassName.includes("bg-transparent");
  const isWhiteText = triggerClassName.includes("text-white");
  const isWhiteBorder = triggerClassName.includes("border-white");

  // Computed theme styles
  const triggerBg = isTransparent
    ? ""
    : isDark
      ? "bg-black hover:bg-neutral-900/60 focus:border-brand/45"
      : "bg-white hover:bg-neutral-50/50 focus:border-brand/40";

  const triggerBorder = isWhiteBorder
    ? ""
    : isDark
      ? "border border-neutral-800 hover:border-neutral-700"
      : "border border-neutral-200 hover:border-brand/35";

  const triggerTextColor = isWhiteText ? "" : isDark ? "text-white" : "text-neutral-700";

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

  const handleToggle = () => {
    if (!isOpen && dropdownRef.current) {
      const rect = dropdownRef.current.getBoundingClientRect();
      const viewportHeight = window.innerHeight;
      const spaceBelow = viewportHeight - rect.bottom;
      // If there's less than 280px below the dropdown, open it upwards
      setOpenUpwards(spaceBelow < 280);
    }
    setIsOpen(!isOpen);
  };

  const handleOptionClick = (option: DropdownOption) => {
    onChange(option.value);
    if (option.onClick) {
      option.onClick();
    }
    setIsOpen(false);
  };

  return (
    <div className={`relative inline-block text-left ${className}`} ref={dropdownRef}>
      <button
        type="button"
        onClick={handleToggle}
        className={`flex items-center justify-between gap-2.5 w-full min-w-0 rounded-full px-5 py-2.5 lg:py-3 text-sm font-semibold cursor-pointer transition-all duration-300 focus:outline-none ${triggerBg} ${triggerBorder} ${triggerTextColor} ${triggerClassName}`}
        aria-haspopup="true"
        aria-expanded={isOpen}
      >
        <div className="flex items-center gap-2 min-w-0 flex-1">
          {TriggerIcon && (
            <TriggerIcon
              className={`w-4 h-4 shrink-0 transition-colors ${
                isWhiteText ? "text-white/70" : isDark ? "text-neutral-400" : "text-neutral-400"
              }`}
            />
          )}
          {selectedOption ? (
            <span className="block truncate text-left">{selectedOption.label}</span>
          ) : (
            <span
              className={`block truncate text-left ${
                isWhiteText ? "text-white/60" : isDark ? "text-neutral-500" : "text-neutral-400"
              }`}
            >
              {placeholder}
            </span>
          )}
        </div>
        <ChevronDown
          className={`w-4.5 h-4.5 transition-transform duration-300 shrink-0 ${
            isOpen ? "rotate-180" : ""
          } ${isWhiteText ? "text-white/70" : isDark ? "text-neutral-500" : "text-neutral-400"}`}
        />
      </button>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, scale: 0.96, y: openUpwards ? 8 : -8 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.96, y: openUpwards ? 8 : -8 }}
            transition={{
              type: "spring",
              duration: 0.22,
              stiffness: 350,
              damping: 26,
            }}
            style={{ originY: openUpwards ? 1 : 0 }}
            className={`absolute z-50 rounded-[28px] p-2 shadow-premium focus:outline-none font-sans ${
              isDark
                ? "bg-black border border-neutral-800 text-white"
                : "bg-white border border-neutral-200 text-neutral-800"
            } ${openUpwards ? "bottom-full mb-2" : "top-full mt-2"} ${
              align === "right" ? "right-0" : "left-0"
            } ${menuClassName.includes("w-") ? "" : "w-72"} ${menuClassName}`}
          >
            <div
              className="flex flex-col gap-0.5 max-h-60 overflow-y-auto pr-1 dropdown-scrollbar"
              role="menu"
              aria-orientation="vertical"
            >
              {options.map((option, index) => {
                const OptionIcon = option.icon;
                const BadgeIcon = option.badge?.icon;
                const isSelected = option.value === value;

                return (
                  <React.Fragment key={option.value || index}>
                    {option.divider && (
                      <div
                        className={`h-[1px] my-1.5 mx-2 ${isDark ? "bg-neutral-800" : "bg-neutral-100"}`}
                      />
                    )}

                    <button
                      type="button"
                      onClick={() => handleOptionClick(option)}
                      className={`flex items-center justify-between w-full px-4 py-3 text-sm font-semibold rounded-2xl cursor-pointer text-left transition-all duration-200 select-none outline-none ${
                        isSelected
                          ? isDark
                            ? "bg-neutral-900 text-brand font-bold"
                            : "bg-neutral-100/90 text-foreground"
                          : isDark
                            ? "text-neutral-300 hover:bg-neutral-900 hover:text-white"
                            : "text-foreground hover:bg-neutral-50/90 hover:text-foreground"
                      }`}
                      role="menuitem"
                    >
                      <div className="flex items-center gap-3 min-w-0 flex-1">
                        {OptionIcon && (
                          <OptionIcon
                            className={`w-5 h-5 shrink-0 transition-colors ${
                              isSelected
                                ? isDark
                                  ? "text-brand"
                                  : "text-foreground"
                                : isDark
                                  ? "text-neutral-500"
                                  : "text-neutral-700"
                            }`}
                          />
                        )}
                        <span className="block truncate text-left flex-1">{option.label}</span>
                      </div>

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
