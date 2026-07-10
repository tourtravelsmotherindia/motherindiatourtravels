"use client";

import { ArrowRight } from "lucide-react";
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
      className={`inline-flex items-center gap-2 text-brand hover:text-brand-hover font-semibold text-sm group shrink-0 transition-colors duration-200 ${className}`}
    >
      <span>{label}</span>
      <span className="w-8 h-8 rounded-full border border-brand/20 flex items-center justify-center group-hover:border-brand transition-all duration-300">
        <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5 duration-300" />
      </span>
    </Link>
  );
}
