import { Product } from "./Product";
import { ProductCategory } from "./ProductCategory";
import { ProductRow } from "./ProductRow";

import './css/ProductTable.css'

interface TableProps {
  products: Product[];
  filter: string;
  stockOnly: boolean;
}

export function ProductTable({ products, filter, stockOnly }: TableProps) {
  const rows: JSX.Element[] = [];
  let lastCategory: string | null = null;

  products.forEach((product) => {
    if (product.name.toLowerCase().indexOf(filter.toLowerCase()) === -1) {
      return;
    }
    if (stockOnly && !product.stocked) {
      return;
    }
    if (product.category !== lastCategory) {
      rows.push(
        <ProductCategory
          category={product.category}
          key={product.category}
        />,
      );
    }
    rows.push(<ProductRow product={product} key={product.name} />);
    lastCategory = product.category;
  });

  return (
    <table className='ProductTable'>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
  );
}
