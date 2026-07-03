import { Metadata } from "next";
import { notFound } from "next/navigation";
import {
  getCollection,
  getAllCollectionSlugs,
  getSiteConfig,
} from "@/lib/data";
import { decodeJsonField, resolveMediaUrl } from "@/lib/utils";
import PackageCard from "@/components/PackageCard";
import type { MediaImage, EmbeddedPackage, PriceTier } from "@/types";

const siteConfig = getSiteConfig();

export async function generateStaticParams() {
  const slugs = getAllCollectionSlugs();
  return slugs.map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const collection = getCollection(params.slug);
  if (!collection) return { title: "Not Found" };

  const collectionName =
    collection.page_props?.collectiondata?.collectionName ||
    collection.title ||
    params.slug.replace(/-/g, " ");

  return {
    title:
      collection.og_title ||
      collection.title ||
      `${collectionName} Tour Packages`,
    description: collection.og_description || collection.description || "",
    openGraph: {
      title: collection.og_title || collectionName,
      description: collection.og_description || collection.description || "",
      images: collection.og_image ? [{ url: collection.og_image }] : [],
      url: collection.og_url || "",
    },
  };
}

export default function CollectionPage({
  params,
}: {
  params: { slug: string };
}) {
  const collection = getCollection(params.slug);
  if (!collection) notFound();

  const meta = collection.page_props?.collectiondata;
  const packages: EmbeddedPackage[] = collection.page_props?.packages || [];
  const cities = collection.page_props?.uniqueCitiesCountriesArray || [];
  const reviews = collection.page_props?.reviews || [];

  const collectionName =
    meta?.collectionName ||
    collection.title ||
    params.slug.replace(/-/g, " ");

  // Resolve banner image
  let bannerImage = "";
  try {
    if (meta?.thumbneil) {
      const images = decodeJsonField<MediaImage[]>(meta.thumbneil);
      if (images?.[0]?.path) {
        bannerImage = resolveMediaUrl(images[0].path);
      }
    }
  } catch {
    // fallback
  }

  // Filter packages with known slugs
  const displayPackages = packages;

  return (
    <div>
      {/* ─── Banner ────────────────────────────────── */}
      <section className="relative h-64 md:h-96 overflow-hidden bg-black">
        {bannerImage ? (
          <img
            src={bannerImage}
            alt={collectionName}
            className="absolute inset-0 w-full h-full object-cover opacity-70"
          />
        ) : (
          <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow" />
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-8 md:p-12">
          <div className="max-w-7xl mx-auto">
            <h1 className="text-3xl md:text-5xl font-bold text-white mb-2">
              {collectionName}
            </h1>
            {meta?.idealDuration && (
              <p className="text-white/80 text-sm md:text-base">
                <i className="bi bi-clock mr-1" />
                Ideal Duration: {meta.idealDuration} | Best Season:{" "}
                {meta.idealSession || "All Time"}
              </p>
            )}
          </div>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-10">
          {/* ─── Main Content ─────────────────────────── */}
          <div className="lg:col-span-3">
            {/* Overview */}
            {meta?.overview && (
              <div className="mb-10">
                <h2 className="text-2xl font-bold text-black mb-4">Overview</h2>
                <div
                  className="prose prose-sm max-w-none text-secondary leading-relaxed"
                  dangerouslySetInnerHTML={{ __html: meta.overview }}
                />
              </div>
            )}

            {/* Package Cards Grid */}
            <div>
              <h2 className="text-2xl font-bold text-black mb-6">
                Tour Packages ({displayPackages.length})
              </h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-6">
                {displayPackages.map((pkg) => (
                  <PackageCard
                    key={pkg.package_id}
                    packageName={pkg.package_name}
                    slug={pkg.web_slug}
                    headerImages={pkg.header_images}
                    thumbneil={pkg.thumbneil}
                    days={pkg.days}
                    price={pkg.package_price}
                    offerTitle={pkg.offer_title}
                  />
                ))}
              </div>
            </div>
          </div>

          {/* ─── Sidebar ──────────────────────────────── */}
          <aside className="space-y-6">
            {/* Trip Planner Stats */}
            <div className="bg-surface rounded-xl p-6">
              <h3 className="font-semibold text-black mb-4">Trip Planner</h3>
              <div className="space-y-3">
                {meta?.idealDuration && (
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-lg bg-green/30 flex items-center justify-center">
                      <i className="bi bi-clock text-green-700" />
                    </div>
                    <div>
                      <span className="text-xs text-secondary2">
                        Ideal Duration
                      </span>
                      <p className="text-sm font-semibold">
                        {meta.idealDuration}
                      </p>
                    </div>
                  </div>
                )}
                {meta?.idealSession && (
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-lg bg-yellow/30 flex items-center justify-center">
                      <i className="bi bi-sun text-yellow-700" />
                    </div>
                    <div>
                      <span className="text-xs text-secondary2">Best Time</span>
                      <p className="text-sm font-semibold">
                        {meta.idealSession}
                      </p>
                    </div>
                  </div>
                )}
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-lg bg-red/20 flex items-center justify-center">
                    <i className="bi bi-suitcase-lg text-red" />
                  </div>
                  <div>
                    <span className="text-xs text-secondary2">Packages</span>
                    <p className="text-sm font-semibold">
                      {packages.length} Tours
                    </p>
                  </div>
                </div>
              </div>
            </div>

            {/* Cities */}
            {cities.length > 0 && (
              <div className="bg-surface rounded-xl p-6">
                <h3 className="font-semibold text-black mb-4">
                  Cities Covered
                </h3>
                <div className="flex flex-wrap gap-2">
                  {cities.map((city) => (
                    <span
                      key={city}
                      className="text-xs bg-white border border-line rounded-full px-3 py-1 text-secondary"
                    >
                      {city}
                    </span>
                  ))}
                </div>
              </div>
            )}

            {/* Help Card */}
            <div className="bg-black text-white rounded-xl p-6 sticky top-24">
              <h3 className="font-semibold mb-2">Need Expert Help?</h3>
              <p className="text-secondary2 text-sm mb-4">
                Our travel experts are here to help you plan the perfect trip.
              </p>
              {siteConfig?.phone && (
                <a
                  href={`tel:${siteConfig.phone}`}
                  className="flex items-center gap-2 bg-red text-white w-full justify-center py-2.5 rounded-lg text-sm font-medium hover:opacity-90 transition-opacity mb-2"
                >
                  <i className="bi bi-telephone-fill" />
                  {siteConfig.phone}
                </a>
              )}
              {siteConfig?.whatsapp && (
                <a
                  href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 bg-green text-black w-full justify-center py-2.5 rounded-lg text-sm font-medium hover:opacity-90 transition-opacity"
                >
                  <i className="bi bi-whatsapp" />
                  WhatsApp
                </a>
              )}
            </div>
          </aside>
        </div>
      </div>
    </div>
  );
}
