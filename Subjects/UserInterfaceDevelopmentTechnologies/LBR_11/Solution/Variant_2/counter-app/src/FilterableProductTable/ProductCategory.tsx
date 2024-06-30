import './css/ProductCategory.css'

interface CategoryProps {
  category: string,
  key: string,
}

export function ProductCategory(props: CategoryProps) {
  return (
    <tr>
      <th colSpan={2} >{props.category}</th>
    </tr>
  );
}
