let partiallyFilledField: string[][] = [
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

function transposeSudokuField(partiallyFilledField: string[][]): string[][] { //транспонировать матрицу
  let transposedSudokuField: string[][] = [[]];

  for (let m: number = 0; m < 9; m++) {
    transposedSudokuField[m] = [];
    for (let i: number = 0; i < 9; i++) {
      transposedSudokuField[m][i] = partiallyFilledField[i][m];
    }
  }

  return transposedSudokuField;
};

function swapRows(partiallyFilledField: string[][], firRowNum: number, secRowNum: number): string[][] { //поменять местами две строки в пределе одного района 
  if (Math.floor(firRowNum / 3) != Math.floor(secRowNum / 3)) {
    console.log("Строки находятся в разных районах");
  }
  else if (firRowNum == secRowNum) {
    console.log("Строки одинаковые");
  }
  else {
    let row: string[] = [];

    row = partiallyFilledField[firRowNum];
    partiallyFilledField[firRowNum] = partiallyFilledField[secRowNum];
    partiallyFilledField[secRowNum] = row;
  }

  return partiallyFilledField;
};

function swapColumns(partiallyFilledField: string[][], firColNum: number, secColNum: number): string[][] { //поменять местами две колонки в пределе одного района
  if (Math.floor(firColNum / 3) != Math.floor(secColNum / 3)) {
    console.log("Столбцы находятся в разных районах");
  }
  else if (firColNum == secColNum) {
    console.log("Столбцы одинаковые");
  }
  else {
    let col: string;
    for (let i: number = 0; i < 9; i++) {
      col = partiallyFilledField[i][secColNum];
      partiallyFilledField[i][secColNum] = partiallyFilledField[i][firColNum];
      partiallyFilledField[i][firColNum] = col;
    }
  }
  return partiallyFilledField;
};

function swapRowsAreas(partiallyFilledField: string[][]): string[][] { //поменять местами районы по горизонтали
  let m: number = 3;
  let row: string[] = [];

  for (let i: number = 0; i < 3; i++) {
    row = partiallyFilledField[i];
    partiallyFilledField[i] = partiallyFilledField[m];
    partiallyFilledField[m] = row;
    m++;
  }

  return partiallyFilledField;
};

function generateFullSudokuBoard(sudokuField: string[][]): string[] {
  sudokuField = swapColumns(swapRowsAreas(swapRows(transposeSudokuField(sudokuField), 0, 2)), 3, 4);
  console.log(sudokuField);//для проверки. Можно убрать
  return sudokuField.flat();
};

function generatePartiallyFilledSudokuBoard(sudokuField: string[], numberOfEmptyCells: number): string[] {
  let randomNumbers: number[] = [];
  let randomValue: number;

  for (let i: number = 0; i < numberOfEmptyCells; i++) {
    randomValue = Math.floor(Math.random() * 81);

    if (randomNumbers.indexOf(randomValue) !== -1) {
      i--;
    } else {
      randomNumbers.push(randomValue);
      sudokuField[randomNumbers[i]] = "";
    }
  }

  return sudokuField;
}

const makeUniq = (arr: string[]) => {
  const uniqSet: Set<string> = new Set(arr);
  return [...uniqSet];
};

export function checkSudokuRow(inputValues: string[]): number[] { //нахождение строки в котором ошибки, нахождение координаты Х каждой ошибки
  const errorLocations: number[]= [];
  for (let rowID: number = 0; rowID < 81; rowID = rowID + 9) {
    const numbersOfID: string[] = [];
    for (let elementID: number = 0; elementID < 9; elementID++) {
      if (inputValues[elementID + rowID] != "") {
        numbersOfID.push(inputValues[elementID + rowID].toString());
      }
      else {
        continue;
      }
    }
    if (makeUniq(numbersOfID).length < numbersOfID.length) {
      errorLocations.push(rowID);
    }
    else {
      continue;
    }
  }
  return errorLocations;
}

export function checkSudokuColumn(inputValues: string[]): number[]{ 
  const errorLocations: number[] = [];
  for (let columnNumber: number = 0; columnNumber < 9; columnNumber++) {
    let numbersOfID: string[] = [];
    let elementID: number = columnNumber;
    for (let numberOfElements: number = 0; numberOfElements < 9; numberOfElements++) { 
      if (inputValues[elementID] != "") {
        numbersOfID.push(inputValues[elementID]); 
      }
      elementID = elementID + 9
    }
    if (makeUniq(numbersOfID).length < numbersOfID.length) {
      errorLocations.push(columnNumber);
    }
    else {
      continue;
    }
  }
  return errorLocations;
}

//export function checkSudokuSquare(inputValues: string[]): string[] {
  //const errorLocations: string[] = [];
  //let squareElements: string[] = [];
  //let m: number = 0;
  //for (let i: number = 0; i < 81; i = i + 3) { //проходимся по всем строкам всех квадратов
    //for (let l: number = 0; l < 3; l = l++) {
      //for (let k: number = 0; k < 3; k++) {
        //squareElements.push(inputValues[i+k+m]);
        //errorLocations.push((i+k+m).toString());
      //}
      //m = m + 9;
    //}
    //m = 0;
  //}
  //return errorLocations;
//}

export function convOneDimArrToTwoDim(inputValues: string[]): string[][] {
  let newArrayOfInputValues: string[][] = [];

  for (let i: number = 0; i < 9; i++) {
    let subArray: string[] = [];
    for (let j: number = 0; j < 9; j++) {
      const index: number = i * 9 + j;
      const value: string = inputValues[index] === "" ? "" : inputValues[index];
      subArray.push(value);
    }
    newArrayOfInputValues.push(subArray);
  }
  console.log(newArrayOfInputValues);
  return newArrayOfInputValues;
}

export function checkSudokuSquaresInFirstColumn(newArrayOfInputValues: string[][]) {
  let elementsOfSquare: string[] = [];
  let elementsOfSquareWithoutEmptyValues: string[] = [];
  const errorLocations: string[] = [];

  for (let i: number = 0; i < 9; i ++) {
    for (let m: number = 0; m < 3; m++) {
      elementsOfSquare.push((i * 9 + m).toString()); 
      if (newArrayOfInputValues[i][m] != '') {
        elementsOfSquareWithoutEmptyValues.push(newArrayOfInputValues[i][m]);
      }
    }
    if (i == 2 || i == 5 || i == 8) {
      if (makeUniq(elementsOfSquareWithoutEmptyValues).length < elementsOfSquareWithoutEmptyValues.length) {
        console.log(elementsOfSquareWithoutEmptyValues);
        for (let z: number = 0; z < elementsOfSquare.length; z++) {
          errorLocations.push(elementsOfSquare[z]);
        }
        console.log("Ошибки в квадрате:");
        console.log(errorLocations);
      }
      elementsOfSquare = [];
      elementsOfSquareWithoutEmptyValues = [];
    }
  }
  return errorLocations.flat();
}

export function checkSudokuSquaresInSecondColumn(newArrayOfInputValues: string[][]) {
  let elementsOfSquare: string[] = [];
  let elementsOfSquareWithoutEmptyValues: string[] = [];
  const errorLocations: string[] = [];

  for (let i: number = 0; i < 9; i ++) {
    for (let m: number = 3; m < 6; m++) {
      elementsOfSquare.push((i * 9 + m).toString()); 
      if (newArrayOfInputValues[i][m] != '') {
        elementsOfSquareWithoutEmptyValues.push(newArrayOfInputValues[i][m]);
      }
    }
    if (i == 2 || i == 5 || i == 8) {
      if (makeUniq(elementsOfSquareWithoutEmptyValues).length < elementsOfSquareWithoutEmptyValues.length) {
        console.log(elementsOfSquareWithoutEmptyValues);
        for (let z: number = 0; z < elementsOfSquare.length; z++) {
          errorLocations.push(elementsOfSquare[z]);
        }
        console.log("Ошибки в квадрате:");
        console.log(errorLocations);
      }
      elementsOfSquare = [];
      elementsOfSquareWithoutEmptyValues = [];
    }
  }
  return errorLocations.flat();
}

export function checkSudokuSquaresInThirdColumn(newArrayOfInputValues: string[][]) {
  let elementsOfSquare: string[] = [];
  let elementsOfSquareWithoutEmptyValues: string[] = [];
  const errorLocations: string[] = [];

  for (let i: number = 0; i < 9; i ++) {
    for (let m: number = 6; m < 9; m++) {
      elementsOfSquare.push((i * 9 + m).toString()); 
      if (newArrayOfInputValues[i][m] != '') {
        elementsOfSquareWithoutEmptyValues.push(newArrayOfInputValues[i][m]);
      }
    }
    if (i == 2 || i == 5 || i == 8) {
      if (makeUniq(elementsOfSquareWithoutEmptyValues).length < elementsOfSquareWithoutEmptyValues.length) {
        console.log(elementsOfSquareWithoutEmptyValues);
        for (let z: number = 0; z < elementsOfSquare.length; z++) {
          errorLocations.push(elementsOfSquare[z]);
        }
        console.log("Ошибки в квадрате:");
        console.log(errorLocations);
      }
      elementsOfSquare = [];
      elementsOfSquareWithoutEmptyValues = [];
    }
  }
  return errorLocations.flat();
}




export let fullSudokuField: string[] = generateFullSudokuBoard(partiallyFilledField);
export let sudokuField: string[] = generatePartiallyFilledSudokuBoard(fullSudokuField, 46);


console.log(sudokuField);
