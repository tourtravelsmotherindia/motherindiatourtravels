"use client";

import { motion } from "framer-motion";
import {
  AlertTriangle,
  Calendar,
  CheckCircle2,
  ChevronDown,
  Clock,
  Database,
  Globe,
  HardDrive,
  Inbox,
  IndianRupee,
  Network,
  RefreshCw,
  Search,
  ShoppingCart,
  Users,
  XCircle,
} from "lucide-react";
import React, { useEffect, useState } from "react";

import AdminCard from "@/components/manage/AdminCard";
import LoadingState from "@/components/manage/LoadingState";
import Dropdown from "@/components/ui/Dropdown";
import { useToast } from "@/context/ToastContext";
import { useSystemPing } from "@/lib/hooks/mutations";
import { useDashboardMetrics } from "@/lib/hooks/queries";
import type { BookingSummary } from "@/lib/hooks/queries/useDashboardMetrics";
import { formatLocalDateTime, formatLocalDateTimeVerbose } from "@/lib/manage/dateUtils";

// Redesigned Metric Card matching Finexy UI
interface MetricCardProps {
  title: string;
  value: string | number;
  change?: string;
  changeType?: "up" | "down";
  subtitle: string;
  icon: React.ReactNode;
}

function MetricCard({ title, value, change, changeType = "up", subtitle, icon }: MetricCardProps) {
  return (
    <AdminCard className="bg-black border border-neutral-800 text-white flex flex-col justify-between min-h-[145px] transition-all hover:border-neutral-700">
      <div className="flex items-center justify-between mb-4">
        <span className="text-neutral-400 text-xs font-semibold">{title}</span>
        <div className="w-8 h-8 rounded-full border border-neutral-800 flex items-center justify-center text-neutral-400 bg-neutral-950 shrink-0 shadow-[0_1px_4px_rgba(0,0,0,0.2)]">
          {icon}
        </div>
      </div>

      <div className="flex items-baseline gap-2">
        <span className="text-3xl font-display font-extrabold text-white tracking-tight leading-none">
          {value}
        </span>
        {change && (
          <span
            className={`inline-flex items-center gap-0.5 px-2 py-0.5 rounded-full text-[10px] font-bold leading-none ${
              changeType === "up"
                ? "bg-emerald-950/40 text-emerald-400 border border-emerald-900/30"
                : "bg-red-950/40 text-red-400 border border-red-900/30"
            }`}
          >
            {changeType === "up" ? "↑" : "↓"} {change}
          </span>
        )}
      </div>

      <p className="text-[10px] text-neutral-500 font-semibold mt-3">{subtitle}</p>
    </AdminCard>
  );
}

