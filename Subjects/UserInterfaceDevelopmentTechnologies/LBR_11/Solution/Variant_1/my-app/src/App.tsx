import React from 'react';
import ALLPRODUCTS from "./FilterableProductTable/Data/ListOfProducts";
import {FilterableProductTable} from "./FilterableProductTable/MainComponents/FilterableProductTable";

import './App.css';

function App() {
  return (
    <div className="App">
      <FilterableProductTable products ={ALLPRODUCTS} />
    </div>
  );
}

export default App;
