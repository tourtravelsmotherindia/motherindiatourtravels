import FAQ from "@/components/home/FAQ";
import Gallery from "@/components/home/Gallery";
import Hero from "@/components/home/Hero";
import PartnerAirlines from "@/components/home/PartnerAirlines";
import PopularDestinations from "@/components/home/PopularDestinations";
import RegionsGrid from "@/components/home/RegionsGrid";
import TestimonialsSection from "@/components/home/TravelerMoments";
import TripCards from "@/components/home/TripCards";
import WhyChooseUs from "@/components/home/WhyChooseUs";
import PageShell from "@/components/layout/PageShell";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getDestinations } from "@/lib/db/repositories/destinationRepo";
import { getFAQData } from "@/lib/db/repositories/faqRepo";
import { getHeroSlides } from "@/lib/db/repositories/heroRepo";
import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

export default async function Home() {
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
