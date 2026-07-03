"use client";

import { useState, type FormEvent } from "react";

export default function ContactForm() {
  const [submitted, setSubmitted] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    // Simulate submission (replace with actual form handling)
    setTimeout(() => {
      setLoading(false);
      setSubmitted(true);
    }, 1000);
  };

  if (submitted) {
    return (
      <div className="bg-green/10 border border-green rounded-xl p-8 text-center">
        <div className="w-16 h-16 rounded-full bg-green/30 text-green flex items-center justify-center mx-auto mb-4">
          <i className="bi bi-check-lg text-3xl" />
        </div>
        <h3 className="text-xl font-bold text-black mb-2">Thank You!</h3>
        <p className="text-secondary">
          Your message has been sent. We&apos;ll get back to you within 24
          hours.
        </p>
      </div>
    );
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label
            htmlFor="name"
            className="block text-sm font-medium text-black mb-1"
          >
            Full Name *
          </label>
          <input
            type="text"
            id="name"
            name="name"
            required
            className="w-full px-4 py-3 rounded-xl border border-line focus:outline-none focus:border-red transition-colors text-sm"
            placeholder="John Doe"
          />
        </div>
        <div>
          <label
            htmlFor="email"
            className="block text-sm font-medium text-black mb-1"
          >
            Email Address *
          </label>
          <input
            type="email"
            id="email"
            name="email"
            required
            className="w-full px-4 py-3 rounded-xl border border-line focus:outline-none focus:border-red transition-colors text-sm"
            placeholder="john@example.com"
          />
        </div>
      </div>

      <div>
        <label
          htmlFor="phone"
          className="block text-sm font-medium text-black mb-1"
        >
          Phone Number
        </label>
        <input
          type="tel"
          id="phone"
          name="phone"
          className="w-full px-4 py-3 rounded-xl border border-line focus:outline-none focus:border-red transition-colors text-sm"
          placeholder="+91 9876543210"
        />
      </div>

      <div>
        <label
          htmlFor="destination"
          className="block text-sm font-medium text-black mb-1"
        >
          Destination / Package Interest
        </label>
        <input
          type="text"
          id="destination"
          name="destination"
          className="w-full px-4 py-3 rounded-xl border border-line focus:outline-none focus:border-red transition-colors text-sm"
          placeholder="e.g., Europe, Thailand, Dubai..."
        />
      </div>

      <div>
        <label
          htmlFor="message"
          className="block text-sm font-medium text-black mb-1"
        >
          Your Message *
        </label>
        <textarea
          id="message"
          name="message"
          required
          rows={5}
          className="w-full px-4 py-3 rounded-xl border border-line focus:outline-none focus:border-red transition-colors text-sm resize-none"
          placeholder="Tell us about your travel plans, preferences, budget..."
        />
      </div>

      <button
        type="submit"
        disabled={loading}
        className="w-full bg-red text-white py-3 rounded-xl font-medium hover:opacity-90 transition-opacity disabled:opacity-60 flex items-center justify-center gap-2"
      >
        {loading ? (
          <>
            <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
            Sending...
          </>
        ) : (
          <>
            <i className="bi bi-send-fill" />
            Send Message
          </>
        )}
      </button>
    </form>
  );
}
