"use client";

import { Briefcase, Compass, Heart } from "lucide-react";
import Link from "next/link";
import { useEffect, useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import DestinationCard from "@/components/shared/DestinationCard";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import { useDestinationFavorites, useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import { type DestinationItem } from "@/types/destination";
import { type PackageItem } from "@/types/package";

export default function WishlistClient({
  packagesData,
  destinationsData,
  companyData,
}: {
  packagesData: PackageItem[];
  destinationsData: DestinationItem[];
  companyData: CompanyData | null;
}) {
  const [activeTab, setActiveTab] = useState<"packages" | "destinations">("packages");
  const [isMounted, setIsMounted] = useState(false);

  const { favorites: packageFavorites, toggleFavorite: togglePackageFavorite } = useFavorites();
  const { favorites: destinationFavorites, toggleFavorite: toggleDestinationFavorite } =
    useDestinationFavorites();

  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect
    setIsMounted(true);
  }, []);

  const favoritePackages = useMemo(() => {
    return packagesData.filter((pkg) => packageFavorites.includes(pkg.slug));
  }, [packagesData, packageFavorites]);

  const favoriteDestinations = useMemo(() => {
    return destinationsData.filter((dest) => destinationFavorites.includes(dest.slug));
  }, [destinationsData, destinationFavorites]);

  if (!isMounted) {
    return (
      <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
        <div className="layout-container pt-12 md:pt-16 pb-section-loose font-sans animate-pulse">
          <div className="h-4 w-32 bg-neutral-100 rounded-full mb-6" />
          <div className="h-10 w-64 bg-neutral-100 rounded-lg mb-4" />
          <div className="h-6 w-96 bg-neutral-100 rounded-lg mb-12" />
          <div className="h-8 w-80 bg-neutral-100 rounded-lg mb-8" />
          <div className="grid grid-cols-2 lg:grid-cols-3 gap-6">
            <div className="aspect-[4/3] bg-neutral-100 rounded-[2rem]" />
            <div className="aspect-[4/3] bg-neutral-100 rounded-[2rem]" />
            <div className="aspect-[4/3] bg-neutral-100 rounded-[2rem]" />
          </div>
        </div>
      </PageShell>
    );
  }

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container pt-12 md:pt-16 pb-section-loose font-sans">
        <Breadcrumbs
          items={[{ label: "Home", href: "/" }, { label: "My Wishlist" }]}
          variant="brackets"
        />
        <SectionHeader
          title="My Wishlist"
          subtitle="Keep track of your dream itineraries and handpicked destinations. Start planning your custom journey from your curated list."
          align="left"
        />

        {/* Tab Switcher */}
        <div className="flex items-center gap-4 sm:gap-6 border-b border-border-light pb-4 mb-8 select-none">
          <button
            onClick={() => setActiveTab("packages")}
            className={`flex items-center gap-2 font-display font-bold text-xs sm:text-sm tracking-wider uppercase pb-3.5 -mb-4.5 border-b-2 transition-all duration-300 cursor-pointer ${
              activeTab === "packages"
                ? "border-neutral-900 text-neutral-900"
                : "border-transparent text-neutral-500 hover:text-neutral-850 hover:border-neutral-200"
            }`}
          >
            <Briefcase className="w-4 h-4 sm:w-4.5 sm:h-4.5" />
            <span>Saved Tours ({favoritePackages.length})</span>
          </button>

          <button
            onClick={() => setActiveTab("destinations")}
            className={`flex items-center gap-2 font-display font-bold text-xs sm:text-sm tracking-wider uppercase pb-3.5 -mb-4.5 border-b-2 transition-all duration-300 cursor-pointer ${
              activeTab === "destinations"
                ? "border-neutral-900 text-neutral-900"
                : "border-transparent text-neutral-500 hover:text-neutral-850 hover:border-neutral-200"
            }`}
          >
            <Compass className="w-4 h-4 sm:w-4.5 sm:h-4.5" />
            <span>Saved Destinations ({favoriteDestinations.length})</span>
          </button>
        </div>

        {/* Tab Content */}
        <div className="mt-8 min-h-[300px]">
          {activeTab === "packages" ? (
            favoritePackages.length === 0 ? (
              <div className="text-center py-20 bg-neutral-50/50 border border-neutral-100 rounded-[2.5rem] flex flex-col items-center px-4">
                <div className="w-16 h-16 rounded-full bg-neutral-100 flex items-center justify-center text-neutral-600 mb-4.5">
                  <Heart className="w-7 h-7" />
                </div>
                <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                  Your Saved Tours is empty
                </h3>
                <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium mb-6 text-center leading-relaxed">
                  Explore our handpicked travel itineraries and add your favorites to your wishlist.
                </p>
                <Link
                  href="/packages"
                  className="inline-flex items-center justify-center gap-2 bg-brand hover:bg-brand-hover text-white font-bold text-xs uppercase tracking-wider py-3.5 px-6 rounded-full transition-all duration-300 shadow-sm cursor-pointer"
                >
                  Browse Packages
                </Link>
              </div>
            ) : (
              <div className="grid grid-cols-2 lg:grid-cols-3 gap-3.5 sm:gap-6 lg:gap-8">
                {favoritePackages.map((pkg) => (
                  <PackageCard
                    key={pkg.id}
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    heroImage={pkg.heroImage}
                    destinations={pkg.destinations}
                    variant="white"
                    isFavorite={true}
                    onToggleFavorite={() => togglePackageFavorite(pkg.slug)}
                  />
                ))}
              </div>
            )
          ) : favoriteDestinations.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50/50 border border-neutral-100 rounded-[2.5rem] flex flex-col items-center px-4">
              <div className="w-16 h-16 rounded-full bg-neutral-100 flex items-center justify-center text-neutral-600 mb-4.5">
                <Compass className="w-7 h-7" />
              </div>
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                Your Saved Destinations is empty
              </h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium mb-6 text-center leading-relaxed">
                Discover the best destinations across India and international retreats, and save
                them here.
              </p>
              <Link
                href="/destinations"
                className="inline-flex items-center justify-center gap-2 bg-brand hover:bg-brand-hover text-white font-bold text-xs uppercase tracking-wider py-3.5 px-6 rounded-full transition-all duration-300 shadow-sm cursor-pointer"
              >
                Browse Destinations
              </Link>
            </div>
          ) : (
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-3.5 sm:gap-6 lg:gap-8">
              {favoriteDestinations.map((dest) => (
                <div
                  key={dest.slug}
                  className="h-[200px] xs:h-[220px] sm:h-[300px] md:h-[360px] w-full"
                >
                  <DestinationCard
                    dest={dest}
                    isMobile
                    isFavorite={true}
                    onToggleFavorite={() => toggleDestinationFavorite(dest.slug)}
                  />
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}
