/* eslint-disable @typescript-eslint/no-explicit-any */
"use client";

import { useEffect, useState } from "react";

import CookieConsent from "@/components/layout/CookieConsent";

declare global {
  interface Window {
    googleTranslateElementInit?: () => void;
    google?: any;
  }
}

export default function TranslationScript() {
  const [hasConsent, setHasConsent] = useState(false);

  useEffect(() => {
    // Check if user has already accepted cookies
    const consent = localStorage.getItem("cookies_accepted");
    if (consent === "true") {
      // eslint-disable-next-line react-hooks/set-state-in-effect
      setHasConsent(true);
    }
  }, []);

  useEffect(() => {
    if (!hasConsent) return;

    // 1. Define the initialization callback Google Translate expects
    window.googleTranslateElementInit = () => {
      console.log("🌐 Google Translate Element Initializing...");
      try {
        if (window.google?.translate?.TranslateElement) {
          new window.google.translate.TranslateElement(
            {
              pageLanguage: "en",
              includedLanguages:
                "en,hi,es,fr,de,it,pt,ru,ar,zh-CN,ja,ko,nl,pl,sv,tr,vi,th,id,he,bn,gu,kn,ml,mr,pa,ta,te,ur",
              autoDisplay: false,
            },
            "google_translate_element",
          );
          console.log("🌐 Google Translate Element Initialized Successfully.");
        } else {
          console.error(
            "🌐 Google Translate Element failed: translate library not found on google object.",
          );
        }
      } catch (err) {
        console.error("🌐 Exception during Google Translate initialization:", err);
      }
    };

    // 2. If the Google Translate library is already loaded in window, run the init callback immediately
    if (window.google?.translate?.TranslateElement) {
      console.log("🌐 Google Translate library already loaded. Initializing immediately...");
      window.googleTranslateElementInit();
    } else {
      // 3. Otherwise inject/re-inject the Google Translate script tag to guarantee fresh callback binding
      const scriptId = "google-translate-script";
      const existingScript = document.getElementById(scriptId);
      if (existingScript) {
        console.log("🌐 Removing stale script tag for fresh callback binding...");
        existingScript.remove();
      }
      console.log("🌐 Injecting Google Translate Script...");
      const script = document.createElement("script");
      script.id = scriptId;
      script.type = "text/javascript";
      script.src =
        "https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
      script.async = true;
      script.onerror = (err) => {
        console.error(
          "🌐 Google Translate Script failed to load. Blocked by adblocker or offline?",
          err,
        );
      };
      document.body.appendChild(script);
    }
  }, [hasConsent]);

  return (
    <>
      {/* Hidden container positioned off-screen to ensure full layout flows correctly */}
      <div
        id="google_translate_element"
        style={{
          position: "absolute",
          top: "-9999px",
          left: "-9999px",
          width: "200px",
          height: "80px",
          overflow: "hidden",
          opacity: 0,
          pointerEvents: "none",
        }}
        aria-hidden="true"
      />
      {!hasConsent && <CookieConsent onAccept={() => setHasConsent(true)} />}
    </>
  );
}

/**
 * Utility to programmatically switch the active language via Google Translate.
 * Sets the appropriate cookie for cross-page persistence and triggers the select event.
 */
export const triggerTranslation = (langCode: string) => {
  console.log(`🌐 triggerTranslation called for: "${langCode}"`);
  try {
    const value = `/en/${langCode}`;

    // Set cookies with absolute path
    if (langCode === "en") {
      // Clear cookie to restore default page language
      document.cookie = "googtrans=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC;";

      if (typeof window !== "undefined") {
        const host = window.location.hostname;
        const domainParts = host.split(".");
        if (domainParts.length > 2) {
          const baseDomain = `.${domainParts.slice(-2).join(".")}`;
          document.cookie = `googtrans=; path=/; domain=${baseDomain}; expires=Thu, 01 Jan 1970 00:00:00 UTC;`;
        }
      }
    } else {
      document.cookie = `googtrans=${value}; path=/;`;

      if (typeof window !== "undefined") {
        const host = window.location.hostname;
        const domainParts = host.split(".");
        if (domainParts.length > 2) {
          const baseDomain = `.${domainParts.slice(-2).join(".")}`;
          document.cookie = `googtrans=${value}; path=/; domain=${baseDomain};`;
        }
      }
    }

    localStorage.setItem("preferred_language", langCode);

    // Internal function to find and trigger change on the google translate combo box
    const applyChange = (): boolean => {
      const googleSelect = document.querySelector(".goog-te-combo") as HTMLSelectElement | null;
      if (googleSelect) {
        googleSelect.value = langCode;
        googleSelect.dispatchEvent(new Event("change"));
        console.log(`🌐 Successfully triggered translation to: "${langCode}"`);
        return true;
      }
      return false;
    };

    // Attempt immediately
    if (!applyChange()) {
      console.warn(
        "🌐 Google Translate select element (.goog-te-combo) not found in DOM yet. Retrying...",
      );
      // Poll every 150ms up to 20 times (3 seconds total) to handle deferred loading
      let attempts = 0;
      const interval = setInterval(() => {
        attempts++;
        const success = applyChange();
        if (success || attempts >= 20) {
          clearInterval(interval);
          if (!success) {
            console.error("🌐 Google Translate failed to initialize after 3 seconds.");
          }
        }
      }, 150);
    }
  } catch (error) {
    console.error("🌐 Error setting translation:", error);
  }
};

/**
 * Helper to fetch the currently active language from cookies or localStorage
 */
export const getActiveLanguage = (): string => {
  if (typeof window === "undefined") return "en";

  const localLang = localStorage.getItem("preferred_language");
  if (localLang) return localLang;

  const match = document.cookie.match(/googtrans=\/en\/([^;]+)/);
  if (match && match[1]) {
    return match[1];
  }

  return "en";
};
