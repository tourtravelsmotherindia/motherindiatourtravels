"use client";

import { useEffect } from "react";

declare global {
  interface Window {
    googleTranslateElementInit?: () => void;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    google?: any;
  }
}

export default function TranslationScript() {
  useEffect(() => {
    // 1. Define the initialization function Google Translate expects
    window.googleTranslateElementInit = () => {
      if (window.google?.translate?.TranslateElement) {
        new window.google.translate.TranslateElement(
          {
            pageLanguage: "en",
            includedLanguages:
              "en,hi,es,fr,de,it,pt,ru,ar,zh-CN,ja,ko,nl,pl,sv,tr,vi,th,id,he,bn,gu,kn,ml,mr,pa,ta,te,ur",
            layout: window.google.translate.TranslateElement.InlineLayout.SIMPLE,
            autoDisplay: false,
          },
          "google_translate_element",
        );
      }
    };

    // 2. Load the Google Translate script dynamically if it doesn't exist
    const scriptId = "google-translate-script";
    if (!document.getElementById(scriptId)) {
      const script = document.createElement("script");
      script.id = scriptId;
      script.type = "text/javascript";
      script.src = "//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
      script.async = true;
      document.body.appendChild(script);
    }
  }, []);

  return (
    // Hidden container that Google Translate uses to inject its combo box
    <div id="google_translate_element" style={{ display: "none" }} aria-hidden="true" />
  );
}

/**
 * Utility to programmatically switch the active language via Google Translate.
 * Sets the appropriate cookie for cross-page persistence and triggers the select event.
 */
export const triggerTranslation = (langCode: string) => {
  try {
    // googtrans cookie format is "/source_lang/target_lang" (e.g. "/en/hi")
    const value = `/en/${langCode}`;

    // Set cookie for both current domain and base path to ensure it persists
    document.cookie = `googtrans=${value}; path=/;`;

    // Fallback: If it's a subdomain or different host, set it on window/local domain
    if (typeof window !== "undefined") {
      const host = window.location.hostname;
      const domainParts = host.split(".");
      if (domainParts.length > 2) {
        const baseDomain = `.${domainParts.slice(-2).join(".")}`;
        document.cookie = `googtrans=${value}; path=/; domain=${baseDomain};`;
      }
    }

    localStorage.setItem("preferred_language", langCode);

    // Find Google's hidden select combo box and trigger changes
    const googleSelect = document.querySelector(".goog-te-combo") as HTMLSelectElement | null;
    if (googleSelect) {
      googleSelect.value = langCode;
      googleSelect.dispatchEvent(new Event("change"));
    }
  } catch (error) {
    console.error("Error setting translation:", error);
  }
};

/**
 * Helper to fetch the currently active language from cookies or localStorage
 */
export const getActiveLanguage = (): string => {
  if (typeof window === "undefined") return "en";

  // Try localStorage first
  const localLang = localStorage.getItem("preferred_language");
  if (localLang) return localLang;

  // Fallback to reading the googtrans cookie
  const match = document.cookie.match(/googtrans=\/en\/([^;]+)/);
  if (match && match[1]) {
    return match[1];
  }

  return "en";
};
