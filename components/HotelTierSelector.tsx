"use client";

import { useState } from "react";
import type { PriceTier } from "@/types";

interface HotelTierSelectorProps {
  priceTiers: PriceTier[];
}

export default function HotelTierSelector({
  priceTiers,
}: HotelTierSelectorProps) {
  const [selectedTier, setSelectedTier] = useState<string>(
    priceTiers?.[0]?.rating || "3"
  );

  const currentTier =
    priceTiers?.find((t) => t.rating === selectedTier) || priceTiers?.[0];

  const tierLabels: Record<string, { label: string; stars: string }> = {
    "3": { label: "3 Star", stars: "★★★" },
    "4": { label: "4 Star", stars: "★★★★" },
    "5": { label: "5 Star", stars: "★★★★★" },
  };

  if (!priceTiers?.length) return null;

  return (
    <div className="bg-surface rounded-xl p-6">
      <h3 className="text-sm font-semibold mb-4">Select Hotel Category</h3>

      {/* Tier buttons */}
      <div className="flex gap-2 mb-6">
        {priceTiers.map((tier) => {
          const isSelected = tier.rating === selectedTier;
          const info = tierLabels[tier.rating] || {
            label: `${tier.rating} Star`,
            stars: "★".repeat(parseInt(tier.rating) || 0),
          };

          return (
            <button
              key={tier.rating}
              onClick={() => setSelectedTier(tier.rating)}
              className={`flex-1 py-3 px-4 rounded-lg text-center transition-all duration-200 ${
                isSelected
                  ? "bg-red text-white shadow-md"
                  : "bg-white border border-line text-black hover:border-red"
              }`}
            >
              <div className="text-xs font-semibold">{info.label}</div>
              <div
                className={`text-sm mt-1 ${
                  isSelected ? "text-white" : "text-yellow"
                }`}
              >
                {info.stars}
              </div>
            </button>
          );
        })}
      </div>

      {/* Price display */}
      {currentTier && (
        <div className="bg-white rounded-lg p-4 border border-line">
          <div className="flex items-baseline justify-between">
            <div>
              <span className="text-xs text-secondary2">Starting from</span>
              <div className="flex items-baseline gap-1 mt-1">
                {currentTier.old_price && (
                  <span className="text-sm text-secondary2 line-through">
                    ₹{parseInt(currentTier.old_price).toLocaleString("en-IN")}
                  </span>
                )}
                <span className="text-2xl font-bold text-red">
                  ₹{currentTier.actual.toLocaleString("en-IN")}
                </span>
              </div>
              {currentTier.discount && (
                <span className="inline-block mt-1 text-xs text-green bg-green/20 px-2 py-0.5 rounded-full font-medium">
                  {currentTier.discount}% Off
                </span>
              )}
            </div>
            <a
              href="#contact"
              className="inline-flex items-center gap-2 bg-red text-white px-5 py-2.5 rounded-full text-sm font-medium hover:opacity-90 transition-opacity"
            >
              <i className="bi bi-telephone-fill" />
              Enquire Now
            </a>
          </div>
        </div>
      )}
    </div>
  );
}
