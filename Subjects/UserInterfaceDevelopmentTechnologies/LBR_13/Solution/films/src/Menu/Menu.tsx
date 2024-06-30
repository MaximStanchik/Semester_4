import './Menu.css'
import { Link } from 'react-router-dom';
import { Card, Category } from "../Card";

type props = {
  items: string[],
}

export function Menu({items} : props) {
  return (
    <ul className='Menu'>
      {items.map(item => (
        <li><Link className='btn' to={item}>{item}</Link></li>
      ))}
    </ul>
  )
}
