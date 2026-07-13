"use client";

import {
  AlertTriangle,
  ArrowRight,
  ArrowUpRight,
  CheckCircle2,
  Clock,
  Compass,
  Database,
  FileText,
  Globe,
  HardDrive,
  Mail,
  MoreVertical,
  Network,
  Package,
  Receipt,
  RefreshCw,
  TrendingUp,
  XCircle,
} from "lucide-react";
import Link from "next/link";
import React, { useEffect, useState } from "react";

import AdminCard from "@/components/manage/AdminCard";
import LoadingState from "@/components/manage/LoadingState";
import { useToast } from "@/context/ToastContext";
import { useSystemPing } from "@/lib/hooks/mutations";
import { useDashboardMetrics } from "@/lib/hooks/queries";
import type { BookingSummary } from "@/lib/hooks/queries/useDashboardMetrics";
import { formatLocalDateTime, formatLocalDateTimeVerbose } from "@/lib/manage/dateUtils";

interface MetricCardProps {
  title: string;
  value: string | number;
  change?: string;
  icon: React.ReactNode;
}

function MetricCard({ title, value, change, icon }: MetricCardProps) {
  return (
    <AdminCard>
      <div className="flex items-center justify-between mb-5">
        <div className="flex items-center gap-2 text-neutral-500 text-xs font-semibold uppercase tracking-wider">
          <div className="shrink-0 text-neutral-500">{icon}</div>
          <span>{title}</span>
        </div>
        <button className="text-neutral-400 hover:text-neutral-600 transition-colors p-1 rounded-lg hover:bg-neutral-50 cursor-pointer">
          <MoreVertical className="w-3.5 h-3.5" />
        </button>
      </div>

      <div className="flex items-end justify-between">
        <h3 className="text-3xl font-display font-extrabold text-foreground leading-none tracking-tight">
          {value}
        </h3>
        {change && (
          <div className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-emerald-50 text-emerald-600">
            <TrendingUp className="w-3 h-3" />
            <span>{change}</span>
          </div>
        )}
      </div>
    </AdminCard>
  );
}

