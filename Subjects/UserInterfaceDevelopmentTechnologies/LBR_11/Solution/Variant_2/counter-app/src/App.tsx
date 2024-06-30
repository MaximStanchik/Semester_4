import "./App.css";
import PRODUCTS from "./products";
import { FilterableProductTable } from "./FilterableProductTable/FilterableProductTable";

function App() {
  return (
    <div className="App">
      <FilterableProductTable products={PRODUCTS} />
    </div>
  );
}

export default App;
