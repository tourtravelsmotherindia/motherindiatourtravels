"use client";

import React, { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Globe, Menu, X } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const [lang] = useState("EN");

  const toggleMenu = () => setIsOpen(!isOpen);

  const navLinks = [
    { name: "Home", href: "#" },
    { name: "Trips", href: "#trips" },
    { name: "About", href: "#about" },
    { name: "Blog", href: "#blog" },
    { name: "Contact", href: "#contact" },
  ];

  return (
    <header className="absolute top-6 left-0 right-0 z-50 px-4 md:px-8 max-w-[1440px] mx-auto">
      <nav className="bg-white rounded-full px-6 py-3.5 shadow-premium flex items-center justify-between border border-border-light">
        {/* Logo */}
        <Link href="/" className="flex items-center gap-2 group">
          <Image
            src="/logo.png?v=234567"
            alt="Mother India Tour Travels Logo"
            width={120}
            height={44}
            className="h-11 w-auto object-contain transition-transform group-hover:scale-103 duration-300"
            priority
          />
        </Link>

        {/* Desktop Nav Links */}
        <div className="hidden md:flex items-center gap-8">
          {navLinks.map((link) => (
            <Link
              key={link.name}
              href={link.href}
              className="text-foreground hover:text-brand font-medium text-sm transition-colors duration-200"
            >
              {link.name}
            </Link>
          ))}
        </div>

        {/* Right Side: Language & Mobile Toggle */}
        <div className="flex items-center gap-4">
          <button className="flex items-center gap-1.5 px-4 py-2 border border-border-light rounded-full text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/30 transition-all duration-200 text-xs font-semibold">
            <Globe className="w-3.5 h-3.5" />
            <span>{lang}</span>
          </button>

          <button
            onClick={toggleMenu}
            className="md:hidden p-2 text-foreground hover:text-brand hover:bg-brand-light rounded-full transition-colors duration-200"
            aria-label="Toggle menu"
          >
            {isOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </nav>

      {/* Mobile Nav Overlay */}
      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.2 }}
            className="absolute top-24 left-4 right-4 bg-white rounded-3xl p-6 shadow-premium border border-border-light flex flex-col gap-4 md:hidden z-40"
          >
            <div className="flex flex-col gap-3">
              {navLinks.map((link) => (
                <Link
                  key={link.name}
                  href={link.href}
                  onClick={() => setIsOpen(false)}
                  className="text-foreground hover:text-brand font-medium text-base py-2 px-3 hover:bg-brand-light rounded-xl transition-all duration-200"
                >
                  {link.name}
                </Link>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}
