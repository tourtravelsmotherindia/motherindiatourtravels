"use client";

import { Suspense, useEffect, useMemo, useRef, useState } from "react";

import PageShell from "@/components/layout/PageShell";
import DestinationCard from "@/components/shared/DestinationCard";
import Pagination from "@/components/shared/Pagination";
import SectionHeader from "@/components/shared/SectionHeader";
import { type CompanyData } from "@/types/company";
import { type DestinationItem } from "@/types/destination";

function DestinationsContent({
  destinationsData,
  companyData,
}: {
  destinationsData: DestinationItem[];
  companyData: CompanyData | null;
}) {
  const [currentPage, setCurrentPage] = useState(1);

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

  const [itemsPerPage, setItemsPerPage] = useState(12);

  useEffect(() => {
    const handleResize = () => {
      setItemsPerPage(window.innerWidth < 1024 ? 10 : 12);
    };
    handleResize();
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const allDestinations = useMemo(() => {
    // Sort destinations featured first, then alphabetical
    const sorted = [...destinationsData];
    sorted.sort((a, b) => {
      if (a.isFeatured && !b.isFeatured) return -1;
      if (!a.isFeatured && b.isFeatured) return 1;
      return a.name.localeCompare(b.name);
    });
    return sorted;
  }, [destinationsData]);

  const totalPages = Math.ceil(allDestinations.length / itemsPerPage);

  const paginatedDestinations = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return allDestinations.slice(startIndex, startIndex + itemsPerPage);
  }, [allDestinations, currentPage, itemsPerPage]);

  return (
    <PageShell companyData={companyData} ptClass="pt-24" bgClass="bg-white">
      <div className="layout-container pt-24 pb-section-loose font-sans">
        <SectionHeader
          title="Explore Destinations"
          subtitle="Discover beautiful destinations around the world, from tranquil hill stations and spiritual temples to tropical beaches and royal heritage cities."
          align="left"
        />

        <div ref={resultsContainerRef} className="scroll-mt-28">
          <div className="flex items-center justify-between mb-8 px-1">
            <p className="text-xs md:text-sm font-bold text-neutral-500 uppercase tracking-wider">
              Showing {allDestinations.length > 0 ? (currentPage - 1) * itemsPerPage + 1 : 0}–
              {Math.min(currentPage * itemsPerPage, allDestinations.length)} of{" "}
              {allDestinations.length} destinations
            </p>
          </div>

          {allDestinations.length === 0 ? (
            <div className="text-center py-20 bg-neutral-50 border border-neutral-100 rounded-[2.5rem] mt-4">
              <h3 className="text-lg md:text-xl font-bold text-neutral-800">
                No destinations found
              </h3>
              <p className="text-neutral-500 text-sm mt-2 max-w-sm mx-auto px-4 font-medium">
                There are currently no destinations available.
              </p>
            </div>
          ) : (
            <div>
              <div className="grid grid-cols-2 lg:grid-cols-4 gap-3.5 sm:gap-6 lg:gap-8">
                {paginatedDestinations.map((dest) => (
                  <div key={dest.slug} className="h-[280px] sm:h-[360px] md:h-[400px] w-full">
                    <DestinationCard dest={dest} isMobile />
                  </div>
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

export default function DestinationsClient(props: {
  destinationsData: DestinationItem[];
  companyData: CompanyData | null;
}) {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading destinations...
        </div>
      }
    >
      <DestinationsContent {...props} />
    </Suspense>
  );
}
