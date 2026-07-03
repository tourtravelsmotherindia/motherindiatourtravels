"use client";

import { useState } from "react";
import Link from "next/link";

export default function HeaderClient() {
  const [mobileOpen, setMobileOpen] = useState(false);

  return (
    <>
      {/* Mobile menu button */}
      <button
        onClick={() => setMobileOpen(!mobileOpen)}
        className="lg:hidden w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface transition-colors"
        aria-label={mobileOpen ? "Close menu" : "Open menu"}
      >
        <i className={`bi ${mobileOpen ? "bi-x-lg" : "bi-list"} text-2xl`} />
      </button>

      {/* Mobile drawer overlay */}
      {mobileOpen && (
        <div
          className="fixed inset-0 bg-black/50 z-50 lg:hidden"
          onClick={() => setMobileOpen(false)}
        />
      )}

      {/* Mobile drawer */}
      <div
        className={`fixed top-0 right-0 h-full w-80 bg-white z-50 lg:hidden transform transition-transform duration-300 overflow-y-auto ${
          mobileOpen ? "translate-x-0" : "translate-x-full"
        }`}
      >
        <div className="flex items-center justify-between p-4 border-b border-line">
          <span className="font-semibold text-lg">Menu</span>
          <button
            onClick={() => setMobileOpen(false)}
            className="w-8 h-8 flex items-center justify-center rounded-lg hover:bg-surface transition-colors"
            aria-label="Close menu"
          >
            <i className="bi bi-x-lg text-xl" />
          </button>
        </div>

        <nav className="p-4 space-y-1">
          <Link
            href="/"
            className="block px-3 py-2 rounded-lg hover:bg-surface transition-colors text-sm font-medium"
            onClick={() => setMobileOpen(false)}
          >
            Home
          </Link>
          <Link
            href="/about-us"
            className="block px-3 py-2 rounded-lg hover:bg-surface transition-colors text-sm font-medium"
            onClick={() => setMobileOpen(false)}
          >
            About Us
          </Link>
          <Link
            href="/blog"
            className="block px-3 py-2 rounded-lg hover:bg-surface transition-colors text-sm font-medium"
            onClick={() => setMobileOpen(false)}
          >
            Blog
          </Link>
          <Link
            href="/contact"
            className="block px-3 py-2 rounded-lg hover:bg-surface transition-colors text-sm font-medium"
            onClick={() => setMobileOpen(false)}
          >
            Contact Us
          </Link>
        </nav>
      </div>
    </>
  );
}
