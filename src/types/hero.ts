export interface Slide {
  id: number;
  image: string;
  tag: string;
  title: string;
  description: string;
}

export interface HeroData {
  slides: Slide[];
}
