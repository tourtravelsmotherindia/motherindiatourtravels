import React from "react";
import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import TripCards from "@/components/TripCards";
import PopularDestinations from "@/components/PopularDestinations";
import Gallery from "@/components/Gallery";
import TravelerMoments from "@/components/TravelerMoments";
import PartnerAirlines from "@/components/PartnerAirlines";
import RegionsGrid from "@/components/RegionsGrid";
import FAQ from "@/components/FAQ";
import Footer from "@/components/Footer";

export default function Home() {
  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      {/* Navigation Header */}
      <Navbar />

      {/* Main Layout Content */}
      <main className="flex-1">
        {/* Hero Banner and Search Bar */}
        <Hero />

        {/* Selected Trip Cards / Packages */}
        <TripCards />

        {/* Popular Destinations Slider */}
        <PopularDestinations />

        {/* Gallery */}
        <Gallery />

        {/* Traveler Moments / Testimonials */}
        <TravelerMoments />

        {/* Search Top Airlines Grid */}
        <PartnerAirlines />

        {/* Destinations By Sub-Continent Regions */}
        <RegionsGrid />

        {/* FAQ Section */}
        <FAQ />
      </main>

      {/* Footer Branding & Links */}
      <Footer />
    </div>
  );
}
