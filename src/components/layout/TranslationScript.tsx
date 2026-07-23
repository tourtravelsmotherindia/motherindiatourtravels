/* eslint-disable @typescript-eslint/no-explicit-any */
"use client";

import { useEffect, useState } from "react";

import CookieConsent from "@/components/layout/CookieConsent";
import { logger } from "@/lib/logger";

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
      logger.log("Translate", "Google Translate Element Initializing...");
      try {
        if (window.google?.translate?.TranslateElement) {
          new window.google.translate.TranslateElement(
            {
              pageLanguage: "en",
              includedLanguages:
                "en,hi,es,fr,de,ar,af,sq,am,hy,az,eu,bs,bg,ca,zh-CN,zh-TW,hr,cs,da,nl,et,tl,fi,gl,ka,el,ha,haw,he,hu,is,ig,id,ga,it,ja,kk,km,ko,ky,lo,lv,lt,lb,mk,mg,ms,mt,mi,mn,ne,no,fa,pl,pt,ro,ru,sm,sr,sn,si,sk,sl,so,sw,sv,th,tr,uk,uz,vi,cy,yo,zu,bn,gu,kn,ml,mr,pa,ta,te,ur",
              autoDisplay: false,
            },
            "google_translate_element",
          );
          logger.log("Translate", "Google Translate Element Initialized Successfully.");
        } else {
          logger.error(
            "Translate",
            "Google Translate Element failed: translate library not found on google object.",
          );
        }
      } catch (err) {
        logger.error("Translate", "Exception during Google Translate initialization:", err);
      }
    };

    // 2. If the Google Translate library is already loaded in window, run the init callback immediately
    if (window.google?.translate?.TranslateElement) {
      logger.log(
        "Translate",
        "Google Translate library already loaded. Initializing immediately...",
      );
      window.googleTranslateElementInit();
    } else {
      // 3. Otherwise inject/re-inject the Google Translate script tag to guarantee fresh callback binding
      const scriptId = "google-translate-script";
      const existingScript = document.getElementById(scriptId);
      if (existingScript) {
        logger.log("Translate", "Removing stale script tag for fresh callback binding...");
        existingScript.remove();
      }
      logger.log("Translate", "Injecting Google Translate Script...");
      const script = document.createElement("script");
      script.id = scriptId;
      script.type = "text/javascript";
      script.src =
        "https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
      script.async = true;
      script.onerror = (err) => {
        logger.error(
          "Translate",
          "Google Translate Script failed to load. Blocked by adblocker or offline?",
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
  logger.log("Translate", `triggerTranslation called for: "${langCode}"`);
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
        logger.log("Translate", `Successfully triggered translation to: "${langCode}"`);
        return true;
      }
      return false;
    };

    // Attempt immediately
    if (!applyChange()) {
      logger.warn(
        "Translate",
        "Google Translate select element (.goog-te-combo) not found in DOM yet. Retrying...",
      );
      // Poll every 150ms up to 20 times (3 seconds total) to handle deferred loading
      let attempts = 0;
      const interval = setInterval(() => {
        attempts++;
        const success = applyChange();
        if (success || attempts >= 20) {
          clearInterval(interval);
          if (!success) {
            logger.error("Translate", "Google Translate failed to initialize after 3 seconds.");
          }
        }
      }, 150);
    }
  } catch (error) {
    logger.error("Translate", "Error setting translation:", error);
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

/**
 * Helper to force-trigger translation on dynamically rendered DOM elements.
 * Dispatches a change event on the Google Translate select to re-scan the DOM.
 */
export const retriggerTranslation = () => {
  try {
    const activeLang = getActiveLanguage();
    if (activeLang && activeLang !== "en") {
      const googleSelect = document.querySelector(".goog-te-combo") as HTMLSelectElement | null;
      if (googleSelect) {
        googleSelect.value = activeLang;
        googleSelect.dispatchEvent(new Event("change"));
        logger.log("Translate", `Retriggered translation to: "${activeLang}"`);
      }
    }
  } catch (error) {
    logger.error("Translate", "Error re-triggering translation:", error);
  }
};
