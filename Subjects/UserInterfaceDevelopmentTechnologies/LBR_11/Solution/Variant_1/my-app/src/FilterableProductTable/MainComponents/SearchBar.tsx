import {ISearchProps} from "../FilterableProductTable/../Interfaces/ISearchProps";
import '../FilterableProductTable/../Styles/SearchBar.css'
export function SearchBar({filter, availability, onFilterChanged, onAvailabilityChanged}: ISearchProps) {
    return (
      <form className="SearchBar">
        <input
          type="text"
          placeholder="Search..."
          value={filter}
          onChange={(value) => onFilterChanged(value.target.value)}
        />
        <p>
          <input
            type="checkbox"
            checked={availability}
            onChange={(value) => onAvailabilityChanged(value.target.checked)}
          />
          Show only available products
        </p>
      </form>
    );
  }
  