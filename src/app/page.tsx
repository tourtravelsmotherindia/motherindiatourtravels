import FAQ from "@/components/FAQ";
import Gallery from "@/components/Gallery";
import Hero from "@/components/Hero";
import PageShell from "@/components/layout/PageShell";
import PartnerAirlines from "@/components/PartnerAirlines";
import PopularDestinations from "@/components/PopularDestinations";
import RegionsGrid from "@/components/RegionsGrid";
import TestimonialsSection from "@/components/TravelerMoments";
import TripCards from "@/components/TripCards";
import WhyChooseUs from "@/components/WhyChooseUs";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getDestinations } from "@/lib/db/repositories/destinationRepo";
import { getFAQData } from "@/lib/db/repositories/faqRepo";
import { getHeroSlides } from "@/lib/db/repositories/heroRepo";
import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

export default async function Home() {
  // Fetch all data server-side
  const [heroData, packagesData, faqData, companyData, destinationsData] = await Promise.all([
    getHeroSlides(),
    getPackagesIndex(),
    getFAQData(),
    getCompanyData(),
    getDestinations(),
  ]);

  const destinationsWrapped = { destinations: destinationsData, total: destinationsData.length };
  const packagesWrapped = { total: packagesData.total, packages: packagesData.packages };

  return (
    <PageShell companyData={companyData}>
      <Hero heroData={heroData} packagesData={packagesWrapped} />
      <WhyChooseUs />
      <TripCards packagesData={packagesWrapped} />
      <PopularDestinations destinationsData={destinationsWrapped} packagesData={packagesWrapped} />
      <Gallery />
      <TestimonialsSection />
      <PartnerAirlines />
      <RegionsGrid />
      <FAQ faqData={faqData} companyData={companyData} />
    </PageShell>
  );
}
