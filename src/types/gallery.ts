// Gallery domain types — v2.0

export interface GalleryImageItem {
  id: string;
  title: string;
  location: string;
  image: string;
  altText: string;
  sortOrder: number;
  destinationId: string | null;
  destinationName?: string | null;
  destinationSlug?: string | null;
}

export interface GallerySectionData {
  tagline: string;
  subtitle: string;
  images: GalleryImageItem[];
}
