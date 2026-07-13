"use client";

import { AlertTriangle } from "lucide-react";

interface EmptyStateProps {
  /** Main heading */
  title?: string;
  /** Descriptive message */
  message?: string;
  /** Optional icon override */
  icon?: React.ReactNode;
}

export default function EmptyState({
  title = "No Records Found",
  message = "Try adjusting your search or insert a new entry.",
  icon,
}: EmptyStateProps) {
  return (
    <div className="py-24 text-center">
      {icon || <AlertTriangle className="w-10 h-10 text-neutral-300 mx-auto mb-3" />}
      <h3 className="text-sm font-bold text-neutral-700">{title}</h3>
      <p className="text-xs text-neutral-500 mt-1">{message}</p>
    </div>
  );
}
