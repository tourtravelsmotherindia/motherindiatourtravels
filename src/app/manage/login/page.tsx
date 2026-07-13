"use client";

import { Eye, EyeOff, Loader2 } from "lucide-react";
import { useRouter, useSearchParams } from "next/navigation";
import React, { useEffect, useState } from "react";

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
  const [needsInit, setNeedsInit] = useState<boolean>(false);

  useEffect(() => {
    const checkInitialization = async () => {
      try {
        const API_BASE =
          process.env.NEXT_PUBLIC_API_URL ?? "https://api.motherindiatourtravels.com";
        const res = await fetch(`${API_BASE}/auth/check-init`);
        if (res.ok) {
          const data = await res.json();
          setNeedsInit(!!data.needsInitialization);
        }
      } catch (err) {
        console.error("Failed to check initialization status:", err);
      }
    };
    checkInitialization();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!email.trim() || !password.trim()) {
      showToast("error", "Login Validation", "Please enter both email and password.");
      return;
    }

    try {
      setLoading(true);
      const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "https://api.motherindiatourtravels.com";

      const endpoint = needsInit ? "/auth/signup" : "/auth/login";
      const res = await fetch(`${API_BASE}${endpoint}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await res.json();

      if (!res.ok) {
        throw new Error(data.error || "Authentication failed");
      }

      if (needsInit) {
        showToast(
          "success",
          "Verification Email Sent",
          "Admin account created! Please check your email inbox to confirm your address before logging in.",
        );
        setNeedsInit(false);
        setPassword("");
        return;
      }

      // Store tokens and metadata
      setTokens(data.access_token, data.refresh_token);
      localStorage.setItem("admin_email", email);

      const successTitle = "Security Gate Unlocked";
      const successMsg = "Redirecting to admin workspace...";
      showToast("success", successTitle, successMsg);

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
        className="absolute left-[5%] bottom-[12%] w-24 h-48 rounded-t-[2rem] bg-[#E58E35] opacity-80 hidden xl:block border border-neutral-200/30"
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
            {needsInit ? "Create Admin" : "Admin Login"}
          </h2>
          <p className="text-xs text-neutral-500 font-semibold text-center mt-2 max-w-[240px] leading-relaxed">
            {needsInit
              ? "Initialize the primary administrator account for this system"
              : "Hey, Enter your details to get sign in to your account"}
          </p>

          <form onSubmit={handleSubmit} className="w-full mt-8 space-y-4">
            {/* Email Field */}
            <div className="relative">
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Enter Email Address"
                disabled={loading}
                required
                className="w-full rounded-[1.25rem] border border-neutral-200 px-5 py-3.5 text-sm focus:border-[#E58E35] focus:outline-none transition-colors disabled:opacity-50 font-medium placeholder:text-neutral-400"
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
                placeholder="Password"
                disabled={loading}
                required
                className="w-full rounded-[1.25rem] border border-neutral-200 pl-5 pr-14 py-3.5 text-sm focus:border-[#E58E35] focus:outline-none transition-colors disabled:opacity-50 font-medium placeholder:text-neutral-400"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-5 inset-y-0 flex items-center text-neutral-400 hover:text-neutral-700 transition-colors cursor-pointer"
              >
                {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
              </button>
            </div>

            {/* Submit button */}
            <button
              type="submit"
              disabled={loading}
              className="w-full py-4 px-6 rounded-[1.25rem] bg-[#E58E35] hover:bg-[#C77625] text-white font-extrabold text-sm transition-all shadow-sm hover:shadow-md disabled:opacity-50 mt-4 cursor-pointer flex items-center justify-center gap-2"
            >
              {loading ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin text-white" />
                  <span>{needsInit ? "Initializing..." : "Signing in..."}</span>
                </>
              ) : (
                <span>{needsInit ? "Create Admin Account" : "Sign in"}</span>
              )}
            </button>
          </form>
        </div>
      </div>

      {/* Background Illustration (Right) - Premium Hot Air Balloon Sunset Scene */}
      <svg
        className="absolute right-[5%] bottom-[10%] w-[420px] h-[380px] hidden xl:block z-0 animate-in fade-in slide-in-from-right-10 duration-700"
        viewBox="0 0 400 400"
        fill="none"
      >
        {/* Sky Circle with Sunset Radial Gradient */}
        <circle cx="200" cy="200" r="160" fill="url(#sky-grad)" />

        {/* Sunset Sun */}
        <circle cx="200" cy="260" r="60" fill="url(#sun-grad)" />

        {/* Mountain Layer 1 (Back) */}
        <path
          d="M 60,320 L 150,190 L 220,270 L 300,160 L 380,320 Z"
          fill="#E58E35"
          opacity="0.25"
        />

        {/* Mountain Layer 2 (Middle) */}
        <path
          d="M 40,320 L 110,230 L 170,290 L 250,195 L 360,320 Z"
          fill="#C77625"
          opacity="0.45"
        />

        {/* Dotted Astrolabe Compass Grid */}
        <circle cx="200" cy="200" r="150" stroke="#e5e5e5" strokeWidth="1" strokeDasharray="4 8" />

        {/* Clouds */}
        <path
          d="M 50,180 C 50,160 80,160 90,170 C 100,155 130,165 130,180 C 140,180 150,190 145,200 L 55,200 Z"
          fill="white"
          opacity="0.8"
        />
        <path
          d="M 280,220 C 280,205 300,200 310,210 C 320,195 345,205 340,220 C 350,220 355,230 350,240 L 275,240 Z"
          fill="white"
          opacity="0.85"
        />

        {/* Birds Silhouette */}
        <path
          d="M 80,120 Q 85,115 90,120 Q 95,115 100,120 Q 93,125 90,121 Q 87,125 80,120 Z"
          fill="#262626"
          opacity="0.5"
        />
        <path
          d="M 105,130 Q 109,126 113,130 Q 117,126 121,130 Q 115,134 113,131 Q 111,134 105,130 Z"
          fill="#262626"
          opacity="0.5"
        />
        <path
          d="M 95,140 Q 98,137 101,140 Q 104,137 107,140 Q 103,143 101,141 Q 99,143 95,140 Z"
          fill="#262626"
          opacity="0.5"
        />

        {/* Foreground Hot Air Balloon */}
        <g transform="translate(40, -10)">
          {/* Envelope (Teardrop shape) */}
          <path
            d="M 200,110 C 200,60 280,60 280,110 C 280,140 255,165 240,180 C 225,165 200,140 200,110 Z"
            fill="white"
            stroke="#262626"
            strokeWidth="2.5"
          />

          {/* Stripes */}
          <path
            d="M 210,80 C 213,90 216,130 227,157 L 221,162 C 209,134 205,94 202,86 Z"
            fill="#E58E35"
            stroke="#262626"
            strokeWidth="1.5"
          />
          <path
            d="M 230,73 C 235,85 238,135 240,165 L 243,165 C 241,135 237,85 232,73 Z"
            fill="#E58E35"
            stroke="#262626"
            strokeWidth="1.5"
          />
          <path
            d="M 270,86 C 267,94 263,134 251,162 L 245,157 C 256,130 259,90 262,80 Z"
            fill="#E58E35"
            stroke="#262626"
            strokeWidth="1.5"
          />

          {/* Burner / basket connections */}
          <line x1="228" y1="180" x2="232" y2="195" stroke="#262626" strokeWidth="1.5" />
          <line x1="252" y1="180" x2="248" y2="195" stroke="#262626" strokeWidth="1.5" />

          {/* Woven Basket */}
          <rect
            x="230"
            y="195"
            width="20"
            height="15"
            rx="3"
            fill="#E58E35"
            stroke="#262626"
            strokeWidth="2"
          />
          <line x1="230" y1="202" x2="250" y2="202" stroke="#262626" strokeWidth="1.5" />
        </g>

        {/* Small Hot Air Balloon in background (depth) */}
        <g transform="translate(10, 0)">
          <path
            d="M 110,80 C 110,65 130,65 130,80 C 130,90 122,100 120,105 C 118,100 110,90 110,80 Z"
            fill="#C77625"
            stroke="#262626"
            strokeWidth="1.5"
            opacity="0.7"
          />
          <line x1="116" y1="105" x2="117" y2="111" stroke="#262626" strokeWidth="1" />
          <line x1="124" y1="105" x2="123" y2="111" stroke="#262626" strokeWidth="1" />
          <rect
            x="117"
            y="111"
            width="7"
            height="5"
            fill="#E58E35"
            stroke="#262626"
            strokeWidth="1"
            opacity="0.8"
          />
        </g>

        {/* Front Hills / Base silhouette */}
        <path
          d="M 40,320 Q 120,290 200,310 T 360,320 L 360,360 L 40,360 Z"
          fill="#8D4C15"
          opacity="0.8"
        />

        {/* Definition of Gradients */}
        <defs>
          <radialGradient id="sky-grad" cx="50%" cy="80%" r="80%">
            <stop offset="0%" stopColor="#FFF3E0" />
            <stop offset="50%" stopColor="#FFE0B2" />
            <stop offset="100%" stopColor="#E58E35" stopOpacity="0.25" />
          </radialGradient>
          <linearGradient id="sun-grad" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="#FFA726" />
            <stop offset="100%" stopColor="#E58E35" />
          </linearGradient>
        </defs>
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
