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

const FlagIcon = ({ countryCode, className = "" }: { countryCode: string; className?: string }) => {
  const cleanClassName = className
    .replace(/\b[wh]-\d+(\.\d+)?\b/g, "")
    .replace(/\b[wh]-auto\b/g, "");

  return (
    <img
      src={`https://flagcdn.com/w40/${countryCode.toLowerCase()}.png`}
      srcSet={`https://flagcdn.com/w80/${countryCode.toLowerCase()}.png 2x`}
      alt={countryCode}
      style={{ width: "24px", height: "16px" }}
      className={`shrink-0 object-cover rounded-sm border border-neutral-200/20 ${cleanClassName}`}
      loading="lazy"
    />
  );
};

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
    {
      value: "en",
      label: "English",
      triggerLabel: "EN",
      icon: (props: { className?: string }) => <FlagIcon countryCode="gb" {...props} />,
    },
    {
      value: "hi",
      label: "हिन्दी (Hindi)",
      triggerLabel: "HI",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "es",
      label: "Español",
      triggerLabel: "ES",
      icon: (props: { className?: string }) => <FlagIcon countryCode="es" {...props} />,
    },
    {
      value: "fr",
      label: "Français",
      triggerLabel: "FR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="fr" {...props} />,
    },
    {
      value: "de",
      label: "Deutsch",
      triggerLabel: "DE",
      icon: (props: { className?: string }) => <FlagIcon countryCode="de" {...props} />,
    },
    {
      value: "ar",
      label: "العربية",
      triggerLabel: "AR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="sa" {...props} />,
    },

    // --- GLOBAL ---
    {
      value: "af",
      label: "Afrikaans",
      triggerLabel: "AF",
      icon: (props: { className?: string }) => <FlagIcon countryCode="za" {...props} />,
      divider: true,
    },
    {
      value: "sq",
      label: "Shqip (Albanian)",
      triggerLabel: "SQ",
      icon: (props: { className?: string }) => <FlagIcon countryCode="al" {...props} />,
    },
    {
      value: "am",
      label: "አማርኛ (Amharic)",
      triggerLabel: "AM",
      icon: (props: { className?: string }) => <FlagIcon countryCode="et" {...props} />,
    },
    {
      value: "hy",
      label: "Հայերեն (Armenian)",
      triggerLabel: "HY",
      icon: (props: { className?: string }) => <FlagIcon countryCode="am" {...props} />,
    },
    {
      value: "az",
      label: "Azərbaycanca (Azerbaijani)",
      triggerLabel: "AZ",
      icon: (props: { className?: string }) => <FlagIcon countryCode="az" {...props} />,
    },
    {
      value: "eu",
      label: "Euskara (Basque)",
      triggerLabel: "EU",
      icon: (props: { className?: string }) => <FlagIcon countryCode="es" {...props} />,
    },
    {
      value: "bs",
      label: "Bosanski (Bosnian)",
      triggerLabel: "BS",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ba" {...props} />,
    },
    {
      value: "bg",
      label: "Български (Bulgarian)",
      triggerLabel: "BG",
      icon: (props: { className?: string }) => <FlagIcon countryCode="bg" {...props} />,
    },
    {
      value: "ca",
      label: "Català (Catalan)",
      triggerLabel: "CA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="es" {...props} />,
    },
    {
      value: "zh-CN",
      label: "简体中文 (Chinese Simplified)",
      triggerLabel: "ZH",
      icon: (props: { className?: string }) => <FlagIcon countryCode="cn" {...props} />,
    },
    {
      value: "zh-TW",
      label: "繁體中文 (Chinese Traditional)",
      triggerLabel: "ZH",
      icon: (props: { className?: string }) => <FlagIcon countryCode="tw" {...props} />,
    },
    {
      value: "hr",
      label: "Hrvatski (Croatian)",
      triggerLabel: "HR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="hr" {...props} />,
    },
    {
      value: "cs",
      label: "Čeština (Czech)",
      triggerLabel: "CS",
      icon: (props: { className?: string }) => <FlagIcon countryCode="cz" {...props} />,
    },
    {
      value: "da",
      label: "Dansk (Danish)",
      triggerLabel: "DA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="dk" {...props} />,
    },
    {
      value: "nl",
      label: "Nederlands (Dutch)",
      triggerLabel: "NL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="nl" {...props} />,
    },
    {
      value: "et",
      label: "Eesti (Estonian)",
      triggerLabel: "ET",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ee" {...props} />,
    },
    {
      value: "tl",
      label: "Filipino",
      triggerLabel: "TL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ph" {...props} />,
    },
    {
      value: "fi",
      label: "Suomi (Finnish)",
      triggerLabel: "FI",
      icon: (props: { className?: string }) => <FlagIcon countryCode="fi" {...props} />,
    },
    {
      value: "gl",
      label: "Galego (Galician)",
      triggerLabel: "GL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="es" {...props} />,
    },
    {
      value: "ka",
      label: "ქართული (Georgian)",
      triggerLabel: "KA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ge" {...props} />,
    },
    {
      value: "el",
      label: "Ελληνικά (Greek)",
      triggerLabel: "EL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="gr" {...props} />,
    },
    {
      value: "ha",
      label: "Hausa",
      triggerLabel: "HA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ng" {...props} />,
    },
    {
      value: "haw",
      label: "Hawaiʻi (Hawaiian)",
      triggerLabel: "HAW",
      icon: (props: { className?: string }) => <FlagIcon countryCode="us" {...props} />,
    },
    {
      value: "he",
      label: "עברית (Hebrew)",
      triggerLabel: "HE",
      icon: (props: { className?: string }) => <FlagIcon countryCode="il" {...props} />,
    },
    {
      value: "hu",
      label: "Magyar (Hungarian)",
      triggerLabel: "HU",
      icon: (props: { className?: string }) => <FlagIcon countryCode="hu" {...props} />,
    },
    {
      value: "is",
      label: "Íslenska (Icelandic)",
      triggerLabel: "IS",
      icon: (props: { className?: string }) => <FlagIcon countryCode="is" {...props} />,
    },
    {
      value: "ig",
      label: "Asụsụ Igbo (Igbo)",
      triggerLabel: "IG",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ng" {...props} />,
    },
    {
      value: "id",
      label: "Bahasa Indonesia",
      triggerLabel: "ID",
      icon: (props: { className?: string }) => <FlagIcon countryCode="id" {...props} />,
    },
    {
      value: "ga",
      label: "Gaeilge (Irish)",
      triggerLabel: "GA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ie" {...props} />,
    },
    {
      value: "it",
      label: "Italiano (Italian)",
      triggerLabel: "IT",
      icon: (props: { className?: string }) => <FlagIcon countryCode="it" {...props} />,
    },
    {
      value: "ja",
      label: "日本語 (Japanese)",
      triggerLabel: "JA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="jp" {...props} />,
    },
    {
      value: "kk",
      label: "Қазақ (Kazakh)",
      triggerLabel: "KK",
      icon: (props: { className?: string }) => <FlagIcon countryCode="kz" {...props} />,
    },
    {
      value: "km",
      label: "ភាសាខ្មែរ (Khmer)",
      triggerLabel: "KM",
      icon: (props: { className?: string }) => <FlagIcon countryCode="kh" {...props} />,
    },
    {
      value: "ko",
      label: "한국어 (Korean)",
      triggerLabel: "KO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="kr" {...props} />,
    },
    {
      value: "ky",
      label: "Кыргызча (Kyrgyz)",
      triggerLabel: "KY",
      icon: (props: { className?: string }) => <FlagIcon countryCode="kg" {...props} />,
    },
    {
      value: "lo",
      label: "ລາວ (Lao)",
      triggerLabel: "LO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="la" {...props} />,
    },
    {
      value: "lv",
      label: "Latviešu (Latvian)",
      triggerLabel: "LV",
      icon: (props: { className?: string }) => <FlagIcon countryCode="lv" {...props} />,
    },
    {
      value: "lt",
      label: "Lietuvių (Lithuanian)",
      triggerLabel: "LT",
      icon: (props: { className?: string }) => <FlagIcon countryCode="lt" {...props} />,
    },
    {
      value: "lb",
      label: "Lëtzebuergesch (Luxembourgish)",
      triggerLabel: "LB",
      icon: (props: { className?: string }) => <FlagIcon countryCode="lu" {...props} />,
    },
    {
      value: "mk",
      label: "Македонски (Macedonian)",
      triggerLabel: "MK",
      icon: (props: { className?: string }) => <FlagIcon countryCode="mk" {...props} />,
    },
    {
      value: "mg",
      label: "Malagasy",
      triggerLabel: "MG",
      icon: (props: { className?: string }) => <FlagIcon countryCode="mg" {...props} />,
    },
    {
      value: "ms",
      label: "Bahasa Melayu (Malay)",
      triggerLabel: "MS",
      icon: (props: { className?: string }) => <FlagIcon countryCode="my" {...props} />,
    },
    {
      value: "mt",
      label: "Malti (Maltese)",
      triggerLabel: "MT",
      icon: (props: { className?: string }) => <FlagIcon countryCode="mt" {...props} />,
    },
    {
      value: "mi",
      label: "Māori",
      triggerLabel: "MI",
      icon: (props: { className?: string }) => <FlagIcon countryCode="nz" {...props} />,
    },
    {
      value: "mn",
      label: "Монгол (Mongolian)",
      triggerLabel: "MN",
      icon: (props: { className?: string }) => <FlagIcon countryCode="mn" {...props} />,
    },
    {
      value: "ne",
      label: "नेपाली (Nepali)",
      triggerLabel: "NE",
      icon: (props: { className?: string }) => <FlagIcon countryCode="np" {...props} />,
    },
    {
      value: "no",
      label: "Norsk (Norwegian)",
      triggerLabel: "NO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="no" {...props} />,
    },
    {
      value: "fa",
      label: "فارسی (Persian)",
      triggerLabel: "FA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ir" {...props} />,
    },
    {
      value: "pl",
      label: "Polski (Polish)",
      triggerLabel: "PL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="pl" {...props} />,
    },
    {
      value: "pt",
      label: "Português (Portuguese)",
      triggerLabel: "PT",
      icon: (props: { className?: string }) => <FlagIcon countryCode="pt" {...props} />,
    },
    {
      value: "ro",
      label: "Română (Romanian)",
      triggerLabel: "RO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ro" {...props} />,
    },
    {
      value: "ru",
      label: "Русский (Russian)",
      triggerLabel: "RU",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ru" {...props} />,
    },
    {
      value: "sm",
      label: "Gagana Sāmoa (Samoan)",
      triggerLabel: "SM",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ws" {...props} />,
    },
    {
      value: "sr",
      label: "Српски (Serbian)",
      triggerLabel: "SR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="rs" {...props} />,
    },
    {
      value: "sn",
      label: "ChiShona (Shona)",
      triggerLabel: "SN",
      icon: (props: { className?: string }) => <FlagIcon countryCode="zw" {...props} />,
    },
    {
      value: "si",
      label: "සිංහල (Sinhala)",
      triggerLabel: "SI",
      icon: (props: { className?: string }) => <FlagIcon countryCode="lk" {...props} />,
    },
    {
      value: "sk",
      label: "Slovenčina (Slovak)",
      triggerLabel: "SK",
      icon: (props: { className?: string }) => <FlagIcon countryCode="sk" {...props} />,
    },
    {
      value: "sl",
      label: "Slovenščina (Slovenian)",
      triggerLabel: "SL",
      icon: (props: { className?: string }) => <FlagIcon countryCode="si" {...props} />,
    },
    {
      value: "so",
      label: "Soomaali (Somali)",
      triggerLabel: "SO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="so" {...props} />,
    },
    {
      value: "sw",
      label: "Kiswahili (Swahili)",
      triggerLabel: "SW",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ke" {...props} />,
    },
    {
      value: "sv",
      label: "Svenska (Swedish)",
      triggerLabel: "SV",
      icon: (props: { className?: string }) => <FlagIcon countryCode="se" {...props} />,
    },
    {
      value: "th",
      label: "ภาษาไทย (Thai)",
      triggerLabel: "TH",
      icon: (props: { className?: string }) => <FlagIcon countryCode="th" {...props} />,
    },
    {
      value: "tr",
      label: "Türkçe (Turkish)",
      triggerLabel: "TR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="tr" {...props} />,
    },
    {
      value: "uk",
      label: "Українська (Ukrainian)",
      triggerLabel: "UK",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ua" {...props} />,
    },
    {
      value: "uz",
      label: "Oʻzbekcha (Uzbek)",
      triggerLabel: "UZ",
      icon: (props: { className?: string }) => <FlagIcon countryCode="uz" {...props} />,
    },
    {
      value: "vi",
      label: "Tiếng Việt (Vietnamese)",
      triggerLabel: "VI",
      icon: (props: { className?: string }) => <FlagIcon countryCode="vn" {...props} />,
    },
    {
      value: "cy",
      label: "Cymraeg (Welsh)",
      triggerLabel: "CY",
      icon: (props: { className?: string }) => <FlagIcon countryCode="gb" {...props} />,
    },
    {
      value: "yo",
      label: "Yorùbá (Yoruba)",
      triggerLabel: "YO",
      icon: (props: { className?: string }) => <FlagIcon countryCode="ng" {...props} />,
    },
    {
      value: "zu",
      label: "isiZulu (Zulu)",
      triggerLabel: "ZU",
      icon: (props: { className?: string }) => <FlagIcon countryCode="za" {...props} />,
    },

    // --- REGIONAL INDIAN ---
    {
      value: "bn",
      label: "বাংলা (Bengali)",
      triggerLabel: "BN",
      icon: (props: { className?: string }) => <FlagIcon countryCode="bd" {...props} />,
      divider: true,
    },
    {
      value: "gu",
      label: "ગુજરાતી (Gujarati)",
      triggerLabel: "GU",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "kn",
      label: "ಕನ್ನಡ (Kannada)",
      triggerLabel: "KN",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "ml",
      label: "മലയാളം (Malayalam)",
      triggerLabel: "ML",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "mr",
      label: "मराठी (Marathi)",
      triggerLabel: "MR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "pa",
      label: "ਪੰਜਾਬੀ (Punjabi)",
      triggerLabel: "PA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "ta",
      label: "தமிழ் (Tamil)",
      triggerLabel: "TA",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "te",
      label: "తెలుగు (Telugu)",
      triggerLabel: "TE",
      icon: (props: { className?: string }) => <FlagIcon countryCode="in" {...props} />,
    },
    {
      value: "ur",
      label: "اردو (Urdu)",
      triggerLabel: "UR",
      icon: (props: { className?: string }) => <FlagIcon countryCode="pk" {...props} />,
    },
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
      href: "/destinations/",
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
    { name: "Regions", href: "/regions/" },
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
              className="notranslate"
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
                  className="notranslate"
                />
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}
