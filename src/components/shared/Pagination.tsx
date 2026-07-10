"use client";

import { ChevronLeft, ChevronRight } from "lucide-react";
import React, { useMemo } from "react";

interface PaginationProps {
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
  className?: string;
}

export default function Pagination({
  currentPage,
  totalPages,
  onPageChange,
  className = "",
}: PaginationProps) {
  const paginationPages = useMemo(() => {
    if (totalPages <= 7) {
      return Array.from({ length: totalPages }, (_, i) => i + 1);
    }

    let startPage = Math.max(2, currentPage - 2);
    let endPage = Math.min(totalPages - 1, currentPage + 2);

    if (currentPage <= 3) {
      startPage = 2;
      endPage = 5;
    } else if (currentPage >= totalPages - 2) {
      startPage = totalPages - 4;
      endPage = totalPages - 1;
    }

    const pages: (number | string)[] = [1];

    if (startPage > 2) {
      pages.push("...");
    }

    for (let i = startPage; i <= endPage; i++) {
      pages.push(i);
    }

    if (endPage < totalPages - 1) {
      pages.push("...");
    }

    pages.push(totalPages);

    return pages;
  }, [currentPage, totalPages]);

  if (totalPages <= 1) return null;

  return (
    <div
      role="navigation"
      aria-label="Pagination Navigation"
      className={`flex items-center justify-center gap-1.5 bg-neutral-100/90 backdrop-blur-md p-1.5 rounded-full max-w-fit mx-auto shadow-sm border border-neutral-200/30 ${className}`}
    >
      <button
        type="button"
        onClick={() => onPageChange(Math.max(currentPage - 1, 1))}
        disabled={currentPage === 1}
        className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2"
        aria-label="Go to previous page"
      >
        <ChevronLeft className="w-4 h-4 stroke-[2.5]" />
      </button>

      {paginationPages.map((page, idx) => {
        if (page === "...") {
          return (
            <span
              key={`ellipsis-${idx}`}
              className="w-9 h-9 flex items-center justify-center text-neutral-400 font-semibold text-sm select-none"
              aria-hidden="true"
            >
              ...
            </span>
          );
        }

        const isPageActive = page === currentPage;

        return (
          <button
            key={`page-${page}`}
            type="button"
            onClick={() => onPageChange(Number(page))}
            aria-label={`Go to page ${page}`}
            aria-current={isPageActive ? "page" : undefined}
            className={`w-9 h-9 rounded-full flex items-center justify-center font-semibold text-sm transition-all duration-200 select-none cursor-pointer focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2 ${
              isPageActive
                ? "bg-neutral-900 text-white shadow-md scale-105"
                : "text-neutral-700 hover:bg-neutral-200/50"
            }`}
          >
            {page}
          </button>
        );
      })}

      <button
        type="button"
        onClick={() => onPageChange(Math.min(currentPage + 1, totalPages))}
        disabled={currentPage === totalPages}
        className="w-9 h-9 rounded-full flex items-center justify-center text-neutral-700 hover:bg-neutral-200/50 disabled:opacity-30 disabled:hover:bg-transparent transition-all duration-200 cursor-pointer disabled:cursor-not-allowed select-none focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand focus-visible:ring-offset-2"
        aria-label="Go to next page"
      >
        <ChevronRight className="w-4 h-4 stroke-[2.5]" />
      </button>
    </div>
  );
}
