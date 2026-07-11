"use client";

import "maplibre-gl/dist/maplibre-gl.css";

import { ArrowRight, MapPin } from "lucide-react";
import maplibregl from "maplibre-gl";
import React, { useEffect, useRef } from "react";

interface ContactMapProps {
  address: string;
  latitude: number | null | undefined;
  longitude: number | null | undefined;
}

export default function ContactMap({ address, latitude, longitude }: ContactMapProps) {
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);

  const lat = latitude || 28.61017854877562;
  const lng = longitude || 77.0760841189022;

  useEffect(() => {
    if (!mapContainerRef.current) return;

    const map = new maplibregl.Map({
      container: mapContainerRef.current,
      style: `https://tiles.stadiamaps.com/styles/osm_bright.json`,
      center: [lng, lat],
      zoom: 15,
      attributionControl: false,
    });

    mapRef.current = map;

    map.addControl(new maplibregl.NavigationControl({ showCompass: false }), "top-right");

    map.on("load", () => {
      const el = document.createElement("div");
      el.className = "group relative cursor-pointer";

      el.innerHTML = `
        <div class="w-8 h-8 rounded-full bg-brand/20 border-2 border-brand flex items-center justify-center shadow-lg transition-transform duration-300 hover:scale-125">
          <div class="w-3.5 h-3.5 rounded-full bg-brand animate-ping absolute opacity-75"></div>
          <div class="w-3 h-3 rounded-full bg-brand relative font-sans"></div>
        </div>
      `;

      new maplibregl.Marker({ element: el }).setLngLat([lng, lat]).addTo(map);
    });

    return () => {
      if (mapRef.current) {
        mapRef.current.remove();
        mapRef.current = null;
      }
    };
  }, [lat, lng]);

  const directionUrl = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`;

  return (
    <div className="relative w-full h-[350px] sm:h-[450px] rounded-[2rem] sm:rounded-[2.5rem] overflow-hidden border border-border-light shadow-card group">
      <div ref={mapContainerRef} className="w-full h-full" />

      <div className="absolute bottom-4 left-4 right-4 sm:bottom-6 sm:left-6 sm:right-auto z-10 bg-white p-5 sm:p-6 rounded-[1.5rem] sm:rounded-[2rem] border border-border-light shadow-premium max-w-sm transition-transform duration-300 group-hover:translate-y-[-4px]">
        <h4 className="font-display text-base sm:text-lg font-bold text-foreground">
          Visit Our Office
        </h4>
        <div className="flex gap-2 sm:gap-2.5 items-start mt-2.5 sm:mt-3">
          <MapPin className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-neutral-400 shrink-0 mt-0.5" />
          <span className="text-xs sm:text-sm font-medium text-neutral-600 font-sans leading-relaxed">
            {address}
          </span>
        </div>
        <a
          href={directionUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="mt-3.5 sm:mt-4 inline-flex items-center gap-2 border border-neutral-200 hover:border-brand rounded-full px-4 sm:px-5 py-2 sm:py-2.5 text-[10px] sm:text-xs font-semibold text-neutral-800 hover:text-brand transition-all duration-200 bg-white select-none cursor-pointer"
        >
          Get a Direction
          <ArrowRight className="w-3.5 h-3.5" />
        </a>
      </div>
    </div>
  );
}
