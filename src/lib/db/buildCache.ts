import fs from "fs";
import path from "path";

import { logger } from "@/lib/logger";

const CACHE_DIR = path.join(process.cwd(), ".build-cache");

/**
 * Executes the given fetch function and caches the result to a local file
 * only during the Next.js production build phase.
 *
 * During development or runtime, it bypasses the cache entirely.
 */
export async function withBuildCache<T>(key: string, fetchFn: () => Promise<T>): Promise<T> {
  const isBuildPhase = process.env.NEXT_PHASE === "phase-production-build";

  if (!isBuildPhase) {
    return fetchFn();
  }

  // Ensure cache directory exists
  if (!fs.existsSync(CACHE_DIR)) {
    try {
      fs.mkdirSync(CACHE_DIR, { recursive: true });
    } catch (e) {
      logger.warn("BuildCache", "Failed to create cache directory:", e);
    }
  }

  // Clean filename for the key
  const safeKey = key.replace(/[^a-zA-Z0-9_-]/g, "_");
  const cacheFile = path.join(CACHE_DIR, `${safeKey}.json`);

  // Try reading from cache
  if (fs.existsSync(cacheFile)) {
    try {
      const cachedData = fs.readFileSync(cacheFile, "utf-8");
      if (cachedData.trim()) {
        return JSON.parse(cachedData) as T;
      }
    } catch (e) {
      logger.warn("BuildCache", `Failed to read/parse cache file for "${key}":`, e);
    }
  }

  // Fetch fresh data
  const result = await fetchFn();

  // Write to cache atomically using a temp file to prevent race conditions
  // across concurrent Next.js page worker threads.
  try {
    const tempFile = path.join(
      CACHE_DIR,
      `${safeKey}.${Math.random().toString(36).substring(2)}.tmp`,
    );
    fs.writeFileSync(tempFile, JSON.stringify(result), "utf-8");
    fs.renameSync(tempFile, cacheFile);
  } catch (e) {
    logger.warn("BuildCache", `Failed to write cache file for "${key}":`, e);
  }

  return result;
}
