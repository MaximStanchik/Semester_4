import { MovieType } from "../movies";

function Movie(props: MovieType) {
    const {
        Title: title, Year: year,
        imdbID: id, Type: type,
        Poster: poster,
    } = props;

    return <>
    <div id={id} className="card small">
        <div className="card-image waves-effect waves-block waves-light">
            <img className="activator"/> // не готово
            </div>
            <div className="card-content">
                <span className="card-title activator grey-text text-darken-4">
                    {title}
                    </span>
                    <p></p> //не доделано
            </div>
}