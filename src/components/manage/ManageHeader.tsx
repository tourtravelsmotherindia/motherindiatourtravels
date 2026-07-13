"use client";

import { CheckCircle2, ChevronRight, CloudLightning, Loader2, Menu, XCircle } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import React, { useEffect, useState } from "react";

import ConfirmationModal from "@/components/ui/ConfirmationModal";
import { useToast } from "@/context/ToastContext";
import { adminGet, adminPost } from "@/lib/adminApi";
import { ADMIN_TABLES } from "@/lib/adminSchema";

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
  const [deployState, setDeployState] = useState<"idle" | "loading" | "success" | "error">("idle");
  const [deployStatus, setDeployStatus] = useState<DeployStatus | null>(null);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);

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
  }, [deployState]);

  const handleDeployTrigger = async () => {
    if (deployState === "loading") return;
    setDeployState("loading");

    try {
      await adminPost("/deploy", {});
      setDeployState("success");
      showToast(
        "success",
        "Deployment Triggered",
        "The build and deploy process has been started on GitHub.",
      );
      setTimeout(() => setDeployState("idle"), 3000);

      // Instantly refresh status after triggering
      setTimeout(async () => {
        try {
          const data = await adminGet<DeployStatus>("/deploy");
          if (data && data.status) {
            setDeployStatus(data);
          }
        } catch (err) {
          console.error("Failed to fetch deployment status:", err);
        }
      }, 1000);
    } catch (err) {
      console.error("Failed to trigger deploy:", err);
      const errMsg = err instanceof Error ? err.message : String(err);
      showToast("error", "Deployment Failed", errMsg || "Failed to trigger deployment.");
      setDeployState("error");
      setTimeout(() => setDeployState("idle"), 5000);
    }
  };

  const isDeploying =
    deployState === "loading" ||
    (deployStatus && (deployStatus.status === "queued" || deployStatus.status === "in_progress"));

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
    <header className="sticky top-0 bg-white/80 backdrop-blur-md border-b border-border-light px-6 py-4 flex flex-col gap-3 z-20">
      <div className="flex items-center justify-between">
        {/* Left: Mobile hamburger & Breadcrumbs */}
        <div className="flex items-center gap-3 min-w-0">
          <button
            onClick={onOpenMobile}
            className="lg:hidden p-2 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-500 hover:text-neutral-800 transition-colors"
          >
            <Menu className="w-5 h-5" />
          </button>

          <div className="flex items-center text-xs font-medium text-neutral-500 min-w-0 overflow-x-auto no-scrollbar">
            {generateBreadcrumbs()}
          </div>
        </div>

        {/* Right: Quick Action or Status */}
        <div className="hidden sm:flex items-center gap-3">
          {deployStatus && (
            <a
              href={deployStatus.url}
              target="_blank"
              rel="noopener noreferrer"
              className={`flex items-center gap-1.5 text-[10px] md:text-xs font-semibold px-3 py-1.5 rounded-full border hover:shadow-premium transition-all duration-200 ${
                deployStatus.status === "queued" || deployStatus.status === "in_progress"
                  ? "bg-amber-50 text-amber-600 border-amber-200 hover:border-amber-400 animate-pulse"
                  : deployStatus.conclusion === "success"
                    ? "bg-emerald-50 text-emerald-600 border-emerald-200 hover:border-emerald-400"
                    : deployStatus.conclusion === "failure" ||
                        deployStatus.conclusion === "cancelled"
                      ? "bg-red-50 text-red-600 border-red-200 hover:border-red-400"
                      : "bg-neutral-50 text-neutral-500 border-neutral-200 hover:border-neutral-300"
              }`}
              title="Click to view run logs on GitHub"
            >
              <span
                className={`w-1.5 h-1.5 rounded-full ${
                  deployStatus.status === "queued" || deployStatus.status === "in_progress"
                    ? "bg-amber-500"
                    : deployStatus.conclusion === "success"
                      ? "bg-emerald-500"
                      : "bg-red-500"
                }`}
              />
              <span className="hidden xl:inline text-[10px] text-neutral-400 font-normal">
                Last Deploy:{" "}
              </span>
              <span>
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
          )}

          <button
            onClick={() => setIsConfirmOpen(true)}
            disabled={!!isDeploying}
            className="flex items-center gap-2 text-xs text-white bg-brand hover:bg-brand-hover disabled:bg-neutral-100 disabled:text-neutral-400 disabled:border-neutral-200 px-4 py-1.5 rounded-full font-semibold border border-brand disabled:border-neutral-200 transition-all duration-200 disabled:cursor-not-allowed cursor-pointer animate-in fade-in zoom-in-95 duration-200"
          >
            {deployState === "loading" && <Loader2 className="w-3.5 h-3.5 animate-spin" />}
            {deployState === "idle" && <CloudLightning className="w-3.5 h-3.5" />}
            {deployState === "success" && <CheckCircle2 className="w-3.5 h-3.5" />}
            {deployState === "error" && <XCircle className="w-3.5 h-3.5" />}
            <span>
              {deployState === "idle" && "Deploy Website"}
              {deployState === "loading" && "Triggering..."}
              {deployState === "success" && "Triggered!"}
              {deployState === "error" && "Trigger Failed"}
            </span>
          </button>

          <ConfirmationModal
            isOpen={isConfirmOpen}
            title="Deploy Website?"
            message="Are you sure you want to trigger a manual deployment? This will rebuild the static website and upload all updated assets to the server."
            confirmLabel="Deploy Now"
            cancelLabel="Cancel"
            onConfirm={() => {
              setIsConfirmOpen(false);
              handleDeployTrigger();
            }}
            onCancel={() => setIsConfirmOpen(false)}
            icon={
              <div className="w-12 h-12 rounded-full bg-brand-light text-brand flex items-center justify-center border border-brand/10">
                <CloudLightning className="w-5 h-5" />
              </div>
            }
          />

          <div className="flex items-center gap-2 text-xs text-neutral-500 bg-neutral-100 px-3.5 py-1.5 rounded-full font-medium border border-neutral-200">
            <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
            <span>API Server Live</span>
          </div>
        </div>
      </div>

      {/* Main Heading Text */}
      <div className="mt-1">
        <h1 className="text-xl md:text-2xl font-bold font-display text-foreground leading-tight">
          {heading}
        </h1>
        {sub && (
          <p className="text-xs md:text-sm text-neutral-500 font-normal mt-1 leading-relaxed max-w-3xl">
            {sub}
          </p>
        )}
      </div>
    </header>
  );
}
