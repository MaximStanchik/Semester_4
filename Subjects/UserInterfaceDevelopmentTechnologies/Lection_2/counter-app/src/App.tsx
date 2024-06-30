import React, { useState } from 'react';
import './App.css';
import Search from './Search';

function App() {

}

return (
<main className="container content">
<Search searchMovies={searchMovies}/>

{
  loading ? (
    <Preloader/>
  ) : (
    <Movies movies = {movies}/>
  )
}
</main>
);

export default App;

//непонятно в каком файле. написано в 16:45
export const moviesAPI = {
  getMovies(type: string) {
    return instance.get<MovieType[]>(`?type = ${type}`)
  },
}

export type MovieType = {
  Title: string,
  Year: string,
  imdbID: string,
  Type: string,
  Poster: string
}