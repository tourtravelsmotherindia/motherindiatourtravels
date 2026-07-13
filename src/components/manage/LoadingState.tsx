"use client";

import { Loader2 } from "lucide-react";

interface LoadingStateProps {
  /** Short description of what's loading */
  message?: string;
  /** Container height variant */
  variant?: "inline" | "full";
}

export default function LoadingState({
  message = "Loading data...",
  variant = "full",
}: LoadingStateProps) {
  if (variant === "inline") {
    return (
      <div className="flex items-center justify-center gap-2 py-4">
        <Loader2 className="w-4 h-4 text-brand animate-spin" />
        <span className="text-xs text-neutral-500 font-medium">{message}</span>
      </div>
    );
  }

  return (
    <div className="py-24 flex flex-col items-center justify-center">
      <Loader2 className="w-6 h-6 text-brand animate-spin" />
      <p className="text-xs text-neutral-600 font-semibold mt-2 animate-pulse">{message}</p>
    </div>
  );
}
