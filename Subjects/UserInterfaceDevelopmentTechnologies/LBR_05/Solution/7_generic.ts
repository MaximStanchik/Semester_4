const arrayOfNumbers: Array<number> = [1,2,33,4,5];
const arrayOfStrings: Array<string> = ['Hello', 'Vladilen'];

function reverse<T>(array: T[]): T[] {
return array.reverse();
}

reverse(arrayOfNumbers);
reverse(arrayOfStrings);