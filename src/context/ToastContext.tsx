"use client";

import { AnimatePresence, motion } from "framer-motion";
import { AlertCircle, CheckCircle, Info, X } from "lucide-react";
import type React from "react";
import { createContext, useContext, useEffect, useState } from "react";

type ToastType = "success" | "error" | "info";

interface Toast {
  type: ToastType;
  title: string;
  message: string;
}

interface ToastContextType {
  showToast: (type: ToastType, title: string, message: string) => void;
}

const ToastContext = createContext<ToastContextType | undefined>(undefined);

export function ToastProvider({ children }: { children: React.ReactNode }) {
  const [toast, setToast] = useState<Toast | null>(null);

  useEffect(() => {
    if (toast) {
      const timer = setTimeout(() => setToast(null), 4000);
      return () => clearTimeout(timer);
    }
  }, [toast]);

  const showToast = (type: ToastType, title: string, message: string) => {
    setToast({ type, title, message });
  };

  const renderIcon = () => {
    if (!toast) return null;
    switch (toast.type) {
      case "error":
        return (
          <div className="w-10 h-10 rounded-full bg-red-50 flex items-center justify-center shrink-0">
            <AlertCircle className="w-6 h-6 text-white fill-red-500" />
          </div>
        );
      case "success":
        return (
          <div className="w-10 h-10 rounded-full bg-emerald-50 flex items-center justify-center shrink-0">
            <CheckCircle className="w-6 h-6 text-white fill-emerald-500" />
          </div>
        );
      case "info":
        return (
          <div className="w-10 h-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0">
            <Info className="w-6 h-6 text-white fill-blue-500" />
          </div>
        );
    }
  };

  const getMessageColor = () => {
    if (!toast) return "";
    switch (toast.type) {
      case "error":
        return "text-red-500";
      case "success":
        return "text-emerald-500";
      case "info":
        return "text-blue-500";
    }
  };

  return (
    <ToastContext.Provider value={{ showToast }}>
      {children}

      {/* Toast Notification Container */}
      <AnimatePresence>
        {toast && (
          <motion.div
            initial={{ opacity: 0, y: 20, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.9 }}
            transition={{ duration: 0.25, ease: "easeOut" }}
            className="fixed bottom-6 right-6 z-[9999] flex items-center gap-4 bg-white border border-neutral-100 rounded-full shadow-2xl py-2.5 pl-3 pr-6 min-w-[320px] max-w-[90vw] sm:max-w-md pointer-events-auto"
          >
            {renderIcon()}

            <div className="flex flex-col text-left">
              <span className="text-sm font-bold text-neutral-800 leading-snug">{toast.title}</span>
              <span className={`text-xs font-bold ${getMessageColor()} mt-0.5`}>{toast.message}</span>
            </div>

            <button
              type="button"
              onClick={() => setToast(null)}
              className="text-neutral-400 hover:text-neutral-600 transition-colors duration-200 cursor-pointer ml-auto shrink-0 p-1"
              aria-label="Dismiss notification"
            >
              <X className="w-4.5 h-4.5 text-neutral-400" />
            </button>
          </motion.div>
        )}
      </AnimatePresence>
    </ToastContext.Provider>
  );
}

export function useToast() {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error("useToast must be used within a ToastProvider");
  }
  return context;
}
