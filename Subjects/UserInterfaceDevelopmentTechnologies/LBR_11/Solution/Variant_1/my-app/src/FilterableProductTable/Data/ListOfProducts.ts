import {IProduct} from "../FilterableProductTable/../Interfaces/IProduct";

const ALLPRODUCTS = [
  {category: 'Laptop', price: '$4000.30', availability: true, name: 'Laptop_1'},
  {category: 'Laptop', price: '$5900.50', availability: true, name: 'Laptop_2'},
  {category: 'Smartphone', price: '$790.99', availability: false, name: 'Smartphone_1'},
  {category: 'Smartphone', price: '$800.99', availability: true, name: 'Smartphone_2'},
  {category: 'Tablet', price: '$399.99', availability: false, name: 'Tablet_1'},
  {category: 'Tablet', price: '$999.99', availability: true, name: 'Tablet_2'},
  {category: 'Tablet', price: '$599.99', availability: true, name: 'Tablet_3'}
] as IProduct[];

export default ALLPRODUCTS;