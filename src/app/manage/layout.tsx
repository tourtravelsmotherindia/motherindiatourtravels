"use client";

import { Loader2 } from "lucide-react";
import { usePathname, useRouter } from "next/navigation";
import React, { useEffect, useState } from "react";

import ManageHeader from "@/components/manage/ManageHeader";
import ManageSidebar from "@/components/manage/ManageSidebar";
import { isLoggedIn } from "@/lib/adminApi";

export default function ManageLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const router = useRouter();
  const pathname = usePathname();
  const [authorized, setAuthorized] = useState<boolean>(false);
  const [checkingAuth, setCheckingAuth] = useState<boolean>(true);
  const [mobileSidebarOpen, setMobileSidebarOpen] = useState<boolean>(false);

  const isLoginPage = pathname === "/manage/login" || pathname === "/manage/login/";

  useEffect(() => {
    // Client-side authentication gate
    const authenticated = isLoggedIn();

    if (!authenticated && !isLoginPage) {
      // Redirect to login page, preserving redirect URL
      const redirectUrl = `/manage/login/?redirect=${encodeURIComponent(pathname)}`;
      router.push(redirectUrl);
    } else if (authenticated && isLoginPage) {
      // Already logged in, redirect to dashboard root
      router.push("/manage/");
    } else {
      setTimeout(() => {
        setAuthorized(authenticated || isLoginPage);
        setCheckingAuth(false);
      }, 0);
      return;
    }

    setTimeout(() => {
      setCheckingAuth(false);
    }, 0);
  }, [pathname, isLoginPage, router]);

  if (checkingAuth) {
    return (
      <div className="min-h-screen bg-neutral-50 flex flex-col items-center justify-center">
        <Loader2 className="w-10 h-10 text-brand animate-spin" />
        <p className="text-sm font-semibold text-neutral-500 mt-3 animate-pulse">
          Authenticating administrator...
        </p>
      </div>
    );
  }

  // If not authorized and not on login page, prevent flash of content
  if (!authorized && !isLoginPage) {
    return (
      <div className="min-h-screen bg-neutral-50 flex flex-col items-center justify-center">
        <Loader2 className="w-10 h-10 text-brand animate-spin" />
        <p className="text-sm font-semibold text-neutral-500 mt-3 animate-pulse">
          Redirecting to security gate...
        </p>
      </div>
    );
  }

  // Login page layout (no sidebar / header)
  if (isLoginPage) {
    return <div className="min-h-screen bg-neutral-50 flex flex-col">{children}</div>;
  }

  // Admin Dashboard layout shell
  return (
    <div className="min-h-screen bg-neutral-50 flex flex-col lg:flex-row">
      {/* Sidebar Navigation */}
      <ManageSidebar
        isMobileOpen={mobileSidebarOpen}
        onCloseMobile={() => setMobileSidebarOpen(false)}
      />

      {/* Main Content Pane */}
      <div className="flex-1 flex flex-col min-w-0">
        {/* Top Header */}
        <ManageHeader onOpenMobile={() => setMobileSidebarOpen(true)} />

        {/* Content Body */}
        <main className="flex-1 p-6 md:p-8">
          <div className="max-w-[1600px] mx-auto">{children}</div>
        </main>
      </div>
    </div>
  );
}
