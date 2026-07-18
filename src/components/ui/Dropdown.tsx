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
  triggerLabel?: string;
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
  variant?: "default" | "slim";
  label?: string;
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
  variant = "default",
  label,
}: DropdownProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [openUpwards, setOpenUpwards] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  const selectedOption = options.find((opt) => opt.value === value);

  const isTransparent = triggerClassName.includes("bg-transparent");
  const isWhiteText = triggerClassName.includes("text-white");
  const isWhiteBorder = triggerClassName.includes("border-white");
  const isSlim = variant === "slim";

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
        className={`flex items-center justify-between gap-2.5 w-full cursor-pointer transition-all duration-300 focus:outline-none ${
          isSlim
            ? "rounded-xl px-3.5 py-1.5 text-xs font-semibold"
            : "rounded-full px-5 py-2.5 lg:py-3 text-sm font-semibold"
        } ${
          isTransparent ? "" : "bg-white hover:bg-neutral-50/50 focus:border-brand/40"
        } ${isWhiteBorder ? "" : "border border-neutral-200 hover:border-brand/35"} ${
          isWhiteText ? "" : isSlim ? "text-black" : "text-neutral-700"
        } ${triggerClassName}`}
        aria-haspopup="true"
        aria-expanded={isOpen}
      >
        <div className="flex items-center gap-2 min-w-0 flex-1 text-left">
          {TriggerIcon && (
            <TriggerIcon
              className={`w-4 h-4 shrink-0 transition-colors ${
                isWhiteText ? "text-white/70" : "text-neutral-400"
              }`}
            />
          )}
          {selectedOption ? (
            <span className="truncate block flex-1">
              {label && (
                <span
                  className={`${isWhiteText ? "text-white/70" : "text-neutral-500"} font-semibold mr-1`}
                >
                  {label}:
                </span>
              )}
              {selectedOption.triggerLabel || selectedOption.label}
            </span>
          ) : (
            <span
              className={`truncate block flex-1 ${isWhiteText ? "text-white/60" : "text-neutral-400"}`}
            >
              {label && (
                <span
                  className={`${isWhiteText ? "text-white/60" : "text-neutral-400"} font-semibold mr-1`}
                >
                  {label}:
                </span>
              )}
              {placeholder}
            </span>
          )}
        </div>
        <ChevronDown
          className={`transition-transform duration-300 shrink-0 ${
            isOpen ? "rotate-180" : ""
          } ${isSlim ? "w-3.5 h-3.5" : "w-4.5 h-4.5"} ${
            isWhiteText ? "text-white/70" : "text-neutral-400"
          }`}
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
            className={`absolute z-50 bg-white border border-neutral-200 shadow-premium focus:outline-none font-sans ${
              isSlim ? "rounded-xl p-1" : "rounded-[28px] p-2"
            } ${
              openUpwards
                ? isSlim
                  ? "bottom-full mb-1.5"
                  : "bottom-full mb-2"
                : isSlim
                  ? "top-full mt-1.5"
                  : "top-full mt-2"
            } ${
              align === "right" ? "right-0" : "left-0"
            } ${menuClassName.includes("w-") ? "" : isSlim ? "w-56" : "w-72"} ${menuClassName}`}
          >
            <div
              className={`flex flex-col gap-0.5 overflow-y-auto pr-1 dropdown-scrollbar ${
                isSlim ? "max-h-48" : "max-h-60"
              }`}
              role="menu"
              aria-orientation="vertical"
            >
              {options.map((option, index) => {
                const OptionIcon = option.icon;
                const BadgeIcon = option.badge?.icon;
                const isSelected = option.value === value;

                return (
                  <React.Fragment key={option.value || index}>
                    {option.divider && <div className="h-[1px] bg-neutral-100 my-1.5 mx-2" />}

                    <button
                      type="button"
                      onClick={() => handleOptionClick(option)}
                      className={`flex items-center justify-between w-full text-left transition-all duration-200 select-none outline-none ${
                        isSlim
                          ? "px-3 py-2 text-xs font-semibold rounded-lg cursor-pointer"
                          : "px-4 py-3 text-sm font-semibold rounded-2xl cursor-pointer"
                      } ${
                        isSelected
                          ? "bg-neutral-100/90 text-black"
                          : "text-black hover:bg-neutral-50/90"
                      }`}
                      role="menuitem"
                    >
                      <div className="flex items-center gap-3 min-w-0">
                        {OptionIcon && (
                          <OptionIcon
                            className={`shrink-0 transition-colors ${
                              isSlim ? "w-4 h-4" : "w-5 h-5"
                            } ${isSelected ? "text-black" : "text-neutral-700"}`}
                          />
                        )}
                        <span className="truncate">{option.label}</span>
                      </div>

                      {option.badge && (
                        <span
                          className={`flex items-center gap-1 uppercase select-none ${
                            isSlim
                              ? "px-2 py-0.5 rounded-[6px] text-[8px] font-extrabold tracking-wider"
                              : "px-2.5 py-1 rounded-[10px] text-[10px] font-bold tracking-wide"
                          } ${option.badge.className || "bg-[#ffd3f3] text-[#a100a1]"}`}
                        >
                          {BadgeIcon && (
                            <BadgeIcon className={isSlim ? "w-3 h-3" : "w-3.5 h-3.5"} />
                          )}
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
