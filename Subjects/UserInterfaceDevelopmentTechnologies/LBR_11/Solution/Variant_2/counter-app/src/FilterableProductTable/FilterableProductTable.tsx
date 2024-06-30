import React from "react";
import { ProductTable } from "./ProductTable";
import { SearchBar } from "./SeachBar";
import { Product } from "./Product";

import './css/FilterableProductTable.css'

interface FilterableProps {
  products: Product[];
}

export function FilterableProductTable({ products }: FilterableProps) {

  const [filter, setFilter] = React.useState("");
  const [stockOnly, setStockOnly] = React.useState(false);

  function handleFilterChanged(filter: string) {
    setFilter(filter);
  }
  function handleStockOnlyChanged(stockOnly: boolean) {
    setStockOnly(stockOnly);
  }

  return (
    <div className="FilterableProductTable">
      <SearchBar
        filter={filter} 
        stockOnly={stockOnly}
        onFilterChanged={handleFilterChanged}
        onStockOnlyChanged={handleStockOnlyChanged}
      />
      <ProductTable filter={filter} stockOnly={stockOnly} products={products} />
    </div>
  );
}

//состояниия, пропсы, те моменты когда нужно было разобраться. а еще надо объяснить когда пользовальзоватлеь воодит что-то в поле (нативный элемент, там произошло событие, значит вызвался обработчик (там скорее всего состояние изменилось и куда-то передалось. когда пользователь что-то ввел, то ...))
