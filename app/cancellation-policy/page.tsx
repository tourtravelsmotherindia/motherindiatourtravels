import { Metadata } from "next";
import { getSiteConfig } from "@/lib/data";

const siteConfig = getSiteConfig();
const siteName = siteConfig?.site_name || "TravelXploria";

export const metadata: Metadata = {
  title: "Cancellation Policy",
  description: `Understand ${siteName}'s cancellation and refund policy for tour packages and travel bookings.`,
};

export default function CancellationPolicyPage() {
  return (
    <div>
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">
            Cancellation Policy
          </h1>
        </div>
      </section>

      <div className="max-w-4xl mx-auto px-4 py-16">
        <div className="prose prose-lg max-w-none">
          <p className="lead">
            We understand that plans can change. This cancellation policy
            outlines the terms and conditions for canceling or modifying your
            travel booking with {siteName}.
          </p>

          <h2>1. Cancellation by the Customer</h2>
          <p>
            Cancellation charges are calculated based on the number of days
            before departure:
          </p>
          <div className="not-prose my-6 overflow-x-auto">
            <table className="w-full border-collapse border border-line text-sm">
              <thead>
                <tr className="bg-surface">
                  <th className="border border-line p-3 text-left font-semibold">
                    Cancellation Period
                  </th>
                  <th className="border border-line p-3 text-left font-semibold">
                    Cancellation Charges
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="border border-line p-3">30+ days before departure</td>
                  <td className="border border-line p-3">25% of the total package cost</td>
                </tr>
                <tr className="bg-surface/50">
                  <td className="border border-line p-3">15-30 days before departure</td>
                  <td className="border border-line p-3">50% of the total package cost</td>
                </tr>
                <tr>
                  <td className="border border-line p-3">7-14 days before departure</td>
                  <td className="border border-line p-3">75% of the total package cost</td>
                </tr>
                <tr className="bg-surface/50">
                  <td className="border border-line p-3">Less than 7 days before departure</td>
                  <td className="border border-line p-3">100% of the total package cost</td>
                </tr>
              </tbody>
            </table>
          </div>

          <h2>2. Refund Processing</h2>
          <p>
            Refunds, if applicable, will be processed within 7-14 working days
            from the date of cancellation confirmation. The refund will be
            credited to the original payment method used for the booking.
          </p>

          <h2>3. Amendments / Date Changes</h2>
          <p>
            Requests to amend or change travel dates are subject to
            availability and may incur modification fees. The fee depends on
            how close to the departure date the change is requested and the
            specific package terms.
          </p>
          <ul>
            <li>Changes made 30+ days before departure: ₹2,000 - ₹5,000 per person</li>
            <li>Changes made 15-29 days before departure: ₹5,000 - ₹10,000 per person</li>
            <li>Changes made less than 15 days before departure: Treated as cancellation</li>
          </ul>

          <h2>4. Cancellation by {siteName}</h2>
          <p>
            In the rare event that we must cancel a tour due to unforeseen
            circumstances (natural disasters, political unrest, or insufficient
            bookings), you will receive a full refund of all payments made.
            Alternatively, you may choose to transfer your booking to an
            alternative date or package at no extra cost.
          </p>

          <h2>5. Force Majeure</h2>
          <p>
            {siteName} shall not be liable for any failure or delay in
            performing its obligations due to circumstances beyond its
            reasonable control, including but not limited to: acts of God, war,
            terrorism, civil unrest, natural disasters, epidemics, government
            restrictions, or airline/transport disruptions.
          </p>

          <h2>6. Partial Cancellation</h2>
          <p>
            If one or more members of a group booking cancel, the cancellation
            charges apply only to the canceled members. The remaining members
            may continue with the booking, though the package price may be
            recalculated based on the revised group size.
          </p>

          <h2>7. No-Show Policy</h2>
          <p>
            If you fail to arrive for your tour without prior notification (a
            &ldquo;no-show&rdquo;), no refund will be provided, and 100% of the
            package cost will be retained as cancellation charges.
          </p>

          <h2>8. Contact Us</h2>
          <p>
            To cancel or modify your booking, please contact us immediately:
          </p>
          <ul>
            {siteConfig?.email && <li>Email: {siteConfig.email}</li>}
            {siteConfig?.phone && <li>Phone: {siteConfig.phone}</li>}
            {siteConfig?.whatsapp && <li>WhatsApp: {siteConfig.whatsapp}</li>}
          </ul>
        </div>
      </div>
    </div>
  );
}
