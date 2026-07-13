export interface SystemStatus {
  id: string;
  status: string;
  lastPing: string;
  websiteStatus: string;
  apiStatus: string;
  imagesStatus: string;
  dbStatus: string;
  metadata: {
    companyName?: string;
    packagesCount?: number;
    blogsCount?: number;
    destinationsCount?: number;
    recentInquiriesCount?: number;
    updatedBy?: string;
    websitePingTimeMs?: number;
    apiPingTimeMs?: number;
    imagesPingTimeMs?: number;
    dbPingTimeMs?: number;
  } | null;
  createdAt: string;
}
