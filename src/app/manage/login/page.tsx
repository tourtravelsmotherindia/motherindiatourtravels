"use client";

import { Loader2 } from "lucide-react";
import { useRouter, useSearchParams } from "next/navigation";
import React, { useState } from "react";

import { useToast } from "@/context/ToastContext";
import { setTokens } from "@/lib/adminApi";

export default function LoginPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { showToast } = useToast();

  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [loading, setLoading] = useState<boolean>(false);
  const [showPassword, setShowPassword] = useState<boolean>(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!email.trim() || !password.trim()) {
      showToast("error", "Login Validation", "Please enter both email and password.");
      return;
    }

    try {
      setLoading(true);
      const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "https://api.motherindiatourtravels.com";

      const res = await fetch(`${API_BASE}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await res.json();

      if (!res.ok) {
        throw new Error(data.error || "Authentication failed");
      }

      // Store tokens and metadata
      setTokens(data.access_token, data.refresh_token);
      localStorage.setItem("admin_email", email);

      showToast("success", "Security Gate Unlocked", "Redirecting to admin workspace...");

      // Redirect to the originally requested page, or base dashboard
      const redirectPath = searchParams.get("redirect") || "/manage/";
      router.push(redirectPath);
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : "Invalid credentials";
      showToast("error", "Access Denied", errorMessage);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="h-screen max-h-screen min-h-screen w-full flex flex-col justify-between items-center bg-[#FAF8F5] relative overflow-hidden font-sans p-6 select-none">
      {/* Background Dotted Pillar (Left) */}
      <div
        className="absolute left-[5%] bottom-[12%] w-24 h-48 rounded-t-[2rem] bg-[#FCD19C] opacity-80 hidden xl:block border border-neutral-200/30"
        style={{
          backgroundImage: "radial-gradient(#262626 15%, transparent 15%)",
          backgroundSize: "16px 16px",
        }}
      ></div>

      {/* Background Arrow Box (Left) */}
      <div className="absolute left-[13%] bottom-[12%] w-20 h-24 bg-white border border-neutral-200 rounded-[1.5rem] shadow-sm hidden xl:flex items-center justify-center transform -rotate-6">
        <span className="text-3xl text-neutral-600 font-display">↗</span>
      </div>

      {/* Background Speech Bubble (Left) */}
      <div className="absolute left-[8%] top-[25%] bg-white border border-neutral-200 rounded-[1.5rem] p-4 w-36 shadow-sm hidden xl:block transform rotate-3">
        <div className="w-16 h-2 bg-neutral-200 rounded-full mb-2"></div>
        <div className="w-20 h-2 bg-neutral-100 rounded-full"></div>
        <div className="absolute -bottom-2 left-8 w-4 h-4 bg-white border-r border-b border-neutral-200 transform rotate-45"></div>
      </div>

      {/* Left Scribbles */}
      <svg
        className="absolute left-[3%] top-[10%] w-48 h-48 text-neutral-300 hidden xl:block"
        viewBox="0 0 100 100"
        fill="none"
        stroke="currentColor"
        strokeWidth="1"
      >
        <path d="M10,80 Q20,30 40,50 T70,30" strokeLinecap="round" />
        <circle cx="80" cy="40" r="2" fill="currentColor" />
      </svg>

      {/* Center Form Card */}
      <div className="flex-1 flex items-center justify-center z-10 w-full max-w-md my-auto animate-in fade-in zoom-in-95 duration-500">
        <div className="bg-white rounded-[2.5rem] p-8 sm:p-10 shadow-[0_20px_50px_rgba(0,0,0,0.03)] border border-neutral-100/50 w-full flex flex-col items-center">
          <h2 className="font-display font-extrabold text-3xl text-neutral-900 text-center tracking-tight">
            Admin Login
          </h2>
          <p className="text-xs text-neutral-500 font-semibold text-center mt-2 max-w-[240px] leading-relaxed">
            Hey, Enter your details to get sign in to your account
          </p>

          <form onSubmit={handleSubmit} className="w-full mt-8 space-y-4">
            {/* Email Field */}
            <div className="relative">
              <input
                type="text"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Enter Email / Phone No"
                disabled={loading}
                required
                className="w-full rounded-[1.25rem] border border-neutral-200 px-5 py-3.5 text-sm focus:border-[#FCD19C] focus:outline-none transition-colors disabled:opacity-50 font-medium placeholder:text-neutral-400"
              />
              <div className="absolute right-5 inset-y-0 flex items-center pointer-events-none">
                <div className="w-4 h-4 rounded-full border border-neutral-300"></div>
              </div>
            </div>

            {/* Password Field */}
            <div className="relative">
              <input
                type={showPassword ? "text" : "password"}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Passcode"
                disabled={loading}
                required
                className="w-full rounded-[1.25rem] border border-neutral-200 pl-5 pr-14 py-3.5 text-sm focus:border-[#FCD19C] focus:outline-none transition-colors disabled:opacity-50 font-medium placeholder:text-neutral-400"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-5 inset-y-0 text-xs font-bold text-neutral-500 hover:text-neutral-800 transition-colors uppercase tracking-wider"
              >
                {showPassword ? "Hide" : "Show"}
              </button>
            </div>

            {/* Having trouble link */}
            <div className="text-left">
              <a
                href="#trouble"
                onClick={(e) => {
                  e.preventDefault();
                  showToast(
                    "info",
                    "Help Desk",
                    "Contact primary administrator to reset credentials.",
                  );
                }}
                className="text-xs font-bold text-neutral-800 hover:underline inline-block mt-1"
              >
                Having trouble in sign in?
              </a>
            </div>

            {/* Submit button */}
            <button
              type="submit"
              disabled={loading}
              className="w-full py-4 px-6 rounded-[1.25rem] bg-[#FCD19C] hover:bg-[#fbc37e] text-neutral-800 font-extrabold text-sm transition-all shadow-sm hover:shadow-md disabled:opacity-50 mt-4 cursor-pointer flex items-center justify-center gap-2"
            >
              {loading ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin text-neutral-800" />
                  <span>Signing in...</span>
                </>
              ) : (
                <span>Sign in</span>
              )}
            </button>
          </form>
        </div>
      </div>

      {/* Background Character Sitting Illustration (Right) - High Fidelity Vector Art matching crop */}
      <svg
        className="absolute right-[5%] bottom-[8%] w-[360px] h-[360px] hidden xl:block z-0"
        viewBox="0 0 300 300"
      >
        {/* Cube Sitting Block */}
        <rect
          x="100"
          y="160"
          width="95"
          height="110"
          fill="white"
          stroke="#262626"
          strokeWidth="2"
          rx="4"
        />

        {/* Dotted pillar behind block */}
        <rect
          x="205"
          y="180"
          width="70"
          height="90"
          fill="#FCD19C"
          stroke="#262626"
          strokeWidth="2"
          rx="4"
        />
        {/* Dotted pattern inside pillar - organic scattered pattern */}
        <circle cx="218" cy="195" r="4.5" fill="#262626" />
        <circle cx="240" cy="190" r="4.5" fill="#262626" />
        <circle cx="258" cy="200" r="4.5" fill="#262626" />
        <circle cx="225" cy="215" r="4.5" fill="#262626" />
        <circle cx="248" cy="222" r="4.5" fill="#262626" />
        <circle cx="216" cy="240" r="4.5" fill="#262626" />
        <circle cx="238" cy="245" r="4.5" fill="#262626" />
        <circle cx="255" cy="235" r="4.5" fill="#262626" />
        <circle cx="228" cy="265" r="4.5" fill="#262626" />
        <circle cx="252" cy="260" r="4.5" fill="#262626" />

        {/* Laptop - sitting on lap */}
        {/* Screen */}
        <path
          d="M50,135 L58,143 L40,105 L32,97 Z"
          fill="#C2DFA7"
          stroke="#262626"
          strokeWidth="2.5"
          strokeLinejoin="round"
        />
        {/* Keyboard base */}
        <path
          d="M50,135 L90,125 L98,133 L58,143 Z"
          fill="#D2E8B5"
          stroke="#262626"
          strokeWidth="2.5"
          strokeLinejoin="round"
        />

        {/* Character - Curved Baggy Trouser and Body geometry */}
        {/* Left Leg (in background) */}
        <path
          d="M118,158 C95,158 75,175 68,185 C50,210 40,230 25,255 L43,264 C60,235 68,215 85,195 C95,185 105,175 118,172 Z"
          fill="white"
          stroke="#262626"
          strokeWidth="2"
          strokeLinejoin="round"
        />
        {/* Left Shoe */}
        <path
          d="M25,255 L12,260 L15,268 L32,264 Z"
          fill="#171717"
          stroke="#262626"
          strokeWidth="1"
        />

        {/* Right Leg (in foreground) */}
        <path
          d="M128,160 C108,165 93,185 88,200 C78,225 73,245 68,270 L86,278 C91,255 96,235 111,215 C121,200 128,185 131,168 Z"
          fill="white"
          stroke="#262626"
          strokeWidth="2"
          strokeLinejoin="round"
        />
        {/* Right Shoe */}
        <path
          d="M68,270 L55,275 L58,283 L75,279 Z"
          fill="#171717"
          stroke="#262626"
          strokeWidth="1"
        />

        {/* Torso / Sweater (black with sprinkles texture) */}
        <path
          d="M138,115 C145,125 152,142 145,158 C140,160 128,160 118,158 C114,142 118,125 125,115 Z"
          fill="#171717"
          stroke="#262626"
          strokeWidth="2"
          strokeLinejoin="round"
        />
        {/* Sprinkle pattern */}
        <line x1="124" y1="123" x2="128" y2="120" stroke="white" strokeWidth="1" />
        <line x1="133" y1="125" x2="137" y2="127" stroke="white" strokeWidth="1" />
        <line x1="128" y1="135" x2="132" y2="132" stroke="white" strokeWidth="1" />
        <line x1="139" y1="138" x2="143" y2="135" stroke="white" strokeWidth="1" />
        <line x1="131" y1="148" x2="135" y2="145" stroke="white" strokeWidth="1" />
        <line x1="141" y1="149" x2="145" y2="146" stroke="white" strokeWidth="1" />

        {/* Sleeve and arm */}
        <path
          d="M125,115 C120,120 115,125 110,130 C108,135 112,138 116,138 C120,138 128,130 130,125"
          fill="#171717"
          stroke="#262626"
          strokeWidth="2"
        />
        <path
          d="M110,130 C102,132 92,132 88,134 C86,135 88,138 92,138 C96,138 102,135 106,133"
          fill="white"
          stroke="#262626"
          strokeWidth="1.5"
          strokeLinecap="round"
        />

        {/* Head, Hair Profile, bun */}
        {/* Neck */}
        <path d="M132,106 L134,115" stroke="#262626" strokeWidth="2" strokeLinecap="round" />
        <path d="M137,106 L138,115" stroke="#262626" strokeWidth="2" strokeLinecap="round" />
        {/* Hair bun */}
        <circle cx="146" cy="68" r="9" fill="#171717" stroke="#262626" strokeWidth="2" />
        {/* Face */}
        <path
          d="M124,100 C118,97 122,84 130,84 C138,84 140,92 140,100 C140,106 132,108 132,112 Z"
          fill="white"
          stroke="#262626"
          strokeWidth="2"
        />
        {/* Smile */}
        <path d="M128,94 C129,96 132,96 133,94" stroke="#262626" strokeWidth="1.5" fill="none" />
        {/* Hair overlay */}
        <path
          d="M132,92 C132,84 136,80 144,84 C144,88 142,92 136,94 Z"
          fill="#171717"
          stroke="#262626"
          strokeWidth="1"
        />

        {/* Floating speech bubble (Right) */}
        <rect
          x="25"
          y="40"
          width="60"
          height="40"
          fill="white"
          stroke="#262626"
          strokeWidth="2"
          rx="6"
        />
        <line x1="38" y1="53" x2="72" y2="53" stroke="#262626" strokeWidth="2" />
        <line x1="38" y1="65" x2="65" y2="65" stroke="#262626" strokeWidth="2" />
        <polygon points="35,80 35,92 45,80" fill="white" stroke="#262626" strokeWidth="2" />
        <line x1="36" y1="79" x2="44" y2="79" stroke="white" strokeWidth="2" />
      </svg>

      {/* Right Scribble Loop */}
      <svg
        className="absolute right-[3%] top-[15%] w-48 h-48 text-neutral-300 hidden xl:block"
        viewBox="0 0 100 100"
        fill="none"
        stroke="currentColor"
        strokeWidth="1"
      >
        <path d="M20,20 Q30,60 50,40 T90,60" strokeLinecap="round" />
        <circle cx="10" cy="50" r="2" fill="currentColor" />
      </svg>

      {/* Footer copyright - Clean branding */}
      <div className="z-10 mt-6 text-center text-[10px] text-neutral-400 font-bold tracking-wide">
        Copyright © 2026 Mother India Tour Travels | Privacy Policy
      </div>
    </div>
  );
}
