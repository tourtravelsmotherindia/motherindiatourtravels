"use client";

import React from "react";

import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
import { type CompanyData } from "@/types/company";

interface PageShellProps {
  children: React.ReactNode;
  companyData: CompanyData | null;
  className?: string; // class applied to <main>
  ptClass?: string; // default "pt-24"
  bgClass?: string; // default "bg-white"
}

export default function PageShell({
  children,
  companyData,
  className = "",
  ptClass = "pt-24",
  bgClass = "bg-white",
}: PageShellProps) {
  return (
    <div className={`relative min-h-screen flex flex-col ${bgClass} ${ptClass}`}>
      <Navbar />
      <main className={`flex-1 ${className}`}>{children}</main>
      <Footer companyData={companyData} />
    </div>
  );
}
