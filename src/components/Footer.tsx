"use client";

import React, { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Mail, Phone, MapPin, ShieldCheck, Send, CheckCircle2 } from "lucide-react";

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
            Experience the magic of India with custom guided tours, serene houseboat cruises, majestic desert safaris, and spiritual Himalayan retreats. Crafting unforgettable memories since 2012.
          </p>
          {/* Social Icons */}
          <div className="flex items-center gap-3 mt-2">
            {[
              {
                name: "Instagram",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                  </svg>
                ),
                href: "#"
              },
              {
                name: "Facebook",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                  </svg>
                ),
                href: "#"
              },
              {
                name: "Twitter",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path>
                  </svg>
                ),
                href: "#"
              },
              {
                name: "YouTube",
                svg: (
                  <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M22.54 6.42a2.78 2.78 0 0 0-1.95-1.96C18.88 4 12 4 12 4s-6.88 0-8.59.46a2.78 2.78 0 0 0-1.95 1.96A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.41 19c1.71.46 8.59.46 8.59.46s6.88 0 8.59-.46a2.78 2.78 0 0 0 1.95-1.96 29 29 0 0 0 .46-5.33 29 29 0 0 0-.46-5.33z"></path>
                    <polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"></polygon>
                  </svg>
                ),
                href: "#"
              }
            ].map((social) => (
              <a
                key={social.name}
                href={social.href}
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
                <span>123 Heritage Way, Connaught Place, New Delhi, India</span>
              </li>
              <li className="flex items-center gap-2.5 text-xs text-white/60">
                <Phone className="w-4 h-4 text-brand shrink-0" />
                <span>+91 98765 43210</span>
              </li>
              <li className="flex items-center gap-2.5 text-xs text-white/60">
                <Mail className="w-4 h-4 text-brand shrink-0" />
                <span>contact@motherindiatravels.com</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      {/* Footer Bottom Bar */}
      <div className="max-w-[1440px] mx-auto px-4 md:px-8 pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between gap-6 relative z-10">
        <div className="flex flex-col md:flex-row items-center gap-4 md:gap-8">
          <p className="text-[10px] font-semibold text-white/40 uppercase tracking-widest text-center md:text-left">
            © {new Date().getFullYear()} Mother India Tour Travels. All rights reserved.
          </p>
          <div className="flex gap-4 text-[10px] font-semibold text-white/40 uppercase tracking-widest">
            <Link href="#" className="hover:text-white transition-colors duration-200">Privacy Policy</Link>
            <span>•</span>
            <Link href="#" className="hover:text-white transition-colors duration-200">Terms of Use</Link>
          </div>
        </div>
        <div className="flex items-center gap-2 px-3.5 py-1.5 bg-white/5 border border-white/10 rounded-full text-[10px] font-bold text-white/70 uppercase tracking-wider">
          <ShieldCheck className="w-4 h-4 text-brand" />
          <span>Government Registered Tour Operator</span>
        </div>
      </div>
    </footer>
  );
}
