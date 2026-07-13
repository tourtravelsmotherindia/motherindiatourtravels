"use client";

import "maplibre-gl/dist/maplibre-gl.css";

import maplibregl from "maplibre-gl";
import React, { useEffect, useRef } from "react";

export interface MapMarker {
  name: string;
  latitude: number;
  longitude: number;
}

interface PackageMapProps {
  /** Map markers sourced from DB attractions or destinations — no hardcoding */
  markers: MapMarker[];
}

export default function PackageMap({ markers }: PackageMapProps) {
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);

  useEffect(() => {
    if (!mapContainerRef.current) return;

    // Deduplicate markers by coordinates
    const unique: MapMarker[] = [];
    markers.forEach((m) => {
      const isDupe = unique.some((u) => u.latitude === m.latitude && u.longitude === m.longitude);
      if (!isDupe) unique.push(m);
    });

    // Default center (India)
    const defaultCenter: [number, number] = [78.9629, 20.5937];
    const initialCenter: [number, number] =
      unique.length > 0 ? [unique[0].longitude, unique[0].latitude] : defaultCenter;
    const initialZoom = unique.length > 0 ? 8 : 4;

    const map = new maplibregl.Map({
      container: mapContainerRef.current,
      style: `https://api.maptiler.com/maps/streets-v4/style.json?key=${process.env.NEXT_PUBLIC_MAPTILER_KEY}`,
      center: initialCenter,
      zoom: initialZoom,
      attributionControl: {},
    });

    mapRef.current = map;
    map.addControl(new maplibregl.NavigationControl({ showCompass: false }), "top-right");

    map.on("load", () => {
      if (unique.length === 0) return;

      unique.forEach(({ name, latitude, longitude }, idx) => {
        const el = document.createElement("div");
        el.className = "group relative cursor-pointer";
        el.innerHTML = `
          <div class="w-7 h-7 rounded-full bg-brand/20 border-2 border-brand flex items-center justify-center shadow-lg transition-transform duration-300 hover:scale-125">
            <div class="w-2.5 h-2.5 rounded-full bg-brand"></div>
          </div>
          <div class="absolute -bottom-8 left-1/2 -translate-x-1/2 bg-neutral-900/90 text-white font-medium text-[10px] px-2 py-0.5 rounded shadow-md whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity duration-200 pointer-events-none uppercase tracking-wider font-sans">
            ${idx + 1}. ${name}
          </div>
        `;

        new maplibregl.Marker({ element: el })
          .setLngLat([longitude, latitude])
          .setPopup(
            new maplibregl.Popup({ offset: 15, closeButton: false }).setHTML(
              `<div class="font-sans px-2 py-1"><p class="font-bold text-xs text-foreground uppercase tracking-wide">Stage ${idx + 1}</p><p class="text-sm font-semibold text-neutral-700">${name}</p></div>`,
            ),
          )
          .addTo(map);
      });

      if (unique.length > 1) {
        const bounds = new maplibregl.LngLatBounds();
        unique.forEach(({ longitude, latitude }) => bounds.extend([longitude, latitude]));
        map.fitBounds(bounds, {
          padding: { top: 60, bottom: 60, left: 60, right: 60 },
          maxZoom: 10,
          duration: 1000,
        });

        // Draw dotted route line
        const pathCoords = unique.map((m): [number, number] => [m.longitude, m.latitude]);
        map.addSource("route", {
          type: "geojson",
          data: {
            type: "Feature",
            properties: {},
            geometry: { type: "LineString", coordinates: pathCoords },
          },
        });

        map.addLayer({
          id: "route-line",
          type: "line",
          source: "route",
          layout: { "line-join": "round", "line-cap": "round" },
          paint: {
            "line-color": "#E58E35",
            "line-width": 3,
            "line-dasharray": [2, 2],
          },
        });
      }
    });

    return () => {
      if (mapRef.current) {
        mapRef.current.remove();
        mapRef.current = null;
      }
    };
  }, [markers]);

  return (
    <div className="relative w-full h-full">
      <div ref={mapContainerRef} className="w-full h-full" />
    </div>
  );
}
