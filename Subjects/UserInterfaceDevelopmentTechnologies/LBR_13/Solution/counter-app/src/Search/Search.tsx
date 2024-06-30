import { Card, Category } from "../Card";
import { Cards } from "../Cards/Cards";
import "./Search.css";
import React from "react";
import axios from "axios";

async function search_for(input: string, type: string): Promise<Card[]> {
  let result: Card[] = [];

  for (let i = 1; i < 3; ++i) {
    try {
      const response = await axios.get("https://www.omdbapi.com/", {
        params: {
          apikey: "d1f715ef",
          s: input,
          type: type,
          page: i,
        },
      });

      console.log(response);

      if (response.data.Response === "False") break;

      const cards: Card[] = response.data.Search.map((item: any) => ({
        title: item.Title,
        year: parseInt(item.Year),
        type: item.Type == "movie" ? Category.movie : Category.series,
        image: item.Poster,
        url: `https://www.imdb.com/title/${item.imdbID}/`,
      }));

      result = result.concat(cards);
    } catch (error) {
      console.error(error);
      break;
    }
  }
  return result;
}

export function Search() {
  let [cards, setCards] = React.useState([] as Card[]);
  let [cat, setCat] = React.useState("");
  let [input, setInput] = React.useState("");

  return (
    <div className="Search">
      <input
        className="Search-input"
        placeholder="search"
        onChange={(v) => setInput(v.target.value)}
      />
      <div className="Search-props">
        <label>
          <input
            type="radio"
            name="searchType"
            onChange={() => setCat("")}
            checked={cat == ""}
          />
          All
        </label>
        <label>
          <input
            type="radio"
            name="searchType"
            onChange={() => setCat("movie")}
            checked={cat == "movie"}
          />
          Movies only
        </label>
        <label>
          <input
            type="radio"
            name="searchType"
            onChange={() => setCat("series")}
            checked={cat == "series"}
          />
          Series only
        </label>

        <button
          className="Search-button"
          onClick={async () => setCards(await search_for(input, cat))}
        >
          search
        </button>
      </div>
      <Cards cards={cards} />
    </div>
  );
}
