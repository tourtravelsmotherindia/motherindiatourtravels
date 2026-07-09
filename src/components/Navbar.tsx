"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Globe, Menu, X } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";

import Dropdown from "@/components/Dropdown";

export default function Navbar() {
  const pathname = usePathname();
  const [isOpen, setIsOpen] = useState(false);
  const [lang, setLang] = useState("EN");
  const [scrolled, setScrolled] = useState(false);

  const languageOptions = [
    { value: "EN", label: "EN", icon: Globe },
    { value: "HI", label: "HI", icon: Globe },
    { value: "ES", label: "ES", icon: Globe },
    { value: "FR", label: "FR", icon: Globe },
  ];

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 20) {
        setScrolled(true);
      } else {
        setScrolled(false);
      }
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const toggleMenu = () => setIsOpen(!isOpen);

  const isHome = pathname === "/";

  const getHref = (href: string) => {
    if (href.startsWith("#")) {
      return isHome ? href : `/${href}`;
    }
    return href;
  };

  const navLinks = [
    { name: "Home", href: "#home" },
    { name: "About", href: "#about" },
    { name: "Packages", href: "/packages" },
    { name: "Blog", href: "#blog" },
    { name: "FAQ", href: "#faq" },
    { name: "Gallery", href: "#gallery" },
    { name: "Contact", href: "#contact" },
  ];

  return (
    <header
      className={`fixed left-0 right-0 z-50 layout-container transition-all duration-300 ${
        scrolled ? "top-3" : "top-6"
      }`}
    >
      <nav
        className={`rounded-full px-6 transition-all duration-300 flex items-center justify-between border ${
          scrolled
             ? "bg-white/80 backdrop-blur-md py-2.5 shadow-premium border-border-light/60"
             : "bg-white py-3.5 shadow-premium border-border-light"
        }`}
      >
        {/* Logo + Brand Name */}
        <Link href="/" className="flex items-center gap-3 group shrink-0 select-none">
          <div className="relative transition-transform group-hover:scale-105 duration-300 shrink-0">
            <Image
              src="/logo.png?v=234567"
              alt="Mother India Tour Travels Logo"
              width={38}
              height={38}
              className="h-9.5 w-9.5 object-contain"
              priority
            />
          </div>
          <div className="flex flex-col">
            <span className="hidden sm:block font-display text-xs lg:text-sm font-bold text-foreground tracking-[0.18em] uppercase leading-none">
              Mother India
            </span>
            <span className="hidden sm:block font-sans text-[8px] lg:text-[9px] font-semibold text-muted tracking-[0.25em] uppercase leading-none mt-1">
              Tour Travels
            </span>
          </div>
        </Link>

        {/* Desktop Nav Links */}
        <div className="hidden md:flex items-center gap-6 lg:gap-8">
          {navLinks.map((link) => (
            <Link
              key={link.name}
              href={getHref(link.href)}
              className="text-foreground hover:text-brand font-semibold text-sm transition-colors duration-200"
            >
              {link.name}
            </Link>
          ))}
        </div>

        {/* Right Side: Language & Mobile Toggle */}
        <div className="flex items-center gap-4">
          <Dropdown
            options={languageOptions}
            value={lang}
            onChange={(val) => setLang(val)}
            align="right"
            triggerClassName="px-4 py-2 border border-border-light rounded-full text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/30 transition-all duration-200 text-xs font-semibold w-auto shadow-none bg-transparent"
            menuClassName="w-28 rounded-2xl p-1"
            icon={Globe}
          />

          <button
            type="button"
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
            className="absolute top-24 left-4 right-4 bg-white rounded-2xl p-6 shadow-premium border border-border-light flex flex-col gap-4 md:hidden z-40"
          >
            <div className="flex flex-col gap-3">
              {navLinks.map((link) => (
                <Link
                  key={link.name}
                  href={getHref(link.href)}
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
