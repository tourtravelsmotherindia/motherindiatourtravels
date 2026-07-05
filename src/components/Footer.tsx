"use client";

import React from "react";
import Link from "next/link";
import Image from "next/image";
import { Mail, Phone, MapPin, ShieldCheck } from "lucide-react";

export default function Footer() {
  return (
    <footer className="bg-brand-dark text-white pt-16 pb-8 border-t border-brand/20">
      <div className="max-w-[1440px] mx-auto px-4 md:px-8 grid grid-cols-1 md:grid-cols-4 gap-10 mb-12">
        {/* Brand Column */}
        <div className="flex flex-col gap-4">
          <Link href="/" className="flex items-center gap-2 group">
            <Image
              src="/logo.png?v=456"
              alt="Mother India Tour Travels Logo"
              width={120}
              height={44}
              className="h-11 w-auto object-contain transition-transform group-hover:scale-103 duration-300"
            />
          </Link>
          <p className="text-xs text-white/70 font-medium leading-relaxed mt-2">
            Experience the magic of India with custom guided tours, serene houseboat cruises, majestic desert safaris, and spiritual Himalayan retreats.
          </p>
          {/* Social Icons */}
          <div className="flex items-center gap-3 mt-2">
            <a
              href="#"
              className="w-8 h-8 rounded-full border border-white/20 hover:border-white hover:bg-white/10 flex items-center justify-center transition-all duration-200 text-white"
              aria-label="Instagram"
            >
              <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
            </a>
            <a
              href="#"
              className="w-8 h-8 rounded-full border border-white/20 hover:border-white hover:bg-white/10 flex items-center justify-center transition-all duration-200 text-white"
              aria-label="Facebook"
            >
              <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
            </a>
            <a
              href="#"
              className="w-8 h-8 rounded-full border border-white/20 hover:border-white hover:bg-white/10 flex items-center justify-center transition-all duration-200 text-white"
              aria-label="Twitter"
            >
              <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path></svg>
            </a>
          </div>
        </div>

        {/* Quick Links */}
        <div>
          <h4 className="text-sm font-extrabold uppercase tracking-wider text-brand-light mb-5">
            Quick Links
          </h4>
          <ul className="flex flex-col gap-3">
            {["Home", "Trips", "About", "Blog", "Contact"].map((link) => (
              <li key={link}>
                <Link
                  href="#"
                  className="text-xs font-semibold text-white/70 hover:text-white hover:translate-x-1 transition-all duration-200 inline-block"
                >
                  {link}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Popular Adventures */}
        <div>
          <h4 className="text-sm font-extrabold uppercase tracking-wider text-brand-light mb-5">
            Popular Trips
          </h4>
          <ul className="flex flex-col gap-3">
            {["Himalayan Heights", "Kerala Backwaters", "Rajasthan Desert", "Taj Mahal & Golden Triangle"].map((trip) => (
              <li key={trip}>
                <Link
                  href="#"
                  className="text-xs font-semibold text-white/70 hover:text-white hover:translate-x-1 transition-all duration-200 inline-block"
                >
                  {trip}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Contact Info & Newsletter */}
        <div className="flex flex-col gap-5">
          <div>
            <h4 className="text-sm font-extrabold uppercase tracking-wider text-brand-light mb-5">
              Contact Us
            </h4>
            <ul className="flex flex-col gap-3.5">
              <li className="flex items-center gap-3 text-xs font-semibold text-white/70">
                <MapPin className="w-4 h-4 text-brand-light shrink-0" />
                <span>123 Heritage Way, New Delhi, India</span>
              </li>
              <li className="flex items-center gap-3 text-xs font-semibold text-white/70">
                <Phone className="w-4 h-4 text-brand-light shrink-0" />
                <span>+91 98765 43210</span>
              </li>
              <li className="flex items-center gap-3 text-xs font-semibold text-white/70">
                <Mail className="w-4 h-4 text-brand-light shrink-0" />
                <span>contact@motherindiatravels.com</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      {/* Footer Bottom Bar */}
      <div className="max-w-[1440px] mx-auto px-4 md:px-8 pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between gap-4">
        <p className="text-[10px] font-bold text-white/50 uppercase tracking-wider">
          © {new Date().getFullYear()} Mother India Tour Travels. All rights reserved.
        </p>
        <div className="flex items-center gap-1 text-[10px] font-bold text-white/50 uppercase tracking-wider">
          <ShieldCheck className="w-4 h-4 text-brand-light" />
          <span>Government Registered Tour Operator</span>
        </div>
      </div>
    </footer>
  );
}
