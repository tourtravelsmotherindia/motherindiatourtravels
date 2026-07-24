import React from "react";

import PolicyLayout from "@/components/layout/PolicyLayout";
import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

export const metadata = {
  title: "Privacy Policy | Mother India Tour Travels",
  description:
    "Read the Privacy Policy of Mother India Tour Travels to understand how we collect, use, protect, and handle your personal information.",
  alternates: {
    canonical: "/privacy-policy/",
  },
};

export default async function PrivacyPolicyPage() {
  const companyData = await getCompanyData();

  const sections = [
    {
      id: "what-we-collect",
      title: "What Personal Information we collect",
      content: (
        <>
          <p>
            We collect personal information to provide you with seamless travel booking services.
            This includes information you provide directly during booking, inquiry, or registration,
            as well as data gathered automatically when you browse our site.
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Personal Identifiers:</strong> Full name, email address, contact numbers
              (including WhatsApp), and billing/mailing address.
            </li>
            <li>
              <strong>Travel & Booking Information:</strong> Destination choices, planned travel
              dates, co-traveler details, special dietary or lodging preferences, and emergency
              contact details.
            </li>
            <li>
              <strong>Official Documentation:</strong> Passport details, visa copies, and
              government-issued photo identity cards (e.g., Aadhaar Card, PAN Card, Voter ID)
              required for booking domestic inner-line permits (e.g., for Ladakh or Sikkim),
              flights, and international tours.
            </li>
            <li>
              <strong>Payment Information:</strong> Transaction details, UPI IDs, or bank transfer
              confirmation notes.{" "}
              <em>
                Please note: We do not store credit or debit card details on our servers. All online
                card transactions are processed securely through certified payment gateways.
              </em>
            </li>
            <li>
              <strong>Technical Usage Data:</strong> Your IP address, browser type, device
              information, operating system, and data collected via analytical cookies or tracking
              pixels.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "how-we-use-it",
      title: "What we do with the Personal Information we collect",
      content: (
        <>
          <p>
            Mother India Tour Travels uses the information collected from you for the following
            specific purposes:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>To process and finalize your flight, hotel, and transport bookings.</li>
            <li>To customize travel itineraries according to your unique interests and needs.</li>
            <li>
              To apply for required travel permits, embassy visas, and travel insurance policies on
              your behalf.
            </li>
            <li>
              To send you transactional updates, booking confirmations, invoices, and itinerary
              changes.
            </li>
            <li>To respond to your questions, support requests, or customer feedback.</li>
            <li>
              To share marketing communication, special deals, or newsletters (only if you have
              explicitly subscribed to receive them).
            </li>
            <li>
              To monitor website traffic, analyze user behavior, and improve our online services.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "when-we-disclose",
      title: "When we Disclose Personal Information",
      content: (
        <>
          <p>
            We do not sell, rent, or trade your personal information to third parties. We share your
            information only with authorized parties necessary to complete your travel arrangements:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Primary Travel Suppliers:</strong> Hotels, flight carriers, transport
              operators, tour guides, and local coordinators responsible for executing your trip
              components.
            </li>
            <li>
              <strong>Service Providers:</strong> Secure payment gateways, IT support providers,
              customer relationship systems, and email dispatch tools.
            </li>
            <li>
              <strong>Legal Authorities:</strong> Government agencies, forest/border control
              checkposts (for restricted area permits), or law enforcement bodies when strictly
              required under Indian laws or regulatory procedures.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "cookies-and-tracking",
      title: "How we use cookies and collect information using technology",
      content: (
        <>
          <p>
            Our website uses cookies and similar tracking systems to improve your navigation
            experience. Cookies are small data files placed on your device:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Essential Cookies:</strong> Needed to run critical website features like user
              logins, translation widgets, and search inputs.
            </li>
            <li>
              <strong>Performance & Analytics Cookies:</strong> We run Google Analytics and Google
              Tag Manager to compile anonymous traffic data, helping us optimize the design and
              loading speed of our site.
            </li>
            <li>
              <strong>Functional Preferences:</strong> Cookies that remember your preferred language
              or region choice for translation scripts.
            </li>
          </ul>
          <p className="mt-4">
            You can modify your browser settings to decline cookies or choose to opt-out via the
            cookie consent panel that appears when you visit our website.
          </p>
        </>
      ),
    },
    {
      id: "security",
      title: "Security",
      content: (
        <>
          <p>
            We prioritize the security of your data. We implement physical, electronic, and
            administrative controls to protect against unauthorized access, loss, or alteration:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              HTTPS encryption (SSL) is deployed across our entire website to secure data in
              transit.
            </li>
            <li>
              Internal access to booking details and personal documentation is restricted to staff
              members on a strict need-to-know basis.
            </li>
            <li>
              We partner only with industry-standard, secure payment gateways and booking platforms.
            </li>
          </ul>
          <p className="mt-4">
            Although we take extensive measures to guard your data, no method of transmission over
            the internet is completely impenetrable, and we cannot guarantee absolute security.
          </p>
        </>
      ),
    },
    {
      id: "international-transfers",
      title: "We may Transfer Personal Information to Other Countries",
      content: (
        <>
          <p>
            If you book an international holiday package (such as tours to Nepal, Bhutan, Thailand,
            Malaysia, or the UAE), we must share your personal identifiers, passport documents, and
            booking details with suppliers, hotels, and ground handlers operating in those
            respective destination countries.
          </p>
          <p>
            By booking an international tour with us, you acknowledge and consent to this transfer
            of data across international borders, which is necessary to deliver your selected travel
            packages.
          </p>
        </>
      ),
    },
    {
      id: "links-to-other-sites",
      title: "Links to other websites",
      content: (
        <>
          <p>
            Our website contains links to external web portals (such as government visa portals,
            airline check-in pages, or third-party mapping providers). We do not control, and are
            not responsible for, the privacy protocols, terms of use, or content of those external
            websites.
          </p>
          <p>
            We recommend reading the privacy policies of any linked websites you choose to visit.
          </p>
        </>
      ),
    },
    {
      id: "your-choices",
      title: "Your Choices",
      content: (
        <>
          <p>You have control over how your information is handled:</p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Marketing Communication:</strong> You can unsubscribe from our newsletters and
              promo emails at any time by clicking the &quot;unsubscribe&quot; link in our emails.
            </li>
            <li>
              <strong>Cookie Control:</strong> You can choose to reject cookies or adjust browser
              rules to delete cookies on exit.
            </li>
            <li>
              <strong>Do-Not-Track:</strong> You can browse our website anonymously or in incognito
              mode to limit automatic tracking.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "access-and-correction",
      title: "Accessing and Correcting your Personal Information",
      content: (
        <>
          <p>
            You have the right to request access to the personal data we store, request updates to
            correct errors, or ask for the deletion of your personal data from our systems (subject
            to active bookings or legal record-keeping obligations).
          </p>
          <p>
            To submit a request, please send an email to our support team at{" "}
            <a
              href={`mailto:${companyData?.email || "tourtravelsmotherindia@gmail.com"}`}
              className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
            >
              {companyData?.email || "tourtravelsmotherindia@gmail.com"}
            </a>
            . We will review and respond to your request within a reasonable timeframe.
          </p>
        </>
      ),
    },
    {
      id: "children",
      title: "Children",
      content: (
        <>
          <p>
            Our travel booking services are not directly marketed to individuals under the age of
            18. We do not knowingly collect personal data from minors without parental or guardian
            verification.
          </p>
          <p>
            If a parent or guardian discovers that a child has shared personal information with us
            without consent, please contact us immediately so we can remove the data.
          </p>
        </>
      ),
    },
    {
      id: "contact-us",
      title: "Contact Us",
      content: (
        <p>
          If you have any questions, feedback, or concerns regarding our Privacy Policy or data
          handling procedures, please feel free to{" "}
          <a
            href="/contact"
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            contact us
          </a>{" "}
          directly or email us at{" "}
          <a
            href={`mailto:${companyData?.email || "tourtravelsmotherindia@gmail.com"}`}
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            {companyData?.email || "tourtravelsmotherindia@gmail.com"}
          </a>
          .
        </p>
      ),
    },
  ];

  const introText =
    "At Mother India Tour Travels, we are committed to protecting your personal information and your right to privacy. This Privacy Policy explains how we collect, use, share, and safeguard your data when you visit our website, book our packages, or engage with us in any way.";

  return (
    <>
      <BreadcrumbJsonLd path="/privacy-policy" />
      <PolicyLayout
        title="Privacy Policy"
        lastUpdated="July 21st, 2026"
        introText={introText}
        sections={sections}
        companyData={companyData}
      />
    </>
  );
}
