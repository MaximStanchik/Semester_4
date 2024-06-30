import React from "react";
import { IFilterableProps } from "../FilterableProductTable/../Interfaces/IFilterableProps";
import { SearchBar } from "../FilterableProductTable/../MainComponents/SearchBar";
import { ProductTable } from "../FilterableProductTable/../MainComponents/ProductTable";
import '../FilterableProductTable/../Styles/FilterableProductTable.css'

export function FilterableProductTable({ products }: IFilterableProps) {
    const rows: JSX.Element[] = [];

    const [filter, setFilter] = React.useState("");
    const [availability, setAvailability] = React.useState(false);

    function handleFilterChanged(filter: string) {
        setFilter(filter);
    }
    function handleAvailabilityChanged(availability: boolean) {
        setAvailability(availability);
    }

    return (
        <div className="FilterableProductTable">
      <SearchBar
        filter={filter} 
        availability={availability}
        onFilterChanged={handleFilterChanged}
        onAvailabilityChanged={handleAvailabilityChanged}
      />
      <ProductTable filter={filter} availability={availability} products={products} />
    </div>
    );
}

//состояниия, пропсы, те моменты когда нужно было разобраться. а еще надо объяснить когда пользовальзоватлеь воодит что-то в поле (нативный элемент, там произошло событие, значит вызвался обработчик (там скорее всего состояние изменилось и куда-то передалось. когда пользователь что-то ввел, то ...))
// в понедельник в 14:40 в 204-1