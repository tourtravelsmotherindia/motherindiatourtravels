"use client";

import React, { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Mail, Phone, MapPin, ArrowRight, CheckCircle2 } from "lucide-react";
import companyData from "@/data/company.json";

export default function Footer() {
  const [email, setEmail] = useState("");
  const [subscribed, setSubscribed] = useState(false);

  const handleSubscribe = (e: React.FormEvent) => {
    e.preventDefault();
    if (email.trim()) {
      setSubscribed(true);
      setTimeout(() => setSubscribed(false), 5000);
      setEmail("");
    }
  };

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
        slot.hours?.[0]?.open === firstHours.open &&
        slot.hours?.[0]?.close === firstHours.close
    );

    const formattedTime = `${formatTime(firstHours.open)} - ${formatTime(firstHours.close)}`;

    if (allSameTime) {
      const allDays = schedule.flatMap((slot) => slot.days);
      const hasMon = allDays.includes("mon");
      const hasSun = allDays.includes("sun");
      if (allDays.length >= 7 || (hasMon && hasSun)) {
        return `Monday - Sunday: ${formattedTime}`;
      }
      return `Everyday: ${formattedTime}`;
    }

    return schedule
      .map((slot) => {
        const daysStr = slot.days
          .map((d) => d.charAt(0).toUpperCase() + d.slice(1))
          .join(", ");
        const slotHours = slot.hours?.[0];
        if (!slotHours) return "";
        return `${daysStr}: ${formatTime(slotHours.open)} - ${formatTime(slotHours.close)}`;
      })
      .filter(Boolean)
      .join(" | ");
  };

  // We can render social media links dynamically
  const socialIcons = [
    {
      name: "Facebook",
      svg: (
        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
        </svg>
      ),
      href: companyData.social_media.facebook
    },
    {
      name: "Instagram",
      svg: (
        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
          <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
          <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
        </svg>
      ),
      href: companyData.social_media.instagram
    },
    {
      name: "Twitter",
      svg: (
        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path>
        </svg>
      ),
      href: companyData.social_media.twitter
    },
    {
      name: "WhatsApp",
      svg: (
        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
        </svg>
      ),
      href: companyData.social_media.whatsapp
    }
  ];

  return (
    <footer id="contact" className="bg-[#F9F9F9] border-t border-neutral-200 text-neutral-600 pt-16 pb-12 relative overflow-hidden font-sans">
      <div className="max-w-[1440px] mx-auto px-4 md:px-8">
        
        {/* Top Section: Newsletter and Socials */}
        <div className="flex flex-col md:flex-row items-stretch gap-8 md:gap-0 pb-12 border-b border-neutral-200">
          {/* Left: Heading and Social Icons */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6 flex-1 pr-0 md:pr-12">
            <h3 className="text-2xl font-extrabold text-neutral-900 tracking-tight leading-tight max-w-[200px]">
              Leading the way in adventure
            </h3>
            <div className="flex items-center gap-3">
              {socialIcons.map((social) => (
                <a
                  key={social.name}
                  href={social.href}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-10 h-10 rounded-full bg-white text-neutral-800 shadow-[0_2px_8px_rgba(0,0,0,0.06)] hover:bg-brand hover:text-white flex items-center justify-center transition-all duration-300 border border-neutral-100"
                  aria-label={social.name}
                >
                  {social.svg}
                </a>
              ))}
            </div>
          </div>

          {/* Separator line */}
          <div className="hidden md:block w-px bg-neutral-200 self-stretch my-2"></div>
          <div className="block md:hidden h-px bg-neutral-200 w-full"></div>

          {/* Right: Newsletter Join */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6 flex-1 pl-0 md:pl-12">
            <h3 className="text-2xl font-extrabold text-neutral-900 tracking-tight leading-tight">
              Join our<br className="hidden sm:inline" /> Newsletter
            </h3>
            <div className="w-full max-w-[320px]">
              {subscribed ? (
                <div className="flex items-center gap-2 text-emerald-600 bg-emerald-50 border border-emerald-100 rounded-full py-2 px-4 text-xs font-semibold">
                  <CheckCircle2 className="w-4 h-4 shrink-0" />
                  <span>Subscribed successfully!</span>
                </div>
              ) : (
                <form onSubmit={handleSubscribe} className="flex items-center bg-white border border-neutral-200 rounded-full p-1 pl-4 w-full shadow-[0_2px_8px_rgba(0,0,0,0.02)]">
                  <input
                    type="email"
                    required
                    placeholder="Enter your e-mail"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="bg-transparent border-none outline-none text-sm text-neutral-800 placeholder-neutral-400 flex-grow min-w-0"
                  />
                  <button
                    type="submit"
                    className="w-10 h-10 rounded-full bg-black text-white flex items-center justify-center hover:bg-brand transition-colors duration-200 shrink-0 cursor-pointer"
                    aria-label="Subscribe"
                  >
                    <ArrowRight className="w-4 h-4" />
                  </button>
                </form>
              )}
            </div>
          </div>
        </div>

        {/* Bottom Section: Grid Columns */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-12 gap-12 pt-16 mb-12">
          {/* Column 1: Logo & About (spans 5 cols on lg) */}
          <div className="lg:col-span-5 flex flex-col gap-5">
            <Link href="/" className="flex items-center gap-3 group w-max">
              <Image
                src="/logo.png?v=234567"
                alt="Mother India Tour Travels Logo"
                width={48}
                height={48}
                className="h-12 w-12 object-contain transition-transform group-hover:scale-105 duration-300"
              />
              <span className="font-sans text-lg lg:text-xl font-extrabold text-neutral-900 tracking-tight leading-none whitespace-nowrap">
                Mother India Tour Travels
              </span>
            </Link>
            <p className="text-sm text-neutral-500 font-medium leading-relaxed max-w-md">
              {companyData.about}
            </p>
          </div>

          {/* Column 2: Contact (spans 3 cols on lg) */}
          <div className="lg:col-span-3 flex flex-col gap-4">
            <h4 className="text-xs font-bold uppercase tracking-widest text-neutral-900">
              Contact
            </h4>
            <ul className="flex flex-col gap-3 text-sm text-neutral-500 font-medium">
              {companyData.phone.map((phoneNum, idx) => (
                <li key={idx} className="flex items-center gap-2.5">
                  <Phone className="w-4 h-4 text-neutral-400 shrink-0" />
                  <a href={`tel:${phoneNum.replace(/\s+/g, "")}`} className="hover:text-neutral-950 transition-colors duration-200">
                    {phoneNum}
                  </a>
                </li>
              ))}
              <li className="flex items-center gap-2.5">
                <Mail className="w-4 h-4 text-neutral-400 shrink-0" />
                <a href={`mailto:${companyData.email}`} className="hover:text-neutral-950 transition-colors duration-200 break-all">
                  {companyData.email}
                </a>
              </li>
              <li className="flex items-start gap-2.5">
                <MapPin className="w-4 h-4 text-neutral-400 shrink-0 mt-0.5" />
                <span>{companyData.address}</span>
              </li>
              <li className="pt-2 border-t border-neutral-200/60 mt-1">
                <div className="text-[11px] font-bold uppercase tracking-wider text-neutral-400 mb-1">
                  Working Hours
                </div>
                <div className="text-xs text-neutral-500 font-semibold normal-case">
                  {getFormattedWorkingHours()}
                </div>
              </li>
            </ul>
          </div>

          {/* Column 3: Quick Links (spans 2 cols on lg) */}
          <div className="lg:col-span-2 flex flex-col gap-4">
            <h4 className="text-xs font-bold uppercase tracking-widest text-neutral-900">
              Quick Links
            </h4>
            <ul className="flex flex-col gap-2.5 text-sm text-neutral-500 font-medium">
              {[
                { name: "Home", href: "#home" },
                { name: "About Us", href: "#about" },
                { name: "Tour Packages", href: "#packages" },
                { name: "Travel Blog", href: "#blog" },
                { name: "FAQs", href: "#faq" },
                { name: "Gallery", href: "#gallery" },
                { name: "Contact Us", href: "#contact" },
                { name: "Privacy Policy", href: "#" },
                { name: "Terms of Use", href: "#" },
              ].map((link) => (
                <li key={link.name}>
                  <Link
                    href={link.href}
                    className="hover:text-neutral-950 hover:translate-x-1 transition-all duration-200 inline-block"
                  >
                    {link.name}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Column 4: Popular Trips (spans 2 cols on lg) */}
          <div className="lg:col-span-2 flex flex-col gap-4">
            <h4 className="text-xs font-bold uppercase tracking-widest text-neutral-900">
              Popular Trips
            </h4>
            <ul className="flex flex-col gap-2.5 text-sm text-neutral-500 font-medium">
              {[
                { name: "Himalayan Heights", href: "#" },
                { name: "Kerala Backwaters", href: "#" },
                { name: "Rajasthan Desert Safari", href: "#" },
                { name: "Taj Mahal & Golden Triangle", href: "#" },
              ].map((trip) => (
                <li key={trip.name}>
                  <Link
                    href={trip.href}
                    className="hover:text-neutral-950 hover:translate-x-1 transition-all duration-200 inline-block"
                  >
                    {trip.name}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Footer Copyright */}
        <div className="pt-8 border-t border-neutral-200 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p className="text-xs font-medium text-neutral-400 text-center sm:text-left">
            © {new Date().getFullYear()} {companyData.name}. All rights reserved.
          </p>
        </div>

      </div>
    </footer>
  );
}
