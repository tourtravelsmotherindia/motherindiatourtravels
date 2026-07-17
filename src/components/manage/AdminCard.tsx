"use client";

import React from "react";

interface AdminCardProps {
  children: React.ReactNode;
  className?: string;
  noPadding?: boolean;
}

export default function AdminCard({ children, className = "", noPadding = false }: AdminCardProps) {
  return (
    <div
      className={`bg-black rounded-2xl border border-neutral-800 text-white ${noPadding ? "" : "p-6"} ${className}`}
    >
      {children}
    </div>
  );
}
