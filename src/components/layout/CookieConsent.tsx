"use client";

import { motion } from "framer-motion";
import { Cookie, X } from "lucide-react";
import { useEffect, useState } from "react";

interface CookieConsentProps {
  onAccept: () => void;
}

export default function CookieConsent({ onAccept }: CookieConsentProps) {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Check if user has already made a choice
    const consent = localStorage.getItem("cookies_accepted");
    if (consent === null) {
      // Delay visibility slightly for a premium entrance effect
      const timer = setTimeout(() => {
        setIsVisible(true);
      }, 1500);
      return () => clearTimeout(timer);
    } else if (consent === "true") {
      onAccept();
    }
  }, [onAccept]);

  const handleAccept = () => {
    localStorage.setItem("cookies_accepted", "true");
    setIsVisible(false);
    onAccept();
  };

  const handleDecline = () => {
    localStorage.setItem("cookies_accepted", "false");
    setIsVisible(false);
  };

  if (!isVisible) return null;

  return (
    <motion.div
      initial={{ opacity: 0, y: 50, scale: 0.95 }}
      animate={{ opacity: 1, y: 0, scale: 1 }}
      exit={{ opacity: 0, y: 20, scale: 0.95 }}
      transition={{ duration: 0.4, ease: "easeOut" }}
      className="fixed bottom-6 left-6 right-6 md:left-auto md:right-8 z-50 max-w-sm sm:max-w-md w-full"
    >
      <div className="bg-white/90 backdrop-blur-lg border border-neutral-200/60 p-5 rounded-[2rem] shadow-premium flex flex-col gap-4 relative overflow-hidden">
        <button
          onClick={handleDecline}
          className="absolute top-4 right-4 text-neutral-400 hover:text-neutral-600 transition-colors p-1"
          aria-label="Close panel"
        >
          <X className="w-4 h-4" />
        </button>

        <div className="flex gap-4">
          <div className="p-3 bg-brand-light text-brand rounded-2xl shrink-0 h-max">
            <Cookie className="w-6 h-6" />
          </div>
          <div className="flex flex-col gap-1.5 pr-4">
            <h4 className="text-sm font-bold text-neutral-900 tracking-tight">Cookie Consent</h4>
            <p className="text-xs text-neutral-500 font-medium leading-relaxed">
              We use cookies to enhance your experience, analyze site traffic, and support language
              translation features. By clicking &quot;Accept Cookies&quot;, you consent to our use
              of cookies.
            </p>
          </div>
        </div>

        <div className="flex items-center gap-3.5 mt-1">
          <button
            onClick={handleDecline}
            className="flex-1 py-2.5 px-4 rounded-xl border border-neutral-200 text-xs font-semibold text-neutral-600 hover:bg-neutral-50 hover:text-neutral-800 transition-all duration-200 cursor-pointer"
          >
            Decline
          </button>
          <button
            onClick={handleAccept}
            className="flex-1 py-2.5 px-4 rounded-xl bg-brand text-xs font-semibold text-white hover:bg-brand-hover shadow-sm hover:shadow transition-all duration-200 cursor-pointer"
          >
            Accept Cookies
          </button>
        </div>
      </div>
    </motion.div>
  );
}
