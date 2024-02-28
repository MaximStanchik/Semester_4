"use strict";
//----------Task_1----------//
function userInputLoop() {
    const userInputArray = [];
    for (let i = 0; i < 10; i++) {
        let userInput = prompt(`Enter an integer element from 0 to 9 (${i + 1}-st iteration):`);
        while (userInput === null || !/^[0-9]$/.test(userInput)) {
            userInput = prompt(`Invalid input. Enter an integer element from 0 to 9 (${i + 1}-st iteration):`);
        }
        const element = parseInt(userInput, 10);
        userInputArray.push(element);
    }
    return userInputArray;
}
function toCreatePhoneNumber(arrayOfTenIntegers) {
    if (arrayOfTenIntegers.length !== 10) {
        return null;
    }
    for (let i = 0; i < arrayOfTenIntegers.length; i++) {
        if (arrayOfTenIntegers[i] < 0 || arrayOfTenIntegers[i] > 9 || !Number.isInteger(arrayOfTenIntegers[i])) {
            return null;
        }
    }
    const areaCode = arrayOfTenIntegers.slice(0, 3).join("");
    const firstPart = arrayOfTenIntegers.slice(3, 6).join("");
    const secondPart = arrayOfTenIntegers.slice(6).join("");
    return `(${areaCode}) ${firstPart}-${secondPart}`;
}
//----------Task_2----------//
class Challenge {
    static solution(number) {
        if (number < 0) {
            return 0;
        }
        let sum = 0;
        for (let i = 3; i < number; i++) {
            if (i % 3 === 0 || i % 5 === 0) {
                sum += i;
            }
        }
        return sum;
    }
}
//----------Task_3----------//
function toRotateArray(nums, k) {
    const arrayLength = nums.length;
    k = k % arrayLength;
    for (let i = 0; i < k; i++) {
        const lastElement = nums[nums.length - 1];
        nums.pop();
        nums.unshift(lastElement);
    }
    return nums;
}
//----------Task_4----------//
function toCalculateTheMedian(array1, array2) {
    let median = 0;
    const combinedArray = [...array1, ...array2];
    if (combinedArray.length % 2 == 0) {
        median = (array1[array1.length - 1] + array2[0]) / 2;
    }
    else {
        median = combinedArray[((combinedArray.length + 1) / 2) - 1];
    }
    return median;
}
function Main() {
    alert('First task');
    const inputArray = userInputLoop();
    alert('Result of executing the function: ' + toCreatePhoneNumber(inputArray));
    alert('Second task');
    alert('Function execution result: ' + Challenge.solution(10));
    alert('Third task');
    const nums = [1, 2, 3, 4, 5, 6, 7];
    const k_input = prompt('Please, enter K value:');
    if (k_input !== null) {
        const k = parseInt(k_input, 10);
        if (isNaN(k)) {
            alert('Invalid input for K. Please enter a valid number.');
        }
        else {
            const result = toRotateArray(nums, k);
            alert('Result of executing the function: ' + result);
        }
    }
    else {
        alert('No value entered');
    }
    alert('Fourth task');
    const firstArray = [1, 2, 3, 4, 5, 6, 7];
    const secondArray = [8, 9, 10, 11, 12, 13, 14];
    alert('Result of executing the function: ' + toCalculateTheMedian(firstArray, secondArray));
    const thirdArray = [1, 2, 3, 4, 5];
    const fourthArray = [6, 7, 8, 9];
    alert('Result of executing the function: ' + toCalculateTheMedian(thirdArray, fourthArray));
    alert('Fifth task');
    const sudokuBoard = [];
    for (let i = 0; i < 9; i++) {
        sudokuBoard[i] = [];
        for (let j = 0; j < 9; j++) {
            sudokuBoard[i][j] = new Set();
        }
    }
    sudokuBoard[0][0].add(5);
    sudokuBoard[1][0].add(6);
    //sudokuBoard[2][0].add(3);
    sudokuBoard[3][0].add(8);
    sudokuBoard[4][0].add(4);
    sudokuBoard[5][0].add(7);
    //sudokuBoard[6][0].add(7);
    sudokuBoard[0][1].add(3);
    sudokuBoard[2][1].add(9);
    sudokuBoard[6][1].add(6);
    sudokuBoard[2][2].add(8);
    sudokuBoard[1][3].add(1);
    sudokuBoard[4][3].add(8);
    sudokuBoard[7][3].add(4);
    sudokuBoard[0][4].add(7);
    sudokuBoard[1][4].add(9);
    sudokuBoard[3][4].add(6);
    sudokuBoard[5][4].add(2);
    sudokuBoard[7][4].add(1);
    sudokuBoard[8][4].add(8);
    sudokuBoard[1][5].add(5);
    sudokuBoard[4][5].add(3);
    sudokuBoard[7][5].add(9);
    sudokuBoard[6][6].add(2);
    sudokuBoard[2][7].add(6);
    sudokuBoard[6][7].add(8);
    sudokuBoard[8][7].add(7);
    sudokuBoard[3][8].add(3);
    sudokuBoard[4][8].add(1);
    sudokuBoard[5][8].add(6);
    sudokuBoard[7][8].add(5);
    sudokuBoard[8][8].add(9);
    for (let i = 0; i < 9; i++) {
        let rowString = "";
        for (let j = 0; j < 9; j++) {
            if (sudokuBoard[i][j].size === 0) {
                rowString += " -";
            }
            else {
                rowString += ` ${Array.from(sudokuBoard[i][j]).join("")}`;
            }
        }
        console.log(rowString);
    }
    alert('The printed Sudoku board is in the developer console');
    for (let i = 0; i < 9; i++) {
        const rowSet = new Set();
        for (let j = 0; j < 9; j++) {
            const cellSet = sudokuBoard[i][j];
            if (cellSet.size === 1) {
                const number = Array.from(cellSet)[0];
                if (number >= 1 && number <= 9) {
                    if (rowSet.has(number)) {
                        console.log(`Error in line ${i + 1}: Number ${number} repeats.`);
                    }
                    else {
                        rowSet.add(number);
                    }
                }
                else {
                    console.log(`Error in line ${i + 1}: There is an invalid value in cell (${i}, ${j}).`);
                }
            }
        }
    }
    for (let j = 0; j < 9; j++) {
        const columnSet = new Set();
        for (let i = 0; i < 9; i++) {
            const cellSet = sudokuBoard[i][j];
            if (cellSet.size === 1) {
                const number = Array.from(cellSet)[0];
                if (number >= 1 && number <= 9) {
                    if (columnSet.has(number)) {
                        console.log(`Error in column ${j + 1}: Number ${number} repeats.`);
                    }
                    else {
                        columnSet.add(number);
                    }
                }
                else {
                    console.log(`Error in column ${j + 1}: There is an invalid value in cell (${i}, ${j}).`);
                }
            }
        }
    }
    for (let blockRow = 0; blockRow < 3; blockRow++) {
        for (let blockCol = 0; blockCol < 3; blockCol++) {
            const blockSet = new Set();
            for (let i = blockRow * 3; i < blockRow * 3 + 3; i++) {
                for (let j = blockCol * 3; j < blockCol * 3 + 3; j++) {
                    const cellSet = sudokuBoard[i][j];
                    if (cellSet.size === 1) {
                        const number = Array.from(cellSet)[0];
                        if (number >= 1 && number <= 9) {
                            if (blockSet.has(number)) {
                                console.log(`Error in subblock (${blockRow + 1}, ${blockCol + 1}): Number ${number} repeats itself.`);
                            }
                            else {
                                blockSet.add(number);
                            }
                        }
                        else {
                            console.log(`Error in subblock (${blockRow + 1}, ${blockCol + 1}): There is an invalid value in cell (${i}, ${j}).`);
                        }
                    }
                }
            }
        }
    }
}
Main();
