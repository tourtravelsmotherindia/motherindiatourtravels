"use client";

import "maplibre-gl/dist/maplibre-gl.css";

import maplibregl from "maplibre-gl";
import React, { useEffect, useRef } from "react";

// Coordinate dictionary for all package destinations in the system
const DESTINATION_COORDINATES: Record<string, [number, number]> = {
  // India
  delhi: [77.209, 28.6139],
  "new delhi": [77.209, 28.6139],
  agra: [78.0081, 27.1767],
  jaipur: [75.7873, 26.9124],
  goa: [73.8278, 15.2993],
  srinagar: [74.7973, 34.0837],
  gulmarg: [74.38, 34.05],
  pahalgam: [75.3167, 34.0167],
  munnar: [77.0597, 10.0889],
  alleppey: [76.3388, 9.4981],
  thekkady: [77.174, 9.6031],
  kochi: [76.2673, 9.9312],
  cochin: [76.2673, 9.9312],
  manali: [77.1887, 32.2396],
  shimla: [77.1734, 31.1048],
  chandigarh: [76.7794, 30.7333],
  amritsar: [74.8723, 31.634],
  haridwar: [78.1642, 29.9457],
  rishikesh: [78.2676, 30.0869],
  corbett: [78.7747, 29.53],
  "corbett national park": [78.7747, 29.53],
  nainital: [79.4582, 29.3801],
  mussoorie: [78.0772, 30.4598],
  khajuraho: [79.9199, 24.8318],
  varanasi: [82.9739, 25.3176],
  pushkar: [74.5554, 26.4897],
  ranthambore: [76.5026, 25.9931],
  darjeeling: [88.2627, 27.041],
  gangtok: [88.6138, 27.3314],
  pelling: [88.2433, 27.2885],
  prayagraj: [81.8463, 25.4358],
  allahabad: [81.8463, 25.4358],
  ayodhya: [82.1997, 26.7957],
  chitrakoot: [80.8553, 25.1764],
  mathura: [77.6737, 27.4924],

  // International
  dubai: [55.2708, 25.2048],
  kathmandu: [85.324, 27.7172],
  pokhara: [83.9856, 28.2096],
  chitwan: [84.4284, 27.5291],
  "kuala lumpur": [101.6869, 3.139],
  genting: [101.7944, 3.4239],
  singapore: [103.8198, 1.3521],
  bangkok: [100.5018, 13.7563],
  pattaya: [100.8831, 12.9236],
  phuket: [98.3922, 7.8804],
  malaysia: [101.9758, 4.2105],
  thailand: [100.9925, 15.87],
  nepal: [84.124, 28.3949],
};

interface PackageMapProps {
  destinations: string[];
}

export default function PackageMap({ destinations }: PackageMapProps) {
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);

  useEffect(() => {
    if (!mapContainerRef.current) return;

    // Resolve destinations to coordinates
    const coordinatesList: { name: string; coord: [number, number] }[] = [];
    destinations.forEach((dest) => {
      const normalized = dest.toLowerCase().trim();
      const coords = DESTINATION_COORDINATES[normalized];
      if (coords) {
        // Prevent duplicate coordinates if they point to same place
        if (
          !coordinatesList.some(
            (item) => item.coord[0] === coords[0] && item.coord[1] === coords[1],
          )
        ) {
          coordinatesList.push({ name: dest, coord: coords });
        }
      }
    });

    // Default center (India center if no coordinates matched)
    const defaultCenter: [number, number] = [78.9629, 20.5937];
    const defaultZoom = 4;

    const initialCenter = coordinatesList.length > 0 ? coordinatesList[0].coord : defaultCenter;
    const initialZoom = coordinatesList.length > 0 ? 8 : defaultZoom;

    // Initialize MapLibre Map using Stadia Maps tile server
    const apiKey = "e856ac81-af78-492d-88de-e541f713b831";
    const map = new maplibregl.Map({
      container: mapContainerRef.current,
      style: `https://tiles.stadiamaps.com/styles/osm_bright.json?api_key=${apiKey}`,
      center: initialCenter,
      zoom: initialZoom,
      attributionControl: false,
    });

    mapRef.current = map;

    // Add navigation controls
    map.addControl(new maplibregl.NavigationControl({ showCompass: false }), "top-right");

    map.on("load", () => {
      if (coordinatesList.length === 0) return;

      // Add markers for each destination
      coordinatesList.forEach(({ name, coord }, idx) => {
        // Create custom HTML element for marker
        const el = document.createElement("div");
        el.className = "group relative cursor-pointer";

        // Inner markup with custom pulsing dot
        el.innerHTML = `
          <div class="w-7 h-7 rounded-full bg-brand/20 border-2 border-brand flex items-center justify-center shadow-lg transition-transform duration-300 hover:scale-125">
            <div class="w-2.5 h-2.5 rounded-full bg-brand"></div>
          </div>
          <div class="absolute -bottom-8 left-1/2 -translate-x-1/2 bg-neutral-900/90 text-white font-medium text-[10px] px-2 py-0.5 rounded shadow-md whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity duration-200 pointer-events-none uppercase tracking-wider font-sans">
            ${idx + 1}. ${name}
          </div>
        `;

        new maplibregl.Marker({ element: el })
          .setLngLat(coord)
          .setPopup(
            new maplibregl.Popup({ offset: 15, closeButton: false }).setHTML(
              `<div class="font-sans px-2 py-1"><p class="font-bold text-xs text-foreground uppercase tracking-wide">Stage ${idx + 1}</p><p class="text-sm font-semibold text-neutral-700">${name}</p></div>`,
            ),
          )
          .addTo(map);
      });

      // Fit bounds to cover all coordinates
      if (coordinatesList.length > 1) {
        const bounds = new maplibregl.LngLatBounds();
        coordinatesList.forEach(({ coord }) => bounds.extend(coord));
        map.fitBounds(bounds, {
          padding: { top: 60, bottom: 60, left: 60, right: 60 },
          maxZoom: 10,
          duration: 1000,
        });

        // Draw dotted path line connecting stages
        const pathCoords = coordinatesList.map((item) => item.coord);

        map.addSource("route", {
          type: "geojson",
          data: {
            type: "Feature",
            properties: {},
            geometry: {
              type: "LineString",
              coordinates: pathCoords,
            },
          },
        });

        map.addLayer({
          id: "route-line",
          type: "line",
          source: "route",
          layout: {
            "line-join": "round",
            "line-cap": "round",
          },
          paint: {
            "line-color": "#E05423", // brand orange
            "line-width": 3,
            "line-dasharray": [2, 2],
          },
        });
      }
    });

    // Cleanup map instance on unmount
    return () => {
      if (mapRef.current) {
        mapRef.current.remove();
        mapRef.current = null;
      }
    };
  }, [destinations]);

  return (
    <div className="relative w-full h-full">
      <div ref={mapContainerRef} className="w-full h-full" />
    </div>
  );
}
