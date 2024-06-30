import {Movies} from './Movie';
import { MovieType } from ',./movies';

type MoviesPropsType = {
    films: MovieType{},
}

function Movies (props: MoviesPropsType) {
    return <div className="movies">
        {films.length ? (
            films.map(film => (
                <Movie key = {film.imdbID} {...film}/>
            ))) : (
                <h4>Nothing found</h4>
            )
}
</div>
}

export {Movies}
