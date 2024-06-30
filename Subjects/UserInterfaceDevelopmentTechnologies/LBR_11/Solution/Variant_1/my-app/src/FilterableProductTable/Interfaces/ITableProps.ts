import {IProduct} from './IProduct';

export interface ITableProps {
    products: IProduct[];
    filter: string;
    availability: boolean;
};