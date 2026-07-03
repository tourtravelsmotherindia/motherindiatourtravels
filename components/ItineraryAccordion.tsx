"use client";

import { useState } from "react";
import Image from "next/image";
import { resolveMediaUrl, decodeJsonField } from "@/lib/utils";
import type { DayDetail, MediaImage } from "@/types";

interface ItineraryAccordionProps {
  dayDetails: DayDetail[];
  cityName: string;
}

export default function ItineraryAccordion({
  dayDetails,
  cityName,
}: ItineraryAccordionProps) {
  const [openDays, setOpenDays] = useState<Set<number>>(new Set());

  const toggleDay = (index: number) => {
    const next = new Set(openDays);
    if (next.has(index)) {
      next.delete(index);
    } else {
      next.add(index);
    }
    setOpenDays(next);
  };

  if (!dayDetails?.length) return null;

  return (
    <div className="space-y-3">
      {dayDetails.map((day, idx) => {
        const isOpen = openDays.has(idx);

        return (
          <div
            key={idx}
            className="border border-line rounded-xl overflow-hidden"
          >
            {/* Day header */}
            <button
              onClick={() => toggleDay(idx)}
              className="w-full flex items-center justify-between p-4 text-left hover:bg-surface transition-colors"
            >
              <div>
                <span className="text-xs text-red font-semibold uppercase">
                  {cityName} - Day {idx + 1}
                </span>
                <h4 className="font-semibold text-sm mt-1">
                  {day.day_title}
                </h4>
              </div>
              <i
                className={`bi bi-chevron-down text-lg text-secondary transition-transform duration-300 ${
                  isOpen ? "rotate-180" : ""
                }`}
              />
            </button>

            {/* Day content */}
            {isOpen && (
              <div className="p-4 pt-0 border-t border-line bg-surface/50">
                {day.day_summary && (
                  <p className="text-sm text-secondary mb-4 leading-relaxed">
                    {day.day_summary}
                  </p>
                )}

                {/* Day elements (transfers, hotels, activities) */}
                <div className="space-y-3">
                  {day.day_element?.map((el, elIdx) => {
                    if (el.element_type === "transfer") {
                      return (
                        <div
                          key={elIdx}
                          className="flex items-center gap-3 p-3 bg-white rounded-lg border border-line"
                        >
                          <div className="w-8 h-8 rounded-full bg-green/30 flex items-center justify-center flex-shrink-0">
                            <i className="bi bi-car-front-fill text-sm text-green-700" />
                          </div>
                          <div className="text-sm">
                            {el.from && el.to
                              ? `${el.from} → ${el.to}`
                              : "Transfer"}
                            {el.type && (
                              <span className="text-secondary2 ml-1">
                                ({el.type})
                              </span>
                            )}
                          </div>
                        </div>
                      );
                    }

                    if (el.element_type === "hotel") {
                      let hotelImages: MediaImage[] = [];
                      try {
                        if (el.images) {
                          hotelImages =
                            decodeJsonField<MediaImage[]>(el.images);
                        }
                      } catch {
                        // ignore
                      }

                      return (
                        <div
                          key={elIdx}
                          className="p-3 bg-white rounded-lg border border-line"
                        >
                          <div className="flex items-center gap-3 mb-2">
                            <div className="w-8 h-8 rounded-full bg-yellow/30 flex items-center justify-center flex-shrink-0">
                              <i className="bi bi-building-fill text-sm text-yellow-700" />
                            </div>
                            <div>
                              <span className="text-sm font-semibold">
                                {el.name || "Hotel"}
                              </span>
                              {el.star_rating && (
                                <span className="text-xs text-yellow ml-1">
                                  {"★".repeat(parseInt(el.star_rating) || 0)}
                                </span>
                              )}
                            </div>
                          </div>
                          {el.description && (
                            <p className="text-xs text-secondary2 mb-2">
                              {el.description}
                            </p>
                          )}
                          {hotelImages.length > 0 && (
                            <div className="flex gap-2 overflow-x-auto">
                              {hotelImages.slice(0, 4).map((img, iIdx) => (
                                <div
                                  key={iIdx}
                                  className="relative w-20 h-16 flex-shrink-0 rounded-lg overflow-hidden bg-surface"
                                >
                                  <Image
                                    src={resolveMediaUrl(img.path)}
                                    alt={`${el.name || "Hotel"} ${iIdx + 1}`}
                                    fill
                                    className="object-cover"
                                    sizes="80px"
                                  />
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      );
                    }

                    if (el.element_type === "activity") {
                      let activityImages: MediaImage[] = [];
                      try {
                        if (el.images) {
                          activityImages =
                            decodeJsonField<MediaImage[]>(el.images);
                        }
                      } catch {
                        // ignore
                      }

                      return (
                        <div
                          key={elIdx}
                          className="p-3 bg-white rounded-lg border border-line"
                        >
                          <div className="flex items-center gap-3 mb-2">
                            <div className="w-8 h-8 rounded-full bg-blue-t/30 flex items-center justify-center flex-shrink-0">
                              <i className="bi bi-map-fill text-sm text-blue-t" />
                            </div>
                            <span className="text-sm font-semibold">
                              {el.name || "Activity"}
                            </span>
                          </div>
                          {el.description && (
                            <p className="text-xs text-secondary2 mb-2">
                              {el.description}
                            </p>
                          )}
                          {activityImages.length > 0 && (
                            <div className="flex gap-2 overflow-x-auto">
                              {activityImages.slice(0, 4).map((img, iIdx) => (
                                <div
                                  key={iIdx}
                                  className="relative w-20 h-16 flex-shrink-0 rounded-lg overflow-hidden bg-surface"
                                >
                                  <Image
                                    src={resolveMediaUrl(img.path)}
                                    alt={`${el.name || "Activity"} ${iIdx + 1}`}
                                    fill
                                    className="object-cover"
                                    sizes="80px"
                                  />
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      );
                    }

                    return null;
                  })}
                </div>
              </div>
            )}
          </div>
        );
      })}
    </div>
  );
}
