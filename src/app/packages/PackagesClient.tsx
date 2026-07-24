"use client";

import { Suspense, useEffect, useMemo, useRef, useState } from "react";

import PageShell from "@/components/layout/PageShell";
import PackageCard from "@/components/shared/PackageCard";
import Pagination from "@/components/shared/Pagination";
import SectionHeader from "@/components/shared/SectionHeader";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import { type PackageItem } from "@/types/package";

function PackagesContent({
  packagesData,
  companyData,
}: {
  packagesData: PackageItem[];
  companyData: CompanyData | null;
}) {
  const [currentPage, setCurrentPage] = useState(1);
  const { isFavorite, toggleFavorite } = useFavorites();

  const resultsContainerRef = useRef<HTMLDivElement>(null);
  const shouldScrollRef = useRef(false);

  useEffect(() => {
    if (shouldScrollRef.current) {
      shouldScrollRef.current = false;
      resultsContainerRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  }, [currentPage]);

  const changePage = (page: number) => {
    shouldScrollRef.current = true;
    setCurrentPage(page);
  };

  const [itemsPerPage, setItemsPerPage] = useState(9);

  useEffect(() => {
    const handleResize = () => {
      setItemsPerPage(window.innerWidth < 1024 ? 10 : 9);
    };
    handleResize();
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const allPackages = useMemo(() => {
    return packagesData || [];
  }, [packagesData]);

  const totalPages = Math.ceil(allPackages.length / itemsPerPage);

  const paginatedPackages = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return allPackages.slice(startIndex, startIndex + itemsPerPage);
  }, [allPackages, currentPage, itemsPerPage]);

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container pt-24 pb-section-loose font-sans">
        <SectionHeader
          title="All Tour Packages"
          subtitle="Embark on unforgettable journeys with our premium, custom-designed itineraries. Explore majestic sights across India and handpicked international destinations."
          align="left"
        />

        <div ref={resultsContainerRef} className="scroll-mt-28">
          <div className="flex items-center justify-between mb-8 px-1">
            <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
              Showing {allPackages.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
              {Math.min(currentPage * itemsPerPage, allPackages.length)} of {allPackages.length}{" "}
              packages
            </p>
          </div>

          {allPackages.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">No packages found</h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                There are currently no tour packages available.
              </p>
            </div>
          ) : (
            <div>
              <div className="grid grid-cols-2 lg:grid-cols-3 gap-3.5 sm:gap-6 lg:gap-8">
                {paginatedPackages.map((pkg) => (
                  <PackageCard
                    key={pkg.id}
                    id={pkg.id}
                    slug={pkg.slug}
                    name={pkg.name}
                    heroImage={pkg.heroImage}
                    destinations={pkg.destinations}
                    variant="white"
                    isFavorite={isFavorite(pkg.slug)}
                    onToggleFavorite={toggleFavorite}
                    priority={pkg.isPopular}
                  />
                ))}
              </div>

              <Pagination
                currentPage={currentPage}
                totalPages={totalPages}
                onPageChange={changePage}
                className="mt-16"
              />
            </div>
          )}
        </div>
      </div>
    </PageShell>
  );
}

export default function PackagesClient(props: {
  packagesData: PackageItem[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading packages...
        </div>
      }
    >
      <PackagesContent {...props} />
    </Suspense>
  );
}
