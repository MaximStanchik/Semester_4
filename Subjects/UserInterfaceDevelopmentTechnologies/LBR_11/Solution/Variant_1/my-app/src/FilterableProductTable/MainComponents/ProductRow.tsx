import {IRowProps} from "../FilterableProductTable/../Interfaces/IRowProps";
import '../FilterableProductTable/../Styles/ProductRow.css'
export function ProductRow(props: IRowProps) {
    const product = props.product;
    return (
      <tr>
        <td style={ product.availability ? {} : {color: "red"}}>{product.name}</td>
        <td>{product.price}</td>
      </tr>
    );
};