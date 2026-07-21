"use client";

import { AnimatePresence, motion } from "framer-motion";
import { MessageCircle, X } from "lucide-react";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";

import { type CompanyData } from "@/types/company";

interface HelpFloatingButtonProps {
  companyData: CompanyData | null;
}

export default function HelpFloatingButton({ companyData }: HelpFloatingButtonProps) {
  const pathname = usePathname();
  const [isHovered, setIsHovered] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect
    setMounted(true);
  }, []);

  const isVariantPage = pathname ? /^\/packages\/[^/]+\/[^/]+/.test(pathname) : false;

  if (!mounted || !companyData || isVariantPage) return null;

  const rawWhatsapp = companyData.whatsappNumber || "";
  const rawMessenger = companyData.messengerNumber || "";

  // If neither WhatsApp nor Messenger is configured, hide the widget
  if (!rawWhatsapp && !rawMessenger) return null;

  const getWhatsappLink = (num: string) => {
    if (!num) return "";
    if (num.startsWith("http")) return num;
    const cleanNum = num.replace(/[^0-9]/g, "");
    if (cleanNum.length === 10) {
      return `https://wa.me/91${cleanNum}`;
    }
    return `https://wa.me/${cleanNum}`;
  };

  const getMessengerLink = (linkOrNum: string) => {
    if (!linkOrNum) return "";
    if (linkOrNum.startsWith("http")) return linkOrNum;
    return `https://m.me/${linkOrNum}`;
  };

  const whatsappLink = getWhatsappLink(rawWhatsapp);
  const messengerLink = getMessengerLink(rawMessenger);

  const handleMainButtonClick = (e: React.MouseEvent) => {
    // On mobile screens, toggle on click
    if (window.matchMedia("(max-width: 768px)").matches) {
      e.preventDefault();
      setIsHovered((prev) => !prev);
    }
  };

  return (
    <div
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
      className="fixed bottom-6 right-6 z-50 flex flex-col items-end select-none pointer-events-auto"
    >
      <AnimatePresence>
        {isHovered && (
          <motion.div
            initial={{ opacity: 0, y: 15, scale: 0.85 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 15, scale: 0.85 }}
            transition={{ duration: 0.22, ease: "easeOut" }}
            className="flex flex-col items-end gap-3 mb-4 pr-1"
          >
            {/* Messenger Button */}
            {messengerLink && (
              <a
                href={messengerLink}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2.5 group cursor-pointer"
              >
                <span className="bg-white text-neutral-800 text-[11px] font-semibold px-2.5 py-1.5 rounded-xl border border-neutral-100 shadow-premium opacity-0 scale-95 group-hover:opacity-100 group-hover:scale-100 md:group-hover:opacity-100 transition-all duration-200 pointer-events-none select-none">
                  Messenger
                </span>
                <div className="w-11 h-11 bg-[#0084FF] hover:bg-[#0074E4] text-white rounded-full flex items-center justify-center shadow-lg hover:scale-105 active:scale-95 transition-all duration-200">
                  <svg className="w-5 h-5" viewBox="0 0 16 16" fill="currentColor">
                    <title>Messenger</title>
                    <path d="M0 7.76C0 3.301 3.493 0 8 0s8 3.301 8 7.76-3.493 7.76-8 7.76c-.81 0-1.586-.107-2.316-.307a.64.64 0 0 0-.427.03l-1.588.702a.64.64 0 0 1-.898-.566l-.044-1.423a.64.64 0 0 0-.215-.456C.956 12.108 0 10.092 0 7.76m5.546-1.459-2.35 3.728c-.225.358.214.761.551.506l2.525-1.916a.48.48 0 0 1 .578-.002l1.869 1.402a1.2 1.2 0 0 0 1.735-.32l2.35-3.728c.226-.358-.214-.761-.551-.506L9.728 7.381a.48.48 0 0 1-.578.002L7.281 5.98a1.2 1.2 0 0 0-1.735.32z" />
                  </svg>
                </div>
              </a>
            )}

            {/* WhatsApp Button */}
            {whatsappLink && (
              <a
                href={whatsappLink}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2.5 group cursor-pointer"
              >
                <span className="bg-white text-neutral-800 text-[11px] font-semibold px-2.5 py-1.5 rounded-xl border border-neutral-100 shadow-premium opacity-0 scale-95 group-hover:opacity-100 group-hover:scale-100 md:group-hover:opacity-100 transition-all duration-200 pointer-events-none select-none">
                  WhatsApp
                </span>
                <div className="w-11 h-11 bg-[#25D366] hover:bg-[#20ba56] text-white rounded-full flex items-center justify-center shadow-lg hover:scale-105 active:scale-95 transition-all duration-200">
                  <svg className="w-5.5 h-5.5" viewBox="0 0 24 24" fill="currentColor">
                    <title>WhatsApp</title>
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L0 24l6.335-1.662c1.746.953 3.71 1.458 5.704 1.459h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" />
                  </svg>
                </div>
              </a>
            )}
          </motion.div>
        )}
      </AnimatePresence>

      {/* Main Action Button */}
      <button
        type="button"
        onClick={handleMainButtonClick}
        className="w-13 h-13 bg-brand text-white hover:bg-brand-hover rounded-full flex items-center justify-center shadow-premium cursor-pointer transition-all duration-300 relative group animate-none"
        aria-label="Toggle contact help widget"
      >
        {/* Subtle pulsing background ring */}
        <div className="absolute inset-0 rounded-full bg-brand/35 animate-ping -z-10 group-hover:bg-brand-hover/40" />

        <motion.div
          animate={{ rotate: isHovered ? 90 : 0 }}
          transition={{ duration: 0.22, ease: "easeInOut" }}
        >
          {isHovered ? <X className="w-5.5 h-5.5" /> : <MessageCircle className="w-5.5 h-5.5" />}
        </motion.div>
      </button>
    </div>
  );
}
