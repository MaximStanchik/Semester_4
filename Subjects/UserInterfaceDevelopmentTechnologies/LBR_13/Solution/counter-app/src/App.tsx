import "./App.css";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Menu } from "./Menu/Menu";
import { Footer } from "./Footer/Footer";
import { Card, Category } from "./Card";
import { Cards } from "./Cards/Cards";
import { Search } from "./Search/Search";
import cock_png from "./cock.png"
import mmm_png from "./mmm.png"
import fish_png from "./fish.jpg"

const cock_card: Card = {
  title: "Cock",
  year: 2024,
  type: Category.movie,
  image: cock_png,
  url: "https://gorodskayaferma.ru/blog-ferma/fakty-o-petuhah/",
}

const mmm_card: Card = {
  title: "red and yellow",
  year: 2020,
  type: Category.cartoon,
  image: mmm_png,
  url: "https://www.color-meanings.com/what-color-yellow-red-make-mixed/",
}

const fish_card: Card = {
  title: "fish",
  year: 2042,
  type: Category.series,
  image: fish_png,
  url: "https://www.youtube.com/watch?v=eAQKifmUUtg",
}

const movie_cards: Card[] = [
  cock_card,
  cock_card,
  cock_card,
  cock_card,
  cock_card,
  cock_card,
]

const mmm_cards: Card[] = [
  mmm_card,
  mmm_card,
  mmm_card,
  mmm_card,
  mmm_card,
  mmm_card,
]

const fish_cards: Card[] = [
  fish_card,
  fish_card,
  fish_card,
  fish_card,
  fish_card,
  fish_card,
]

function App() {
  return (
    <Router>
      <div className="App">
        <Menu
          items={Object.keys(Category).filter((item) => isNaN(Number(item)))}
        />

        <Routes>
          <Route path="/" element={<h2>nothing here</h2>}/>
          <Route path="movie" element={<Cards cards={movie_cards}/>}/>
          <Route path="cartoon" element={<Cards cards={mmm_cards}/>}/>
          <Route path="series" element={<Cards cards={fish_cards}/>}/>
          <Route path="search" element={<Search />}/>
        </Routes>

        <Footer />
      </div>
    </Router>
  );
}

export default App;
