"use client";

import {
  Activity,
  AlertTriangle,
  ChevronDown,
  ChevronUp,
  Clock,
  Database,
  Globe,
  HardDrive,
  Loader2,
  Network,
  RefreshCw,
  TrendingUp,
} from "lucide-react";
import React, { useEffect, useState } from "react";

import { useToast } from "@/context/ToastContext";
import { adminPost, getRecords } from "@/lib/adminApi";
import type { SystemStatus } from "@/types/system-status";

interface MetricCardProps {
  title: string;
  value: string | number;
  subtext: string;
  icon: React.ReactNode;
  bgIconColor: string;
  textColor: string;
}

function MetricCard({ title, value, subtext, icon, bgIconColor, textColor }: MetricCardProps) {
  return (
    <div className="bg-white rounded-[2rem] border border-border-light p-6">
      <div className="flex items-start justify-between">
        <div className="space-y-3">
          <p className="text-xs font-semibold text-neutral-400 uppercase tracking-wider">{title}</p>
          <h3 className="text-2xl md:text-3xl font-display font-bold text-foreground leading-none">
            {value}
          </h3>
          <p className="text-xs text-neutral-400 font-medium">{subtext}</p>
        </div>
        <div
          className={`w-12 h-12 rounded-full ${bgIconColor} ${textColor} flex items-center justify-center border border-current/10 flex-shrink-0`}
        >
          {icon}
        </div>
      </div>
    </div>
  );
}

