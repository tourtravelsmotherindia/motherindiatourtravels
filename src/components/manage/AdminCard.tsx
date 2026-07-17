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
      className={`bg-white rounded-2xl border border-neutral-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] ${noPadding ? "" : "p-6"} ${className}`}
    >
      {children}
    </div>
  );
}
