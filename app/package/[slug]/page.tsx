import { Metadata } from "next";
import { notFound } from "next/navigation";
import {
  getPackage,
  getAllPackageSlugs,
} from "@/lib/data";
import { decodeJsonField, resolveMediaUrl } from "@/lib/utils";
import HotelTierSelector from "@/components/HotelTierSelector";
import ItineraryAccordion from "@/components/ItineraryAccordion";
import type { PriceTier, ItineraryCity, FaqItem } from "@/types";

export async function generateStaticParams() {
  const slugs = getAllPackageSlugs();
  return slugs.map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const pkg = getPackage(params.slug);
  if (!pkg) return { title: "Not Found" };

  return {
    title:
      pkg.meta_title ||
      pkg.seo_title ||
      pkg.package_name ||
      "Package Details",
    description: pkg.meta_description || pkg.description || "",
    keywords: pkg.meta_keywords || "",
    openGraph: {
      title: pkg.og_title || pkg.package_name || "",
      description: pkg.og_description || "",
      images: pkg.og_image ? [{ url: pkg.og_image }] : [],
      url: pkg.og_url || "",
    },
  };
}

export default function PackageDetailPage({
  params,
}: {
  params: { slug: string };
}) {
  const pkg = getPackage(params.slug);
  if (!pkg) notFound();

  // Decode itinerary (JSON string → ItineraryCity[])
  let itinerary: ItineraryCity[] = [];
  try {
    const decoded = decodeJsonField<ItineraryCity[]>(pkg.itinerary);
    itinerary = Array.isArray(decoded) ? decoded : [];
  } catch {
    itinerary = [];
  }

  // Decode FAQ (JSON string → FaqItem[])
  let faqs: FaqItem[] = [];
  try {
    const decoded = decodeJsonField<FaqItem[]>(pkg.faq);
    faqs = Array.isArray(decoded) ? decoded : [];
  } catch {
    faqs = [];
  }

  // Price tiers (native array in standalone packages)
  const priceTiers: PriceTier[] = Array.isArray(pkg.price) ? pkg.price : [];

  // Gallery images (objects with path property)
  const galleryPaths: string[] = pkg.images?.length
    ? pkg.images.map((img) => img.path).filter(Boolean)
    : pkg.cover_image
      ? [pkg.cover_image]
      : [];

  return (
    <div>
      {/* ─── Hero Gallery ──────────────────────────── */}
      <section className="relative h-64 md:h-96 lg:h-[500px] overflow-hidden bg-black">
        {galleryPaths[0] ? (
          <img
            src={resolveMediaUrl(galleryPaths[0])}
            alt={pkg.package_name}
            className="absolute inset-0 w-full h-full object-cover"
          />
        ) : (
          <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow" />
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-8 lg:p-12">
          <div className="max-w-7xl mx-auto text-white">
            <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold mb-3">
              {pkg.package_name}
            </h1>
            <div className="flex flex-wrap gap-4 text-white/80 text-sm">
              {pkg.days > 0 && (
                <span>
                  <i className="bi bi-clock mr-1" />
                  {pkg.days} Days / {pkg.nights} Nights
                </span>
              )}
              {itinerary.length > 0 && (
                <span>
                  <i className="bi bi-geo-alt mr-1" />
                  {itinerary.length} Cities
                </span>
              )}
            </div>
          </div>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-10">
          {/* ─── Main Content ────────────────────────── */}
          <div className="lg:col-span-2 space-y-10">
            {/* Hotel Tier + Price Selector */}
            {priceTiers.length > 0 && (
              <HotelTierSelector priceTiers={priceTiers} />
            )}

            {/* About / Overview */}
            {pkg.about && (
              <section>
                <h2 className="text-2xl font-bold text-black mb-4">
                  Trip Overview
                </h2>
                <div
                  className="prose prose-sm max-w-none text-secondary leading-relaxed"
                  dangerouslySetInnerHTML={{ __html: pkg.about }}
                />
              </section>
            )}

            {/* Highlights */}
            {pkg.highlights && (
              <section>
                <h2 className="text-2xl font-bold text-black mb-4">
                  Trip Highlights
                </h2>
                <div
                  className="prose prose-sm max-w-none text-secondary leading-relaxed"
                  dangerouslySetInnerHTML={{ __html: pkg.highlights }}
                />
              </section>
            )}

            {/* Itinerary Accordion */}
            {itinerary.length > 0 && (
              <section>
                <h2 className="text-2xl font-bold text-black mb-6">
                  Detailed Itinerary
                </h2>
                <div className="space-y-8">
                  {itinerary.map((city, idx) => {
                    const bannerImg =
                      city.banner_image?.[0]?.path
                        ? resolveMediaUrl(city.banner_image[0].path)
                        : "";

                    return (
                      <div key={idx}>
                        {/* City header */}
                        <div className="relative h-40 rounded-xl overflow-hidden mb-4">
                          {bannerImg ? (
                            <img
                              src={bannerImg}
                              alt={city.city}
                              className="absolute inset-0 w-full h-full object-cover"
                            />
                          ) : (
                            <div className="absolute inset-0 bg-gradient-to-r from-blue-t to-bluet-t" />
                          )}
                          <div className="absolute inset-0 bg-black/30 flex items-end p-4">
                            <div>
                              <h3 className="text-xl font-bold text-white">
                                {city.city}
                              </h3>
                              <span className="text-white/80 text-sm">
                                {city.country} — {city.day_details?.length || 0}{" "}
                                days
                              </span>
                            </div>
                          </div>
                        </div>

                        <ItineraryAccordion
                          dayDetails={city.day_details}
                          cityName={city.city}
                        />
                      </div>
                    );
                  })}
                </div>
              </section>
            )}

            {/* Inclusions / Exclusions */}
            {(pkg.inclusions?.length > 0 ||
              pkg.exclusions?.length > 0) && (
              <section className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {pkg.inclusions?.length > 0 && (
                  <div className="bg-surface rounded-xl p-6">
                    <h3 className="font-semibold text-black mb-3 flex items-center gap-2">
                      <i className="bi bi-check-circle-fill text-green" />
                      Inclusions
                    </h3>
                    <ul className="space-y-2">
                      {pkg.inclusions.map((item, i) => (
                        <li
                          key={i}
                          className="flex items-start gap-2 text-sm text-secondary"
                        >
                          <i className="bi bi-check2 text-green mt-0.5 flex-shrink-0" />
                          {item}
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
                {pkg.exclusions?.length > 0 && (
                  <div className="bg-surface rounded-xl p-6">
                    <h3 className="font-semibold text-black mb-3 flex items-center gap-2">
                      <i className="bi bi-x-circle-fill text-red" />
                      Exclusions
                    </h3>
                    <ul className="space-y-2">
                      {pkg.exclusions.map((item, i) => (
                        <li
                          key={i}
                          className="flex items-start gap-2 text-sm text-secondary"
                        >
                          <i className="bi bi-x text-red mt-0.5 flex-shrink-0" />
                          {item}
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
              </section>
            )}

            {/* FAQs */}
            {faqs.length > 0 && (
              <section>
                <h2 className="text-2xl font-bold text-black mb-6">
                  Frequently Asked Questions
                </h2>
                <div className="space-y-3">
                  {faqs.map((faq, idx) => (
                    <details
                      key={idx}
                      className="group border border-line rounded-xl overflow-hidden"
                    >
                      <summary className="flex items-center justify-between p-4 cursor-pointer hover:bg-surface transition-colors list-none">
                        <span className="font-medium text-sm pr-4">
                          {faq.question}
                        </span>
                        <i className="bi bi-chevron-down text-secondary group-open:rotate-180 transition-transform flex-shrink-0" />
                      </summary>
                      <div className="p-4 pt-0 text-sm text-secondary leading-relaxed">
                        {faq.answer}
                      </div>
                    </details>
                  ))}
                </div>
              </section>
            )}
          </div>

          {/* ─── Sidebar ──────────────────────────────── */}
          <aside className="space-y-6">
            {/* Quick Enquiry */}
            <div className="bg-black text-white rounded-xl p-6 sticky top-24">
              <h3 className="font-semibold mb-2">Interested in this trip?</h3>
              <p className="text-secondary2 text-sm mb-4">
                Get in touch for a customized quote and availability.
              </p>
              <div className="space-y-2">
                <a
                  href="tel:+91"
                  className="flex items-center gap-2 bg-red text-white w-full justify-center py-2.5 rounded-lg text-sm font-medium hover:opacity-90 transition-opacity"
                >
                  <i className="bi bi-telephone-fill" />
                  Call Now
                </a>
                <a
                  href="https://wa.me/"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 bg-green text-black w-full justify-center py-2.5 rounded-lg text-sm font-medium hover:opacity-90 transition-opacity"
                >
                  <i className="bi bi-whatsapp" />
                  WhatsApp
                </a>
              </div>
            </div>

            {/* More Images */}
            {galleryPaths.length > 1 && (
              <div className="bg-surface rounded-xl p-6">
                <h3 className="font-semibold text-black mb-4">Gallery</h3>
                <div className="grid grid-cols-2 gap-2">
                  {galleryPaths.slice(1, 5).map((img, idx) => (
                    <div
                      key={idx}
                      className="aspect-square rounded-lg overflow-hidden bg-surface"
                    >
                      <img
                        src={resolveMediaUrl(img)}
                        alt={`${pkg.package_name} ${idx + 2}`}
                        className="w-full h-full object-cover"
                        loading="lazy"
                      />
                    </div>
                  ))}
                </div>
              </div>
            )}
          </aside>
        </div>
      </div>
    </div>
  );
}
