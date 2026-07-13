"use client";

import { AlertTriangle, RefreshCw } from "lucide-react";

interface ErrorStateProps {
  /** The error message to display */
  message?: string;
  /** Optional callback to retry the failed operation */
  onRetry?: () => void;
}

export default function ErrorState({
  message = "Failed to load data from the server.",
  onRetry,
}: ErrorStateProps) {
  return (
    <div className="py-16 flex flex-col items-center justify-center text-center">
      <div className="w-12 h-12 rounded-full bg-red-50 text-red-500 flex items-center justify-center mb-4">
        <AlertTriangle className="w-6 h-6" />
      </div>
      <h3 className="text-sm font-bold text-neutral-800 mb-1">Something went wrong</h3>
      <p className="text-xs text-neutral-500 max-w-xs leading-relaxed">{message}</p>
      {onRetry && (
        <button
          onClick={onRetry}
          className="mt-4 inline-flex items-center gap-1.5 px-4 py-2 rounded-full bg-white border border-neutral-200 text-xs font-semibold text-neutral-700 hover:bg-neutral-50 transition-colors"
        >
          <RefreshCw className="w-3.5 h-3.5" />
          <span>Retry</span>
        </button>
      )}
    </div>
  );
}