export default function SystemStatusDashboard() {
  const { showToast } = useToast();
  const [logs, setLogs] = useState<SystemStatus[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [pinging, setPinging] = useState<boolean>(false);
  const [expandedLogId, setExpandedLogId] = useState<string | null>(null);

  const [refreshTrigger, setRefreshTrigger] = useState<number>(0);

  // Fetch status history on load
  useEffect(() => {
    let active = true;
    const fetchLogs = async () => {
      try {
        const data = await getRecords<SystemStatus>(
          "system-status",
          "order=createdAt.desc&limit=100",
        );
        if (active) {
          setLogs(data);
        }
      } catch (err: unknown) {
        console.error("Failed to load status logs:", err);
        const errMsg = err instanceof Error ? err.message : "Failed to retrieve diagnostic logs.";
        showToast("error", "Database Sync", errMsg);
      } finally {
        if (active) {
          setLoading(false);
        }
      }
    };
    fetchLogs();
    return () => {
      active = false;
    };
  }, [showToast, refreshTrigger]);

  const handleManualPing = async () => {
    try {
      setPinging(true);
      setLoading(true);
      const response = await adminPost<{ success: boolean; data: SystemStatus; error?: string }>(
        "/admin/system-status/ping",
        {},
      );
      if (response && response.success) {
        showToast("success", "Diagnostic Check", "New system status check executed!");
        setRefreshTrigger((prev) => prev + 1);
      } else {
        throw new Error(response?.error || "Diagnostics failed");
      }
    } catch (err: unknown) {
      console.error("Diagnostic trigger failed:", err);
      const errMsg = err instanceof Error ? err.message : "Failed to run manual diagnostics.";
      showToast("error", "Diagnostic Failed", errMsg);
      setLoading(false);
    } finally {
      setPinging(false);
    }
  };

  // Metrics Calculations
  const totalChecks = logs.length;
  const healthyChecks = logs.filter((l) => l.status === "healthy").length;
  const uptimeScore = totalChecks > 0 ? ((healthyChecks / totalChecks) * 100).toFixed(2) : "100.00";

  const totalIncidents = logs.filter((l) => l.status !== "healthy").length;

  // Average DB Response Time
  let avgDbLatency = 0;
  let validDbLatencies = 0;
  logs.forEach((log) => {
    const latency = log.metadata?.dbPingTimeMs;
    if (latency !== undefined && latency !== null) {
      avgDbLatency += latency;
      validDbLatencies++;
    }
  });
  avgDbLatency = validDbLatencies > 0 ? Math.round(avgDbLatency / validDbLatencies) : 0;

  // Latest status (represented by the first element since list is sorted by createdAt desc)
  const currentStatus = logs[0] || null;

  // SVG Chart data preparation (latest 20 pings in chronological order)
  const chartLogs = [...logs].reverse().slice(-20);

  // Render SVG Chart lines path
  const getChartLinePath = (
    metricKey: "dbPingTimeMs" | "websitePingTimeMs" | "apiPingTimeMs" | "imagesPingTimeMs",
  ) => {
    if (chartLogs.length < 2) return "";
    const w = 600;
    const h = 180;
    const paddingX = 30;
    const paddingY = 20;

    // Determine max value dynamically for scaling
    let maxVal = 500; // default cap
    chartLogs.forEach((l) => {
      const val = l.metadata?.[metricKey] ?? 0;
      if (val > maxVal) maxVal = val;
    });
    // Add 10% breathing room
    maxVal = maxVal * 1.1;

    return chartLogs
      .map((log, index) => {
        const val = log.metadata?.[metricKey] ?? 0;
        const x = (index / (chartLogs.length - 1)) * (w - paddingX * 2) + paddingX;
        // Invert Y axis (0ms is at the bottom)
        const y = h - paddingY - (val / maxVal) * (h - paddingY * 2);
        return `${index === 0 ? "M" : "L"} ${x} ${y}`;
      })
      .join(" ");
  };

  const toggleExpandLog = (id: string) => {
    setExpandedLogId((prev) => (prev === id ? null : id));
  };

  return (
    <div className="space-y-8 animate-in fade-in duration-300">
      {/* Top Action Bar */}
      <div className="flex justify-end">
        <button
          onClick={handleManualPing}
          disabled={pinging || loading}
          className="flex items-center justify-center gap-2 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs py-2.5 px-6 shadow-premium transition-all cursor-pointer disabled:opacity-50"
        >
          {pinging ? (
            <Loader2 className="w-3.5 h-3.5 animate-spin" />
          ) : (
            <RefreshCw className="w-3.5 h-3.5" />
          )}
          <span>Ping Diagnostics Now</span>
        </button>
      </div>

      {loading ? (
        <div className="py-32 flex flex-col items-center justify-center bg-white rounded-[2rem] border border-border-light">
          <Loader2 className="w-10 h-10 text-brand animate-spin" />
          <p className="text-sm font-semibold text-neutral-500 mt-3 animate-pulse">
            Loading dashboard diagnostics...
          </p>
        </div>
      ) : (
        <>
          {/* Uptime Metrics Row */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <MetricCard
              title="System Uptime Score"
              value={`${uptimeScore}%`}
              subtext="Percentage of healthy runs"
              icon={<TrendingUp className="w-5 h-5" />}
              bgIconColor="bg-emerald-50"
              textColor="text-emerald-600"
            />
            <MetricCard
              title="Active Health Monitors"
              value={currentStatus ? "4 / 4" : "0 / 4"}
              subtext="Monitored web subsystems"
              icon={<Activity className="w-5 h-5" />}
              bgIconColor="bg-brand-light"
              textColor="text-brand"
            />
            <MetricCard
              title="Avg Database Latency"
              value={`${avgDbLatency} ms`}
              subtext="Avg SQL execution speed"
              icon={<Database className="w-5 h-5" />}
              bgIconColor="bg-blue-50"
              textColor="text-blue-600"
            />
            <MetricCard
              title="Total Outages / Warnings"
              value={totalIncidents}
              subtext="Runs flagged as degraded/down"
              icon={<AlertTriangle className="w-5 h-5" />}
              bgIconColor="bg-amber-50"
              textColor="text-amber-600"
            />
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Latency Trend Area Chart */}
            <div className="lg:col-span-2 bg-white rounded-[2rem] border border-border-light p-6 md:p-8 space-y-6 flex flex-col justify-between">
              <div>
                <h3 className="text-base font-bold font-display text-foreground">
                  Latency Trend Metrics
                </h3>
                <p className="text-xs text-neutral-400 mt-0.5 font-medium">
                  Response latency values (ms) plotted for the last 20 diagnostic checks
                </p>
              </div>

              {chartLogs.length < 2 ? (
                <div className="h-48 flex items-center justify-center text-xs text-neutral-400 font-medium italic">
                  Not enough historical log data yet to plot trends.
                </div>
              ) : (
                <div className="w-full">
                  {/* SVG Chart */}
                  <svg viewBox="0 0 600 180" className="w-full overflow-visible">
                    {/* Grid Lines */}
                    <line
                      x1="30"
                      y1="20"
                      x2="570"
                      y2="20"
                      stroke="var(--color-neutral-100)"
                      strokeWidth="1"
                    />
                    <line
                      x1="30"
                      y1="65"
                      x2="570"
                      y2="65"
                      stroke="var(--color-neutral-100)"
                      strokeWidth="1"
                    />
                    <line
                      x1="30"
                      y1="110"
                      x2="570"
                      y2="110"
                      stroke="var(--color-neutral-100)"
                      strokeWidth="1"
                    />
                    <line
                      x1="30"
                      y1="160"
                      x2="570"
                      y2="160"
                      stroke="var(--color-neutral-200)"
                      strokeWidth="1.5"
                    />

                    {/* Chart Paths */}
                    <path
                      d={getChartLinePath("dbPingTimeMs")}
                      fill="none"
                      stroke="var(--color-blue-500)"
                      strokeWidth="2.5"
                      strokeLinecap="round"
                    />
                    <path
                      d={getChartLinePath("websitePingTimeMs")}
                      fill="none"
                      stroke="var(--color-amber-500)"
                      strokeWidth="2.5"
                      strokeLinecap="round"
                    />
                    <path
                      d={getChartLinePath("apiPingTimeMs")}
                      fill="none"
                      stroke="var(--color-emerald-500)"
                      strokeWidth="2.5"
                      strokeLinecap="round"
                    />
                    <path
                      d={getChartLinePath("imagesPingTimeMs")}
                      fill="none"
                      stroke="var(--color-purple-500)"
                      strokeWidth="2.5"
                      strokeLinecap="round"
                    />
                  </svg>
                </div>
              )}

              {/* Legends Row */}
              <div className="flex flex-wrap items-center gap-6 justify-center text-[10px] pt-4 border-t border-border-light font-semibold">
                <span className="flex items-center gap-2 text-neutral-600">
                  <span className="w-2.5 h-2.5 rounded-full bg-blue-500" />
                  PostgreSQL DB
                </span>
                <span className="flex items-center gap-2 text-neutral-600">
                  <span className="w-2.5 h-2.5 rounded-full bg-amber-500" />
                  Static Website
                </span>
                <span className="flex items-center gap-2 text-neutral-600">
                  <span className="w-2.5 h-2.5 rounded-full bg-emerald-500" />
                  API Worker
                </span>
                <span className="flex items-center gap-2 text-neutral-600">
                  <span className="w-2.5 h-2.5 rounded-full bg-purple-500" />
                  Images Worker
                </span>
              </div>
            </div>

            {/* Service Status Panel */}
            <div className="bg-white rounded-[2rem] border border-border-light p-6 md:p-8 space-y-6">
              <div>
                <h3 className="text-base font-bold font-display text-foreground">
                  Services Monitor
                </h3>
                <p className="text-xs text-neutral-400 mt-0.5 font-medium">
                  Current subsystem operational status
                </p>
              </div>

              {!currentStatus ? (
                <div className="py-12 text-center text-xs text-neutral-400 font-medium italic border border-dashed border-border-light rounded-[1.5rem]">
                  No status data available.
                </div>
              ) : (
                <div className="space-y-4">
                  {/* Service: DB */}
                  <div className="flex items-center justify-between p-3.5 rounded-[1.5rem] border border-border-light text-xs font-semibold">
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-xl bg-blue-50 text-blue-600">
                        <Database className="w-4 h-4" />
                      </div>
                      <div>
                        <p className="text-neutral-800">Database Connection</p>
                        <p className="text-[10px] text-neutral-400 font-normal">
                          Supabase PostgreSQL
                        </p>
                      </div>
                    </div>
                    <div className="text-right">
                      <span
                        className={`inline-flex px-2.5 py-0.5 rounded-full text-[9px] font-bold border ${
                          currentStatus.dbStatus === "up"
                            ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                            : "bg-red-50 text-red-600 border-red-100"
                        }`}
                      >
                        {currentStatus.dbStatus === "up" ? "Online" : "Offline"}
                      </span>
                      <p className="text-[9px] text-neutral-400 font-medium mt-1">
                        {currentStatus.metadata?.dbPingTimeMs ?? "-"} ms
                      </p>
                    </div>
                  </div>

                  {/* Service: Web */}
                  <div className="flex items-center justify-between p-3.5 rounded-[1.5rem] border border-border-light text-xs font-semibold">
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-xl bg-amber-50 text-amber-600">
                        <Globe className="w-4 h-4" />
                      </div>
                      <div>
                        <p className="text-neutral-800">Static Website</p>
                        <p className="text-[10px] text-neutral-400 font-normal">
                          Public Contact Route
                        </p>
                      </div>
                    </div>
                    <div className="text-right">
                      <span
                        className={`inline-flex px-2.5 py-0.5 rounded-full text-[9px] font-bold border ${
                          currentStatus.websiteStatus === "up"
                            ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                            : "bg-red-50 text-red-600 border-red-100"
                        }`}
                      >
                        {currentStatus.websiteStatus === "up" ? "Online" : "Offline"}
                      </span>
                      <p className="text-[9px] text-neutral-400 font-medium mt-1">
                        {currentStatus.metadata?.websitePingTimeMs ?? "-"} ms
                      </p>
                    </div>
                  </div>

                  {/* Service: API */}
                  <div className="flex items-center justify-between p-3.5 rounded-[1.5rem] border border-border-light text-xs font-semibold">
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-xl bg-emerald-50 text-emerald-600">
                        <Network className="w-4 h-4" />
                      </div>
                      <div>
                        <p className="text-neutral-800">API Gateway Server</p>
                        <p className="text-[10px] text-neutral-400 font-normal">
                          Cloudflare API Worker
                        </p>
                      </div>
                    </div>
                    <div className="text-right">
                      <span
                        className={`inline-flex px-2.5 py-0.5 rounded-full text-[9px] font-bold border ${
                          currentStatus.apiStatus === "up"
                            ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                            : "bg-red-50 text-red-600 border-red-100"
                        }`}
                      >
                        {currentStatus.apiStatus === "up" ? "Online" : "Offline"}
                      </span>
                      <p className="text-[9px] text-neutral-400 font-medium mt-1">
                        {currentStatus.metadata?.apiPingTimeMs ?? "-"} ms
                      </p>
                    </div>
                  </div>

                  {/* Service: Images */}
                  <div className="flex items-center justify-between p-3.5 rounded-[1.5rem] border border-border-light text-xs font-semibold">
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-xl bg-purple-50 text-purple-600">
                        <HardDrive className="w-4 h-4" />
                      </div>
                      <div>
                        <p className="text-neutral-800">Media Cdn Proxy</p>
                        <p className="text-[10px] text-neutral-400 font-normal">
                          Cloudflare Images R2
                        </p>
                      </div>
                    </div>
                    <div className="text-right">
                      <span
                        className={`inline-flex px-2.5 py-0.5 rounded-full text-[9px] font-bold border ${
                          currentStatus.imagesStatus === "up"
                            ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                            : "bg-red-50 text-red-600 border-red-100"
                        }`}
                      >
                        {currentStatus.imagesStatus === "up" ? "Online" : "Offline"}
                      </span>
                      <p className="text-[9px] text-neutral-400 font-medium mt-1">
                        {currentStatus.metadata?.imagesPingTimeMs ?? "-"} ms
                      </p>
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Diagnostic Log History List */}
          <div className="bg-white rounded-[2rem] border border-border-light p-6 md:p-8 space-y-6">
            <div>
              <h3 className="text-base font-bold font-display text-foreground">
                Diagnostic Logs History
              </h3>
              <p className="text-xs text-neutral-400 mt-0.5 font-medium">
                Detailed run logs and response metrics recorded (showing latest {logs.length} runs)
              </p>
            </div>

            <div className="overflow-x-auto no-scrollbar">
              {logs.length === 0 ? (
                <div className="py-12 text-center text-xs text-neutral-400 font-medium italic">
                  No diagnostic runs recorded yet.
                </div>
              ) : (
                <table className="w-full text-left border-collapse text-xs font-medium">
                  <thead>
                    <tr className="border-b border-border-light text-neutral-400 font-semibold uppercase tracking-wider">
                      <th className="pb-3 pr-4">Diagnostic Timestamp</th>
                      <th className="pb-3 px-4">Log ID (UUID)</th>
                      <th className="pb-3 px-4 text-center">Status</th>
                      <th className="pb-3 px-4 text-center">Website</th>
                      <th className="pb-3 px-4 text-center">API</th>
                      <th className="pb-3 px-4 text-center">Images</th>
                      <th className="pb-3 px-4 text-center">Database</th>
                      <th className="pb-3 pl-4 text-right">Details</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border-light text-neutral-700">
                    {logs.map((log) => {
                      const isExpanded = expandedLogId === log.id;
                      return (
                        <React.Fragment key={log.id}>
                          <tr className="group hover:bg-neutral-50/50 transition-colors">
                            <td className="py-3.5 pr-4 text-neutral-800 font-semibold">
                              <span className="flex items-center gap-1.5">
                                <Clock className="w-3.5 h-3.5 text-neutral-400" />
                                {new Date(log.lastPing).toLocaleString("en-IN", {
                                  day: "numeric",
                                  month: "short",
                                  hour: "2-digit",
                                  minute: "2-digit",
                                  second: "2-digit",
                                })}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 font-mono text-[10px] text-neutral-400">
                              {log.id}
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span
                                className={`inline-flex px-2 py-0.5 text-[10px] font-bold rounded-full border ${
                                  log.status === "healthy"
                                    ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                                    : log.status === "degraded"
                                      ? "bg-amber-50 text-amber-600 border-amber-100"
                                      : "bg-red-50 text-red-600 border-red-100"
                                }`}
                              >
                                {log.status}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span
                                className={
                                  log.websiteStatus === "up"
                                    ? "text-emerald-600"
                                    : "text-red-500 font-bold"
                                }
                              >
                                {log.websiteStatus === "up" ? "Online" : "Offline"}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span
                                className={
                                  log.apiStatus === "up"
                                    ? "text-emerald-600"
                                    : "text-red-500 font-bold"
                                }
                              >
                                {log.apiStatus === "up" ? "Online" : "Offline"}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span
                                className={
                                  log.imagesStatus === "up"
                                    ? "text-emerald-600"
                                    : "text-red-500 font-bold"
                                }
                              >
                                {log.imagesStatus === "up" ? "Online" : "Offline"}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span
                                className={
                                  log.dbStatus === "up"
                                    ? "text-emerald-600"
                                    : "text-red-500 font-bold"
                                }
                              >
                                {log.dbStatus === "up" ? "Online" : "Offline"}
                              </span>
                            </td>
                            <td className="py-3.5 pl-4 text-right">
                              <button
                                onClick={() => toggleExpandLog(log.id)}
                                className="p-1.5 rounded-full border border-neutral-100 hover:border-brand hover:bg-brand-light text-neutral-500 hover:text-brand transition-all cursor-pointer"
                                title="Expand Details"
                              >
                                {isExpanded ? (
                                  <ChevronUp className="w-3.5 h-3.5" />
                                ) : (
                                  <ChevronDown className="w-3.5 h-3.5" />
                                )}
                              </button>
                            </td>
                          </tr>

                          {/* Expanded JSON details block */}
                          {isExpanded && (
                            <tr>
                              <td colSpan={8} className="p-4 bg-neutral-50 rounded-lg">
                                <div className="space-y-3 font-semibold text-neutral-700 text-xs leading-relaxed">
                                  <p className="font-bold text-neutral-900 border-b border-border-light pb-1.5">
                                    Diagnostic Metadata Details
                                  </p>
                                  <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 py-1">
                                    <div>
                                      <p className="text-[10px] text-neutral-400">
                                        SYNC AGENT TRIGGER
                                      </p>
                                      <p className="mt-0.5">
                                        {log.metadata?.updatedBy || "system-cron"}
                                      </p>
                                    </div>
                                    <div>
                                      <p className="text-[10px] text-neutral-400">
                                        DATABASE PROFILE COMPANY
                                      </p>
                                      <p className="mt-0.5">{log.metadata?.companyName || "N/A"}</p>
                                    </div>
                                    <div>
                                      <p className="text-[10px] text-neutral-400">
                                        DATABASE SCHEMA COUNTS
                                      </p>
                                      <p className="mt-0.5 text-neutral-600 font-normal">
                                        Packages:{" "}
                                        <span className="font-bold text-neutral-800">
                                          {log.metadata?.packagesCount ?? 0}
                                        </span>{" "}
                                        | Destinations:{" "}
                                        <span className="font-bold text-neutral-800">
                                          {log.metadata?.destinationsCount ?? 0}
                                        </span>{" "}
                                        | Blogs:{" "}
                                        <span className="font-bold text-neutral-800">
                                          {log.metadata?.blogsCount ?? 0}
                                        </span>
                                      </p>
                                    </div>
                                  </div>
                                  <div>
                                    <p className="text-[10px] text-neutral-400">
                                      RAW LOG JSON METADATA
                                    </p>
                                    <pre className="mt-1.5 p-3 bg-neutral-900 text-neutral-100 rounded-xl font-mono text-[10px] overflow-x-auto leading-normal">
                                      {JSON.stringify(log.metadata, null, 2)}
                                    </pre>
                                  </div>
                                </div>
                              </td>
                            </tr>
                          )}
                        </React.Fragment>
                      );
                    })}
                  </tbody>
                </table>
              )}
            </div>
          </div>
        </>
      )}
    </div>
  );
}
