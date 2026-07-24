import React from "react";

import PolicyLayout from "@/components/layout/PolicyLayout";
import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

export const metadata = {
  title: "Cancellation & Refund Policy | Mother India Tour Travels",
  description:
    "Read the Cancellation and Refund Policy of Mother India Tour Travels. Learn about package cancellation fees, hotel policies, and refund rules.",
  alternates: {
    canonical: "/cancellation-policy/",
  },
};

export default async function CancellationPolicyPage() {
  const companyData = await getCompanyData();

  const sections = [
    {
      id: "general-timeline",
      title: "Overview of Cancellation Charges",
      content: (
        <>
          <p>
            Cancellations of any confirmed bookings must be requested in writing via email to our
            official address ({companyData?.email || "tourtravelsmotherindia@gmail.com"}). The date
            on which we receive your written email request determines the applicable cancellation
            charges.
          </p>
          <p>Standard package cancellation charges are computed as follows:</p>
          <div className="overflow-x-auto my-6">
            <table className="min-w-full divide-y divide-neutral-200 border border-neutral-200 text-left text-sm md:text-base">
              <thead className="bg-neutral-50 text-neutral-800 font-semibold">
                <tr>
                  <th className="px-4 py-3 border-b">Time of Written Cancellation</th>
                  <th className="px-4 py-3 border-b">Applicable Cancellation Charge</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-neutral-200 text-neutral-600 font-medium">
                <tr>
                  <td className="px-4 py-3.5">45 Days or more prior to scheduled departure date</td>
                  <td className="px-4 py-3.5">
                    The advance booking/reservation amount will be charged.
                  </td>
                </tr>
                <tr>
                  <td className="px-4 py-3.5">30 to 44 Days prior to scheduled departure date</td>
                  <td className="px-4 py-3.5">35% of the total package cost will be charged.</td>
                </tr>
                <tr>
                  <td className="px-4 py-3.5">15 to 29 Days prior to scheduled departure date</td>
                  <td className="px-4 py-3.5">50% of the total package cost will be charged.</td>
                </tr>
                <tr>
                  <td className="px-4 py-3.5">
                    Within 15 Days of scheduled departure date (or No Show)
                  </td>
                  <td className="px-4 py-3.5 font-bold text-red-600">
                    100% of the total package cost will be charged (Zero refund).
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <p className="mt-2 text-xs md:text-sm text-neutral-500 italic">
            Note: The standard timelines above represent baseline operational and booking
            deductions. Certain customized components (like flights, specific luxury hotels, or peak
            holiday packages) are governed by stricter policies detailed below.
          </p>
        </>
      ),
    },
    {
      id: "hotel-cancellations",
      title: "Hotel Bookings & Individual Policies",
      content: (
        <>
          <p>
            Accommodation booking terms differ significantly depending on the properties and room
            categories selected.{" "}
            <strong>
              We adhere strictly to the individual cancellation and refund policies set by each
              respective hotel.
            </strong>
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Refundable Hotels:</strong> For hotels designated as &quot;Refundable&quot; on
              your travel vouchers, refunds and their respective timelines will be processed
              according to the hotel{"'"}s specific terms.
            </li>
            <li>
              <strong>Non-Refundable Hotels:</strong> If a hotel is marked as
              &quot;Non-Refundable&quot; on the vouchers or booked under promotional rates, the
              hotel charges will not be refunded under any circumstances, entailing a 100%
              cancellation fee for that portion, overriding the standard timelines listed in Section
              1.
            </li>
            <li>
              <strong>On-Trip Changes:</strong> Any hotel changes made on-trip (e.g., cancelling an
              itinerary hotel to book a different property mid-trip) will attract a 100%
              cancellation fee for the originally booked hotel.
            </li>
            <li>
              <strong>Check-in Restrictions:</strong> Early check-in or late check-out requests are
              subject to hotel availability and discretion. Mother India Tour Travels cannot process
              cancellation requests or issue refunds if a hotel is unable to accommodate these
              requests.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "flight-cancellations",
      title: "Flight Ticket Cancellations",
      content: (
        <>
          <p>
            Airfare cancellations and modifications are governed solely by the respective airline
            {"'"}s fare rules and cancellation policy:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Non-Refundable Flights:</strong> On cancelling flights marked as
              {'"'}Non-Refundable{'"'} on the final travel vouchers, customers will be eligible for
              a zero refund.
            </li>
            <li>
              <strong>Refundable Flights:</strong> For flights marked as &quot;Refundable&quot;, the
              customer will receive the refund amount returned by the airline, minus airline
              penalties and our administrative service charges.
            </li>
            <li>
              <strong>Delays and Groundings:</strong> Mother India Tour Travels is not responsible
              for delayed, grounded, or cancelled flights. Any compensation or alternate flight
              arrangements must be handled directly with the operating airline carrier.
            </li>
            <li>
              <strong>Passport & Border Control:</strong> The traveler must ensure their passport
              has a minimum of 6 months (or 1 year, as required by specific international
              destinations) validity and is in good physical condition. We are not liable to refund
              packages if border control or airlines deny boarding due to invalid passports.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "visa-and-insurance",
      title: "Visa & Insurance Policies",
      content: (
        <>
          <p>
            Charges paid for visas, documentation, and travel insurance policies are subject to
            special terms:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Visa Applications:</strong> Mother India Tour Travels acts as a facilitator to
              assist you in preparing visa documentation. Visa approval is the sole discretion of
              the respective foreign embassy or high commission. The visa fee and our documentation
              processing fee are strictly 100% non-refundable, regardless of whether the visa is
              granted or rejected.
            </li>
            <li>
              <strong>Travel Insurance:</strong> Once applied and issued, travel insurance premiums
              are 100% non-refundable and subject to immediate policy lock-in.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "confidentiality-supplier",
      title: "Confidentiality of Supplier Agreements",
      content: (
        <>
          <p>
            The commercial agreements between Mother India Tour Travels and its third-party
            suppliers (hotels, destination management groups, flight consolidators) are
            confidential.
          </p>
          <p>
            Clients are not entitled to request, review, or inspect these documents, including but
            not limited to raw supplier invoices, email agreements, or transaction confirmations
            between Mother India Tour Travels and its business partners.
          </p>
          <p>
            Furthermore, Mother India Tour Travels is under no obligation to provide a detailed cost
            breakdown of forfeited amounts resulting from cancellations or cancellations charges.
          </p>
        </>
      ),
    },
    {
      id: "customer-responsibility",
      title: "Customer Responsibility",
      content: (
        <>
          <p>
            It is the responsibility of the traveler to review and understand the cancellation,
            amendment, and refund policies before confirming any booking.
          </p>
          <p>
            Proceeding with the advance payment or full package payment constitutes full and final
            acceptance of all terms, conditions, and cancellation charges detailed on this page and
            in the itinerary documentation.
          </p>
        </>
      ),
    },
    {
      id: "loss-and-damage",
      title: "Loss or Damage Liability",
      content: (
        <>
          <p>
            Mother India Tour Travels (operated as a registered travel agency in Delhi) is not
            liable for any loss, theft, or damage to personal belongings, luggage, or valuables
            during transfers, hotel stays, or activities.
          </p>
          <p>
            In the event of baggage loss or theft, the traveler must lodge complaints directly with
            local police or transport authorities.
          </p>
        </>
      ),
    },
    {
      id: "cancellation-contact",
      title: "How to Request a Cancellation",
      content: (
        <p>
          If you need to cancel a package or request booking changes, please{" "}
          <a
            href="/contact"
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            contact us
          </a>{" "}
          directly or email our support desk at{" "}
          <a
            href={`mailto:${companyData?.email || "tourtravelsmotherindia@gmail.com"}`}
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            {companyData?.email || "tourtravelsmotherindia@gmail.com"}
          </a>
          . Our travel coordinators will guide you through the cancellation process and outline any
          penalties or eligible refunds.
        </p>
      ),
    },
  ];

  const introText =
    "We understand that sometimes travel plans change. This Cancellation & Refund Policy outlines the terms, timelines, and fees associated with cancelling your travel packages, hotel stays, and transport arrangements with Mother India Tour Travels.";

  return (
    <>
      <BreadcrumbJsonLd path="/cancellation-policy" />
      <PolicyLayout
        title="Cancellation & Refund Policy"
        lastUpdated="July 21st, 2026"
        introText={introText}
        sections={sections}
        companyData={companyData}
      />
    </>
  );
}
