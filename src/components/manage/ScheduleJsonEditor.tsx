"use client";

import { Plus, Trash2 } from "lucide-react";
import React, { useState } from "react";

import { type WorkingHoursSchedule } from "@/types/company";

interface ScheduleJsonEditorProps {
  value: WorkingHoursSchedule[] | null | undefined;
  onChange: (val: WorkingHoursSchedule[]) => void;
}

const DAYS_OF_WEEK = [
  { key: "mon", label: "Monday" },
  { key: "tue", label: "Tuesday" },
  { key: "wed", label: "Wednesday" },
  { key: "thu", label: "Thursday" },
  { key: "fri", label: "Friday" },
  { key: "sat", label: "Saturday" },
  { key: "sun", label: "Sunday" },
];

export default function ScheduleJsonEditor({ value, onChange }: ScheduleJsonEditorProps) {
  const [prevValue, setPrevValue] = useState(value);
  const [schedules, setSchedules] = useState<WorkingHoursSchedule[]>(() =>
    Array.isArray(value) ? value : [],
  );

  if (value !== prevValue) {
    setPrevValue(value);
    setSchedules(Array.isArray(value) ? value : []);
  }

  const handleUpdate = (updated: WorkingHoursSchedule[]) => {
    setSchedules(updated);
    onChange(updated);
  };

  const handleAddSchedule = () => {
    const newSchedule: WorkingHoursSchedule = {
      days: [],
      hours: [{ open: "09:00", close: "18:00" }],
    };
    handleUpdate([...schedules, newSchedule]);
  };

  const handleRemoveSchedule = (index: number) => {
    const updated = schedules.filter((_, idx) => idx !== index);
    handleUpdate(updated);
  };

  const handleToggleDay = (schedIndex: number, dayKey: string) => {
    const updated = [...schedules];
    const sched = { ...updated[schedIndex] };
    if (sched.days.includes(dayKey)) {
      sched.days = sched.days.filter((d) => d !== dayKey);
    } else {
      sched.days = [...sched.days, dayKey];
    }
    updated[schedIndex] = sched;
    handleUpdate(updated);
  };

  const handleAddHourSlot = (schedIndex: number) => {
    const updated = [...schedules];
    const sched = { ...updated[schedIndex] };
    sched.hours = [...sched.hours, { open: "09:00", close: "18:00" }];
    updated[schedIndex] = sched;
    handleUpdate(updated);
  };

  const handleRemoveHourSlot = (schedIndex: number, slotIndex: number) => {
    const updated = [...schedules];
    const sched = { ...updated[schedIndex] };
    sched.hours = sched.hours.filter((_, idx) => idx !== slotIndex);
    updated[schedIndex] = sched;
    handleUpdate(updated);
  };

  const handleHourChange = (
    schedIndex: number,
    slotIndex: number,
    field: "open" | "close",
    val: string,
  ) => {
    const updated = [...schedules];
    const sched = { ...updated[schedIndex] };
    const hours = [...sched.hours];
    hours[slotIndex] = { ...hours[slotIndex], [field]: val };
    sched.hours = hours;
    updated[schedIndex] = sched;
    handleUpdate(updated);
  };

  return (
    <div className="space-y-6">
      {schedules.map((sched, schedIdx) => (
        <div
          key={schedIdx}
          className="p-5 rounded-[1.5rem] border border-border-light bg-neutral-50/50 space-y-4 relative group"
        >
          <button
            type="button"
            onClick={() => handleRemoveSchedule(schedIdx)}
            className="absolute top-4 right-4 p-2 text-red-500 hover:text-red-700 hover:bg-red-50 rounded-full transition-colors opacity-0 group-hover:opacity-100 focus:opacity-100"
            title="Remove schedule block"
          >
            <Trash2 className="w-4 h-4" />
          </button>

          {/* Days Selector */}
          <div className="space-y-2">
            <label className="block text-xs font-bold text-neutral-600 uppercase tracking-wider">
              Applicable Days
            </label>
            <div className="flex flex-wrap gap-2">
              {DAYS_OF_WEEK.map((day) => {
                const isActive = sched.days.includes(day.key);
                return (
                  <button
                    key={day.key}
                    type="button"
                    onClick={() => handleToggleDay(schedIdx, day.key)}
                    className={`px-3 py-1.5 rounded-full text-xs font-semibold border transition-all select-none ${
                      isActive
                        ? "bg-brand border-brand text-white shadow-sm"
                        : "bg-white border-neutral-200 text-neutral-600 hover:border-brand/40"
                    }`}
                  >
                    {day.label}
                  </button>
                );
              })}
            </div>
            {sched.days.length === 0 && (
              <p className="text-[11px] text-amber-600 font-medium">
                * Please select at least one day for this schedule block.
              </p>
            )}
          </div>

          {/* Hours Slots */}
          <div className="space-y-3">
            <div className="flex items-center justify-between">
              <label className="block text-xs font-bold text-neutral-600 uppercase tracking-wider">
                Operating Hours Slots
              </label>
              <button
                type="button"
                onClick={() => handleAddHourSlot(schedIdx)}
                className="text-xs font-bold text-brand hover:text-brand-hover flex items-center gap-1"
              >
                <Plus className="w-3.5 h-3.5" /> Add Slot
              </button>
            </div>

            <div className="space-y-2.5">
              {sched.hours.map((slot, slotIdx) => (
                <div key={slotIdx} className="flex items-center gap-3">
                  <div className="flex items-center gap-2 flex-1">
                    <span className="text-xs text-neutral-500 font-medium">Open:</span>
                    <input
                      type="time"
                      value={slot.open}
                      onChange={(e) => handleHourChange(schedIdx, slotIdx, "open", e.target.value)}
                      className="rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors w-full"
                    />
                  </div>
                  <div className="flex items-center gap-2 flex-1">
                    <span className="text-xs text-neutral-500 font-medium">Close:</span>
                    <input
                      type="time"
                      value={slot.close}
                      onChange={(e) => handleHourChange(schedIdx, slotIdx, "close", e.target.value)}
                      className="rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors w-full"
                    />
                  </div>
                  {sched.hours.length > 1 && (
                    <button
                      type="button"
                      onClick={() => handleRemoveHourSlot(schedIdx, slotIdx)}
                      className="p-2 text-neutral-400 hover:text-red-600 rounded-full hover:bg-neutral-100 transition-colors"
                      title="Remove hour slot"
                    >
                      <Trash2 className="w-4 h-4" />
                    </button>
                  )}
                </div>
              ))}
            </div>
          </div>
        </div>
      ))}

      <button
        type="button"
        onClick={handleAddSchedule}
        className="w-full py-3 border border-dashed border-neutral-300 rounded-[1.5rem] text-sm text-neutral-500 hover:text-brand hover:border-brand font-semibold transition-colors flex items-center justify-center gap-2 bg-neutral-50/20"
      >
        <Plus className="w-4 h-4" /> Add Schedule Block
      </button>
    </div>
  );
}
