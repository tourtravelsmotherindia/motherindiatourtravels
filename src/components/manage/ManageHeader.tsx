"use client";

import { ChevronRight, CloudLightning, Loader2, Menu, RefreshCw } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import React, { useEffect, useState } from "react";

import { useToast } from "@/context/ToastContext";
import { adminGet } from "@/lib/adminApi";
import { ADMIN_TABLES } from "@/lib/adminSchema";
import { useSystemPing } from "@/lib/hooks/mutations";

interface ManageHeaderProps {
  onOpenMobile: () => void;
  title?: string;
  subtitle?: string;
}

interface DeployStatus {
  status: string;
  conclusion: string | null;
  url: string;
  createdAt: string;
}

export default function ManageHeader({ onOpenMobile, title, subtitle }: ManageHeaderProps) {
  const pathname = usePathname();
  const { showToast } = useToast();
  const [deployStatus, setDeployStatus] = useState<DeployStatus | null>(null);

  const pingMutation = useSystemPing();

  const handleSystemPing = async () => {
    try {
      const response = await pingMutation.mutateAsync();
      if (response && response.success) {
        showToast("success", "Diagnostic Check", "New system status check executed!");
        window.dispatchEvent(new CustomEvent("system-status-pinged"));
      } else {
        throw new Error(response?.error || "Diagnostics failed");
      }
    } catch (err: unknown) {
      console.error("Diagnostic trigger failed:", err);
      const errMsg = err instanceof Error ? err.message : "Failed to run manual diagnostics.";
      showToast("error", "Diagnostic Failed", errMsg);
    }
  };

  useEffect(() => {
    let active = true;
    let intervalId: NodeJS.Timeout;

    const startPolling = (ms: number) => {
      if (intervalId) clearInterval(intervalId);
      intervalId = setInterval(async () => {
        try {
          const data = await adminGet<DeployStatus>("/deploy");
          if (active && data && data.status) {
            setDeployStatus(data);
            if (data.status === "completed") {
              startPolling(30000);
            }
          }
        } catch (err) {
          console.error("Failed to fetch deployment status:", err);
        }
      }, ms);
    };

    const load = async () => {
      try {
        const data = await adminGet<DeployStatus>("/deploy");
        if (active && data && data.status) {
          setDeployStatus(data);
          if (data.status === "queued" || data.status === "in_progress") {
            startPolling(8000);
          } else {
            startPolling(30000);
          }
        }
      } catch (err) {
        console.error("Failed to fetch deployment status:", err);
      }
    };

    load();

    return () => {
      active = false;
      if (intervalId) clearInterval(intervalId);
    };
  }, []);

  // Generate breadcrumbs from pathname
  const generateBreadcrumbs = () => {
    const segments = pathname.split("/").filter(Boolean);
    const breadcrumbs = [];

    // Base Manage link
    breadcrumbs.push(
      <Link key="manage" href="/manage/" className="hover:text-brand transition-colors">
        Manage
      </Link>,
    );

    // Dynamic segments
    let currentPath = "/manage";
    segments.slice(1).forEach((segment, idx) => {
      // Clean up segment if it's table slug
      const tableConfig = ADMIN_TABLES[segment];
      const label = tableConfig
        ? tableConfig.label
        : segment.charAt(0).toUpperCase() + segment.slice(1);
      currentPath += `/${segment}`;

      breadcrumbs.push(
        <React.Fragment key={segment}>
          <ChevronRight className="w-3 h-3 text-neutral-400 mx-1 flex-shrink-0" />
          {idx === segments.length - 2 ? (
            <span className="text-neutral-900 font-semibold truncate">{label}</span>
          ) : (
            <Link href={currentPath} className="hover:text-brand transition-colors truncate">
              {label}
            </Link>
          )}
        </React.Fragment>,
      );
    });

    return breadcrumbs;
  };

  // Determine page headings
  const getHeadings = () => {
    if (title) return { heading: title, sub: subtitle };

    const segments = pathname.split("/").filter(Boolean);
    const tableSlug = segments[1];

    if (!tableSlug) {
      return {
        heading: "Dashboard Overview",
        sub: "Welcome to the Mother India Tour Travels control center. Here's what's happening today.",
      };
    }

    if (tableSlug === "system-status") {
      return {
        heading: "System Status Dashboard",
        sub: "Uptime health monitors, latency trends and diagnostics log history.",
      };
    }

    if (tableSlug === "deploy") {
      return {
        heading: "Website Deployments",
        sub: "Rebuild and publish static website updates to cPanel hosting or Cloudflare Pages.",
      };
    }

    const tableConfig = ADMIN_TABLES[tableSlug];
    if (tableConfig) {
      return {
        heading: `${tableConfig.label} Management`,
        sub: `Browse, search, edit, and create records inside the ${tableConfig.label} database table.`,
      };
    }

    return {
      heading: tableSlug.charAt(0).toUpperCase() + tableSlug.slice(1),
      sub: "Manage your database records dynamically.",
    };
  };

  const { heading, sub } = getHeadings();

  return (
    <header className="sticky top-0 bg-white border-b border-neutral-100 px-6 py-3.5 flex flex-col gap-3 z-20">
      <div className="flex items-center justify-between">
        {/* Left: Mobile hamburger & Breadcrumbs */}
        <div className="flex items-center gap-3 min-w-0">
          <button
            onClick={onOpenMobile}
            className="lg:hidden p-2 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-500 hover:text-neutral-800 transition-colors"
          >
            <Menu className="w-5 h-5" />
          </button>

          <div className="flex items-center text-xs font-semibold text-neutral-700 min-w-0 overflow-x-auto no-scrollbar">
            {generateBreadcrumbs()}
          </div>
        </div>

        {/* Right: Quick Action or Status */}
        <div className="hidden sm:flex items-center gap-3">
          {/* Unified System Health Status Pill */}
          <div className="flex items-center gap-3 text-[10px] md:text-xs font-semibold px-4 py-1.5 rounded-full border border-neutral-100 bg-white text-neutral-600 shadow-[0_1px_4px_rgba(0,0,0,0.04)] leading-none shrink-0">
            {/* API Status Indicator */}
            <div className="flex items-center gap-1.5">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse shrink-0" />
              <span className="text-neutral-500 font-medium">API:</span>
              <span className="text-emerald-700 font-bold">Online</span>
            </div>

            {deployStatus && (
              <>
                <span className="w-px h-3 bg-neutral-100 shrink-0" />
                {/* Deploy Status Indicator */}
                <a
                  href={deployStatus.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 text-neutral-500 hover:text-brand transition-colors shrink-0"
                  title="Click to view run logs on GitHub"
                >
                  <span className="text-neutral-500 font-medium">Deploy:</span>
                  <span
                    className={`font-semibold ${
                      deployStatus.status === "queued" || deployStatus.status === "in_progress"
                        ? "text-amber-700 animate-pulse"
                        : deployStatus.conclusion === "success"
                          ? "text-emerald-700"
                          : "text-red-700"
                    }`}
                  >
                    {deployStatus.status === "queued" && "Queued"}
                    {deployStatus.status === "in_progress" && "In Progress"}
                    {deployStatus.status === "completed" &&
                      deployStatus.conclusion === "success" &&
                      "Success"}
                    {deployStatus.status === "completed" &&
                      deployStatus.conclusion === "failure" &&
                      "Failed"}
                    {deployStatus.status === "completed" &&
                      deployStatus.conclusion === "cancelled" &&
                      "Cancelled"}
                    {deployStatus.status !== "queued" &&
                      deployStatus.status !== "in_progress" &&
                      deployStatus.status !== "completed" &&
                      "Active"}
                  </span>
                </a>
              </>
            )}
          </div>

          <Link
            href="/manage/deploy/"
            className="flex items-center gap-1.5 text-xs text-neutral-700 bg-white hover:bg-neutral-50 border border-neutral-100 px-4 py-1.5 rounded-full font-semibold shadow-[0_1px_4px_rgba(0,0,0,0.04)] transition-all duration-200 cursor-pointer shrink-0"
          >
            <CloudLightning className="w-3.5 h-3.5 text-brand" />
            <span>Deploy Website</span>
          </Link>

          {pathname.startsWith("/manage/system-status") && (
            <button
              onClick={handleSystemPing}
              disabled={pingMutation.isPending}
              className="flex items-center justify-center gap-1.5 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs py-1.5 px-4 shadow-premium transition-all cursor-pointer disabled:opacity-50 shrink-0"
            >
              {pingMutation.isPending ? (
                <Loader2 className="w-3.5 h-3.5 animate-spin" />
              ) : (
                <RefreshCw className="w-3.5 h-3.5" />
              )}
              <span>Ping Diagnostics Now</span>
            </button>
          )}
        </div>
      </div>

      {/* Main Heading Text */}
      <div className="mt-1">
        <h1 className="text-xl md:text-2xl font-bold font-display text-neutral-800 leading-tight">
          {heading}
        </h1>
        {sub && (
          <p className="text-xs md:text-sm text-neutral-600 font-medium mt-1 leading-relaxed max-w-3xl">
            {sub}
          </p>
        )}
      </div>
    </header>
  );
}
