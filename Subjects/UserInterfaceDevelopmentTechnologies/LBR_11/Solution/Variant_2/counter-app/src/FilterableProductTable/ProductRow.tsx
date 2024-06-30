import { Product } from "./Product";
import './css/ProductRow.css'

interface RowProps {
  product: Product,
  key: string,
}

export function ProductRow(props: RowProps) {
  const product = props.product;
  return (
    <tr>
      <td style={ product.stocked ? {} : {color: "red"}}>{product.name}</td>
      <td>{product.price}</td>
    </tr>
  );
}
