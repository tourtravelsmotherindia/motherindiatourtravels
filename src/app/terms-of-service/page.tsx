import React from "react";

import PolicyLayout from "@/components/layout/PolicyLayout";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

export const metadata = {
  title: "Terms of Service | Mother India Tour Travels",
  description:
    "Read the Terms of Service of Mother India Tour Travels. Understand the terms, guidelines, and policies governing our tour packages and services.",
  alternates: {
    canonical: "/terms-of-service/",
  },
};

export default async function TermsOfServicePage() {
  const companyData = await getCompanyData();

  const sections = [
    {
      id: "applicability",
      title: "Applicability of the Agreement",
      content: (
        <>
          <p>
            This agreement (user agreement) incorporates the terms and conditions for Mother India
            Tour Travels to provide services to the person(s) ({"'the User'"}) intending to purchase
            or inquiring for any products and/or services of Mother India Tour Travels by using our
            website (https://www.motherindiatourtravels.com) or using any other customer interface
            channels which includes our sales team, office locations, call centers, advertisements,
            or information campaigns.
          </p>
          <p>
            Both the User and Mother India Tour Travels are individually referred to as a{"'party'"}{" "}
            to this agreement and collectively as the {"'parties'"}.
          </p>
        </>
      ),
    },
    {
      id: "user-responsibility",
      title: "User's Responsibility of Cognizance",
      content: (
        <>
          <p>
            The Users availing services from Mother India Tour Travels shall be deemed to have read,
            understood, and expressly accepted the terms and conditions of this agreement, which
            shall govern the transaction or provision of such services for all purposes, and shall
            be binding on the User.
          </p>
          <p>
            All rights and liabilities of the User and/or Mother India Tour Travels with respect to
            any services to be provided shall be restricted to the scope of this agreement. Mother
            India Tour Travels reserves the right, in its sole discretion, to terminate the access
            to any or all of our websites or other sales channels and related services at any time,
            without notice, for maintenance or any reason whatsoever.
          </p>
          <p>
            In addition to this Agreement, there are certain terms of service (TOS) specific to the
            services rendered or products provided (e.g., flight tickets, holiday packages, hotel
            bookings, vehicle rentals). In the event of a conflict between such TOS and this
            Agreement, the terms of this Agreement shall prevail.
          </p>
        </>
      ),
    },
    {
      id: "accuracy-of-info",
      title: "Accuracy of Booking Information",
      content: (
        <>
          <p>
            By using payment gateway linkages on our website, the User authorizes Mother India Tour
            Travels and its designated payment partners to process transactions for retrieving
            requested booking confirmations.
          </p>
          <p>
            When submitting inquiries or booking forms, the User is fully responsible for providing
            accurate and truthful personal details, contact numbers, and travel information. Mother
            India Tour Travels will not be liable for any booking delays or financial loss incurred
            as a result of incorrect or inaccurate information submitted by the User.
          </p>
        </>
      ),
    },
    {
      id: "confidentiality",
      title: "Confidentiality",
      content: (
        <>
          <p>
            Any information which is specifically mentioned by Mother India Tour Travels as
            Confidential shall be maintained confidentially by the User and shall not be disclosed
            unless required by law or to serve the purpose of this agreement and the obligations of
            both the parties therein.
          </p>
        </>
      ),
    },
    {
      id: "website-usage",
      title: "Website Usage",
      content: (
        <>
          <p>
            Your use of any information or materials on our website is entirely at your own risk,
            for which Mother India Tour Travels shall not undertake any liability. It shall be your
            own responsibility to ensure that any products, services, or information available
            through our website meet your explicit specifications.
          </p>
          <p>
            You are restricted from altering, duplicating, distributing, transmitting, reproducing,
            publishing, licensing, or selling any information, software, products, or services
            acquired from this website. Duplication of content from the website is strictly
            forbidden.
          </p>
        </>
      ),
    },
    {
      id: "user-onus",
      title: "Onus of the User",
      content: (
        <>
          <p>
            Mother India Tour Travels is responsible only for transactions done by the User directly
            through us. We are not responsible for screening, censoring, or otherwise controlling
            transactions, including whether the transaction is legal and valid as per the laws of
            the land of the User.
          </p>
          <p>
            The accuracy of the data and bookings must be cross-verified by the User. The User
            warrants that they will abide by all such additional procedures and guidelines, as
            modified from time to time, in connection with the use of the services, and comply with
            all applicable laws and regulations of the jurisdictions concerned.
          </p>
        </>
      ),
    },
    {
      id: "insurance",
      title: "Insurance",
      content: (
        <>
          <p>
            Unless explicitly provided as an inclusion by Mother India Tour Travels in any specific
            holiday package, obtaining sufficient insurance coverage is the sole obligation/option
            of the User, and we do not accept any claims arising out of travel risks.
          </p>
          <p>
            Insurance, if provided as a part of the service, shall be as per the terms and
            conditions of the insuring company. The User shall contact the insurance company
            directly for any claims or disputes, and Mother India Tour Travels shall not provide any
            undertakings for acceptance of the claims by the insurance company.
          </p>
        </>
      ),
    },
    {
      id: "force-majeure",
      title: "Force Majeure Circumstances",
      content: (
        <>
          <p>
            The User agrees that there can be exceptional circumstances where travel service
            providers like airlines, hotels, or transporters may be unable to honor confirmed
            bookings due to reasons like climatic conditions, landslides, road blocks, labor unrest,
            insolvency, business exigencies, government decisions, operational and technical issues,
            route and flight cancellations, etc.
          </p>
          <p>
            If Mother India Tour Travels is informed in advance of such situations, it will make its
            best efforts to provide similar alternatives to its customers or refund the booking
            amount after reasonable service charges, if supported and refunded by the respective
            service operators.
          </p>
          <p>
            In no case shall our liability include any loss, damage, or additional expense
            whatsoever beyond the amount charged by Mother India Tour Travels for its services. We
            shall not be liable for delays or inabilities in performance or nonperformance in whole
            or in part of our obligations due to causes beyond our reasonable control, such as acts
            of God, fires, strikes, acts of government, acts of terrorism, or mountain route
            disruptions.
          </p>
        </>
      ),
    },
    {
      id: "data-safety",
      title: "Safety of Data Downloaded",
      content: (
        <>
          <p>
            The User understands and agrees that any material and/or data downloaded or otherwise
            obtained through the use of our services is done entirely at their own discretion and
            risk, and they will be solely responsible for any damage to their computer systems or
            loss of data that results from the download of such material.
          </p>
        </>
      ),
    },
    {
      id: "proprietary-rights",
      title: "Proprietary Rights",
      content: (
        <>
          <p>
            Our website and promotional emails may contain materials protected by copyrights,
            trademarks, or other intellectual property laws. The User may use this material only as
            expressly authorized by Mother India Tour Travels and shall not copy, transmit, or
            create derivative works without express written authorization.
          </p>
        </>
      ),
    },
    {
      id: "visa-obligations",
      title: "Visa Obligations of the User",
      content: (
        <>
          <p>
            The travel bookings done by Mother India Tour Travels are subject to the visa
            requirements of the individual traveler. We act as a facilitator and guide you with
            formalities, but visa approval rests solely with the concerned embassy. We are not
            liable to refund for any bookings cancelled or untraveled due to visa rejections or
            delays.
          </p>
        </>
      ),
    },
    {
      id: "indemnification",
      title: "Indemnification",
      content: (
        <>
          <p>
            The User agrees to indemnify, defend, and hold harmless Mother India Tour Travels, its
            affiliates, partners, and employees from and against any losses, liabilities, claims,
            damages, costs, and expenses (including legal fees) asserted against or incurred by us
            that arise out of, result from, or may be payable by virtue of, any breach of any
            warranty, covenant, or agreement by the User.
          </p>
        </>
      ),
    },
    {
      id: "right-to-refuse",
      title: "Right to Refuse",
      content: (
        <>
          <p>
            Mother India Tour Travels at its sole discretion reserves the right not to accept any
            customer order or booking request without assigning any reason. Any contract to provide
            travel services is not complete until full payment towards the service is received and
            accepted by us.
          </p>
          <p>
            We reserve the right to limit user activity, warn other users, or suspend registrations
            if the user breaches this agreement or provides unauthenticated details.
          </p>
        </>
      ),
    },
    {
      id: "invalid-info",
      title: "Right to Cancellation in Case of Invalid User Information",
      content: (
        <>
          <p>
            The User undertakes to provide Mother India Tour Travels only correct, accurate, and
            valid information when requesting travel services. Any default or misrepresentation of
            facts will vitiate this agreement and disentitle the User from availing of our services.
          </p>
          <p>
            In case we discover or suspect that information provided is incorrect, unauthorized, or
            fraudulent, Mother India Tour Travels reserves the unrestricted right to cancel the
            bookings without prior intimation to the User, and we shall not be responsible or liable
            for any loss arising from such measures.
          </p>
        </>
      ),
    },
    {
      id: "severability",
      title: "Severability & Headings",
      content: (
        <>
          <p>
            If any provision of this agreement is determined to be invalid or unenforceable in whole
            or in part, such invalidity or unenforceability shall attach only to such provision, and
            the remaining parts of all other provisions shall continue to be in full force and
            effect.
          </p>
          <p>
            Headings are included for convenience and identification only and do not define, limit,
            or interpret the scope of this agreement.
          </p>
        </>
      ),
    },
    {
      id: "updation-of-info",
      title: "Updation of Information",
      content: (
        <>
          <p>
            We endeavor to ensure that the User does not face inconveniences. However, information,
            package itineraries, hotel amenities, and pricing may contain typographical errors or
            inaccuracies. We correct these immediately upon notice and reserve the right to make
            changes and improvements without prior notice.
          </p>
        </>
      ),
    },
    {
      id: "terms-modification",
      title: "Modification of these Terms of Use",
      content: (
        <>
          <p>
            Mother India Tour Travels reserves the right to change the terms, conditions, and
            notices under which our services are offered, including but not limited to the charges.
            The User is responsible for regularly reviewing these terms.
          </p>
        </>
      ),
    },
    {
      id: "health",
      title: "Health Regulations",
      content: (
        <>
          <p>
            When you book a tour with us (or if someone else books a tour in your name), you certify
            that you are physically and mentally fit to travel to your chosen destinations
            (especially high-altitude regions like Ladakh, Himachal Pradesh, or Sikkim).
          </p>
          <p>
            It is your responsibility to maintain your health throughout the tour. Any medical
            expenses, emergency stay-backs, or evacuations shall be borne solely by the traveler.
          </p>
        </>
      ),
    },
    {
      id: "holiday-pictures",
      title: "Usage of Customer's Holiday Pictures",
      content: (
        <>
          <p>
            Any travel photos or videos shared by customers in trip support groups
            (WhatsApp/Telegram) or via email may be shared on our social media platforms (Facebook,
            Instagram, etc.) to engage our audience.
          </p>
          <p>
            If you are not comfortable with this, please drop an email to{" "}
            <a
              href={`mailto:${companyData?.email || "tourtravelsmotherindia@gmail.com"}`}
              className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
            >
              {companyData?.email || "tourtravelsmotherindia@gmail.com"}
            </a>
            , and we will promptly remove or avoid uploading your media.
          </p>
        </>
      ),
    },
    {
      id: "jurisdiction",
      title: "Jurisdiction",
      content: (
        <>
          <p>
            Mother India Tour Travels disclaims any implied warranties imputed by the laws of any
            jurisdiction other than where it operates its main offices.
          </p>
          <p>
            All bookings, transactions, and disputes between the User and the company are subject
            exclusively to the court jurisdictions of <strong>New Delhi, India</strong>.
          </p>
        </>
      ),
    },
  ];

  const introText =
    "Welcome to Mother India Tour Travels. By availing of our services, booking tour packages, or browsing our website, you agree to comply with and be bound by the following Terms of Service. Please read them carefully before finalizing your bookings.";

  return (
    <PolicyLayout
      title="Terms of Service"
      lastUpdated="July 21st, 2026"
      introText={introText}
      sections={sections}
      companyData={companyData}
    />
  );
}
