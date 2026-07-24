"use client";

import Link from "next/link";
import React from "react";

interface SeeAllLinkProps {
  href: string;
  label: string;
  className?: string;
}

export default function SeeAllLink({ href, label, className = "" }: SeeAllLinkProps) {
  return (
    <Link
      href={href}
      className={`text-neutral-900 font-bold underline hover:text-brand transition-colors duration-200 text-sm shrink-0 ${className}`}
    >
      {label}
    </Link>
  );
}
