import Link from "next/link";
import Image from "next/image";
import { resolveMediaUrl, decodeJsonField } from "@/lib/utils";
import type { MediaImage, PriceTier } from "@/types";

interface PackageCardProps {
  packageName: string;
  slug: string;
  headerImages?: string; // JSON-encoded array of MediaImage[]
  thumbneil?: string; // JSON-encoded array of MediaImage[]
  days?: number;
  nights?: number;
  price?: string | PriceTier[]; // JSON-encoded or native array
  offerTitle?: string | null;
}

export default function PackageCard({
  packageName,
  slug,
  headerImages,
  thumbneil,
  days,
  nights,
  price,
  offerTitle,
}: PackageCardProps) {
  // Resolve thumbnail image
  let imageUrl = "";
  try {
    let images: MediaImage[] = [];
    if (thumbneil) {
      images = decodeJsonField<MediaImage[]>(thumbneil);
    } else if (headerImages) {
      images = decodeJsonField<MediaImage[]>(headerImages);
    }
    if (images?.length > 0) {
      imageUrl = resolveMediaUrl(images[0].path);
    }
  } catch {
    // Fallback - no image
  }

  // Resolve starting price
  let priceDisplay = "";
  try {
    let tiers: PriceTier[] = [];
    if (typeof price === "string") {
      tiers = decodeJsonField<PriceTier[]>(price);
    } else if (Array.isArray(price)) {
      tiers = price;
    }
    if (tiers?.length > 0) {
      const minPrice = Math.min(...tiers.map((t) => t.actual));
      priceDisplay = `₹${minPrice.toLocaleString("en-IN")}`;
    }
  } catch {
    priceDisplay = "";
  }

  const durationDisplay =
    days || nights
      ? `${days || 0} Days / ${nights || 0} Nights`
      : "";

  return (
    <Link
      href={`/package/${slug}`}
      className="group block bg-white rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-all duration-300"
    >
      {/* Image */}
      <div className="relative aspect-[4/3] overflow-hidden bg-surface">
        {imageUrl ? (
          <Image
            src={imageUrl}
            alt={packageName}
            fill
            className="object-cover group-hover:scale-110 transition-transform duration-500"
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
          />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center text-secondary">
            <i className="bi bi-image text-4xl" />
          </div>
        )}

        {/* Offer badge */}
        {offerTitle && (
          <span className="absolute top-3 left-3 bg-red text-white text-xs font-semibold px-2 py-1 rounded">
            {offerTitle}
          </span>
        )}

        {/* Duration badge */}
        {durationDisplay && (
          <span className="absolute bottom-3 left-3 bg-black/70 text-white text-xs px-2 py-1 rounded">
            {durationDisplay}
          </span>
        )}
      </div>

      {/* Content */}
      <div className="p-4">
        <h3 className="font-semibold text-sm text-black line-clamp-2 mb-2 group-hover:text-red transition-colors">
          {packageName}
        </h3>

        {priceDisplay && (
          <div className="flex items-baseline gap-1">
            <span className="text-xs text-secondary2">Starts from</span>
            <span className="text-lg font-bold text-black">{priceDisplay}</span>
          </div>
        )}
      </div>
    </Link>
  );
}
