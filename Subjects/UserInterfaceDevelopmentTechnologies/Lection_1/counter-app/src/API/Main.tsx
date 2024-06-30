import {useEffect, useState} from "react";
import {moviesAPI, MovieType} from "./api";
import {Movies} from "./components/Movies";

function Main() {
    const [movies, setMovies] = useState<MovieType[]>([]);
    const [title, setTitle] = useState('matrix');

    const fetchMovies = async (_title: string) => {
        const response = await moviesAPI.getMovies(title)
        setMovies(response)
    }
    useEffect(() => {fetchMovies(title)});

return <>
<main className="container content">
    <h1>Каталог фильмов</h1>
    <Movies films={movies}/>
    </main>
    </>
}

export {Main}


    