export default function DashboardOverview() {
  const { showToast } = useToast();
  const [mounted, setMounted] = useState<boolean>(false);
  const [searchTerm, setSearchTerm] = useState<string>("");
  const [sortBy, setSortBy] = useState<string>("newest");
  const [analyticsTimeframe, setAnalyticsTimeframe] = useState<string>("this_week");

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

  const formatDatePickerRange = () => {
    const end = new Date();
    const start = new Date();
    start.setDate(end.getDate() - 30);
    const opt: Intl.DateTimeFormatOptions = { day: "numeric", month: "short", year: "numeric" };
    return `${start.toLocaleDateString("en-US", opt)} - ${end.toLocaleDateString("en-US", opt)}`;
  };

  // Mock Trend Data matching Finexy visual layout
  const weeklyRevenueData = [
    { day: "Fri", amount: 45, value: "₹12,500" },
    { day: "Sat", amount: 35, value: "₹8,900" },
    { day: "Sun", amount: 80, value: "₹22,430" }, // Sunday highlighted
    { day: "Mon", amount: 40, value: "₹11,200" },
    { day: "Thu", amount: 55, value: "₹15,400" },
    { day: "Wed", amount: 70, value: "₹19,800" },
    { day: "Tue", amount: 50, value: "₹14,000" },
  ];

  const monthlyIncomeData = [
    { month: "Jan", profit: 60, loss: 40 },
    { month: "Feb", profit: 75, loss: 20 },
    { month: "Mar", profit: 80, loss: 20 },
    { month: "Apr", profit: 70, loss: 30 },
    { month: "May", profit: 85, loss: 15 },
    { month: "Jun", profit: 90, loss: 10 },
    { month: "Jul", profit: 75, loss: 25 },
    { month: "Aug", profit: 65, loss: 30 },
  ];

  // Derived values
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

  // Search & sorting for the dashboard bookings table
  const filteredBookings = React.useMemo(() => {
    let list = [...recentBookings];
    if (searchTerm.trim()) {
      const q = searchTerm.toLowerCase();
      list = list.filter(
        (b) => b.name.toLowerCase().includes(q) || b.email.toLowerCase().includes(q),
      );
    }

    list.sort((a, b) => {
      const timeA = new Date(a.createdAt).getTime();
      const timeB = new Date(b.createdAt).getTime();
      return sortBy === "newest" ? timeB - timeA : timeA - timeB;
    });

    return list;
  }, [recentBookings, searchTerm, sortBy]);

  const getBookingStatusStyle = (status: string) => {
    switch (status) {
      case "NEW":
        return "bg-brand/10 text-brand border-brand/20";
      case "READ":
        return "bg-neutral-900 text-neutral-400 border-neutral-800";
      case "CONTACTED":
        return "bg-blue-950/40 text-blue-400 border-blue-900/30";
      default:
        return "bg-emerald-950/40 text-emerald-400 border-emerald-900/30";
    }
  };

  if (loading) {
    return <LoadingState message="Fetching system telemetry..." />;
  }

  return (
    <div className="space-y-6 animate-in fade-in duration-300 text-white bg-black">
      {/* Top Header Row styled like Finexy */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h2 className="text-xl md:text-2xl font-bold font-display text-white">Sales Overview</h2>
          <p className="text-xs text-neutral-400 mt-0.5">
            {getGreeting()} Here is a snapshot of what is happening today.
          </p>
        </div>
        <button className="flex items-center gap-2.5 text-xs text-neutral-300 bg-neutral-950 border border-neutral-850 rounded-full px-4 py-2 font-semibold shadow-premium transition-all hover:bg-neutral-900 cursor-pointer shrink-0">
          <Calendar className="w-3.5 h-3.5 text-neutral-400" />
          <span>{mounted ? formatDatePickerRange() : "Loading..."}</span>
          <ChevronDown className="w-3.5 h-3.5 text-neutral-500" />
        </button>
      </div>

      {/* Error State Banner */}
      {isError && (
        <div className="bg-black rounded-2xl border border-red-900/30 p-6 text-white flex items-center justify-between gap-4">
          <div className="flex items-center gap-3">
            <AlertTriangle className="w-5 h-5 text-red-500 shrink-0" />
            <div>
              <p className="text-sm font-bold text-red-400">Dashboard telemetry failed to load</p>
              <p className="text-xs text-red-500 mt-0.5">
                {error instanceof Error ? error.message : "Unknown connectivity error"}
              </p>
            </div>
          </div>
          <button
            onClick={() => refetch()}
            className="px-4 py-2 rounded-full bg-neutral-900 border border-neutral-800 text-xs font-semibold text-neutral-300 hover:bg-neutral-800 transition-colors"
          >
            Retry
          </button>
        </div>
      )}

      {/* Metrics Row matching Finexy UI */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <MetricCard
          title="Total Sales"
          value={metricsValues.bookingsCount}
          change="4.9%"
          changeType="up"
          subtitle={`Last month: ${Math.max(0, metricsValues.bookingsCount - metricsValues.newBookings)}`}
          icon={<ShoppingCart className="w-4 h-4" />}
        />
        <MetricCard
          title="New Customer"
          value={metricsValues.newBookings}
          change="7.5%"
          changeType="up"
          subtitle={`Active sign-ups: ${metricsValues.newBookings}`}
          icon={<Users className="w-4 h-4" />}
        />
        <MetricCard
          title="Return Products"
          value={metricsValues.contactsCount}
          change="6.0%"
          changeType="down"
          subtitle={`Pending reviews: ${metricsValues.contactsCount}`}
          icon={<Inbox className="w-4 h-4" />}
        />
        <MetricCard
          title="Total Revenue"
          value={`₹${(metricsValues.bookingsCount * 12500).toLocaleString("en-IN")}`}
          subtitle={`Est. conversion: ₹${((metricsValues.bookingsCount - metricsValues.newBookings) * 12500).toLocaleString("en-IN")}`}
          icon={<IndianRupee className="w-4 h-4" />}
        />
      </div>

      {/* Analytics Charts Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Left: Revenue Analytics Bar Chart */}
        <AdminCard className="lg:col-span-2 bg-black border border-neutral-800">
          <div className="flex items-center justify-between mb-6">
            <h3 className="text-sm font-bold font-display text-white">Revenue analytics</h3>
            <Dropdown
              options={[
                { value: "this_week", label: "This Week" },
                { value: "last_week", label: "Last Week" },
              ]}
              value={analyticsTimeframe}
              onChange={(val) => setAnalyticsTimeframe(val)}
              className="w-32"
              triggerClassName="py-1 px-3 text-xs bg-neutral-950 border border-neutral-850 text-neutral-300 hover:text-white"
              theme="dark"
            />
          </div>

          <div className="h-60 flex items-end justify-between gap-3 px-2 pt-6 pb-2 relative">
            {/* Horizontal Grid lines */}
            <div className="absolute inset-0 flex flex-col justify-between pointer-events-none pb-8 pt-6">
              <div className="border-b border-neutral-900 w-full" />
              <div className="border-b border-neutral-900 w-full" />
              <div className="border-b border-neutral-900 w-full" />
            </div>

            {weeklyRevenueData.map((item, idx) => (
              <div
                key={idx}
                className="flex flex-col items-center gap-2.5 flex-1 group relative cursor-pointer z-10"
              >
                {/* Tooltip */}
                <div
                  className={`absolute -top-9 px-2.5 py-1 text-[10px] font-bold rounded-lg shadow-premium transition-all duration-205 whitespace-nowrap z-20 pointer-events-none ${
                    item.day === "Sun"
                      ? "bg-brand text-white opacity-100 translate-y-0"
                      : "bg-neutral-900 border border-neutral-800 text-white opacity-0 group-hover:opacity-100 translate-y-1 group-hover:translate-y-0"
                  }`}
                >
                  {item.value}
                </div>

                {/* Vertical Bar */}
                <div className="w-full h-44 flex items-end bg-neutral-950/20 rounded-t-lg overflow-hidden">
                  <motion.div
                    initial={{ height: 0 }}
                    animate={{ height: `${item.amount}%` }}
                    transition={{ duration: 0.8, ease: "easeOut" }}
                    className={`w-full rounded-t-lg transition-colors duration-200 ${
                      item.day === "Sun" ? "bg-brand" : "bg-neutral-850 group-hover:bg-neutral-700"
                    }`}
                  />
                </div>

                <span
                  className={`text-[10px] font-semibold transition-colors duration-200 ${
                    item.day === "Sun"
                      ? "text-brand font-bold"
                      : "text-neutral-500 group-hover:text-neutral-300"
                  }`}
                >
                  {item.day}
                </span>
              </div>
            ))}
          </div>
        </AdminCard>

        {/* Right: Total Income Stacked Chart */}
        <AdminCard className="bg-black border border-neutral-800">
          <div className="mb-4">
            <h3 className="text-sm font-bold font-display text-white">Total Income</h3>
            <p className="text-[10px] text-neutral-500 mt-0.5">
              View your income in a certain period of time
            </p>
          </div>

          {/* Legends */}
          <div className="flex items-center gap-4 mb-4 text-[10px] font-semibold">
            <div className="flex items-center gap-1.5">
              <span className="w-2.5 h-2.5 rounded-full bg-brand shrink-0" />
              <span className="text-neutral-400">Profit</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="w-2.5 h-2.5 rounded-full bg-neutral-850 shrink-0" />
              <span className="text-neutral-400">Loss</span>
            </div>
          </div>

          <div className="h-44 flex items-end justify-between gap-1.5 px-1 pt-6 pb-2 relative">
            {monthlyIncomeData.map((item, idx) => (
              <div
                key={idx}
                className="flex flex-col items-center gap-2 flex-1 group cursor-pointer relative"
              >
                {/* Tooltip */}
                <div className="absolute -top-10 px-2.5 py-1 bg-neutral-900 border border-neutral-800 text-white text-[9px] font-bold rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-200 whitespace-nowrap z-20 pointer-events-none flex flex-col items-center leading-normal">
                  <span className="text-brand">Profit: {item.profit}%</span>
                  <span className="text-neutral-400">Loss: {item.loss}%</span>
                </div>

                {/* Stacked Bar Container */}
                <div className="w-3.5 h-32 rounded-t-md overflow-hidden flex flex-col justify-end bg-neutral-955">
                  <motion.div
                    initial={{ height: 0 }}
                    animate={{ height: `${item.loss}%` }}
                    transition={{ duration: 0.8, delay: 0.1, ease: "easeOut" }}
                    className="w-full bg-neutral-850"
                  />
                  <motion.div
                    initial={{ height: 0 }}
                    animate={{ height: `${item.profit}%` }}
                    transition={{ duration: 0.8, ease: "easeOut" }}
                    className="w-full bg-brand border-t border-black/10"
                  />
                </div>
                <span className="text-[9px] font-semibold text-neutral-500 group-hover:text-neutral-300">
                  {item.month}
                </span>
              </div>
            ))}
          </div>
        </AdminCard>
      </div>

      {/* Bottom Section: Recent Inquiries Table & System Health */}
      <div className="grid grid-cols-1 xl:grid-cols-3 gap-6">
        {/* Recent Inquiries List */}
        <AdminCard
          noPadding
          className="xl:col-span-2 overflow-hidden bg-black border border-neutral-800"
        >
          <div className="flex flex-col sm:flex-row sm:items-center justify-between px-6 pt-5 pb-4 border-b border-neutral-900 gap-3 bg-black">
            <div>
              <h3 className="text-sm font-bold font-display text-white">Recent orders</h3>
              <p className="text-xs text-neutral-500 mt-0.5">Last 5 booking inquiries received.</p>
            </div>

            {/* Filter and Sort Toolbar */}
            <div className="flex items-center gap-3 w-full sm:w-auto">
              <div className="relative w-full sm:w-44">
                <Search className="absolute left-3 top-2.5 w-3.5 h-3.5 text-neutral-500" />
                <input
                  type="text"
                  placeholder="Search guest..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full rounded-full border border-neutral-850 pl-8 pr-4 py-1.5 text-[10px] bg-neutral-950 text-neutral-200 focus:outline-none focus:border-brand/45"
                />
              </div>
              <Dropdown
                options={[
                  { value: "newest", label: "Sort: Newest" },
                  { value: "oldest", label: "Sort: Oldest" },
                ]}
                value={sortBy}
                onChange={(val) => setSortBy(val)}
                className="w-32"
                triggerClassName="py-1.5 px-3 text-[10px] bg-neutral-950 border border-neutral-850 text-neutral-300 hover:text-white"
                theme="dark"
              />
            </div>
          </div>

          <div className="overflow-x-auto no-scrollbar">
            {recentBookings.length === 0 ? (
              <div className="py-12 text-center text-xs text-neutral-500 font-medium italic">
                No bookings found yet.
              </div>
            ) : (
              <table className="w-full text-left border-collapse text-xs bg-black text-white">
                <thead>
                  <tr className="border-b border-neutral-900 text-neutral-400 font-bold uppercase tracking-wider text-[10px]">
                    <th className="py-3 px-6 font-semibold">Guest</th>
                    <th className="py-3 px-6 font-semibold">Date</th>
                    <th className="py-3 px-6 font-semibold">People</th>
                    <th className="py-3 px-6 font-semibold">Rooms</th>
                    <th className="py-3 px-6 font-semibold text-center">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-neutral-900/40 text-neutral-300 font-medium">
                  {filteredBookings.map((b) => (
                    <tr key={b.id} className="hover:bg-neutral-900/30 transition-colors">
                      <td className="py-3.5 px-6">
                        <p className="font-semibold text-white">{b.name}</p>
                        <p className="text-[10px] text-neutral-500 font-normal mt-0.5">{b.email}</p>
                      </td>
                      <td className="py-3.5 px-6 text-neutral-400">
                        {mounted ? formatLocalDateTime(b.createdAt) : "..."}
                      </td>
                      <td className="py-3.5 px-6 text-neutral-300 font-semibold">
                        {b.numberOfPeople || b.adults + b.children + b.infants}
                      </td>
                      <td className="py-3.5 px-6 text-neutral-400">{b.rooms} room(s)</td>
                      <td className="py-3.5 px-6 text-center">
                        <span
                          className={`inline-flex items-center gap-1 px-2.5 py-1 text-[10px] font-semibold rounded-full border ${getBookingStatusStyle(b.status)}`}
                        >
                          <span
                            className={`w-1.5 h-1.5 rounded-full shrink-0 ${
                              b.status === "NEW"
                                ? "bg-brand animate-pulse"
                                : b.status === "READ"
                                  ? "bg-neutral-500"
                                  : b.status === "CONTACTED"
                                    ? "bg-blue-400"
                                    : "bg-emerald-400"
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

        {/* Right Column: System Health */}
        <div className="space-y-4">
          <AdminCard className="bg-black border border-neutral-800">
            <div className="flex items-center justify-between mb-4">
              <div>
                <h3 className="text-sm font-bold font-display text-white">System Health</h3>
                <p className="text-[10px] text-neutral-500 mt-0.5 font-medium">
                  Real-time diagnostics
                </p>
              </div>
              <button
                onClick={handleManualPing}
                disabled={pingMutation.isPending}
                className="p-2 rounded-lg border border-neutral-800 text-neutral-400 hover:text-brand hover:border-brand/40 hover:bg-neutral-900/30 transition-all duration-200 disabled:opacity-50 cursor-pointer"
                title="Run diagnostic check"
              >
                <RefreshCw
                  className={`w-3.5 h-3.5 ${pingMutation.isPending ? "animate-spin text-brand" : "text-neutral-500"}`}
                />
              </button>
            </div>

            {!systemStatus ? (
              <div className="py-4 text-center text-xs text-neutral-550 font-medium italic border border-dashed border-neutral-800 rounded-xl">
                No status data. Click reload to check.
              </div>
            ) : (
              <div className="space-y-3">
                {/* Health Status Banner */}
                <div
                  className={`flex items-center gap-2.5 p-3 rounded-xl border ${
                    systemStatus.status === "healthy"
                      ? "bg-emerald-950/20 border-emerald-900/30 text-emerald-400"
                      : systemStatus.status === "degraded"
                        ? "bg-amber-950/20 border-amber-900/30 text-amber-400"
                        : "bg-red-950/20 border-red-900/30 text-red-400"
                  }`}
                >
                  {systemStatus.status === "healthy" ? (
                    <CheckCircle2 className="w-4 h-4 text-emerald-400 flex-shrink-0" />
                  ) : systemStatus.status === "degraded" ? (
                    <AlertTriangle className="w-4 h-4 text-amber-400 flex-shrink-0" />
                  ) : (
                    <XCircle className="w-4 h-4 text-red-400 flex-shrink-0" />
                  )}
                  <div>
                    <p className="text-xs font-bold leading-none">
                      {systemStatus.status === "healthy"
                        ? "All Systems Operational"
                        : systemStatus.status === "degraded"
                          ? "Performance Degraded"
                          : "Service Outage Detected"}
                    </p>
                    <p className="text-[9px] text-neutral-500 mt-1">
                      via {systemStatus.metadata?.updatedBy || "system-cron"}
                    </p>
                  </div>
                </div>

                {/* Individual Telemetry Checks */}
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
                      className="flex items-center justify-between px-3 py-2.5 rounded-xl hover:bg-neutral-900/35 transition-colors text-xs"
                    >
                      <div className="flex items-center gap-2.5">
                        <div className="text-neutral-500">{service.icon}</div>
                        <span className="text-neutral-300 font-semibold">{service.name}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        {service.latency !== undefined && service.status === "up" && (
                          <span className="text-[10px] text-neutral-500 font-medium">
                            {service.latency}ms
                          </span>
                        )}
                        <span
                          className={`flex items-center gap-1 text-[10px] font-semibold ${
                            service.status === "up" ? "text-emerald-400" : "text-red-400"
                          }`}
                        >
                          <span
                            className={`w-1.5 h-1.5 rounded-full ${service.status === "up" ? "bg-emerald-550" : "bg-red-550"}`}
                          />
                          {service.status === "up" ? "Online" : "Offline"}
                        </span>
                      </div>
                    </div>
                  ))}
                </div>

                {/* Footer Status sync time */}
                <div className="flex items-center justify-between text-[9px] text-neutral-500 font-medium pt-2 border-t border-neutral-900">
                  <span className="flex items-center gap-1 text-neutral-500">
                    <Clock className="w-3 h-3" />
                    Last diagnostic:
                  </span>
                  <span suppressHydrationWarning className="text-neutral-400">
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
