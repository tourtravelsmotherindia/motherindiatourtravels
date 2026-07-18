"use client";

import { AnimatePresence, motion } from "framer-motion";
import { ChevronDown, Globe, Menu, Search, X } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";

import { getActiveLanguage, triggerTranslation } from "@/components/layout/TranslationScript";
import Dropdown from "@/components/ui/Dropdown";

interface SubmenuItem {
  name: string;
  href: string;
}

interface SubmenuSection {
  title: string;
  items: SubmenuItem[];
}

interface DestinationSubmenu {
  type: "destinations";
  sections: SubmenuSection[];
}

interface ThemeSubmenu {
  type: "themes";
  items: SubmenuItem[];
}

interface NavLink {
  name: string;
  href: string;
  submenu?: DestinationSubmenu | ThemeSubmenu;
}

export default function Navbar({ transparent = false }: { transparent?: boolean }) {
  const pathname = usePathname();
  const [isOpen, setIsOpen] = useState(false);
  const [lang, setLang] = useState("en");
  const [scrolled, setScrolled] = useState(false);
  const [mobileSubmenuOpen, setMobileSubmenuOpen] = useState<string | null>(null);

  // Synchronize language state on client mount to avoid Next.js hydration mismatches
  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect
    setLang(getActiveLanguage());
  }, []);

  const handleLanguageChange = (val: string) => {
    setLang(val);
    triggerTranslation(val);
  };

  const languageOptions = [
    // --- POPULAR ---
    { value: "en", label: "English", triggerLabel: "EN", icon: Globe },
    { value: "es", label: "Español (Spanish)", triggerLabel: "ES", icon: Globe },
    { value: "fr", label: "Français (French)", triggerLabel: "FR", icon: Globe },
    { value: "de", label: "Deutsch (German)", triggerLabel: "DE", icon: Globe },
    { value: "hi", label: "हिन्दी (Hindi)", triggerLabel: "HI", icon: Globe },
    { value: "ar", label: "العربية (Arabic)", triggerLabel: "AR", icon: Globe },

    // --- GLOBAL ---
    { value: "nl", label: "Nederlands (Dutch)", triggerLabel: "NL", icon: Globe, divider: true },
    { value: "zh-CN", label: "中文 (Chinese)", triggerLabel: "ZH", icon: Globe },
    { value: "it", label: "Italiano (Italian)", triggerLabel: "IT", icon: Globe },
    { value: "ja", label: "日本語 (Japanese)", triggerLabel: "JA", icon: Globe },
    { value: "ko", label: "한국어 (Korean)", triggerLabel: "KO", icon: Globe },
    { value: "pl", label: "Polski (Polish)", triggerLabel: "PL", icon: Globe },
    { value: "pt", label: "Português (Portuguese)", triggerLabel: "PT", icon: Globe },
    { value: "ru", label: "Русский (Russian)", triggerLabel: "RU", icon: Globe },
    { value: "sv", label: "Svenska (Swedish)", triggerLabel: "SV", icon: Globe },
    { value: "tr", label: "Türkçe (Turkish)", triggerLabel: "TR", icon: Globe },
    { value: "vi", label: "Tiếng Việt (Vietnamese)", triggerLabel: "VI", icon: Globe },
    { value: "th", label: "ภาษาไทย (Thai)", triggerLabel: "TH", icon: Globe },
    { value: "id", label: "Bahasa Indonesia", triggerLabel: "ID", icon: Globe },
    { value: "he", label: "עברית (Hebrew)", triggerLabel: "HE", icon: Globe },

    // --- REGIONAL ---
    { value: "bn", label: "বাংলা (Bengali)", triggerLabel: "BN", icon: Globe, divider: true },
    { value: "gu", label: "ગુજરાતી (Gujarati)", triggerLabel: "GU", icon: Globe },
    { value: "kn", label: "ಕನ್ನಡ (Kannada)", triggerLabel: "KN", icon: Globe },
    { value: "ml", label: "മലയാളം (Malayalam)", triggerLabel: "ML", icon: Globe },
    { value: "mr", label: "मराठी (Marathi)", triggerLabel: "MR", icon: Globe },
    { value: "pa", label: "ਪੰਜਾਬੀ (Punjabi)", triggerLabel: "PA", icon: Globe },
    { value: "ta", label: "தமிழ் (Tamil)", triggerLabel: "TA", icon: Globe },
    { value: "te", label: "తెలుగు (Telugu)", triggerLabel: "TE", icon: Globe },
    { value: "ur", label: "اردו (Urdu)", triggerLabel: "UR", icon: Globe },
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

  const toggleMenu = () => {
    setIsOpen(!isOpen);
    // Collapsing mobile submenus when the top-level drawer is toggled prevents
    // stale open submenus appearing the next time the drawer opens.
    setMobileSubmenuOpen(null);
  };

  const toggleMobileSubmenu = (name: string) => {
    setMobileSubmenuOpen(mobileSubmenuOpen === name ? null : name);
  };

  const isHome = pathname === "/";
  const isTransparentPage = isHome || transparent;

  const getHref = (href: string) => {
    if (href.startsWith("#")) {
      return isHome ? href : `/${href}`;
    }
    return href;
  };

  const navLinks: NavLink[] = [
    { name: "Home", href: "#home" },
    { name: "About", href: "/about" },
    {
      name: "Destinations",
      href: "/packages",
      submenu: {
        type: "destinations",
        sections: [
          {
            title: "Domestic Tours",
            items: [
              { name: "Kerala Backwaters", href: "/packages?search=Kerala" },
              { name: "Goa Beaches", href: "/packages?search=Goa" },
              { name: "Himachal Hills", href: "/packages?search=Himachal" },
              { name: "Rajasthan Deserts", href: "/packages?search=Jaipur" },
              { name: "Kashmir Valley", href: "/packages?search=Srinagar" },
              { name: "Uttarakhand Sights", href: "/packages?search=Rishikesh" },
            ],
          },
          {
            title: "International Tours",
            items: [
              { name: "Nepal Himalayas", href: "/packages?search=Kathmandu" },
              { name: "Thailand Beaches", href: "/packages?search=Bangkok" },
              { name: "Dubai & UAE Luxury", href: "/packages?search=Dubai" },
              { name: "Malaysia Escape", href: "/packages?search=Kuala" },
            ],
          },
        ],
      },
    },
    {
      name: "Trip Themes",
      href: "/packages",
      submenu: {
        type: "themes",
        items: [
          { name: "Honeymoon Special", href: "/packages?category=honeymoon-tour-packages" },
          { name: "Beach Getaways", href: "/packages?category=beach-tour-packages" },
          { name: "Luxury Tours", href: "/packages?category=luxury-tour-packages" },
          { name: "Spiritual Journeys", href: "/packages?category=spiritual-tour-packages" },
          { name: "Wildlife & Nature", href: "/packages?category=wildlife-tour-packages" },
          { name: "Budget Travel", href: "/packages?category=budget-tour-packages" },
          { name: "Weekend Trips", href: "/packages?category=weekend-tour-packages" },
        ],
      },
    },
    { name: "Packages", href: "/packages" },
    { name: "Blog", href: "#blog" },
    { name: "Gallery", href: "#gallery" },
    { name: "Contact", href: "/contact" },
  ];

  return (
    <header
      className={`fixed left-0 right-0 z-50 transition-all duration-500 ${
        scrolled || !isTransparentPage
          ? "top-3 md:top-4 layout-container"
          : "top-0 w-full px-6 md:px-12 lg:px-24 bg-gradient-to-b from-black/40 to-transparent"
      }`}
    >
      <nav
        className={`transition-all duration-500 flex items-center justify-between ${
          scrolled || !isTransparentPage
            ? "rounded-full px-6 bg-white/85 backdrop-blur-md py-2.5 shadow-premium border border-border-light/60"
            : "rounded-none px-0 bg-transparent py-6 border-none shadow-none"
        }`}
      >
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
          <div className="flex flex-col notranslate">
            <span
              className={`block font-display text-[10px] sm:text-xs lg:text-sm font-bold tracking-[0.18em] uppercase leading-none transition-colors duration-300 ${
                !scrolled && isTransparentPage ? "text-white" : "text-foreground"
              }`}
            >
              Mother India
            </span>
            <span
              className={`block font-sans text-[7px] sm:text-[8px] lg:text-[9px] font-semibold tracking-[0.25em] uppercase leading-none mt-1 transition-colors duration-300 ${
                !scrolled && isTransparentPage ? "text-white/70" : "text-muted"
              }`}
            >
              Tour Travels
            </span>
          </div>
        </Link>

        <div className="hidden md:flex items-center gap-6 lg:gap-8">
          {navLinks.map((link) => {
            if (link.submenu) {
              return (
                <div key={link.name} className="relative group py-2">
                  <button
                    className={`flex items-center gap-1.5 font-semibold text-sm transition-colors duration-200 cursor-pointer select-none ${
                      !scrolled && isTransparentPage
                        ? "text-white hover:text-white/70"
                        : "text-foreground hover:text-brand"
                    }`}
                  >
                    <span>{link.name}</span>
                    <ChevronDown
                      className={`w-3.5 h-3.5 transition-transform duration-200 group-hover:rotate-180 ${
                        !scrolled && isTransparentPage
                          ? "text-white/60 group-hover:text-white"
                          : "text-neutral-400 group-hover:text-brand"
                      }`}
                    />
                  </button>
                  <div className="absolute top-full left-1/2 -translate-x-1/2 pt-2.5 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 pointer-events-none group-hover:pointer-events-auto z-50">
                    <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
                      {link.submenu.type === "destinations" ? (
                        <div className="grid grid-cols-2 gap-8 w-[460px]">
                          {link.submenu.sections.map((section) => (
                            <div key={section.title} className="flex flex-col">
                              <h4 className="text-[10px] font-bold uppercase tracking-wider text-muted mb-3.5 pb-1 border-b border-border-light">
                                {section.title}
                              </h4>
                              <div className="flex flex-col gap-2">
                                {section.items.map((item) => (
                                  <Link
                                    key={item.name}
                                    href={item.href}
                                    className="text-foreground hover:text-brand text-xs font-semibold transition-colors duration-150 py-0.5"
                                  >
                                    {item.name}
                                  </Link>
                                ))}
                              </div>
                            </div>
                          ))}
                        </div>
                      ) : (
                        <div className="flex flex-col w-[200px]">
                          <h4 className="text-[10px] font-bold uppercase tracking-wider text-muted mb-3.5 pb-1 border-b border-border-light">
                            Explore by Category
                          </h4>
                          <div className="flex flex-col gap-2">
                            {link.submenu.items.map((item) => (
                              <Link
                                key={item.name}
                                href={item.href}
                                className="text-foreground hover:text-brand text-xs font-semibold transition-colors duration-150 py-0.5"
                              >
                                {item.name}
                              </Link>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              );
            }

            return (
              <Link
                key={link.name}
                href={getHref(link.href)}
                className={`font-semibold text-sm transition-colors duration-200 ${
                  !scrolled && isTransparentPage
                    ? "text-white hover:text-white/70"
                    : "text-foreground hover:text-brand"
                }`}
              >
                {link.name}
              </Link>
            );
          })}
        </div>

        <div className="flex items-center gap-2 sm:gap-4">
          <Link
            href="/search"
            className={`p-2 sm:p-2.5 rounded-full border transition-all duration-300 flex items-center justify-center cursor-pointer ${
              !scrolled && isTransparentPage
                ? "border-white/20 text-white hover:bg-white/10 hover:border-white/40"
                : "border-border-light text-foreground hover:bg-neutral-50 hover:text-brand hover:border-brand/30"
            }`}
            aria-label="Search"
          >
            <Search className="w-4 h-4 sm:w-4.5 sm:h-4.5" />
          </Link>

          <div className="hidden md:block">
            <Dropdown
              options={languageOptions}
              value={lang}
              onChange={(val) => handleLanguageChange(val)}
              align="right"
              triggerClassName={`px-4 py-2 border transition-all duration-200 text-xs font-semibold w-auto shadow-none bg-transparent ${
                !scrolled && isTransparentPage
                  ? "border-white/20 text-white hover:bg-white/10 hover:border-white/40"
                  : "border-border-light text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/30"
              }`}
              menuClassName="w-64 max-h-[300px] overflow-y-auto rounded-2xl p-1"
              icon={Globe}
            />
          </div>

          <button
            type="button"
            onClick={toggleMenu}
            className={`md:hidden p-2 rounded-full transition-colors duration-200 ${
              !scrolled && isTransparentPage
                ? "text-white hover:text-white/80 hover:bg-white/10"
                : "text-foreground hover:text-brand hover:bg-brand-light"
            }`}
            aria-label="Toggle menu"
          >
            {isOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </nav>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.2 }}
            className="absolute top-24 left-4 right-4 bg-white rounded-2xl p-5 shadow-premium border border-border-light flex flex-col gap-4 md:hidden z-40 max-h-[80vh] overflow-y-auto dropdown-scrollbar"
          >
            <div className="flex flex-col gap-2">
              {navLinks.map((link) => {
                if (link.submenu) {
                  const isSubmenuOpen = mobileSubmenuOpen === link.name;
                  return (
                    <div key={link.name} className="flex flex-col">
                      <button
                        onClick={() => toggleMobileSubmenu(link.name)}
                        className="flex items-center justify-between text-foreground hover:text-brand font-semibold text-sm py-2.5 px-3 hover:bg-brand-light rounded-xl transition-all duration-200 w-full text-left"
                      >
                        <span>{link.name}</span>
                        <ChevronDown
                          className={`w-4 h-4 text-neutral-400 transition-transform duration-200 ${
                            isSubmenuOpen ? "rotate-180" : ""
                          }`}
                        />
                      </button>

                      <AnimatePresence>
                        {isSubmenuOpen && (
                          <motion.div
                            initial={{ height: 0, opacity: 0 }}
                            animate={{ height: "auto", opacity: 1 }}
                            exit={{ height: 0, opacity: 0 }}
                            transition={{ duration: 0.2 }}
                            className="overflow-hidden pl-4 flex flex-col gap-2 mt-1 border-l border-neutral-100 ml-4.5"
                          >
                            {link.submenu.type === "destinations" ? (
                              link.submenu.sections.map((section) => (
                                <div key={section.title} className="flex flex-col gap-1.5 mt-2">
                                  <span className="text-[9px] font-bold uppercase tracking-wider text-muted px-2">
                                    {section.title}
                                  </span>
                                  {section.items.map((item) => (
                                    <Link
                                      key={item.name}
                                      href={item.href}
                                      onClick={() => setIsOpen(false)}
                                      className="text-foreground hover:text-brand text-xs font-semibold py-1.5 px-2 hover:bg-brand-light rounded-lg transition-all duration-200"
                                    >
                                      {item.name}
                                    </Link>
                                  ))}
                                </div>
                              ))
                            ) : (
                              <div className="flex flex-col gap-1.5 mt-2">
                                <span className="text-[9px] font-bold uppercase tracking-wider text-muted px-2">
                                  Explore by Theme
                                </span>
                                {link.submenu.items.map((item) => (
                                  <Link
                                    key={item.name}
                                    href={item.href}
                                    onClick={() => setIsOpen(false)}
                                    className="text-foreground hover:text-brand text-xs font-semibold py-1.5 px-2 hover:bg-brand-light rounded-lg transition-all duration-200"
                                  >
                                    {item.name}
                                  </Link>
                                ))}
                              </div>
                            )}
                          </motion.div>
                        )}
                      </AnimatePresence>
                    </div>
                  );
                }

                return (
                  <Link
                    key={link.name}
                    href={getHref(link.href)}
                    onClick={() => setIsOpen(false)}
                    className="text-foreground hover:text-brand font-semibold text-sm py-2.5 px-3 hover:bg-brand-light rounded-xl transition-all duration-200"
                  >
                    {link.name}
                  </Link>
                );
              })}

              <div className="border-t border-border-light pt-4 mt-2 px-3 flex flex-col gap-2">
                <span className="text-[10px] font-bold uppercase tracking-wider text-muted mb-1">
                  Select Language
                </span>
                <Dropdown
                  options={languageOptions}
                  value={lang}
                  onChange={(val) => handleLanguageChange(val)}
                  align="left"
                  triggerClassName="px-4 py-2.5 border border-border-light rounded-full text-foreground hover:bg-brand-light hover:text-brand hover:border-brand/30 transition-all duration-200 text-xs font-semibold w-full shadow-none bg-transparent flex items-center justify-between"
                  menuClassName="w-full max-h-[250px] overflow-y-auto rounded-2xl p-1"
                  icon={Globe}
                />
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}
