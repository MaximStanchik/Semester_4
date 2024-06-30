"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var partiallyFilledField = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
    ["4", "5", "6", "7", "8", "9", "1", "2", "3"],
    ["7", "8", "9", "1", "2", "3", "4", "5", "6"],
    ["2", "3", "4", "5", "6", "7", "8", "9", "1"],
    ["5", "6", "7", "8", "9", "1", "2", "3", "4"],
    ["8", "9", "1", "2", "3", "4", "5", "6", "7"],
    ["3", "4", "5", "6", "7", "8", "9", "1", "2"],
    ["6", "7", "8", "9", "1", "2", "3", "4", "5"],
    ["9", "1", "2", "3", "4", "5", "6", "7", "8"]
];
// можно сгененрировать польностью заполненное сгенерированное поле , потом некоторые цифры убираются
function transposeSudokuField(partiallyFilledField) {
    var transposedSudokuField = [[]];
    for (var m = 0; m < 9; m++) {
        transposedSudokuField[m] = [];
        for (var i = 0; i < 9; i++) {
            transposedSudokuField[m][i] = partiallyFilledField[i][m];
        }
    }
    return transposedSudokuField;
}
;
function swapRows(partiallyFilledField, firRowNum, secRowNum) {
    if (Math.floor(firRowNum / 3) != Math.floor(secRowNum / 3)) {
        console.log("Строки находятся в разных районах");
    }
    else if (firRowNum == secRowNum) {
        console.log("Строки одинаковые");
    }
    else {
        var row = [];
        row = partiallyFilledField[firRowNum];
        partiallyFilledField[firRowNum] = partiallyFilledField[secRowNum];
        partiallyFilledField[secRowNum] = row;
    }
    return partiallyFilledField;
}
;
function swapColumns(partiallyFilledField, firColNum, secColNum) {
    if (Math.floor(firColNum / 3) != Math.floor(secColNum / 3)) {
        console.log("Столбцы находятся в разных районах");
    }
    else if (firColNum == secColNum) {
        console.log("Столбцы одинаковые");
    }
    else {
        var col = void 0;
        for (var i = 0; i < 9; i++) {
            col = partiallyFilledField[i][secColNum];
            partiallyFilledField[i][secColNum] = partiallyFilledField[i][firColNum];
            partiallyFilledField[i][firColNum] = col;
        }
    }
    return partiallyFilledField;
}
;
function swapRowsAreas(partiallyFilledField) {
    var m = 3;
    var row = [];
    for (var i = 0; i < 3; i++) {
        row = partiallyFilledField[i];
        partiallyFilledField[i] = partiallyFilledField[m];
        partiallyFilledField[m] = row;
        m++;
    }
    return partiallyFilledField;
}
;
function generateFullSudokuBoard(sudokuField) {
    sudokuField = swapColumns(swapRowsAreas(swapRows(transposeSudokuField(sudokuField), 0, 2)), 3, 4);
    return sudokuField;
}
;
function generatePartiallyFilledSudokuBoard(sudokuField, numberOfEmptyCells) {
    var newSudokuField = sudokuField.flat();
    var randomNumbers = [];
    var randomValue;
    for (var i = 0; i < numberOfEmptyCells; i++) {
        randomValue = Math.floor(Math.random() * 81);
        if (randomNumbers.indexOf(randomValue) !== -1) {
            i--;
        }
        else {
            randomNumbers.push(randomValue);
            newSudokuField[randomNumbers[i]] = "";
        }
    }
    return sudokuField;
}
var sudokuField = generatePartiallyFilledSudokuBoard(generateFullSudokuBoard(partiallyFilledField), 46);
exports.default = sudokuField;
console.log(generatePartiallyFilledSudokuBoard(generateFullSudokuBoard(partiallyFilledField), 46));
