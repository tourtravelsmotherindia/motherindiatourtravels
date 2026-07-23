import { Compass, FileText, MapPin, ShieldCheck } from "lucide-react";
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

  const coreLinks = [
    { name: "Home", href: "/", desc: "Welcome to Mother India Tour Travels" },
    { name: "About Us", href: "/about/", desc: "Our history, mission, and travel expertise" },
    {
      name: "Tour Packages",
      href: "/packages/",
      desc: "Explore customized domestic & international tours",
    },
    {
      name: "Travel Destinations",
      href: "/destinations/",
      desc: "Browse beautiful places across India",
    },
    { name: "Regions Grid", href: "/regions/", desc: "Tour plans grouped by geographic regions" },
    { name: "FAQs", href: "/faqs/", desc: "Frequently asked booking & cancellation questions" },
    {
      name: "Contact Us",
      href: "/contact/",
      desc: "Get in touch for custom travel booking quotes",
    },
  ];

  const policyLinks = [
    {
      name: "Cancellation & Refund Policy",
      href: "/cancellation-policy/",
      desc: "Booking cancellation charges & timelines",
    },
    {
      name: "Privacy Policy",
      href: "/privacy-policy/",
      desc: "How we collect, secure, and handle your data",
    },
    {
      name: "Terms of Service",
      href: "/terms-of-service/",
      desc: "Standard terms and user agreements",
    },
    {
      name: "Cookie Policy",
      href: "/cookie-policy/",
      desc: "Details on cookies and analytics tracking",
    },
  ];

  return (
    <PageShell companyData={companyData}>
      <div className="layout-container py-12 md:py-20 font-sans">
        {/* Header */}
        <div className="max-w-3xl mb-12 md:mb-16">
          <span className="text-brand font-display font-bold text-sm tracking-wider uppercase bg-brand-light px-3 py-1 rounded-full">
            Directory
          </span>
          <h1 className="text-4xl md:text-5xl font-display font-bold text-foreground mt-4 mb-6">
            HTML Sitemap
          </h1>
          <p className="text-muted text-lg leading-relaxed">
            Browse our comprehensive index of travel routes, package variations, geographical
            regions, and operational guidelines. Click any link to navigate directly.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12">
          {/* Column Left */}
          <div className="space-y-12">
            {/* Section: Core Pages */}
            <section className="bg-white border border-border-light rounded-2xl p-6 md:p-8 shadow-premium hover:shadow-lg transition-all duration-300">
              <div className="flex items-center gap-3 mb-6 pb-4 border-b border-border-light">
                <Compass className="text-brand w-6 h-6" />
                <h2 className="text-xl md:text-2xl font-display font-bold text-foreground">
                  Core Pages
                </h2>
              </div>
              <ul className="space-y-4">
                {coreLinks.map((link) => (
                  <li key={link.href} className="group">
                    <Link href={link.href} className="block">
                      <div className="flex items-start justify-between">
                        <div>
                          <span className="text-foreground font-semibold group-hover:text-brand transition-colors duration-200 block text-base md:text-lg">
                            {link.name}
                          </span>
                          <span className="text-muted text-sm block mt-0.5">{link.desc}</span>
                        </div>
                        <span className="text-border-light group-hover:text-brand group-hover:translate-x-1 transition-all duration-200 text-lg font-bold">
                          &rarr;
                        </span>
                      </div>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>

            {/* Section: Support & Policies */}
            <section className="bg-white border border-border-light rounded-2xl p-6 md:p-8 shadow-premium hover:shadow-lg transition-all duration-300">
              <div className="flex items-center gap-3 mb-6 pb-4 border-b border-border-light">
                <ShieldCheck className="text-brand w-6 h-6" />
                <h2 className="text-xl md:text-2xl font-display font-bold text-foreground">
                  Policies & Legal Info
                </h2>
              </div>
              <ul className="space-y-4">
                {policyLinks.map((link) => (
                  <li key={link.href} className="group">
                    <Link href={link.href} className="block">
                      <div className="flex items-start justify-between">
                        <div>
                          <span className="text-foreground font-semibold group-hover:text-brand transition-colors duration-200 block text-base md:text-lg">
                            {link.name}
                          </span>
                          <span className="text-muted text-sm block mt-0.5">{link.desc}</span>
                        </div>
                        <span className="text-border-light group-hover:text-brand group-hover:translate-x-1 transition-all duration-200 text-lg font-bold">
                          &rarr;
                        </span>
                      </div>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>
          </div>

          {/* Column Right */}
          <div className="space-y-12">
            {/* Section: Destinations */}
            <section className="bg-white border border-border-light rounded-2xl p-6 md:p-8 shadow-premium hover:shadow-lg transition-all duration-300">
              <div className="flex items-center gap-3 mb-6 pb-4 border-b border-border-light">
                <MapPin className="text-brand w-6 h-6" />
                <h2 className="text-xl md:text-2xl font-display font-bold text-foreground">
                  Explore Destinations
                </h2>
              </div>
              <div className="max-h-[400px] overflow-y-auto dropdown-scrollbar pr-2 space-y-4">
                {destinations.length === 0 ? (
                  <p className="text-muted text-sm italic">No destinations found.</p>
                ) : (
                  destinations.map((d) => (
                    <div
                      key={d.slug}
                      className="group pb-3 border-b border-border-light last:border-0 last:pb-0"
                    >
                      <Link href={`/destinations/${d.slug}/`} className="block">
                        <div className="flex items-center justify-between">
                          <div>
                            <span className="text-foreground font-semibold group-hover:text-brand transition-colors duration-200 text-base">
                              {d.name}
                            </span>
                            <div className="flex flex-wrap gap-2 mt-1 items-center">
                              {d.stateName && (
                                <span className="text-xs text-muted">
                                  {d.stateName}, {d.countryName}
                                </span>
                              )}
                              <span className="text-[10px] bg-brand-light text-brand px-1.5 py-0.5 rounded font-medium uppercase tracking-wider">
                                {d.type.replace("_", " ")}
                              </span>
                            </div>
                          </div>
                          <span className="text-border-light group-hover:text-brand group-hover:translate-x-1 transition-all duration-200 text-sm">
                            &rarr;
                          </span>
                        </div>
                      </Link>
                    </div>
                  ))
                )}
              </div>
            </section>

            {/* Section: Tour Packages & Variants */}
            <section className="bg-white border border-border-light rounded-2xl p-6 md:p-8 shadow-premium hover:shadow-lg transition-all duration-300">
              <div className="flex items-center gap-3 mb-6 pb-4 border-b border-border-light">
                <FileText className="text-brand w-6 h-6" />
                <h2 className="text-xl md:text-2xl font-display font-bold text-foreground">
                  Tour Packages & Variants
                </h2>
              </div>
              <div className="max-h-[500px] overflow-y-auto dropdown-scrollbar pr-2 space-y-6">
                {packages.length === 0 ? (
                  <p className="text-muted text-sm italic">No packages found.</p>
                ) : (
                  packages.map((p) => (
                    <div key={p.slug} className="space-y-2">
                      <Link href={`/packages/${p.slug}/`} className="block group">
                        <div className="flex items-center justify-between">
                          <span className="text-foreground font-bold group-hover:text-brand transition-colors duration-200 text-base">
                            {p.name}
                          </span>
                          <span className="text-xs bg-brand text-white px-2 py-0.5 rounded-full font-medium">
                            {p.tourStyle}
                          </span>
                        </div>
                      </Link>

                      {/* Variants */}
                      {p.variants && p.variants.length > 0 && (
                        <div className="pl-4 border-l-2 border-border-light space-y-1.5 py-0.5">
                          {p.variants.map((v) => (
                            <Link
                              key={v.slug}
                              href={`/packages/${p.slug}/${v.slug}/`}
                              className="block text-sm text-muted hover:text-brand transition-colors duration-200 py-0.5 flex items-center justify-between group"
                            >
                              <span>{v.label}</span>
                              <span className="opacity-0 group-hover:opacity-100 text-brand transition-opacity duration-200 text-xs">
                                view package &rarr;
                              </span>
                            </Link>
                          ))}
                        </div>
                      )}
                    </div>
                  ))
                )}
              </div>
            </section>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
