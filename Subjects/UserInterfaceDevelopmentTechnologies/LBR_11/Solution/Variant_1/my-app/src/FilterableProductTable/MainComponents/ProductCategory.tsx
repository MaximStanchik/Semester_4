import {ICategoryProps} from "../FilterableProductTable/../Interfaces/ICategoryProps";
import '../FilterableProductTable/../Styles/ProductCategory.css'
export function ProductCategory(props: ICategoryProps) {
    return (
      <tr>
        <th colSpan={2} >{props.category}</th>
      </tr>
    );
};