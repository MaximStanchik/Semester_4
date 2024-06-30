"use strict";
//----------Task_1----------//
class Product {
    constructor(id, size, color, price) {
        this._discount = 0;
        this._finalPrice = 0;
        this._id = id;
        this._size = size;
        this._color = color;
        this._price = price;
        this.calculateFinalPrice();
    }
    get ID() {
        return this._id;
    }
    get Size() {
        return this._size;
    }
    get Color() {
        return this._color;
    }
    get Price() {
        return this._price;
    }
    set Price(price) {
        this._price = price;
        this.calculateFinalPrice();
    }
    get Discount() {
        return this._discount;
    }
    set Discount(discount) {
        this._discount = discount;
        this.calculateFinalPrice();
    }
    get finalCost() {
        return this._finalPrice;
    }
    calculateFinalPrice() {
        this._finalPrice = this._price - (this._price * this._discount) / 100;
    }
    static create(id, size, color, price) {
        return new Product(id, size, color, price);
    }
}
const products = {
    shoes: {
        boots: [
            Product.create(1, 42, 'gray', 1000),
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
function toConvertOriginalValue(inputValue) {
    let convertedValue = 0;
    if (inputValue !== null) {
        convertedValue = parseInt(inputValue, 10);
    }
    else {
        alert('No value entered');
    }
    return convertedValue;
}
function toFilterShoes(products, minPrice, maxPrice, size, color) {
    const filteredNumbers = [];
    for (const category of Object.values(products.shoes)) {
        for (const product of category) {
            if (product.Price >= minPrice &&
                product.Price <= maxPrice &&
                product.Size === size &&
                product.Color === color) {
                filteredNumbers.push(product.ID);
            }
        }
    }
    return filteredNumbers;
}
//----------Task_4----------//
//----------Task_5----------//
function Main() {
    const minimumPriceInput = prompt('Please enter the minimum price value:');
    const maximumPriceInput = prompt('Please enter the maximum price value:');
    const sizeInput = prompt('Please enter the size value:');
    const colorInput = prompt('Please enter the color value:');
    let minPrice = toConvertOriginalValue(minimumPriceInput);
    let maxPrice = toConvertOriginalValue(maximumPriceInput);
    const size = toConvertOriginalValue(sizeInput);
    const color = colorInput !== null ? colorInput : '';
    if (minPrice > maxPrice) {
        const temp = minPrice;
        minPrice = maxPrice;
        maxPrice = temp;
    }
    const filteredProductNumbers = toFilterShoes(products, minPrice, maxPrice, size, color);
    alert('Displaying product unique numbers that match the specified filter: ' + filteredProductNumbers);
}
Main();
