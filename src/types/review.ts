export interface ReviewItem {
  id: string;
  reviewer: string;
  review: string;
  rating: number;
  packageName: string;
  source: string;
  avatar: string;
  reviewLink: string;
  isApproved: boolean;
  isFeatured: boolean;
  createdAt: Date;
}
