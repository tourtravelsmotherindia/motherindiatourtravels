import Link from "next/link";
import { getSiteConfig, getMenu } from "@/lib/data";
import type { MenuItem } from "@/types";

export default function Footer() {
  const siteConfig = getSiteConfig();
  const menuWrapper = getMenu();
  const menuItems: MenuItem[] =
    menuWrapper?.data?.menu_structure || [];

  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-black text-white">
      <div className="max-w-7xl mx-auto px-4 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10">
          {/* Company info */}
          <div>
            <h3 className="text-lg font-semibold mb-4">
              {siteConfig?.site_name || "TravelXploria"}
            </h3>
            <p className="text-secondary2 text-sm leading-relaxed mb-4">
              {siteConfig?.tagline ||
                "Discover curated travel packages across the world's most beautiful destinations"}
            </p>
            <div className="flex items-center gap-3">
              {siteConfig?.facebook && (
                <a
                  href={siteConfig.facebook}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-9 h-9 flex items-center justify-center rounded-full bg-surface2 hover:bg-red transition-colors"
                  aria-label="Facebook"
                >
                  <i className="bi bi-facebook" />
                </a>
              )}
              {siteConfig?.instagram && (
                <a
                  href={siteConfig.instagram}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-9 h-9 flex items-center justify-center rounded-full bg-surface2 hover:bg-red transition-colors"
                  aria-label="Instagram"
                >
                  <i className="bi bi-instagram" />
                </a>
              )}
              {siteConfig?.whatsapp && (
                <a
                  href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-9 h-9 flex items-center justify-center rounded-full bg-surface2 hover:bg-green transition-colors"
                  aria-label="WhatsApp"
                >
                  <i className="bi bi-whatsapp" />
                </a>
              )}
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-lg font-semibold mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/about-us"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  About Us
                </Link>
              </li>
              <li>
                <Link
                  href="/contact"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  Contact
                </Link>
              </li>
              <li>
                <Link
                  href="/blog"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  Blog
                </Link>
              </li>
              <li>
                <Link
                  href="/faq"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  FAQ
                </Link>
              </li>
              <li>
                <Link
                  href="/privacy-policy"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link
                  href="/terms-and-condition"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  Terms & Conditions
                </Link>
              </li>
              <li>
                <Link
                  href="/cancellation-policy"
                  className="text-secondary2 hover:text-white transition-colors text-sm"
                >
                  Cancellation Policy
                </Link>
              </li>
            </ul>
          </div>

          {/* Destinations */}
          {menuItems.length > 0 && (
            <div>
              <h3 className="text-lg font-semibold mb-4">Popular Destinations</h3>
              <ul className="space-y-2">
                {menuItems.slice(0, 8).map((item) => {
                  const href =
                    item.link && item.link !== "#" ? `/${item.link}` : "#";
                  return (
                    <li key={item.id}>
                      <Link
                        href={href}
                        className="text-secondary2 hover:text-white transition-colors text-sm"
                      >
                        {item.title}
                      </Link>
                    </li>
                  );
                })}
              </ul>
            </div>
          )}

          {/* Contact info */}
          <div>
            <h3 className="text-lg font-semibold mb-4">Get In Touch</h3>
            <ul className="space-y-3">
              {siteConfig?.phone && (
                <li>
                  <a
                    href={`tel:${siteConfig.phone}`}
                    className="flex items-center gap-2 text-secondary2 hover:text-white transition-colors text-sm"
                  >
                    <i className="bi bi-telephone-fill" />
                    {siteConfig.phone}
                  </a>
                </li>
              )}
              {siteConfig?.email && (
                <li>
                  <a
                    href={`mailto:${siteConfig.email}`}
                    className="flex items-center gap-2 text-secondary2 hover:text-white transition-colors text-sm"
                  >
                    <i className="bi bi-envelope-fill" />
                    {siteConfig.email}
                  </a>
                </li>
              )}
              {siteConfig?.whatsapp && (
                <li>
                  <a
                    href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center gap-2 text-secondary2 hover:text-white transition-colors text-sm"
                  >
                    <i className="bi bi-whatsapp" />
                    WhatsApp
                  </a>
                </li>
              )}
            </ul>
          </div>
        </div>
      </div>

      {/* Bottom bar */}
      <div className="border-t border-surface2">
        <div className="max-w-7xl mx-auto px-4 py-6 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p className="text-secondary2 text-sm">
            &copy; {currentYear} {siteConfig?.site_name || "TravelXploria"}. All
            rights reserved.
          </p>
          <div className="flex items-center gap-6">
            <Link
              href="/privacy-policy"
              className="text-secondary2 hover:text-white transition-colors text-xs"
            >
              Privacy Policy
            </Link>
            <Link
              href="/terms-and-condition"
              className="text-secondary2 hover:text-white transition-colors text-xs"
            >
              Terms & Conditions
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
