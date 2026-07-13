-- CreateTable
CREATE TABLE "SystemStatus" (
    "id" TEXT NOT NULL DEFAULT 'singleton',
    "status" TEXT NOT NULL DEFAULT 'healthy',
    "lastPing" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "websiteStatus" TEXT NOT NULL DEFAULT 'up',
    "apiStatus" TEXT NOT NULL DEFAULT 'up',
    "imagesStatus" TEXT NOT NULL DEFAULT 'up',
    "dbStatus" TEXT NOT NULL DEFAULT 'up',
    "metadata" JSONB,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SystemStatus_pkey" PRIMARY KEY ("id")
);
