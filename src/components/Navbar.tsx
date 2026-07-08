"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Globe, Menu, X } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";

export default function Navbar() {
  const pathname = usePathname();
  const [isOpen, setIsOpen] = useState(false);
  const [lang] = useState("EN");
  const [scrolled, setScrolled] = useState(false);

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
      className={`fixed left-0 right-0 z-50 px-4 md:px-8 max-w-[1440px] mx-auto transition-all duration-300 ${
        scrolled ? "top-3" : "top-6"
      }`}
    >
      <nav
        className={`rounded-full px-6 transition-all duration-300 flex items-center justify-between border ${
          scrolled
            ? "bg-white/80 backdrop-blur-md py-2.5 shadow-[0_8px_30px_rgba(0,0,0,0.06)] border-border-light/60"
            : "bg-white py-3.5 shadow-[0_8px_30px_rgba(0,0,0,0.06)] border-border-light"
        }`}
      >
        {/* Logo + Brand Name */}
        <Link href="/" className="flex items-center gap-3 group shrink-0">
          <Image
            src="/logo.png?v=234567"
            alt="Mother India Tour Travels Logo"
            width={44}
            height={44}
            className="h-11 w-11 object-contain transition-transform group-hover:scale-103 duration-300"
            priority
          />
          <span className="hidden sm:block font-display text-base lg:text-lg font-extrabold text-foreground tracking-tight leading-none whitespace-nowrap">
            Mother India Tour Travels
          </span>
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
          <button
            type="button"
            className="flex items-center gap-1.5 px-4 py-2 border border-border-light rounded-full text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/30 transition-all duration-200 text-xs font-semibold"
          >
            <Globe className="w-3.5 h-3.5" />
            <span>{lang}</span>
          </button>

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
            className="absolute top-24 left-4 right-4 bg-white rounded-3xl p-6 shadow-[0_8px_30px_rgba(0,0,0,0.06)] border border-border-light flex flex-col gap-4 md:hidden z-40"
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
