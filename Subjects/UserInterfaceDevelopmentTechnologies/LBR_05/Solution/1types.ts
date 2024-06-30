const str: string = 'Hello';

console.log(str);

const isFetching: boolean = true;
const isLoading: boolean = false;

const int: number = 42;
const float: number = 4.50;
const num: number = 3e10;

const mmessage: string = 'Hello Typescript';

const numberArray: number[] = [1,1,2,3,5,8,13];
const numberArray2: Array<number> = [1,1,2,3,5,8,13];

const words: string[] = ['Hello', 'Typescript'];

//Tuple

const contact = ['Vladilen', 1234567];
const contact2: [string, number] = ['Vladilen', 1234567];

let variable = 42;

let variable2: any = 42;
variable2 = [];

// ===
function sayMyName(name: string): void {
    console.log(name);
}
sayMyName('Jonny');

// Never

function throwError(message: string): never {
    throw new Error(message);
}

function infinite():never {
    while (true) {

    }
}

// Type
type Login = string;

const login: Login = 'admin';
//const login2: Login - 2;

type ID = string | number;

const id1: ID = 1234;
const id2: ID = '1234';
//const id3: ID = true

type SomeType = string | null | undefined;


let tuple: [string, number] = ['string', 4];
let varable: SomeType = 'string';