export default function DashboardOverview() {
  const { showToast } = useToast();
  const [mounted, setMounted] = useState<boolean>(false);

  const { data: metrics, isLoading: loading, isError, error, refetch } = useDashboardMetrics();

  const pingMutation = useSystemPing();

  useEffect(() => {
    setTimeout(() => setMounted(true), 0);
  }, []);

  const handleManualPing = async () => {
    try {
      const response = await pingMutation.mutateAsync();
      if (response && response.success) {
        showToast("success", "System Diagnostic", "Uptime status updated successfully!");
      } else {
        throw new Error(response?.error || "Diagnostics failed");
      }
    } catch (err: unknown) {
      console.error("Diagnostic check failed:", err);
      const errMsg = err instanceof Error ? err.message : "Failed to trigger system status check.";
      // Don't toast on session expiry — the layout handles redirect smoothly
      if (!errMsg.includes("Session expired")) {
        showToast("error", "System Diagnostic", errMsg);
      }
    }
  };

  const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return "Good Morning!";
    if (hour < 17) return "Good Afternoon!";
    if (hour < 22) return "Good Evening!";
    return "Good Night!";
  };

  const quickShortcuts = [
    {
      title: "Add Tour Package",
      desc: "Create a new travel itinerary package",
      href: "/manage/packages/?action=new",
      icon: <Package className="w-4 h-4" />,
      color: "text-brand bg-brand-light/40 group-hover:bg-brand group-hover:text-white",
    },
    {
      title: "Review Booking Inquiries",
      desc: "Review and update guest travel requests",
      href: "/manage/bookings/",
      icon: <Receipt className="w-4 h-4" />,
      color: "text-amber-600 bg-amber-50 group-hover:bg-amber-500 group-hover:text-white",
    },
    {
      title: "Write Blog Article",
      desc: "Publish travel stories, articles and guides",
      href: "/manage/blog-posts/?action=new",
      icon: <FileText className="w-4 h-4" />,
      color: "text-emerald-600 bg-emerald-50 group-hover:bg-emerald-500 group-hover:text-white",
    },
    {
      title: "Manage Destinations",
      desc: "Configure featured cities and attractions",
      href: "/manage/destinations/",
      icon: <Compass className="w-4 h-4" />,
      color: "text-blue-600 bg-blue-50 group-hover:bg-blue-500 group-hover:text-white",
    },
  ];

  const getBookingStatusStyle = (status: string) => {
    switch (status) {
      case "NEW":
        return "bg-brand/8 text-brand border-brand/15";
      case "READ":
        return "bg-neutral-100 text-neutral-500 border-neutral-200";
      case "CONTACTED":
        return "bg-blue-50 text-blue-600 border-blue-100";
      default:
        return "bg-emerald-50 text-emerald-600 border-emerald-100";
    }
  };

  // Derived values (safe when data is undefined during loading)
  const metricsValues = metrics ?? {
    bookingsCount: 0,
    newBookings: 0,
    packagesCount: 0,
    blogsCount: 0,
    contactsCount: 0,
    systemStatus: null,
    recentBookings: [] as BookingSummary[],
  };

  const systemStatus = metricsValues.systemStatus;
  const recentBookings = metricsValues.recentBookings;

  return (
    <div className="space-y-6 animate-in fade-in duration-300">
      {/* Page Heading */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
        <div>
          <h2 className="text-xl md:text-2xl font-bold font-display text-neutral-900">
            {getGreeting()}
          </h2>
          <p className="text-sm text-neutral-600 font-medium mt-0.5">
            Here&apos;s a snapshot of what&apos;s happening with the travel portal today.
          </p>
        </div>
        <div className="flex items-center gap-2 text-xs text-neutral-600 bg-white border border-neutral-100 rounded-full px-4 py-2 font-medium shadow-[0_1px_4px_rgba(0,0,0,0.04)]">
          <Clock className="w-3.5 h-3.5 text-neutral-500" />
          <span>
            {mounted
              ? new Date().toLocaleDateString("en-IN", {
                  day: "numeric",
                  month: "short",
                  year: "numeric",
                })
              : "Loading..."}
          </span>
        </div>
      </div>

      {/* Error state for the whole dashboard */}
      {isError && (
        <div className="bg-white rounded-2xl border border-red-100 p-6">
          <div className="flex items-center gap-3 mb-2">
            <AlertTriangle className="w-5 h-5 text-red-500" />
            <p className="text-sm font-bold text-red-700">Dashboard data failed to load</p>
          </div>
          <p className="text-xs text-red-500 mb-4">
            {error instanceof Error ? error.message : "Unknown error"}
          </p>
          <button
            onClick={() => refetch()}
            className="px-4 py-2 rounded-full bg-white border border-red-200 text-xs font-semibold text-red-600 hover:bg-red-50 transition-colors"
          >
            Retry
          </button>
        </div>
      )}

      {/* Metrics Row */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <MetricCard
          title="Total Bookings"
          value={loading ? "..." : metricsValues.bookingsCount}
          change={metricsValues.newBookings > 0 ? `+${metricsValues.newBookings} new` : undefined}
          icon={<Receipt className="w-3.5 h-3.5" />}
        />
        <MetricCard
          title="Tour Packages"
          value={loading ? "..." : metricsValues.packagesCount}
          icon={<Package className="w-3.5 h-3.5" />}
        />
        <MetricCard
          title="Articles & Blogs"
          value={loading ? "..." : metricsValues.blogsCount}
          icon={<FileText className="w-3.5 h-3.5" />}
        />
        <MetricCard
          title="Contact Forms"
          value={loading ? "..." : metricsValues.contactsCount}
          icon={<Mail className="w-3.5 h-3.5" />}
        />
      </div>

      <div className="grid grid-cols-1 xl:grid-cols-3 gap-6">
        {/* Recent Bookings */}
        <AdminCard noPadding className="xl:col-span-2 overflow-hidden">
          <div className="flex items-center justify-between px-6 pt-5 pb-4 border-b border-neutral-50">
            <div>
              <h3 className="text-sm font-bold font-display text-neutral-800">Recent Inquiries</h3>
              <p className="text-xs text-neutral-500 mt-0.5">Last 5 booking inquiries received.</p>
            </div>
            <Link
              href="/manage/bookings/"
              className="inline-flex items-center gap-1 text-xs font-semibold text-brand hover:text-brand-hover transition-colors"
            >
              <span>View All</span>
              <ArrowRight className="w-3 h-3 text-brand" />
            </Link>
          </div>

          <div className="overflow-x-auto no-scrollbar">
            {loading ? (
              <LoadingState message="Loading bookings..." variant="inline" />
            ) : recentBookings.length === 0 ? (
              <div className="py-12 text-center text-xs text-neutral-500 font-medium italic">
                No bookings found yet.
              </div>
            ) : (
              <table className="w-full text-left border-collapse text-xs">
                <thead>
                  <tr className="text-neutral-800 font-bold uppercase tracking-wider text-[10px]">
                    <th className="py-3 px-6 font-semibold">Guest</th>
                    <th className="py-3 px-6 font-semibold">Date</th>
                    <th className="py-3 px-6 font-semibold">People</th>
                    <th className="py-3 px-6 font-semibold">Rooms</th>
                    <th className="py-3 px-6 font-semibold text-center">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-neutral-50 text-neutral-700 font-medium">
                  {recentBookings.map((b) => (
                    <tr key={b.id} className="hover:bg-neutral-50/60 transition-colors">
                      <td className="py-3.5 px-6">
                        <p className="font-semibold text-neutral-800">{b.name}</p>
                        <p className="text-[10px] text-neutral-500 font-normal mt-0.5">{b.email}</p>
                      </td>
                      <td className="py-3.5 px-6 text-neutral-600">
                        {mounted ? formatLocalDateTime(b.createdAt) : "..."}
                      </td>
                      <td className="py-3.5 px-6 text-neutral-700 font-semibold">
                        {b.numberOfPeople || b.adults + b.children + b.infants}
                      </td>
                      <td className="py-3.5 px-6 text-neutral-600">{b.rooms} room(s)</td>
                      <td className="py-3.5 px-6 text-center">
                        <span
                          className={`inline-flex items-center gap-1 px-2.5 py-1 text-[10px] font-semibold rounded-full border ${getBookingStatusStyle(b.status)}`}
                        >
                          <span
                            className={`w-1.5 h-1.5 rounded-full shrink-0 ${
                              b.status === "NEW"
                                ? "bg-brand animate-pulse"
                                : b.status === "READ"
                                  ? "bg-neutral-400"
                                  : b.status === "CONTACTED"
                                    ? "bg-blue-500"
                                    : "bg-emerald-500"
                            }`}
                          />
                          {b.status}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>
        </AdminCard>

        {/* Right Column */}
        <div className="space-y-4">
          {/* Quick Actions */}
          <AdminCard>
            <h3 className="text-sm font-bold font-display text-foreground mb-4">Quick Actions</h3>
            <div className="space-y-2">
              {quickShortcuts.map((sc, idx) => (
                <Link
                  key={idx}
                  href={sc.href}
                  className="flex items-center gap-3 p-3 rounded-xl border border-neutral-100 hover:border-brand/20 hover:bg-brand-light/20 transition-all duration-200 group"
                >
                  <div
                    className={`w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 transition-colors ${sc.color}`}
                  >
                    {sc.icon}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h4 className="text-xs font-semibold text-neutral-800 group-hover:text-brand transition-colors">
                      {sc.title}
                    </h4>
                    <p className="text-[10px] text-neutral-500 mt-0.5 font-medium truncate">
                      {sc.desc}
                    </p>
                  </div>
                  <ArrowUpRight className="w-3.5 h-3.5 text-neutral-400 group-hover:text-brand transition-colors shrink-0" />
                </Link>
              ))}
            </div>
          </AdminCard>

          {/* System Health */}
          <AdminCard>
            <div className="flex items-center justify-between mb-4">
              <div>
                <h3 className="text-sm font-bold font-display text-neutral-800">System Health</h3>
                <p className="text-[10px] text-neutral-500 mt-0.5 font-medium">
                  Real-time diagnostics
                </p>
              </div>
              <button
                onClick={handleManualPing}
                disabled={pingMutation.isPending || loading}
                className="p-2 rounded-lg border border-neutral-100 text-neutral-500 hover:text-brand hover:border-brand/20 hover:bg-brand-light/20 transition-all duration-200 disabled:opacity-50 cursor-pointer"
                title="Run diagnostic check"
              >
                <RefreshCw
                  className={`w-3.5 h-3.5 ${pingMutation.isPending ? "animate-spin text-brand" : ""}`}
                />
              </button>
            </div>

            {loading ? (
              <LoadingState message="Loading system status..." variant="inline" />
            ) : !systemStatus ? (
              <div className="py-4 text-center text-xs text-neutral-500 font-medium italic border border-dashed border-neutral-100 rounded-xl">
                No status data. Click reload to check.
              </div>
            ) : (
              <div className="space-y-3">
                {/* Overall Banner */}
                <div
                  className={`flex items-center gap-2.5 p-3 rounded-xl border ${
                    systemStatus.status === "healthy"
                      ? "bg-emerald-50/50 border-emerald-100/80 text-emerald-700"
                      : systemStatus.status === "degraded"
                        ? "bg-amber-50/50 border-amber-100/80 text-amber-700"
                        : "bg-red-50/50 border-red-100/80 text-red-700"
                  }`}
                >
                  {systemStatus.status === "healthy" ? (
                    <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
                  ) : systemStatus.status === "degraded" ? (
                    <AlertTriangle className="w-4 h-4 text-amber-500 flex-shrink-0" />
                  ) : (
                    <XCircle className="w-4 h-4 text-red-500 flex-shrink-0" />
                  )}
                  <div>
                    <p
                      className={`text-xs font-bold ${
                        systemStatus.status === "healthy"
                          ? "text-emerald-700"
                          : systemStatus.status === "degraded"
                            ? "text-amber-700"
                            : "text-red-700"
                      }`}
                    >
                      {systemStatus.status === "healthy"
                        ? "All Systems Operational"
                        : systemStatus.status === "degraded"
                          ? "Performance Degraded"
                          : "Service Outage Detected"}
                    </p>
                    <p className="text-[9px] text-neutral-500 mt-0.5">
                      via {systemStatus.metadata?.updatedBy || "system-cron"}
                    </p>
                  </div>
                </div>

                {/* Individual Services */}
                <div className="space-y-1">
                  {[
                    {
                      name: "Supabase DB",
                      status: systemStatus.dbStatus,
                      latency: systemStatus.metadata?.dbPingTimeMs,
                      icon: <Database className="w-3.5 h-3.5" />,
                    },
                    {
                      name: "Static Website",
                      status: systemStatus.websiteStatus,
                      latency: systemStatus.metadata?.websitePingTimeMs,
                      icon: <Globe className="w-3.5 h-3.5" />,
                    },
                    {
                      name: "API Worker",
                      status: systemStatus.apiStatus,
                      latency: systemStatus.metadata?.apiPingTimeMs,
                      icon: <Network className="w-3.5 h-3.5" />,
                    },
                    {
                      name: "Images Worker",
                      status: systemStatus.imagesStatus,
                      latency: systemStatus.metadata?.imagesPingTimeMs,
                      icon: <HardDrive className="w-3.5 h-3.5" />,
                    },
                  ].map((service, idx) => (
                    <div
                      key={idx}
                      className="flex items-center justify-between px-3 py-2.5 rounded-xl hover:bg-neutral-50 transition-colors text-xs"
                    >
                      <div className="flex items-center gap-2.5">
                        <div className="text-neutral-400">{service.icon}</div>
                        <span className="text-neutral-700 font-semibold">{service.name}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        {service.latency !== undefined && service.status === "up" && (
                          <span className="text-[10px] text-neutral-500 font-medium">
                            {service.latency}ms
                          </span>
                        )}
                        <span
                          className={`flex items-center gap-1 text-[10px] font-semibold ${
                            service.status === "up" ? "text-emerald-700" : "text-red-700"
                          }`}
                        >
                          <span
                            className={`w-1.5 h-1.5 rounded-full ${service.status === "up" ? "bg-emerald-600" : "bg-red-600"}`}
                          />
                          {service.status === "up" ? "Online" : "Offline"}
                        </span>
                      </div>
                    </div>
                  ))}
                </div>

                {/* Footer Sync Time */}
                <div className="flex items-center justify-between text-[9px] text-neutral-500 font-medium pt-2 border-t border-neutral-50">
                  <span className="flex items-center gap-1 text-neutral-500">
                    <Clock className="w-3 h-3" />
                    Last diagnostic:
                  </span>
                  <span suppressHydrationWarning className="text-neutral-600">
                    {mounted && systemStatus.lastPing
                      ? formatLocalDateTimeVerbose(systemStatus.lastPing)
                      : "..."}
                  </span>
                </div>
              </div>
            )}
          </AdminCard>
        </div>
      </div>
    </div>
  );
}
