/**
 * Zustand store for admin UI-only state.
 *
 * Strictly separated from server/API data (which lives in React Query cache).
 * Never duplicate API response data here — only UI concerns like filters,
 * selection, modal visibility, and sidebar state.
 */

import { create } from "zustand";

export interface AdminFilters {
  search: string;
  status: string | null;
}

export interface AdminUiState {
  // Sidebar
  mobileSidebarOpen: boolean;
  setMobileSidebarOpen: (open: boolean) => void;
  toggleMobileSidebar: () => void;

  // Active table filters (keyed by table slug)
  tableFilters: Record<string, AdminFilters>;
  setTableFilter: (table: string, filters: Partial<AdminFilters>) => void;
  clearTableFilter: (table: string) => void;

  // Row selection (keyed by table slug)
  selectedRows: Record<string, Set<string>>;
  toggleRowSelection: (table: string, rowId: string) => void;
  selectAllRows: (table: string, rowIds: string[]) => void;
  clearRowSelection: (table: string) => void;
  isRowSelected: (table: string, rowId: string) => boolean;
}

export const useAdminUiStore = create<AdminUiState>((set, get) => ({
  // Sidebar
  mobileSidebarOpen: false,
  setMobileSidebarOpen: (open) => set({ mobileSidebarOpen: open }),
  toggleMobileSidebar: () => set((state) => ({ mobileSidebarOpen: !state.mobileSidebarOpen })),

  // Filters
  tableFilters: {},
  setTableFilter: (table, filters) =>
    set((state) => ({
      tableFilters: {
        ...state.tableFilters,
        [table]: {
          ...state.tableFilters[table],
          ...filters,
        },
      },
    })),
  clearTableFilter: (table) =>
    set((state) => {
      const updated = { ...state.tableFilters };
      delete updated[table];
      return { tableFilters: updated };
    }),

  // Row selection
  selectedRows: {},
  toggleRowSelection: (table, rowId) =>
    set((state) => {
      const current = new Set(state.selectedRows[table] || []);
      if (current.has(rowId)) {
        current.delete(rowId);
      } else {
        current.add(rowId);
      }
      return {
        selectedRows: { ...state.selectedRows, [table]: current },
      };
    }),
  selectAllRows: (table, rowIds) =>
    set((state) => ({
      selectedRows: {
        ...state.selectedRows,
        [table]: new Set(rowIds),
      },
    })),
  clearRowSelection: (table) =>
    set((state) => {
      const updated = { ...state.selectedRows };
      delete updated[table];
      return { selectedRows: updated };
    }),
  isRowSelected: (table, rowId) => {
    const rows = get().selectedRows[table];
    return rows ? rows.has(rowId) : false;
  },
}));
