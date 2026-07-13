"use client";

import { AnimatePresence, motion } from "framer-motion";
import { AlertCircle, X } from "lucide-react";
import React from "react";

interface ConfirmationModalProps {
  isOpen: boolean;
  title: string;
  message: string;
  confirmLabel?: string;
  cancelLabel?: string;
  onConfirm: () => void;
  onCancel: () => void;
  confirmBtnClassName?: string;
  icon?: React.ReactNode;
}

export default function ConfirmationModal({
  isOpen,
  title,
  message,
  confirmLabel = "Confirm",
  cancelLabel = "Cancel",
  onConfirm,
  onCancel,
  confirmBtnClassName = "bg-brand hover:bg-brand-hover text-white border-brand",
  icon,
}: ConfirmationModalProps) {
  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          {/* Backdrop Overlay */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.2 }}
            className="fixed inset-0 bg-neutral-900/40 backdrop-blur-xs cursor-pointer"
            onClick={onCancel}
          />

          {/* Modal Card */}
          <motion.div
            initial={{ opacity: 0, scale: 0.95, y: 10 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 10 }}
            transition={{ duration: 0.2, ease: "easeOut" }}
            className="relative bg-white rounded-[2rem] border border-border-light shadow-premium max-w-md w-full p-6 md:p-8 flex flex-col items-center text-center z-10 overflow-hidden"
          >
            {/* Close Icon Float */}
            <button
              onClick={onCancel}
              className="absolute top-4 right-4 w-8 h-8 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-400 hover:text-neutral-700 transition-colors flex items-center justify-center cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>

            {/* Icon Header */}
            <div className="mb-4">
              {icon || (
                <div className="w-12 h-12 rounded-full bg-brand-light text-brand flex items-center justify-center border border-brand/10">
                  <AlertCircle className="w-5 h-5" />
                </div>
              )}
            </div>

            {/* Content */}
            <h3 className="font-display font-bold text-lg md:text-xl text-neutral-900 mb-2 leading-snug">
              {title}
            </h3>
            <p className="text-xs md:text-sm text-neutral-500 font-medium leading-relaxed max-w-sm mb-6">
              {message}
            </p>

            {/* Buttons Row - Side-by-Side (One Row, Two Columns) */}
            <div className="flex items-center gap-3.5 w-full">
              <button
                type="button"
                onClick={onCancel}
                className="flex-1 py-2.5 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-600 font-semibold text-xs md:text-sm transition-colors cursor-pointer text-center"
              >
                {cancelLabel}
              </button>
              <button
                type="button"
                onClick={onConfirm}
                className={`flex-1 py-2.5 rounded-full border font-semibold text-xs md:text-sm transition-colors cursor-pointer text-center shadow-sm ${confirmBtnClassName}`}
              >
                {confirmLabel}
              </button>
            </div>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
}
