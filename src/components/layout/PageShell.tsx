"use client";

import React from "react";

import { type CompanyData } from "@/types/company";

import Footer from "./Footer";
import HelpFloatingButton from "./HelpFloatingButton";
import Navbar from "./Navbar";

interface PageShellProps {
  children: React.ReactNode;
  companyData: CompanyData | null;
  className?: string; // class applied to <main>
  ptClass?: string; // default "pt-24"
  bgClass?: string; // default "bg-white"
  transparentNavbar?: boolean;
}

export default function PageShell({
  children,
  companyData,
  className = "",
  ptClass = "pt-24",
  bgClass = "bg-white",
  transparentNavbar = false,
}: PageShellProps) {
  return (
    <div className={`relative min-h-screen flex flex-col ${bgClass} ${ptClass}`}>
      <Navbar transparent={transparentNavbar} />
      <main className={`flex-1 ${className}`}>{children}</main>
      <Footer companyData={companyData} />
      <HelpFloatingButton companyData={companyData} />
    </div>
  );
}
