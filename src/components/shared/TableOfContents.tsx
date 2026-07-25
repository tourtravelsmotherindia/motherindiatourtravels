"use client";

import React from "react";

export interface TocItem {
  id: string;
  title: string;
  children?: TocItem[];
}

interface TableOfContentsProps {
  items: TocItem[];
  activeId: string;
  size?: "sm" | "md";
  showBackToTop?: boolean;
}

export default function TableOfContents({
  items,
  activeId,
  size = "md",
  showBackToTop = true,
}: TableOfContentsProps) {
  const titleClass =
    size === "sm"
      ? "text-lg font-bold text-neutral-900 mb-4"
      : "text-xl md:text-2xl font-bold text-neutral-900 mb-5";

  const itemClass = size === "sm" ? "text-sm font-semibold" : "text-base font-semibold";

  const childItemClass = size === "sm" ? "text-xs font-semibold" : "text-sm font-semibold";

  const listSpacing = size === "sm" ? "space-y-2.5" : "space-y-3.5";
  const childListSpacing = size === "sm" ? "space-y-2 mt-2 ml-4" : "space-y-2.5 mt-2.5 ml-6";

  return (
    <div>
      <h2 className={titleClass}>Table of contents</h2>

      {/* Top-level items: numbered */}
      <ol className={`${listSpacing} list-decimal list-inside ${itemClass}`}>
        {items.map((item) => {
          const isActive = activeId === item.id;
          return (
            <li key={item.id} className="text-neutral-400">
              <a
                href={`#${item.id}`}
                className={`transition-all duration-200 underline decoration-neutral-300 hover:decoration-neutral-950 ${
                  isActive
                    ? "text-neutral-900 font-bold underline decoration-neutral-950"
                    : "text-neutral-700 hover:text-neutral-900"
                }`}
              >
                {item.title}
              </a>

              {/* Sub-items: dots */}
              {item.children && item.children.length > 0 && (
                <ul className={`${childListSpacing} list-disc ${childItemClass}`}>
                  {item.children.map((child) => {
                    const isChildActive = activeId === child.id;
                    return (
                      <li key={child.id} className="text-neutral-400">
                        <a
                          href={`#${child.id}`}
                          className={`transition-all duration-200 underline decoration-neutral-200 hover:decoration-neutral-900 ${
                            isChildActive
                              ? "text-neutral-900 font-bold underline decoration-neutral-900"
                              : "text-neutral-600 hover:text-neutral-900"
                          }`}
                        >
                          {child.title}
                        </a>
                      </li>
                    );
                  })}
                </ul>
              )}
            </li>
          );
        })}
      </ol>

      {showBackToTop && (
        <>
          <div className="w-full h-px bg-neutral-200 mt-6 mb-4" />
          <button
            onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
            className="flex items-center gap-2 text-xs font-bold text-neutral-500 hover:text-neutral-900 transition-colors cursor-pointer group"
          >
            <span className="group-hover:-translate-y-0.5 transition-transform duration-200">
              Back to top ↑
            </span>
          </button>
        </>
      )}
    </div>
  );
}
