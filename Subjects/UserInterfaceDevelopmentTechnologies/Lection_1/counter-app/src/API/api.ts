import { title } from "process";

const API_KEY = process.env.REACT_APP_API_KEY;

export const moviesAPI = {
    getMovies(titles: string) { //получает все фильмы по названию //fetch -- js-метод, формирующий запрос. Принимает только один параметр
        return fetch (`https://www.omdbapi.com/?apikey=${API_KEY}&s=${title}`)
        .then(response => response.json()) //Promise<any>
        .then(data => data.Search)
    },
};

export type MovieType = {
    Title: string,
    Year: string,
    imdbID: string,
    Type: string,
    Poster: string
}