"use client";

import {
  Activity,
  AlertTriangle,
  CheckCircle2,
  Clock,
  CloudLightning,
  ExternalLink,
  Globe,
  Loader2,
  Play,
  XCircle,
} from "lucide-react";
import React, { useEffect, useState } from "react";

import ConfirmationModal from "@/components/ui/ConfirmationModal";
import { useToast } from "@/context/ToastContext";
import { adminGet, adminPost } from "@/lib/adminApi";
import { logger } from "@/lib/logger";
import { formatLocalDateTimeVerbose } from "@/lib/manage/dateUtils";

function GithubIcon(props: React.ComponentProps<"svg">) {
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      {...props}
    >
      <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4" />
      <path d="M9 18c-4.51 2-5-2-7-2" />
    </svg>
  );
}

interface DeployStatus {
  status: string;
  conclusion: string | null;
  url: string;
  createdAt: string;
}

export default function DeployDashboard() {
  const { showToast } = useToast();

  // cPanel States
  const [cpanelStatus, setCpanelStatus] = useState<DeployStatus | null>(null);
  const [cpanelLoading, setCpanelLoading] = useState(true);
  const [cpanelActionState, setCpanelActionState] = useState<
    "idle" | "loading" | "success" | "error"
  >("idle");
  const [isCpanelConfirmOpen, setIsCpanelConfirmOpen] = useState(false);

  // Cloudflare States
  const [cfStatus, setCfStatus] = useState<DeployStatus | null>(null);
  const [cfLoading, setCfLoading] = useState(true);
  const [cfActionState, setCfActionState] = useState<"idle" | "loading" | "success" | "error">(
    "idle",
  );
  const [isCfConfirmOpen, setIsCfConfirmOpen] = useState(false);

  // cPanel Fetch & Poll
  useEffect(() => {
    let active = true;
    let intervalId: NodeJS.Timeout;

    const startPolling = (ms: number) => {
      if (intervalId) clearInterval(intervalId);
      intervalId = setInterval(async () => {
        try {
          const data = await adminGet<DeployStatus>("/deploy?target=cpanel");
          if (active && data && data.status) {
            setCpanelStatus(data);
            if (data.status === "completed") {
              startPolling(30000);
            }
          }
        } catch (err) {
          logger.error("DeployDashboard", "Failed to fetch cpanel status:", err);
        }
      }, ms);
    };

    const load = async () => {
      try {
        const data = await adminGet<DeployStatus>("/deploy?target=cpanel");
        if (active && data && data.status) {
          setCpanelStatus(data);
          if (data.status === "queued" || data.status === "in_progress") {
            startPolling(5000);
          } else {
            startPolling(30000);
          }
        }
      } catch (err) {
        logger.error("DeployDashboard", "Failed to fetch cpanel status:", err);
      } finally {
        if (active) setCpanelLoading(false);
      }
    };

    load();

    return () => {
      active = false;
      if (intervalId) clearInterval(intervalId);
    };
  }, [cpanelActionState]);

  // Cloudflare Fetch & Poll
  useEffect(() => {
    let active = true;
    let intervalId: NodeJS.Timeout;

    const startPolling = (ms: number) => {
      if (intervalId) clearInterval(intervalId);
      intervalId = setInterval(async () => {
        try {
          const data = await adminGet<DeployStatus>("/deploy?target=cloudflare");
          if (active && data && data.status) {
            setCfStatus(data);
            if (data.status === "completed") {
              startPolling(30000);
            }
          }
        } catch (err) {
          logger.error("DeployDashboard", "Failed to fetch Cloudflare status:", err);
        }
      }, ms);
    };

    const load = async () => {
      try {
        const data = await adminGet<DeployStatus>("/deploy?target=cloudflare");
        if (active && data && data.status) {
          setCfStatus(data);
          if (data.status === "queued" || data.status === "in_progress") {
            startPolling(5000);
          } else {
            startPolling(30000);
          }
        }
      } catch (err) {
        logger.error("DeployDashboard", "Failed to fetch Cloudflare status:", err);
      } finally {
        if (active) setCfLoading(false);
      }
    };

    load();

    return () => {
      active = false;
      if (intervalId) clearInterval(intervalId);
    };
  }, [cfActionState]);

  const handleCpanelDeploy = async () => {
    if (cpanelActionState === "loading") return;
    setCpanelActionState("loading");

    try {
      await adminPost("/deploy", { target: "cpanel" });
      setCpanelActionState("success");
      showToast(
        "success",
        "cPanel Deploy Triggered",
        "cPanel build & upload process has been dispatched on GitHub Actions.",
      );
      setTimeout(() => setCpanelActionState("idle"), 3000);
    } catch (err: unknown) {
      logger.error("DeployDashboard", "Failed to trigger cPanel deploy:", err);
      const errMsg = err instanceof Error ? err.message : "Failed to trigger cPanel deployment.";
      showToast("error", "Deployment Failed", errMsg);
      setCpanelActionState("error");
      setTimeout(() => setCpanelActionState("idle"), 5000);
    }
  };

  const handleCfDeploy = async () => {
    if (cfActionState === "loading") return;
    setCfActionState("loading");

    try {
      await adminPost("/deploy", { target: "cloudflare" });
      setCfActionState("success");
      showToast(
        "success",
        "Cloudflare Pages Deploy Triggered",
        "Cloudflare Pages deployment webhook has been requested successfully.",
      );
      setTimeout(() => setCfActionState("idle"), 3000);
    } catch (err: unknown) {
      logger.error("DeployDashboard", "Failed to trigger Cloudflare Pages deploy:", err);
      const errMsg =
        err instanceof Error ? err.message : "Failed to trigger Cloudflare Pages deployment.";
      showToast("error", "Deployment Failed", errMsg);
      setCfActionState("error");
      setTimeout(() => setCfActionState("idle"), 5000);
    }
  };

  const getStatusBadge = (status: string, conclusion: string | null) => {
    if (status === "queued") {
      return (
        <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-amber-50 text-amber-600 animate-pulse border border-amber-100">
          <Clock className="w-3 h-3" />
          <span>Queued</span>
        </span>
      );
    }
    if (status === "in_progress") {
      return (
        <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-indigo-50 text-indigo-600 animate-pulse border border-indigo-100">
          <Loader2 className="w-3 h-3 animate-spin" />
          <span>In Progress</span>
        </span>
      );
    }
    if (status === "completed") {
      if (conclusion === "success") {
        return (
          <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-emerald-50 text-emerald-600 border border-emerald-100">
            <CheckCircle2 className="w-3 h-3" />
            <span>Success</span>
          </span>
        );
      }
      if (conclusion === "failure") {
        return (
          <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-red-50 text-red-600 border border-red-100">
            <XCircle className="w-3 h-3" />
            <span>Failed</span>
          </span>
        );
      }
      if (conclusion === "cancelled") {
        return (
          <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-neutral-50 text-neutral-500 border border-neutral-100">
            <AlertTriangle className="w-3 h-3" />
            <span>Cancelled</span>
          </span>
        );
      }
    }
    return (
      <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-neutral-50 text-neutral-500 border border-neutral-100">
        <Activity className="w-3 h-3" />
        <span>Unknown</span>
      </span>
    );
  };

  return (
    <div className="space-y-8 animate-in fade-in duration-300">
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        {/* cPanel Target */}
        <div className="bg-white rounded-[2rem] border border-neutral-100 p-6 md:p-8 hover:shadow-premium transition-all duration-300 flex flex-col justify-between space-y-6">
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 rounded-2xl bg-amber-50 text-amber-500 flex items-center justify-center border border-amber-100">
                  <Globe className="w-6 h-6" />
                </div>
                <div>
                  <h3 className="text-lg font-bold font-display text-neutral-800">
                    cPanel Web Server
                  </h3>
                  <p className="text-xs text-neutral-400 font-medium">
                    FTP Sync & Live Server Deploy
                  </p>
                </div>
              </div>
              {!cpanelLoading &&
                (cpanelStatus ? (
                  getStatusBadge(cpanelStatus.status, cpanelStatus.conclusion)
                ) : (
                  <span className="flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-red-50 text-red-600 border border-red-100">
                    <AlertTriangle className="w-3.5 h-3.5" />
                    <span>Unavailable</span>
                  </span>
                ))}
            </div>

            <div className="border-t border-neutral-50 pt-4 space-y-3">
              <p className="text-sm text-neutral-600">
                Rebuilds the Next.js static files in GitHub Actions and uploads them securely via
                FTP directly to your cPanel hosting directories. Only updated files are
                synchronized.
              </p>

              {cpanelLoading ? (
                <div className="h-20 flex items-center justify-center">
                  <Loader2 className="w-6 h-6 animate-spin text-neutral-300" />
                </div>
              ) : cpanelStatus ? (
                <div className="bg-neutral-50/50 rounded-xl p-4 space-y-2 border border-neutral-100 text-xs text-neutral-600 font-medium">
                  <div className="flex justify-between">
                    <span className="text-neutral-400">Latest Build:</span>
                    <span>{formatLocalDateTimeVerbose(cpanelStatus.createdAt)}</span>
                  </div>
                  {cpanelStatus.url && (
                    <div className="flex justify-between items-center">
                      <span className="text-neutral-400">Run Logs:</span>
                      <a
                        href={cpanelStatus.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-brand hover:underline flex items-center gap-1"
                      >
                        <span>GitHub Action Run</span>
                        <ExternalLink className="w-3 h-3" />
                      </a>
                    </div>
                  )}
                </div>
              ) : (
                <div className="bg-red-50/50 text-red-700 rounded-xl p-4 border border-red-100 text-xs font-medium flex flex-col gap-1">
                  <span className="font-semibold text-red-800">Status details unavailable</span>
                  <span className="text-red-600/80">
                    Could not retrieve the latest build status from GitHub Actions.
                  </span>
                </div>
              )}
            </div>
          </div>

          <div>
            <button
              onClick={() => setIsCpanelConfirmOpen(true)}
              disabled={
                cpanelLoading ||
                cpanelActionState === "loading" ||
                !!(
                  cpanelStatus &&
                  (cpanelStatus.status === "queued" || cpanelStatus.status === "in_progress")
                )
              }
              className="w-full flex items-center justify-center gap-2 rounded-full bg-neutral-900 hover:bg-neutral-800 disabled:bg-neutral-100 text-white disabled:text-neutral-400 font-bold py-3.5 transition-all cursor-pointer disabled:cursor-not-allowed text-sm shadow-premium"
            >
              {cpanelActionState === "loading" ? (
                <Loader2 className="w-4 h-4 animate-spin text-white" />
              ) : (
                <GithubIcon className="w-4 h-4 text-white" />
              )}
              <span>Deploy to cPanel Host</span>
            </button>
          </div>
        </div>

        {/* Cloudflare Pages Target */}
        <div className="bg-white rounded-[2rem] border border-neutral-100 p-6 md:p-8 hover:shadow-premium transition-all duration-300 flex flex-col justify-between space-y-6">
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 rounded-2xl bg-indigo-50 text-indigo-500 flex items-center justify-center border border-indigo-100">
                  <CloudLightning className="w-6 h-6" />
                </div>
                <div>
                  <h3 className="text-lg font-bold font-display text-neutral-800">
                    Cloudflare Pages
                  </h3>
                  <p className="text-xs text-neutral-400 font-medium">
                    Edge hosting deployment pipeline
                  </p>
                </div>
              </div>
            </div>

            <div className="border-t border-neutral-50 pt-4 space-y-3">
              <p className="text-sm text-neutral-600">
                Triggers Cloudflare Pages built-in build system using an authenticated deploy hook.
                Cloudflare builds the project on their infrastructure and deploys to their global
                edge.
              </p>

              {cfLoading ? (
                <div className="h-20 flex items-center justify-center">
                  <Loader2 className="w-6 h-6 animate-spin text-neutral-300" />
                </div>
              ) : cfStatus ? (
                <div className="bg-neutral-50/50 rounded-xl p-4 space-y-2 border border-neutral-100 text-xs text-neutral-600 font-medium">
                  <div className="flex justify-between">
                    <span className="text-neutral-400">Latest Build:</span>
                    <span>{formatLocalDateTimeVerbose(cfStatus.createdAt)}</span>
                  </div>
                  {cfStatus.url && (
                    <div className="flex justify-between items-center">
                      <span className="text-neutral-400">Preview Link:</span>
                      <a
                        href={cfStatus.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-brand hover:underline flex items-center gap-1"
                      >
                        <span>Pages Preview URL</span>
                        <ExternalLink className="w-3 h-3" />
                      </a>
                    </div>
                  )}
                </div>
              ) : null}
            </div>
          </div>

          <div>
            <button
              onClick={() => setIsCfConfirmOpen(true)}
              disabled={
                cfLoading ||
                cfActionState === "loading" ||
                !!(cfStatus && (cfStatus.status === "queued" || cfStatus.status === "in_progress"))
              }
              className="w-full flex items-center justify-center gap-2 rounded-full bg-brand hover:bg-brand-hover disabled:bg-neutral-100 text-white disabled:text-neutral-400 font-bold py-3.5 transition-all cursor-pointer disabled:cursor-not-allowed text-sm shadow-premium"
            >
              {cfActionState === "loading" ? (
                <Loader2 className="w-4 h-4 animate-spin text-white" />
              ) : (
                <Play className="w-4 h-4 text-white fill-white" />
              )}
              <span>Deploy to Cloudflare Pages</span>
            </button>
          </div>
        </div>
      </div>

      {/* Confirmation Modals */}
      <ConfirmationModal
        isOpen={isCpanelConfirmOpen}
        title="Deploy to cPanel?"
        message="Are you sure you want to trigger a manual cPanel deployment? This will run a build in GitHub Actions and upload the output via FTP."
        confirmLabel="Deploy cPanel Now"
        cancelLabel="Cancel"
        onConfirm={() => {
          setIsCpanelConfirmOpen(false);
          handleCpanelDeploy();
        }}
        onCancel={() => setIsCpanelConfirmOpen(false)}
        icon={
          <div className="w-12 h-12 rounded-full bg-amber-50 text-amber-500 flex items-center justify-center border border-amber-100">
            <Globe className="w-5 h-5" />
          </div>
        }
      />

      <ConfirmationModal
        isOpen={isCfConfirmOpen}
        title="Deploy to Cloudflare Pages?"
        message="Are you sure you want to trigger a manual Cloudflare Pages deployment? This will call Cloudflare's webhook to start the build."
        confirmLabel="Deploy Cloudflare Now"
        cancelLabel="Cancel"
        onConfirm={() => {
          setIsCfConfirmOpen(false);
          handleCfDeploy();
        }}
        onCancel={() => setIsCfConfirmOpen(false)}
        icon={
          <div className="w-12 h-12 rounded-full bg-indigo-50 text-indigo-500 flex items-center justify-center border border-indigo-100">
            <CloudLightning className="w-5 h-5" />
          </div>
        }
      />
    </div>
  );
}
