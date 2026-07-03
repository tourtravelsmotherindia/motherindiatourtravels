import { Metadata } from "next";
import { getSiteConfig } from "@/lib/data";

const siteConfig = getSiteConfig();
const siteName = siteConfig?.site_name || "TravelXploria";

export const metadata: Metadata = {
  title: "Terms & Conditions",
  description: `Read the terms and conditions for using ${siteName}'s website and booking travel packages.`,
};

export default function TermsPage() {
  return (
    <div>
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">
            Terms & Conditions
          </h1>
        </div>
      </section>

      <div className="max-w-4xl mx-auto px-4 py-16">
        <div className="prose prose-lg max-w-none">
          <p className="lead">
            By accessing and using {siteName}&apos;s website and services, you
            agree to comply with and be bound by the following terms and
            conditions. Please read them carefully before making a booking.
          </p>

          <h2>1. Acceptance of Terms</h2>
          <p>
            By using this website and/or making a booking with {siteName}, you
            acknowledge that you have read, understood, and agree to be bound
            by these terms and conditions.
          </p>

          <h2>2. Booking and Payment</h2>
          <ul>
            <li>All bookings are subject to availability at the time of confirmation.</li>
            <li>A deposit of 25-50% of the total package price is required to confirm your booking, unless stated otherwise.</li>
            <li>The balance must be paid by the due date specified in your booking confirmation.</li>
            <li>Failure to pay the balance by the due date may result in cancellation of your booking.</li>
            <li>Prices are subject to change until full payment is received.</li>
          </ul>

          <h2>3. Pricing</h2>
          <p>
            All prices displayed on our website are in Indian Rupees (₹) unless
            otherwise stated. Prices are subject to change without prior notice
            due to fluctuations in exchange rates, fuel prices, taxes, or other
            factors beyond our control. The final price will be confirmed at the
            time of booking.
          </p>

          <h2>4. Accommodation and Itinerary</h2>
          <ul>
            <li>Hotels mentioned in the itinerary are subject to availability. In case of unavailability, we will provide an alternative of a similar or higher standard.</li>
            <li>The itinerary may be modified due to weather conditions, local events, or other operational reasons. We will inform you of any changes as early as possible.</li>
            <li>Check-in and check-out times are as per the hotel&apos;s policy. Early check-in or late check-out is subject to availability and may incur additional charges.</li>
          </ul>

          <h2>5. Travel Documents and Insurance</h2>
          <ul>
            <li>It is your responsibility to ensure you have valid passports, visas, and any other required travel documents before departure.</li>
            <li>{siteName} strongly recommends purchasing comprehensive travel insurance to cover trip cancellation, medical emergencies, baggage loss, and other unforeseen events.</li>
            <li>We are not responsible for any losses or expenses arising from inadequate travel documents or lack of insurance.</li>
          </ul>

          <h2>6. Liability</h2>
          <p>
            {siteName} acts as a tour operator and travel agent. While we take
            utmost care in selecting our service providers (hotels, airlines,
            transport operators, guides):
          </p>
          <ul>
            <li>We are not liable for any injury, loss, damage, delay, or expense caused by third-party service providers.</li>
            <li>We are not responsible for events beyond our control, including but not limited to: flight delays/cancellations, weather conditions, natural disasters, strikes, or political unrest.</li>
            <li>Our liability in any case is limited to the amount paid for the booking.</li>
          </ul>

          <h2>7. Website Usage</h2>
          <ul>
            <li>The content on this website is for general information purposes only and may change without notice.</li>
            <li>Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offense.</li>
            <li>You may not reproduce, duplicate, copy, or exploit any content from this website without our express written permission.</li>
          </ul>

          <h2>8. Governing Law</h2>
          <p>
            These terms and conditions are governed by and construed in
            accordance with the laws of India. Any disputes arising from these
            terms shall be subject to the exclusive jurisdiction of the courts
            in Kolkata, West Bengal.
          </p>

          <h2>9. Contact</h2>
          <p>
            If you have any questions about these Terms & Conditions, please
            contact us:
          </p>
          <ul>
            {siteConfig?.email && <li>Email: {siteConfig.email}</li>}
            {siteConfig?.phone && <li>Phone: {siteConfig.phone}</li>}
          </ul>
        </div>
      </div>
    </div>
  );
}
