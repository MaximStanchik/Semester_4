//----------Task_1----------//
class Product {
    private readonly _id: number;
    private readonly _size: number;
    private readonly _color: string;
    private _price: number;
    private _discount: number = 0;
    private _finalPrice: number = 0;
  
    private constructor(id: number, size: number, color: string, price: number) {
      this._id = id;
      this._size = size;
      this._color = color;
      this._price = price;
      this.calculateFinalPrice();
    }
  
    get ID(): number {
      return this._id;
    }
  
    get Size(): number {
      return this._size;
    }
  
    get Color(): string {
      return this._color;
    }
  
    get Price(): number {
      return this._price;
    }
  
    set Price(price: number) {
      this._price = price;
      this.calculateFinalPrice();
    }
  
    get Discount(): number {
      return this._discount;
    }
  
    set Discount(discount: number) {
      this._discount = discount;
      this.calculateFinalPrice();
    }
  
    get finalCost(): number {
      return this._finalPrice;
    }
  
    private calculateFinalPrice() {
      this._finalPrice = this._price - (this._price * this._discount) / 100;
    }
  
    static create(id: number, size: number, color: string, price: number): Product {
      return new Product(id, size, color, price);
    }
  }
  interface Shoes {
    [key: string]: Product[];
  }
  
  interface Products {
    shoes: Shoes;
    [Symbol.iterator](): IterableIterator<Product>;
  }
  
  const products: Products = {
    shoes: {
      boots: [
        Product.create(1, 0, 'gray', 1000),
        Product.create(2, 42, 'gray', 1200)
      ],
      sneakers: [
        Product.create(3, 38, 'white', 800),
        Product.create(4, 41, 'blue', 1500)
      ],
      sandals: [
        Product.create(5, 37, 'red', 600),
        Product.create(6, 39, 'yellow', 900)
      ]
    },
  //----------Task_2----------//
  *[Symbol.iterator]() {
    const categories = Object.values(this.shoes);
    for (const category of categories) {
      yield* category;
    }
  }
  };
  
  //----------Task_3----------//
  function toConvertOriginalValue(inputValue: string | null): number {
    let convertedValue: number = 0;
    if (inputValue !== null) {
      convertedValue = parseInt(inputValue, 10);
    } 
    else {
      alert('No value entered');
    }
    return convertedValue;
  }
  
  function toFilterShoes(products: any, minPrice: number, maxPrice: number, size: number, color: string): number[] {
    const filteredNumbers: number[] = [];
    for (const category of Object.values(products.shoes) as any[]) {
      for (const product of category) {
        if (product.Price >= minPrice && product.Price <= maxPrice && product.Size === size && product.Color === color) {
          filteredNumbers.push(product.ID);
        }
      }
    }
    return filteredNumbers;
  }
  
  //----------Task_4----------//
  //----------Task_5----------//
  function Main() {
    const minimumPriceInput: string | null = prompt('Please enter the minimum price value:');
    const maximumPriceInput: string | null = prompt('Please enter the maximum price value:');
    const sizeInput: string | null = prompt('Please enter the size value:');
    const colorInput: string | null = prompt('Please enter the color value:');
  
    let minPrice: number = toConvertOriginalValue(minimumPriceInput);
    let maxPrice: number = toConvertOriginalValue(maximumPriceInput);
    const size: number = toConvertOriginalValue(sizeInput);
    const color: string = colorInput !== null ? colorInput : '';
  
    if (minPrice > maxPrice) {
      const temp = minPrice;
      minPrice = maxPrice;
      maxPrice = temp;
    }
  
    const filteredProductNumbers = toFilterShoes(products, minPrice, maxPrice, size, color);
    alert('Displaying product unique numbers that match the specified filter: ' + filteredProductNumbers);
  }
  
  Main();

