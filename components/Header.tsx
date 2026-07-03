import Link from "next/link";
import HeaderClient from "./HeaderClient";
import { getMenu, getSiteConfig } from "@/lib/data";
import type { MenuItem, SiteConfig } from "@/types";

export default function Header() {
  const menuWrapper = getMenu();
  const siteConfig: SiteConfig | null = getSiteConfig();
  const menuItems: MenuItem[] =
    menuWrapper?.data?.menu_structure || [];

  const logoPath = siteConfig?.logo_path || "";
  const phone = siteConfig?.phone || "";

  return (
    <header className="sticky top-0 z-50 bg-white shadow-sm">
      {/* Top bar */}
      <div className="hidden lg:block bg-surface border-b border-line">
        <div className="max-w-7xl mx-auto px-4 py-2 flex items-center justify-between text-sm text-secondary">
          <span>
            {siteConfig?.tagline || "Discover Your Next Adventure"}
          </span>
          <div className="flex items-center gap-4">
            {phone && (
              <a
                href={`tel:${phone}`}
                className="flex items-center gap-1 hover:text-black transition-colors"
              >
                <i className="bi bi-telephone-fill text-xs" />
                {phone}
              </a>
            )}
            {siteConfig?.email && (
              <a
                href={`mailto:${siteConfig.email}`}
                className="flex items-center gap-1 hover:text-black transition-colors"
              >
                <i className="bi bi-envelope-fill text-xs" />
                {siteConfig.email}
              </a>
            )}
          </div>
        </div>
      </div>

      {/* Main nav */}
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex items-center justify-between h-16 lg:h-20">
          {/* Logo */}
          <Link href="/" className="flex-shrink-0">
            <span className="text-2xl font-bold text-black">
              {siteConfig?.site_name || "TravelXploria"}
            </span>
          </Link>

          {/* Desktop Nav */}
          <nav className="hidden lg:flex items-center gap-1">
            {menuItems.map((item) => (
              <div key={item.id} className="relative group">
                <Link
                  href={item.link && item.link !== "#" ? `/${item.link}` : "#"}
                  className="px-3 py-2 text-sm font-medium text-black hover:text-red transition-colors rounded-lg hover:bg-surface whitespace-nowrap flex items-center gap-1"
                >
                  {item.title}
                  {item.submenus?.length > 0 && (
                    <i className="bi bi-chevron-down text-[10px]" />
                  )}
                </Link>

                {/* Dropdown */}
                {item.submenus?.length > 0 && (
                  <div className="absolute top-full left-0 mt-1 bg-white rounded-xl shadow-xl border border-line opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 min-w-[600px] p-6">
                    <div className="grid grid-cols-3 gap-6">
                      {item.submenus.map((sub) => (
                        <div key={sub.id}>
                          <Link
                            href={
                              sub.link && sub.link !== "#"
                                ? `/${sub.link}`
                                : sub.collectionUrl || "#"
                            }
                            className="text-sm font-semibold text-black hover:text-red transition-colors"
                          >
                            {sub.title}
                          </Link>
                          {sub.childMenus?.length > 0 && (
                            <ul className="mt-2 space-y-1">
                              {sub.childMenus.map((child) => (
                                <li key={child.id}>
                                  <Link
                                    href={child.url || "#"}
                                    className="text-sm text-secondary hover:text-black transition-colors"
                                  >
                                    {child.title}
                                  </Link>
                                </li>
                              ))}
                            </ul>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            ))}

            {/* Static links */}
            <Link
              href="/about-us"
              className="px-3 py-2 text-sm font-medium text-black hover:text-red transition-colors rounded-lg hover:bg-surface"
            >
              About Us
            </Link>
            <Link
              href="/blog"
              className="px-3 py-2 text-sm font-medium text-black hover:text-red transition-colors rounded-lg hover:bg-surface"
            >
              Blog
            </Link>
            <Link
              href="/contact"
              className="px-3 py-2 text-sm font-medium text-black hover:text-red transition-colors rounded-lg hover:bg-surface"
            >
              Contact Us
            </Link>
          </nav>

          {/* CTA + Mobile toggle */}
          <div className="flex items-center gap-3">
            {phone && (
              <a
                href={`tel:${phone}`}
                className="hidden lg:inline-flex items-center gap-2 bg-red text-white px-4 py-2 rounded-full text-sm font-medium hover:opacity-90 transition-opacity"
              >
                <i className="bi bi-telephone-fill" />
                {phone}
              </a>
            )}

            {/* Search icon */}
            <button
              className="hidden lg:flex w-10 h-10 items-center justify-center rounded-full hover:bg-surface transition-colors"
              aria-label="Search"
            >
              <i className="bi bi-search text-lg" />
            </button>

            {/* Mobile menu toggle */}
            <HeaderClient />
          </div>
        </div>
      </div>
    </header>
  );
}
