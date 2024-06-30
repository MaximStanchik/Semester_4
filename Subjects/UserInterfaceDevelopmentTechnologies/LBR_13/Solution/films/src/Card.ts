export enum Category {
  movie,
  cartoon,
  series,
  search,
}

export type Card = {
  title: string,
  year: number,
  type: Category,
  image: string,
  url: string,
};
