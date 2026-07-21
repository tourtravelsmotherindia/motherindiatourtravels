"use client";

import dynamic from "next/dynamic";
import React, { useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import FormField from "@/components/ui/FormField";
import PhoneInput from "@/components/ui/PhoneInput";
import { useToast } from "@/context/ToastContext";
import { useSubmitContact } from "@/lib/hooks/mutations";
import { formatWorkingHours } from "@/lib/utils/formatWorkingHours";
import { type CompanyData } from "@/types/company";

// Dynamically import the map component to avoid SSR errors
const ContactMap = dynamic(() => import("@/components/contact/ContactMap"), {
  ssr: false,
  loading: () => (
    <div className="w-full h-[450px] bg-neutral-100 flex items-center justify-center text-neutral-400 font-medium rounded-[2.5rem]">
      Loading Location Map...
    </div>
  ),
});

interface ContactClientProps {
  companyData: CompanyData;
}

export default function ContactClient({ companyData }: ContactClientProps) {
  const { showToast } = useToast();
  const contactMutation = useSubmitContact();

  const [fullName, setFullName] = useState("");
  const [emailAddress, setEmailAddress] = useState("");
  const [countryCodeVal, setCountryCodeVal] = useState("IN:+91");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [message, setMessage] = useState("");

  const getFormattedWorkingHours = () => {
    return formatWorkingHours(companyData.working_hours, ", ");
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!fullName || !emailAddress || !phoneNumber || !message) {
      showToast("error", "Validation Failed", "Please fill in all required fields.");
      return;
    }

    try {
      const dialCode = countryCodeVal.split(":")[1] ?? "";
      const fullPhone = `${dialCode}${phoneNumber}`.trim();

      await contactMutation.mutateAsync({
        name: fullName,
        email: emailAddress,
        phone: fullPhone,
        message,
        source: "contact_page",
      });

      showToast(
        "success",
        "Message Sent!",
        "Thank you for contacting us. We will get back to you shortly.",
      );
      setFullName("");
      setEmailAddress("");
      setCountryCodeVal("IN:+91");
      setPhoneNumber("");
      setMessage("");
    } catch (err) {
      const errMsg = err instanceof Error ? err.message : "Something went wrong. Please try again.";
      showToast("error", "Submission Failed", errMsg);
    }
  };

  return (
    <div className="layout-container py-16 sm:py-24">
      <div className="grid grid-cols-1 lg:grid-cols-[1.1fr_0.9fr] gap-12 lg:gap-20 items-start">
        <div className="flex flex-col">
          <Breadcrumbs
            items={[{ label: "Home", href: "/" }, { label: "Contact" }]}
            variant="brackets"
          />

          <h1 className="font-display text-4xl sm:text-5xl lg:text-6xl font-bold text-foreground leading-[1.1] tracking-tight">
            Get in —
            <br />
            touch with us
          </h1>
          <p className="text-neutral-800 font-sans text-sm sm:text-base leading-relaxed max-w-lg mt-6">
            {
              "We're here to help! Whether you have a question about our services, need assistance with your account, or want to provide feedback, our team is ready to assist you."
            }
          </p>

          <div className="mt-10 sm:mt-12 flex flex-col gap-8">
            <div className="flex flex-col gap-1.5">
              <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest font-sans">
                Email
              </span>
              <a
                href={`mailto:${companyData.email}`}
                className="text-neutral-900 font-display text-lg sm:text-xl lg:text-2xl font-semibold hover:text-brand transition-colors duration-200"
              >
                {companyData.email}
              </a>
            </div>

            <div className="flex flex-col gap-1.5">
              <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest font-sans">
                Phone
              </span>
              <div className="flex flex-wrap items-center gap-x-2.5 gap-y-1">
                {companyData.phone.map((phoneNum, idx) => (
                  <React.Fragment key={phoneNum}>
                    {idx > 0 && (
                      <span className="text-neutral-300 font-sans text-sm sm:text-base">|</span>
                    )}
                    <a
                      href={`tel:${phoneNum}`}
                      className="text-neutral-900 font-display text-lg sm:text-xl lg:text-2xl font-semibold hover:text-brand transition-colors duration-200"
                    >
                      {phoneNum}
                    </a>
                  </React.Fragment>
                ))}
              </div>
            </div>

            <div className="flex flex-col gap-1.5">
              <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest font-sans">
                Working Hours
              </span>
              <span className="text-neutral-800 font-sans text-xs sm:text-sm font-medium leading-relaxed">
                Available {getFormattedWorkingHours()}
              </span>
            </div>
          </div>
        </div>

        <div className="bg-white border border-border-light rounded-[2.5rem] p-6 sm:p-10 shadow-premium">
          <form onSubmit={handleSubmit} className="flex flex-col gap-5 sm:gap-6">
            <FormField
              id="fullName"
              label="Full Name"
              type="text"
              required
              value={fullName}
              onChange={setFullName}
              placeholder="Enter your full name..."
            />

            <FormField
              id="emailAddress"
              label="Email Address"
              type="email"
              required
              value={emailAddress}
              onChange={setEmailAddress}
              placeholder="Enter your email address..."
            />

            <PhoneInput
              id="phoneNumber"
              label="Phone Number"
              phoneNumber={phoneNumber}
              onChange={setPhoneNumber}
              countryCodeVal={countryCodeVal}
              onChangeCountryCode={setCountryCodeVal}
              placeholder="Enter your phone number..."
              required
            />

            <FormField
              id="message"
              label="Message"
              type="textarea"
              required
              value={message}
              onChange={setMessage}
              placeholder="Enter your message..."
            />

            <button
              type="submit"
              disabled={contactMutation.isPending}
              className="w-full sm:w-auto bg-brand hover:bg-brand-hover text-white font-semibold px-8 py-3.5 rounded-full text-sm cursor-pointer shadow-premium hover:shadow-lg transition-all duration-300 flex items-center justify-center gap-2 self-end select-none border-none outline-none disabled:opacity-60 disabled:cursor-not-allowed"
            >
              <span>{contactMutation.isPending ? "Sending..." : "Send Message"}</span>
              <svg
                className="w-4 h-4 transition-transform duration-200 group-hover:translate-x-1"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"
                />
              </svg>
            </button>
          </form>
        </div>
      </div>

      <div className="mt-16 sm:mt-24">
        <ContactMap
          address={companyData.address}
          latitude={companyData.latitude}
          longitude={companyData.longitude}
        />
      </div>
    </div>
  );
}
