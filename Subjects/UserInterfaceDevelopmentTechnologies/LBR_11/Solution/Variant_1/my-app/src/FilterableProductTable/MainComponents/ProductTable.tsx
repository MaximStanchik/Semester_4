import {ITableProps} from "../FilterableProductTable/../Interfaces/ITableProps";
import { ProductCategory } from "./ProductCategory";
import { ProductRow } from "./ProductRow";
import '../FilterableProductTable/../Styles/ProductTable.css'

export function ProductTable({ products, filter, availability }: ITableProps) {
    const rows: JSX.Element[] = [];
    let lastCategory: string | null = null;
    products.forEach((product) => {
        if (product.name.toLowerCase().indexOf(filter.toLowerCase()) === -1) {
            return;
        }
        if (availability == true && product.availability == false) {
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

    return(
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