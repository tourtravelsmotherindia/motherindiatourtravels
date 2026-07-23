"use client";

import { useEffect, useState } from "react";

import { logger } from "@/lib/logger";

export function useFavorites(storageKey = "mother_india_favorites") {
  const [favorites, setFavorites] = useState<string[]>([]);

  useEffect(() => {
    try {
      const saved = localStorage.getItem(storageKey);
      if (saved) {
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setFavorites(JSON.parse(saved));
      }
    } catch (e) {
      logger.error("Favorites", "Failed to parse favorites from localStorage", e);
    }
  }, [storageKey]);

  const isFavorite = (slug: string) => favorites.includes(slug);

  const toggleFavorite = (slug: string) => {
    setFavorites((prev) => {
      const next = prev.includes(slug) ? prev.filter((s) => s !== slug) : [...prev, slug];
      try {
        localStorage.setItem(storageKey, JSON.stringify(next));
      } catch (e) {
        logger.error("Favorites", "Failed to save favorites to localStorage", e);
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
