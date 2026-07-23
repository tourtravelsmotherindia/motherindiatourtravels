import { Metadata } from "next";
import Link from "next/link";

import PageShell from "@/components/layout/PageShell";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations } from "@/lib/db/repositories/destinationRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

export const dynamic = "force-static";

export const metadata: Metadata = {
  title: "Sitemap | Mother India Tour Travels",
  description:
    "Browse our comprehensive index of travel routes, package variations, geographical regions, and operational guidelines.",
  alternates: {
    canonical: "/sitemap/",
  },
};

export default async function SitemapPage() {
  const [packages, destinations, companyData] = await Promise.all([
    getAllPackages(),
    getAllDestinations(),
    getCompanyData(),
  ]);

  // Display top 8 destinations & packages
  const popularDestinations = destinations.slice(0, 8);
  const popularPackages = packages.slice(0, 8);

  const regionLinks = [
    { name: "North India", href: "/regions/" },
    { name: "South India", href: "/regions/" },
    { name: "West India", href: "/regions/" },
    { name: "East India", href: "/regions/" },
    { name: "Central India", href: "/regions/" },
    { name: "Northeast India", href: "/regions/" },
    { name: "View All Regions", href: "/regions/", isBold: true },
  ];

  const companyLinks = [
    { name: "About Us", href: "/about/" },
    { name: "Contact Us", href: "/contact/" },
    { name: "Frequently Asked Questions", href: "/faqs/" },
  ];

  const supportLinks = [
    {
      name: "WhatsApp Inquiry",
      href: companyData?.whatsappNumber
        ? `https://wa.me/${companyData.whatsappNumber.replace(/[^0-9]/g, "")}`
        : "https://wa.me/919999042456",
    },
    { name: "Contact Support", href: "/contact/" },
    { name: "Traveler Reviews", href: "/#testimonials" },
  ];

  const policyLinks = [
    { name: "Cancellation & Refund", href: "/cancellation-policy/" },
    { name: "Privacy Policy", href: "/privacy-policy/" },
    { name: "Terms of Service", href: "/terms-of-service/" },
    { name: "Cookie Policy", href: "/cookie-policy/" },
  ];

  return (
    <PageShell companyData={companyData}>
      <div className="layout-container py-16 md:py-24 font-sans text-neutral-800 bg-white min-h-[60vh]">
        {/* Title */}
        <h1 className="text-4xl md:text-5xl font-display font-semibold text-neutral-900 tracking-tight mb-16">
          Sitemap
        </h1>

        {/* Link Grid */}
        <div className="space-y-16">
          {/* Row 1 */}
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-x-8 gap-y-12">
            {/* Column 1: Destinations */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Destinations
              </h2>
              <ul className="space-y-3.5">
                {popularDestinations.map((d) => (
                  <li key={d.slug}>
                    <Link
                      href={`/destinations/${d.slug}/`}
                      className="text-neutral-500 hover:text-brand transition-colors duration-200 text-[15px]"
                    >
                      {d.name}
                    </Link>
                  </li>
                ))}
                <li>
                  <Link
                    href="/destinations/"
                    className="text-neutral-900 font-semibold hover:text-brand transition-colors duration-200 text-[15px]"
                  >
                    View All Destinations
                  </Link>
                </li>
              </ul>
            </div>

            {/* Column 2: Tour Packages */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Tour Packages
              </h2>
              <ul className="space-y-3.5">
                {popularPackages.map((p) => (
                  <li key={p.slug}>
                    <Link
                      href={`/packages/${p.slug}/`}
                      className="text-neutral-500 hover:text-brand transition-colors duration-200 text-[15px]"
                    >
                      {p.name}
                    </Link>
                  </li>
                ))}
                <li>
                  <Link
                    href="/packages/"
                    className="text-neutral-900 font-semibold hover:text-brand transition-colors duration-200 text-[15px]"
                  >
                    View All Packages
                  </Link>
                </li>
              </ul>
            </div>

            {/* Column 3: Regions */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Regions
              </h2>
              <ul className="space-y-3.5">
                {regionLinks.map((link, idx) => (
                  <li key={idx}>
                    <Link
                      href={link.href}
                      className={`${
                        link.isBold ? "text-neutral-900 font-semibold" : "text-neutral-500"
                      } hover:text-brand transition-colors duration-200 text-[15px]`}
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Column 4: Company */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Company
              </h2>
              <ul className="space-y-3.5">
                {companyLinks.map((link, idx) => (
                  <li key={idx}>
                    <Link
                      href={link.href}
                      className="text-neutral-500 hover:text-brand transition-colors duration-200 text-[15px]"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Row 2 */}
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-x-8 gap-y-12">
            {/* Column 5: Support */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Support
              </h2>
              <ul className="space-y-3.5">
                {supportLinks.map((link, idx) => (
                  <li key={idx}>
                    <Link
                      href={link.href}
                      className="text-neutral-500 hover:text-brand transition-colors duration-200 text-[15px]"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Column 6: Policies */}
            <div>
              <h2 className="text-base font-semibold text-neutral-900 tracking-wide uppercase mb-6">
                Policies
              </h2>
              <ul className="space-y-3.5">
                {policyLinks.map((link, idx) => (
                  <li key={idx}>
                    <Link
                      href={link.href}
                      className="text-neutral-500 hover:text-brand transition-colors duration-200 text-[15px]"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
