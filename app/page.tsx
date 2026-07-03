import Link from "next/link";
import { Metadata } from "next";
import {
  getSiteConfig,
  getAllCollectionSlugs,
  getCollection,
  getAllBlogMeta,
} from "@/lib/data";
import { decodeJsonField, resolveMediaUrl } from "@/lib/utils";
import PackageCard from "@/components/PackageCard";
import BlogCard from "@/components/BlogCard";
import type { CollectionData, MediaImage, BlogMeta } from "@/types";

const siteConfig = getSiteConfig();

export const metadata: Metadata = {
  title: siteConfig?.site_name || "TravelXploria",
  description:
    siteConfig?.tagline ||
    "Discover curated travel packages across the world's most beautiful destinations",
};

export default function HomePage() {
  // Get featured collections (first 8 with thumbnails)
  const allSlugs = getAllCollectionSlugs();
  const collections: CollectionData[] = allSlugs
    .map((slug) => getCollection(slug))
    .filter((c): c is CollectionData => c !== null)
    .slice(0, 8);

  // Get recent blogs (3)
  const recentBlogs: BlogMeta[] = getAllBlogMeta().slice(0, 3);

  // Extra featured collection slugs for destinations grid
  const featuredCollections = collections.slice(0, 6);

  return (
    <div>
      {/* ─── Hero Section ─────────────────────────────── */}
      <section className="relative h-screen max-h-[800px] min-h-[600px] flex items-center justify-center overflow-hidden bg-black">
        {/* Video Background */}
        <video
          autoPlay
          muted
          loop
          playsInline
          className="absolute inset-0 w-full h-full object-cover opacity-60"
          poster="/photo/menu/1.png"
        >
          <source src="/videos/hero-video.mp4" type="video/mp4" />
        </video>

        {/* Overlay */}
        <div className="absolute inset-0 bg-gradient-to-b from-black/40 via-black/30 to-black/60" />

        {/* Content */}
        <div className="relative z-10 text-center px-4 max-w-4xl mx-auto">
          <h1 className="text-4xl md:text-6xl lg:text-7xl font-bold text-white mb-6 leading-tight">
            {siteConfig?.tagline || "Discover Your Next Adventure"}
          </h1>
          <p className="text-lg md:text-xl text-white/80 mb-8 max-w-2xl mx-auto">
            Explore handpicked travel packages across the world&apos;s most
            beautiful destinations. Your dream vacation starts here.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              href="#destinations"
              className="inline-flex items-center gap-2 bg-red text-white px-8 py-4 rounded-full text-lg font-semibold hover:bg-red/90 transition-colors"
            >
              <i className="bi bi-globe-americas" />
              Explore Destinations
            </Link>
            {siteConfig?.whatsapp && (
              <a
                href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 bg-green text-black px-8 py-4 rounded-full text-lg font-semibold hover:bg-green/90 transition-colors"
              >
                <i className="bi bi-whatsapp" />
                Chat on WhatsApp
              </a>
            )}
          </div>
        </div>
      </section>

      {/* ─── Featured Destinations ────────────────────── */}
      <section id="destinations" className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold text-black mb-4">
              Popular Destinations
            </h2>
            <p className="text-secondary max-w-2xl mx-auto">
              Explore our most loved travel destinations with carefully curated
              packages
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {featuredCollections.map((col) => {
              let thumbnail = "";
              try {
                if (col.page_props?.collectiondata?.thumbneil) {
                  const images = decodeJsonField<MediaImage[]>(
                    col.page_props.collectiondata.thumbneil
                  );
                  if (images?.[0]?.path) {
                    thumbnail = resolveMediaUrl(images[0].path);
                  }
                }
              } catch {
                // fallback
              }

              const name =
                col.page_props?.collectiondata?.collectionName ||
                col.slug.replace(/-/g, " ");

              return (
                <Link
                  key={col.slug}
                  href={`/${col.slug}`}
                  className="group relative h-80 rounded-2xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300"
                >
                  {thumbnail ? (
                    <img
                      src={thumbnail}
                      alt={name}
                      className="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                      loading="lazy"
                    />
                  ) : (
                    <div className="absolute inset-0 bg-gradient-card" />
                  )}
                  <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent" />
                  <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
                    <h3 className="text-xl font-bold mb-1">{name}</h3>
                    <p className="text-sm text-white/80">
                      {col.page_props?.uniqueCitiesCountriesArray?.length || 0}{" "}
                      cities
                    </p>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* ─── Why Choose Us ────────────────────────────── */}
      <section className="py-20 bg-surface">
        <div className="max-w-7xl mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold text-black mb-4">
              Why Travel With Us
            </h2>
            <p className="text-secondary max-w-2xl mx-auto">
              We make your travel dreams a reality with our expert planning and
              support
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {[
              {
                icon: "bi-shield-check",
                title: "Trusted & Verified",
                desc: "100% secure bookings with trusted partners",
              },
              {
                icon: "bi-currency-rupee",
                title: "Best Price Guarantee",
                desc: "Unbeatable prices across all destinations",
              },
              {
                icon: "bi-headset",
                title: "24/7 Support",
                desc: "Round-the-clock assistance during your trip",
              },
              {
                icon: "bi-star-fill",
                title: "Customized Packages",
                desc: "Tailored itineraries to match your preferences",
              },
            ].map((item, i) => (
              <div key={i} className="text-center">
                <div className="w-16 h-16 rounded-2xl bg-red/10 text-red flex items-center justify-center mx-auto mb-4">
                  <i className={`bi ${item.icon} text-2xl`} />
                </div>
                <h3 className="font-semibold text-black mb-2">{item.title}</h3>
                <p className="text-sm text-secondary2">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ─── Recent Blogs ────────────────────────────── */}
      {recentBlogs.length > 0 && (
        <section className="py-20 bg-white">
          <div className="max-w-7xl mx-auto px-4">
            <div className="flex items-end justify-between mb-12">
              <div>
                <h2 className="text-3xl md:text-4xl font-bold text-black mb-4">
                  Travel Stories
                </h2>
                <p className="text-secondary">
                  Tips, guides, and inspiration for your next adventure
                </p>
              </div>
              <Link
                href="/blog"
                className="hidden sm:inline-flex items-center gap-2 text-red hover:text-red/80 font-medium transition-colors"
              >
                View All Blogs
                <i className="bi bi-arrow-right" />
              </Link>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {recentBlogs.map((blog) => (
                <BlogCard
                  key={blog.slug}
                  slug={blog.slug}
                  title={blog.blog_title}
                  description={blog.description}
                  publishDate={blog.publish_date}
                  image={blog.image}
                />
              ))}
            </div>
          </div>
        </section>
      )}

      {/* ─── CTA Section ──────────────────────────────── */}
      <section className="py-20 bg-gradient-to-r from-red to-yellow">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
            Ready to Plan Your Dream Vacation?
          </h2>
          <p className="text-white/80 mb-8 max-w-2xl mx-auto">
            Let our travel experts help you craft the perfect itinerary. Call us
            or send a message to get started.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            {siteConfig?.phone && (
              <a
                href={`tel:${siteConfig.phone}`}
                className="inline-flex items-center gap-2 bg-white text-black px-8 py-4 rounded-full text-lg font-semibold hover:bg-white/90 transition-colors"
              >
                <i className="bi bi-telephone-fill" />
                {siteConfig.phone}
              </a>
            )}
            <Link
              href="/contact"
              className="inline-flex items-center gap-2 bg-black text-white px-8 py-4 rounded-full text-lg font-semibold hover:bg-black/80 transition-colors"
            >
              <i className="bi bi-envelope-fill" />
              Contact Us
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
