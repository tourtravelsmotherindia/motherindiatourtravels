"use client";

import { Code, FormInput, Plus, Trash2 } from "lucide-react";
import React, { useState } from "react";

interface GenericJsonEditorProps {
  value: Record<string, unknown> | unknown[] | null | undefined;
  onChange: (val: unknown) => void;
  label: string;
}

export default function GenericJsonEditor({ value, onChange, label }: GenericJsonEditorProps) {
  const [prevValue, setPrevValue] = useState(value);
  const [isRaw, setIsRaw] = useState(() =>
    value === undefined || value === null || !(!Array.isArray(value) && typeof value === "object")
      ? true
      : false,
  );
  const [rawText, setRawText] = useState(() =>
    value === undefined || value === null ? "" : JSON.stringify(value, null, 2),
  );
  const [kvPairs, setKvPairs] = useState<
    { key: string; value: string; type: "string" | "number" | "boolean" }[]
  >(() => {
    if (value && typeof value === "object" && !Array.isArray(value)) {
      return Object.entries(value).map(([k, v]) => {
        let type: "string" | "number" | "boolean" = "string";
        if (typeof v === "number") type = "number";
        if (typeof v === "boolean") type = "boolean";
        return { key: k, value: String(v), type };
      });
    }
    return [];
  });
  const [jsonError, setJsonError] = useState<string | null>(null);

  if (value !== prevValue) {
    setPrevValue(value);
    if (value === undefined || value === null) {
      setRawText("");
      setKvPairs([]);
    } else {
      setRawText(JSON.stringify(value, null, 2));
      if (typeof value === "object" && !Array.isArray(value)) {
        const pairs = Object.entries(value).map(([k, v]) => {
          let type: "string" | "number" | "boolean" = "string";
          if (typeof v === "number") type = "number";
          if (typeof v === "boolean") type = "boolean";
          return { key: k, value: String(v), type };
        });
        setKvPairs(pairs);
        setIsRaw(false);
      } else {
        setIsRaw(true);
      }
    }
  }

  const handleKvChange = (index: number, field: "key" | "value" | "type", val: string) => {
    const updatedPairs = [...kvPairs];
    const pair = { ...updatedPairs[index] };

    if (field === "type") {
      pair.type = val as "string" | "number" | "boolean";
      if (pair.type === "boolean" && pair.value !== "true" && pair.value !== "false") {
        pair.value = "false";
      } else if (pair.type === "number" && isNaN(Number(pair.value))) {
        pair.value = "0";
      }
    } else {
      pair[field] = val;
    }

    updatedPairs[index] = pair;
    setKvPairs(updatedPairs);

    // Convert pairs back to object and notify parent
    const obj: Record<string, unknown> = {};
    updatedPairs.forEach((p) => {
      if (!p.key.trim()) return;
      if (p.type === "number") {
        obj[p.key] = Number(p.value) || 0;
      } else if (p.type === "boolean") {
        obj[p.key] = p.value === "true";
      } else {
        obj[p.key] = p.value;
      }
    });
    onChange(obj);
  };

  const handleAddPair = () => {
    const updated = [...kvPairs, { key: "", value: "", type: "string" as const }];
    setKvPairs(updated);
  };

  const handleRemovePair = (index: number) => {
    const updatedPairs = kvPairs.filter((_, idx) => idx !== index);
    setKvPairs(updatedPairs);

    const obj: Record<string, unknown> = {};
    updatedPairs.forEach((p) => {
      if (!p.key.trim()) return;
      if (p.type === "number") {
        obj[p.key] = Number(p.value) || 0;
      } else if (p.type === "boolean") {
        obj[p.key] = p.value === "true";
      } else {
        obj[p.key] = p.value;
      }
    });
    onChange(obj);
  };

  const handleRawTextChange = (text: string) => {
    setRawText(text);
    if (!text.trim()) {
      setJsonError(null);
      onChange(null);
      return;
    }

    try {
      const parsed = JSON.parse(text);
      setJsonError(null);
      onChange(parsed);
    } catch (e: unknown) {
      const msg = e instanceof Error ? e.message : "Invalid JSON syntax";
      setJsonError(msg);
      // Still set the parent state to the raw text for input retention
      onChange(text);
    }
  };

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <label className="block text-xs font-semibold text-neutral-600 uppercase">{label}</label>
        <button
          type="button"
          onClick={() => setIsRaw(!isRaw)}
          className="text-xs font-bold text-brand hover:text-brand-hover flex items-center gap-1 bg-brand-light/20 px-3 py-1 rounded-full border border-brand/10 transition-colors"
        >
          {isRaw ? (
            <>
              <FormInput className="w-3.5 h-3.5" /> Use Form Editor
            </>
          ) : (
            <>
              <Code className="w-3.5 h-3.5" /> Edit Raw JSON
            </>
          )}
        </button>
      </div>

      {isRaw ? (
        <div className="space-y-1.5">
          <textarea
            rows={6}
            value={rawText}
            onChange={(e) => handleRawTextChange(e.target.value)}
            placeholder='e.g. { "showFeatured": true, "itemsCount": 5 }'
            className="w-full rounded-[1.25rem] border border-border-light px-4 py-3 text-sm bg-neutral-50 font-mono focus:border-brand focus:outline-none transition-colors"
          />
          {jsonError && (
            <p className="text-xs text-red-500 font-semibold mt-1">JSON Error: {jsonError}</p>
          )}
        </div>
      ) : (
        <div className="space-y-3">
          {kvPairs.map((pair, idx) => (
            <div key={idx} className="flex gap-2 items-center">
              {/* Key input */}
              <input
                type="text"
                value={pair.key}
                placeholder="Key"
                onChange={(e) => handleKvChange(idx, "key", e.target.value)}
                className="w-1/4 rounded-full border border-border-light px-3.5 py-1.5 text-xs bg-white focus:border-brand focus:outline-none transition-colors"
              />

              {/* Value Type */}
              <select
                value={pair.type}
                onChange={(e) => handleKvChange(idx, "type", e.target.value)}
                className="rounded-full border border-border-light px-2 py-1.5 text-xs bg-white focus:border-brand focus:outline-none transition-colors w-24 text-neutral-600 font-medium"
              >
                <option value="string">Text</option>
                <option value="number">Number</option>
                <option value="boolean">Boolean</option>
              </select>

              {/* Value input */}
              <div className="flex-1">
                {pair.type === "boolean" ? (
                  <select
                    value={pair.value}
                    onChange={(e) => handleKvChange(idx, "value", e.target.value)}
                    className="rounded-full border border-border-light px-3.5 py-1.5 text-xs bg-white focus:border-brand focus:outline-none transition-colors w-full text-neutral-600 font-medium"
                  >
                    <option value="true">True</option>
                    <option value="false">False</option>
                  </select>
                ) : (
                  <input
                    type={pair.type === "number" ? "number" : "text"}
                    value={pair.value}
                    placeholder="Value"
                    onChange={(e) => handleKvChange(idx, "value", e.target.value)}
                    className="w-full rounded-full border border-border-light px-3.5 py-1.5 text-xs bg-white focus:border-brand focus:outline-none transition-colors"
                  />
                )}
              </div>

              {/* Remove button */}
              <button
                type="button"
                onClick={() => handleRemovePair(idx)}
                className="p-1.5 text-neutral-400 hover:text-red-500 rounded-full hover:bg-neutral-100 transition-colors"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </div>
          ))}

          {kvPairs.length === 0 && (
            <p className="text-xs text-neutral-400 italic py-2">No metadata properties set.</p>
          )}

          <button
            type="button"
            onClick={handleAddPair}
            className="text-xs font-bold text-brand hover:text-brand-hover flex items-center gap-1 bg-white hover:bg-brand-light/10 border border-brand/20 px-3.5 py-1.5 rounded-full transition-colors w-fit"
          >
            <Plus className="w-3.5 h-3.5" /> Add Property
          </button>
        </div>
      )}
    </div>
  );
}
