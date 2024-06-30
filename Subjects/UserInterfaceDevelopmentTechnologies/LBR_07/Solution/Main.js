"use strict";
//-----------Task_2-----------//
const myPromise = new Promise(function (resolve, reject) {
    setTimeout(() => {
        console.log(Math.round(Math.random() * 100));
        resolve();
    }, 3000);
});
myPromise.then(() => { console.log("Operation completed successfully"); });
myPromise.finally(() => { console.log("The functionality of the second task has been demonstrated"); });
//-----------Task_3-----------//
function generateThreeNumbers(delay) {
    function delayedResolve(resolve) {
        setTimeout(() => {
            const randomNumber = Math.round(Math.random() * 100);
            resolve(randomNumber);
        }, delay);
    }
    ;
    return new Promise(delayedResolve);
}
let delay = 3000;
const promises = [
    generateThreeNumbers(3000),
    generateThreeNumbers(2000),
    generateThreeNumbers(1000)
];
Promise.all(promises).then((randomNumber) => { console.log("Generated numbers: " + randomNumber); });
Promise.all(promises).finally(() => { console.log("The functionality of the third task has been demonstrated"); });
//-----------Task_4-----------//
let pr = new Promise((res, rej) => {
    rej('ku');
});
pr
    .then(() => console.log(1))
    .catch(() => console.log(2))
    .catch(() => console.log(3))
    .then(() => console.log(4))
    .then(() => console.log(5));
//-----------Task_5-----------//
const successfulPromise = new Promise(function (resolve, reject) {
    let number = 21;
    setTimeout(() => {
        resolve(number);
    }, 1000);
});
//.then((number) => {console.log("First number: " + number); return number * 2})
//.then((number) => {console.log("Second number: " + number)}) 
//.finally(() => {console.log("The functionality of the fifth task has been demonstrated")});
//-----------Task_6-----------//
async function asyncSyntax() {
    try {
        const number = await successfulPromise;
        console.log("First number: " + number);
        return number * 2;
    }
    catch (error) {
        console.error("Something went wrong...");
    }
}
asyncSyntax().then(number => { console.log("Second number: " + number); }).finally(() => { console.log("The functionality of the sixth task has been demonstrated"); });
