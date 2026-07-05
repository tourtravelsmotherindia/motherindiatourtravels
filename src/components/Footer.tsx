"use client";

import React, { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Mail, Phone, MapPin, ShieldCheck, Send, CheckCircle2 } from "lucide-react";
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

  return (
    <footer id="contact" className="bg-brand-dark text-white pt-16 pb-8 border-t border-white/10 relative overflow-hidden">
      {/* Decorative background light glow */}
      <div className="absolute top-0 left-1/4 w-96 h-96 bg-white/[0.01] rounded-full blur-3xl pointer-events-none" />
      
      <div className="max-w-[1440px] mx-auto px-4 md:px-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16 relative z-10">
        {/* Brand Column */}
        <div className="flex flex-col gap-5">
          <Link href="/" className="flex items-center gap-3 group w-max">
            <Image
              src="/logo.png?v=456"
              alt="Mother India Tour Travels Logo"
              width={44}
              height={44}
              className="h-11 w-11 object-contain transition-transform group-hover:scale-105 duration-300"
            />
            <span className="font-sans text-base lg:text-lg font-extrabold text-white tracking-tight leading-none whitespace-nowrap">
              Mother India Tour Travels
            </span>
          </Link>
          <p className="text-xs text-white/60 font-medium leading-relaxed max-w-sm">
            {companyData.about}
          </p>
          {/* Social Icons */}
          <div className="flex items-center gap-3 mt-2">
            {[
              {
                name: "Facebook",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                  </svg>
                ),
                href: companyData.social_media.facebook
              },
              {
                name: "Instagram",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
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
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path>
                  </svg>
                ),
                href: companyData.social_media.twitter
              },
              {
                name: "LinkedIn",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                    <rect x="2" y="9" width="4" height="12"></rect>
                    <circle cx="4" cy="4" r="2"></circle>
                  </svg>
                ),
                href: companyData.social_media.linkedin
              },
              {
                name: "Pinterest",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M8 22c.5-1.5 1.5-4.5 1.5-4.5s-.38-.75-.38-1.88c0-1.75 1-3.08 2.3-3.08 1.08 0 1.6.82 1.6 1.8 0 1.09-.7 2.73-1.05 4.25-.3 1.25.62 2.27 1.85 2.27 2.23 0 3.95-2.35 3.95-5.75 0-3-2.17-5.1-5.26-5.1-3.58 0-5.69 2.68-5.69 5.46 0 1.08.42 2.25.94 2.88.1.13.1.25.07.38l-.35 1.48c-.06.25-.2.32-.46.2-1.72-.8-2.67-3.32-2.67-5.35 0-4.36 3.17-8.36 9.13-8.36 4.8 0 8.52 3.42 8.52 7.98 0 4.77-3.01 8.61-7.18 8.61-1.4 0-2.72-.73-3.17-1.59l-.86 3.29c-.31 1.2-1.15 2.71-1.72 3.65 1.3.38 2.67.59 4.09.59 7.73 0 14-6.27 14-14S19.73 2 12 2 0 8.27 0 16c0 2.8 1.08 5.36 2.87 7.28a8 8 0 0 1-.87-4.28c0-.75.06-1.5.17-2.25l1.83-7.75"></path>
                  </svg>
                ),
                href: companyData.social_media.pinterest
              },
              {
                name: "WhatsApp",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
                  </svg>
                ),
                href: companyData.social_media.whatsapp
              }
            ].map((social) => (
              <a
                key={social.name}
                href={social.href}
                target="_blank"
                rel="noopener noreferrer"
                className="w-9 h-9 rounded-full border border-white/10 hover:border-brand hover:bg-brand flex items-center justify-center transition-all duration-300 text-white/70 hover:text-white"
                aria-label={social.name}
              >
                {social.svg}
              </a>
            ))}
          </div>
        </div>

        {/* Quick Links Column */}
        <div className="flex flex-col gap-5 lg:pl-4">
          <h4 className="text-xs font-extrabold uppercase tracking-widest text-brand border-l-2 border-brand pl-3">
            Quick Links
          </h4>
          <ul className="flex flex-col gap-3">
            {[
              { name: "Home", href: "#home" },
              { name: "About Us", href: "#about" },
              { name: "Tour Packages", href: "#packages" },
              { name: "Travel Blog", href: "#blog" },
              { name: "FAQs", href: "#faq" },
              { name: "Gallery", href: "#gallery" },
              { name: "Contact Us", href: "#contact" },
            ].map((link) => (
              <li key={link.name}>
                <Link
                  href={link.href}
                  className="text-xs font-semibold text-white/60 hover:text-white hover:translate-x-1.5 transition-all duration-200 inline-flex items-center gap-1.5 group"
                >
                  <span className="w-1.5 h-1.5 rounded-full bg-brand scale-0 group-hover:scale-100 transition-transform duration-200" />
                  <span>{link.name}</span>
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Popular Adventures Column */}
        <div className="flex flex-col gap-5">
          <h4 className="text-xs font-extrabold uppercase tracking-widest text-brand border-l-2 border-brand pl-3">
            Popular Trips
          </h4>
          <ul className="flex flex-col gap-3">
            {[
              { name: "Himalayan Heights", href: "#" },
              { name: "Kerala Backwaters", href: "#" },
              { name: "Rajasthan Desert Safari", href: "#" },
              { name: "Taj Mahal & Golden Triangle", href: "#" },
            ].map((trip) => (
              <li key={trip.name}>
                <Link
                  href={trip.href}
                  className="text-xs font-semibold text-white/60 hover:text-white hover:translate-x-1.5 transition-all duration-200 inline-flex items-center gap-1.5 group"
                >
                  <span className="w-1.5 h-1.5 rounded-full bg-brand scale-0 group-hover:scale-100 transition-transform duration-200" />
                  <span>{trip.name}</span>
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Newsletter & Contact Column */}
        <div className="flex flex-col gap-6">
          <div className="flex flex-col gap-3">
            <h4 className="text-xs font-extrabold uppercase tracking-widest text-brand border-l-2 border-brand pl-3">
              Newsletter
            </h4>
            <p className="text-xs text-white/60 leading-relaxed">
              Subscribe for exclusive itineraries, cultural travel guides, and early access to tour offers.
            </p>
            {subscribed ? (
              <div className="flex items-center gap-2 text-emerald-400 bg-emerald-500/10 border border-emerald-500/20 rounded-xl p-3 text-xs font-semibold">
                <CheckCircle2 className="w-4 h-4 shrink-0" />
                <span>Thank you! You have subscribed successfully.</span>
              </div>
            ) : (
              <form onSubmit={handleSubscribe} className="flex gap-2 mt-1">
                <input
                  type="email"
                  required
                  placeholder="Enter your email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="bg-white/5 border border-white/10 focus:border-brand/40 focus:ring-1 focus:ring-brand/40 outline-none rounded-xl px-3.5 py-2 text-xs w-full transition-all text-white placeholder:text-white/40"
                />
                <button
                  type="submit"
                  className="bg-brand hover:bg-brand-hover text-white rounded-xl px-3.5 py-2 flex items-center justify-center transition-colors duration-200 cursor-pointer"
                  aria-label="Subscribe"
                >
                  <Send className="w-3.5 h-3.5" />
                </button>
              </form>
            )}
          </div>

          <div className="flex flex-col gap-3.5 pt-2 border-t border-white/5">
            <h5 className="text-[10px] font-extrabold uppercase tracking-wider text-white/50">
              Direct Contact
            </h5>
            <ul className="flex flex-col gap-3">
              <li className="flex items-start gap-2.5 text-xs text-white/60">
                <MapPin className="w-4 h-4 text-brand shrink-0 mt-0.5" />
                <span>{companyData.address}</span>
              </li>
              {companyData.phone.map((phoneNum, idx) => (
                <li key={idx} className="flex items-center gap-2.5 text-xs text-white/60">
                  <Phone className="w-4 h-4 text-brand shrink-0" />
                  <a href={`tel:${phoneNum.replace(/\s+/g, "")}`} className="hover:text-white transition-colors duration-200">
                    {phoneNum}
                  </a>
                </li>
              ))}
              <li className="flex items-center gap-2.5 text-xs text-white/60">
                <Mail className="w-4 h-4 text-brand shrink-0" />
                <a href={`mailto:${companyData.email}`} className="hover:text-white transition-colors duration-200">
                  {companyData.email}
                </a>
              </li>
              <li className="flex items-start gap-2.5 text-xs text-white/60 pt-2 border-t border-white/5 mt-1">
                <div className="text-[10px] font-extrabold uppercase tracking-wider text-white/40 w-full">
                  Working Hours
                  <div className="font-normal normal-case mt-1 text-white/50 flex flex-col gap-0.5">
                    <span>{companyData.working_hours.weekdays}</span>
                    <span>{companyData.working_hours.weekends}</span>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>

      {/* Footer Bottom Bar */}
      <div className="max-w-[1440px] mx-auto px-4 md:px-8 pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between gap-6 relative z-10">
        <div className="flex flex-col md:flex-row items-center gap-4 md:gap-8">
          <p className="text-[10px] font-semibold text-white/40 uppercase tracking-widest text-center md:text-left">
            © {new Date().getFullYear()} {companyData.name}. All rights reserved.
          </p>
          <div className="flex gap-4 text-[10px] font-semibold text-white/40 uppercase tracking-widest">
            <Link href="#" className="hover:text-white transition-colors duration-200">Privacy Policy</Link>
            <span>•</span>
            <Link href="#" className="hover:text-white transition-colors duration-200">Terms of Use</Link>
          </div>
        </div>
        <div className="flex flex-wrap items-center gap-2.5">
          <div className="flex items-center gap-2 px-3.5 py-1.5 bg-white/5 border border-white/10 rounded-full text-[10px] font-bold text-white/70 uppercase tracking-wider">
            <ShieldCheck className="w-4 h-4 text-brand" />
            <span>Government Registered Tour Operator</span>
          </div>
          {companyData.certifications.map((cert, idx) => (
            <div key={idx} className="flex items-center gap-1.5 px-3 py-1.5 bg-white/5 border border-white/10 rounded-full text-[10px] font-bold text-white/70 uppercase tracking-wider">
              <span>{cert}</span>
            </div>
          ))}
        </div>
      </div>
    </footer>
  );
}
