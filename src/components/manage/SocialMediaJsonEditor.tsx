"use client";

import {
  Briefcase,
  Camera,
  Globe,
  Link,
  MessageCircle,
  Pin,
  Plus,
  Trash2,
  Video,
} from "lucide-react";
import React, { useState } from "react";

interface SocialMediaJsonEditorProps {
  value: Record<string, string> | null | undefined;
  onChange: (val: Record<string, string>) => void;
}

const PRESETS = [
  {
    key: "facebook",
    label: "Facebook",
    icon: Link,
    placeholder: "https://facebook.com/username",
  },
  {
    key: "instagram",
    label: "Instagram",
    icon: Camera,
    placeholder: "https://instagram.com/username",
  },
  { key: "twitter", label: "Twitter / X", icon: Globe, placeholder: "https://x.com/username" },
  {
    key: "linkedin",
    label: "LinkedIn",
    icon: Briefcase,
    placeholder: "https://linkedin.com/in/username",
  },
  {
    key: "pinterest",
    label: "Pinterest",
    icon: Pin,
    placeholder: "https://pinterest.com/username",
  },
  { key: "youtube", label: "YouTube", icon: Video, placeholder: "https://youtube.com/@channel" },
  { key: "whatsapp", label: "WhatsApp", icon: MessageCircle, placeholder: "https://wa.me/phone" },
];

export default function SocialMediaJsonEditor({ value, onChange }: SocialMediaJsonEditorProps) {
  const [prevValue, setPrevValue] = useState(value);
  const [data, setData] = useState<Record<string, string>>(() =>
    value && typeof value === "object" ? value : {},
  );
  const [customKey, setCustomKey] = useState("");
  const [customValue, setCustomValue] = useState("");

  if (value !== prevValue) {
    setPrevValue(value);
    setData(value && typeof value === "object" ? value : {});
  }

  const handleUpdateField = (key: string, val: string) => {
    const updated = { ...data, [key]: val };
    // Remove empty values to clean up output
    if (!val.trim()) {
      delete updated[key];
    }
    setData(updated);
    onChange(updated);
  };

  const handleRemoveField = (key: string) => {
    const updated = { ...data };
    delete updated[key];
    setData(updated);
    onChange(updated);
  };

  const handleAddCustom = (e: React.FormEvent) => {
    e.preventDefault();
    const formattedKey = customKey.trim().toLowerCase().replace(/\s+/g, "-");
    if (!formattedKey) return;
    if (data[formattedKey] !== undefined) {
      alert("This platform handle already exists.");
      return;
    }
    const updated = { ...data, [formattedKey]: customValue.trim() };
    setData(updated);
    onChange(updated);
    setCustomKey("");
    setCustomValue("");
  };

  // Separate preset fields from custom keys
  const presetKeys = PRESETS.map((p) => p.key);
  const customFields = Object.keys(data).filter((k) => !presetKeys.includes(k));

  return (
    <div className="space-y-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {PRESETS.map((preset) => {
          const Icon = preset.icon;
          return (
            <div key={preset.key} className="space-y-1.5">
              <label className="flex items-center gap-2 text-xs font-semibold text-neutral-600 uppercase">
                <Icon className="w-3.5 h-3.5 text-neutral-500" />
                {preset.label}
              </label>
              <input
                type="text"
                value={data[preset.key] || ""}
                placeholder={preset.placeholder}
                onChange={(e) => handleUpdateField(preset.key, e.target.value)}
                className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>
          );
        })}
      </div>

      {customFields.length > 0 && (
        <div className="space-y-3 pt-4 border-t border-border-light">
          <h4 className="text-xs font-bold text-neutral-600 uppercase tracking-wider">
            Custom Platforms
          </h4>
          <div className="space-y-3">
            {customFields.map((key) => (
              <div key={key} className="flex gap-2 items-center">
                <div className="w-1/3">
                  <span className="inline-block text-xs font-semibold bg-neutral-100 text-neutral-700 px-3 py-1.5 rounded-full border border-neutral-200 capitalize">
                    {key}
                  </span>
                </div>
                <div className="flex-1">
                  <input
                    type="text"
                    value={data[key] || ""}
                    placeholder="Profile URL"
                    onChange={(e) => handleUpdateField(key, e.target.value)}
                    className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
                  />
                </div>
                <button
                  type="button"
                  onClick={() => handleRemoveField(key)}
                  className="p-2 text-red-500 hover:text-red-700 hover:bg-red-50 rounded-full transition-colors"
                >
                  <Trash2 className="w-4 h-4" />
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      <form
        onSubmit={handleAddCustom}
        className="pt-4 border-t border-border-light flex gap-2 items-end"
      >
        <div className="w-1/3 space-y-1.5">
          <label className="block text-xs font-semibold text-neutral-500 uppercase">
            Platform Name
          </label>
          <input
            type="text"
            value={customKey}
            placeholder="e.g. Threads"
            onChange={(e) => setCustomKey(e.target.value)}
            className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
          />
        </div>
        <div className="flex-1 space-y-1.5">
          <label className="block text-xs font-semibold text-neutral-500 uppercase">
            Profile URL
          </label>
          <input
            type="text"
            value={customValue}
            placeholder="https://..."
            onChange={(e) => setCustomValue(e.target.value)}
            className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
          />
        </div>
        <button
          type="submit"
          disabled={!customKey.trim()}
          className="rounded-full bg-brand text-white px-4 py-2.5 text-xs font-bold hover:bg-brand-hover transition-colors flex items-center gap-1.5 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          <Plus className="w-3.5 h-3.5" /> Add
        </button>
      </form>
    </div>
  );
}
