"use client";

import dynamic from "next/dynamic";
import React, { useState } from "react";

import { useToast } from "@/context/ToastContext";

// Dynamically import the map component to avoid SSR errors
const ContactMap = dynamic(() => import("@/components/ContactMap"), {
  ssr: false,
  loading: () => (
    <div className="w-full h-[450px] bg-neutral-100 flex items-center justify-center text-neutral-400 font-medium rounded-[2.5rem]">
      Loading Location Map...
    </div>
  ),
});

interface CompanyData {
  name: string;
  tagline: string;
  website: string;
  phone: string[];
  email: string;
  address: string;
  working_hours: {
    timezone: string;
    schedule: {
      days: string[];
      hours: { open: string; close: string }[];
    }[];
  };
  latitude?: number | null;
  longitude?: number | null;
}

interface ContactClientProps {
  companyData: CompanyData;
}

export default function ContactClient({ companyData }: ContactClientProps) {
  const { showToast } = useToast();

  const [fullName, setFullName] = useState("");
  const [emailAddress, setEmailAddress] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [message, setMessage] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const getFormattedWorkingHours = () => {
    const schedule = companyData.working_hours?.schedule;
    if (!schedule || !Array.isArray(schedule)) return "";

    const formatTime = (timeStr: string) => {
      const [hourStr, minStr] = timeStr.split(":");
      const hour = parseInt(hourStr, 10);
      const ampm = hour >= 12 ? "PM" : "AM";
      const hour12 = hour % 12 || 12;
      return `${hour12}:${minStr} ${ampm}`;
    };

    const firstSlot = schedule[0];
    const firstHours = firstSlot?.hours?.[0];
    if (!firstHours) return "";

    const allSameTime = schedule.every(
      (slot) =>
        slot.hours?.[0]?.open === firstHours.open && slot.hours?.[0]?.close === firstHours.close,
    );

    const formattedTime = `${formatTime(firstHours.open)} - ${formatTime(firstHours.close)}`;

    if (allSameTime) {
      const allDays = schedule.flatMap((slot) => slot.days);
      const hasMon = allDays.includes("mon");
      const hasSun = allDays.includes("sun");
      if (allDays.length >= 7 || (hasMon && hasSun)) {
        return `Monday - Sunday, ${formattedTime}`;
      }
      return `Everyday, ${formattedTime}`;
    }

    return schedule
      .map((slot) => {
        const daysStr = slot.days.map((d) => d.charAt(0).toUpperCase() + d.slice(1)).join(", ");
        const slotHours = slot.hours?.[0];
        if (!slotHours) return "";
        return `${daysStr}: ${formatTime(slotHours.open)} - ${formatTime(slotHours.close)}`;
      })
      .filter(Boolean)
      .join(" | ");
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!fullName || !emailAddress || !phoneNumber || !message) {
      showToast("error", "Validation Failed", "Please fill in all required fields.");
      return;
    }

    setSubmitting(true);

    // Simulate backend submission
    setTimeout(() => {
      showToast(
        "success",
        "Message Sent!",
        "Thank you for contacting us. We will get back to you shortly.",
      );
      setFullName("");
      setEmailAddress("");
      setPhoneNumber("");
      setMessage("");
      setSubmitting(false);
    }, 1200);
  };

  return (
    <div className="layout-container py-16 sm:py-24">
      {/* Top Grid: Info and Form */}
      <div className="grid grid-cols-1 lg:grid-cols-[1.1fr_0.9fr] gap-12 lg:gap-20 items-start">
        {/* Left Side: Contact Information */}
        <div className="flex flex-col">
          <h1 className="font-display text-4xl sm:text-5xl lg:text-6xl font-bold text-foreground leading-[1.1] tracking-tight">
            Get in —
            <br />
            touch with us
          </h1>
          <p className="text-neutral-500 font-sans text-sm sm:text-base leading-relaxed max-w-lg mt-6">
            {
              "We're here to help! Whether you have a question about our services, need assistance with your account, or want to provide feedback, our team is ready to assist you."
            }
          </p>

          <div className="mt-10 sm:mt-12 flex flex-col gap-8">
            {/* Email Address */}
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

            {/* Phone Numbers */}
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

            {/* Working Hours */}
            <div className="flex flex-col gap-1.5">
              <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-widest font-sans">
                Working Hours
              </span>
              <span className="text-neutral-500 font-sans text-xs sm:text-sm font-medium leading-relaxed">
                Available {getFormattedWorkingHours()}
              </span>
            </div>
          </div>
        </div>

        {/* Right Side: Form Card */}
        <div className="bg-white border border-border-light rounded-[2.5rem] p-6 sm:p-10 shadow-premium">
          <form onSubmit={handleSubmit} className="flex flex-col gap-5 sm:gap-6">
            {/* Full Name */}
            <div className="flex flex-col gap-2">
              <label htmlFor="fullName" className="text-xs font-semibold text-neutral-500 ml-1">
                Full Name
              </label>
              <input
                id="fullName"
                type="text"
                required
                value={fullName}
                onChange={(e) => setFullName(e.target.value)}
                placeholder="Enter your full name..."
                className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm focus:outline-none focus:border-brand focus:ring-1 focus:ring-brand/35 hover:border-neutral-300 font-sans transition-all duration-200 text-foreground"
              />
            </div>

            {/* Email Address */}
            <div className="flex flex-col gap-2">
              <label htmlFor="emailAddress" className="text-xs font-semibold text-neutral-500 ml-1">
                Email Address
              </label>
              <input
                id="emailAddress"
                type="email"
                required
                value={emailAddress}
                onChange={(e) => setEmailAddress(e.target.value)}
                placeholder="Enter your email address..."
                className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm focus:outline-none focus:border-brand focus:ring-1 focus:ring-brand/35 hover:border-neutral-300 font-sans transition-all duration-200 text-foreground"
              />
            </div>

            {/* Phone Number */}
            <div className="flex flex-col gap-2">
              <label htmlFor="phoneNumber" className="text-xs font-semibold text-neutral-500 ml-1">
                Phone Number
              </label>
              <input
                id="phoneNumber"
                type="tel"
                required
                value={phoneNumber}
                onChange={(e) => setPhoneNumber(e.target.value)}
                placeholder="Enter your phone number..."
                className="w-full bg-white border border-neutral-200 rounded-full px-5 py-3 text-sm focus:outline-none focus:border-brand focus:ring-1 focus:ring-brand/35 hover:border-neutral-300 font-sans transition-all duration-200 text-foreground"
              />
            </div>

            {/* Message */}
            <div className="flex flex-col gap-2">
              <label htmlFor="message" className="text-xs font-semibold text-neutral-500 ml-1">
                Message
              </label>
              <textarea
                id="message"
                required
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                placeholder="Enter your message..."
                className="w-full bg-white border border-neutral-200 rounded-[1.5rem] px-5 py-4.5 text-sm focus:outline-none focus:border-brand focus:ring-1 focus:ring-brand/35 hover:border-neutral-300 font-sans transition-all duration-200 min-h-[140px] resize-none text-foreground"
              />
            </div>

            {/* Submit Button */}
            <button
              type="submit"
              disabled={submitting}
              className="w-full sm:w-auto bg-brand hover:bg-brand-hover text-white font-semibold px-8 py-3.5 rounded-full text-sm cursor-pointer shadow-premium hover:shadow-lg transition-all duration-300 flex items-center justify-center gap-2 self-end select-none border-none outline-none disabled:opacity-60 disabled:cursor-not-allowed"
            >
              <span>{submitting ? "Sending..." : "Send Message"}</span>
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

      {/* Bottom Row: Full Width Map */}
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
