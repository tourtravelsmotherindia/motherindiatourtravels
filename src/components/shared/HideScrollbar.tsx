"use client";

import { useEffect } from "react";

export default function HideScrollbar() {
  useEffect(() => {
    // Add no-scrollbar class to the HTML document element on mount
    document.documentElement.classList.add("no-scrollbar");
    return () => {
      // Clean up and remove the class on unmount
      document.documentElement.classList.remove("no-scrollbar");
    };
  }, []);

  return null;
}
