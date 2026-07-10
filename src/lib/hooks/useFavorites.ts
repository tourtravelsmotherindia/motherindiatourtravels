"use client";

import { useState } from "react";

export function useFavorites(storageKey = "mother_india_favorites") {
  const [favorites, setFavorites] = useState<string[]>(() => {
    if (typeof window === "undefined") return [];
    try {
      const saved = localStorage.getItem(storageKey);
      return saved ? JSON.parse(saved) : [];
    } catch (e) {
      console.error("Failed to parse favorites from localStorage", e);
      return [];
    }
  });

  const isFavorite = (slug: string) => favorites.includes(slug);

  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => {
      const next = prev.includes(slug) ? prev.filter((s) => s !== slug) : [...prev, slug];
      try {
        localStorage.setItem(storageKey, JSON.stringify(next));
      } catch (e) {
        console.error("Failed to save favorites to localStorage", e);
      }
      return next;
    });
  };

  return {
    favorites,
    isFavorite,
    toggleFavorite,
  };
}
