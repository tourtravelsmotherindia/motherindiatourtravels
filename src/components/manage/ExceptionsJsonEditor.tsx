"use client";

import { Calendar, Plus, Trash2 } from "lucide-react";
import React, { useState } from "react";

export interface HolidayException {
  date: string;
  reason: string;
  isClosed: boolean;
}

interface ExceptionsJsonEditorProps {
  value: HolidayException[] | null | undefined;
  onChange: (val: HolidayException[]) => void;
}

export default function ExceptionsJsonEditor({ value, onChange }: ExceptionsJsonEditorProps) {
  const [prevValue, setPrevValue] = useState(value);
  const [exceptions, setExceptions] = useState<HolidayException[]>(() =>
    Array.isArray(value) ? value : [],
  );

  if (value !== prevValue) {
    setPrevValue(value);
    setExceptions(Array.isArray(value) ? value : []);
  }

  const handleUpdate = (updated: HolidayException[]) => {
    setExceptions(updated);
    onChange(updated);
  };

  const handleAddException = () => {
    const todayStr = new Date().toISOString().split("T")[0];
    const newException: HolidayException = {
      date: todayStr,
      reason: "",
      isClosed: true,
    };
    handleUpdate([...exceptions, newException]);
  };

  const handleRemoveException = (index: number) => {
    const updated = exceptions.filter((_, idx) => idx !== index);
    handleUpdate(updated);
  };

  const handleFieldChange = (index: number, field: keyof HolidayException, val: unknown) => {
    const updated = [...exceptions];
    updated[index] = { ...updated[index], [field]: val };
    handleUpdate(updated);
  };

  return (
    <div className="space-y-4">
      {exceptions.length > 0 ? (
        <div className="space-y-3">
          {exceptions.map((exc, idx) => (
            <div
              key={idx}
              className="flex flex-col sm:flex-row gap-3 p-4 rounded-[1.5rem] border border-border-light bg-neutral-50/50 relative group items-start sm:items-center"
            >
              {/* Date field */}
              <div className="w-full sm:w-1/3 flex items-center gap-2">
                <Calendar className="w-4 h-4 text-neutral-400 shrink-0" />
                <input
                  type="date"
                  value={exc.date}
                  onChange={(e) => handleFieldChange(idx, "date", e.target.value)}
                  className="rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors w-full"
                />
              </div>

              {/* Reason / Note */}
              <div className="flex-1 w-full">
                <input
                  type="text"
                  value={exc.reason}
                  placeholder="Reason (e.g. Independence Day)"
                  onChange={(e) => handleFieldChange(idx, "reason", e.target.value)}
                  className="rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors w-full"
                />
              </div>

              {/* Is Closed checkbox */}
              <div className="flex items-center gap-2 select-none shrink-0 self-end sm:self-auto">
                <input
                  type="checkbox"
                  id={`exc-closed-${idx}`}
                  checked={exc.isClosed}
                  onChange={(e) => handleFieldChange(idx, "isClosed", e.target.checked)}
                  className="w-4 h-4 text-brand border-neutral-300 rounded focus:ring-brand accent-brand"
                />
                <label
                  htmlFor={`exc-closed-${idx}`}
                  className="text-xs font-semibold text-neutral-600 cursor-pointer"
                >
                  Closed All Day
                </label>
              </div>

              {/* Delete button */}
              <button
                type="button"
                onClick={() => handleRemoveException(idx)}
                className="p-2 text-red-500 hover:text-red-700 hover:bg-red-50 rounded-full transition-colors self-end sm:self-auto"
                title="Remove exception"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </div>
          ))}
        </div>
      ) : (
        <div className="text-center py-6 rounded-[1.5rem] border border-dashed border-neutral-200 bg-neutral-50/20">
          <p className="text-xs text-neutral-400 font-medium">No holiday exceptions added yet.</p>
        </div>
      )}

      <button
        type="button"
        onClick={handleAddException}
        className="w-full py-3 border border-dashed border-neutral-300 rounded-[1.5rem] text-sm text-neutral-500 hover:text-brand hover:border-brand font-semibold transition-colors flex items-center justify-center gap-2 bg-neutral-50/20"
      >
        <Plus className="w-4 h-4" /> Add Holiday Exception
      </button>
    </div>
  );
}
