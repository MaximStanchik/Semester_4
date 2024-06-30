import "./css/SearchBar.css"

interface Props {
  filter: string;
  stockOnly: boolean;
  onFilterChanged: (x: string) => void;
  onStockOnlyChanged: (x: boolean) => void;
}

export function SearchBar({filter, stockOnly, onFilterChanged, onStockOnlyChanged}: Props) {
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
          checked={stockOnly}
          onChange={(value) => onStockOnlyChanged(value.target.checked)}
        />{" "}
        Only show products in stock
      </p>
    </form>
  );
}
