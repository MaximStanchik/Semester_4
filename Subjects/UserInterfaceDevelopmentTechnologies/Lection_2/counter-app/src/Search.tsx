import { stringify } from "querystring";
import React, { ChangeEvent, useState } from "react";

function Search(props) {
    const { searchMovies = Function.prototype } = props;

    const [search: stringify, setSearch] = useState('');
    const [type: string, setType] = useState('');

    const handleKey = (event): void => {
        if (event.key === 'Enter') {
            searchMovies(search, type);
        }
    }

    const handleFilter = (event): void => {
        setType(event.target.dataset.type);
        searchMovies(search, type);
    }

    return (
        <div className="row">
            <div className="input-field">
                <input
                    placeholder="search"
                    type="search"
                    className="validate"
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                    onKeyDown={handleKey}
                />
                <button className="btn search-btn" onClick={handleSearch}>
                    Search
                </button>
            </div>
            <div>
                <label className="movies-type">
                    <input
                        className="with-gap"
                        name="type"
                        type="radio"
                        data-type=""
                        onChange={handleFilter}
                        checked={type === ""}
                    />
                    <span>All</span>
                </label>
                <label className="movies-type">
                    <input
                        className="with-gap"
                        name="type"
                        type="radio"
                        data-type="movie"
                        onChange={handleFilter}
                        checked={type === "movie"}
                    />
                    <span>Movies only</span>
                </label>
                <label className="movies-type">
                    <input
                        className="with-gap"
                        name="type"
                        type="radio"
                        data-type="series"
                        onChange={handleFilter}
                        checked={type === "series"}
                    />
                    <span>Series only</span>
                </label>
            </div>
        </div>
    );
}
export default Search;