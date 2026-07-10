"use client";

import { AnimatePresence, motion } from "framer-motion";
import React from "react";

interface AccordionItemProps {
  isOpen: boolean;
  onToggle: () => void;
  trigger: React.ReactNode; // Clickable header content
  children: React.ReactNode; // Content to reveal
  duration?: number; // Animation duration (default 0.25s)
  className?: string; // Optional class for the container
}

export default function AccordionItem({
  isOpen,
  onToggle,
  trigger,
  children,
  duration = 0.25,
  className = "",
}: AccordionItemProps) {
  return (
    <div className={className}>
      {/* Header / Trigger */}
      <div onClick={onToggle} className="cursor-pointer select-none">
        {trigger}
      </div>

      {/* Animated Content */}
      <AnimatePresence initial={false}>
        {isOpen && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: "auto", opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration, ease: "easeInOut" }}
            className="overflow-hidden"
          >
            {children}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
