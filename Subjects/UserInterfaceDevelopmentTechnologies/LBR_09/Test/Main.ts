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

function checkSudokuRow(inputValues: string[]): Map<number, string[]> { //нахождение строки в котором ошибки, нахождение координаты Х каждой ошибки
  let numbersOfID: string[] = [];
  const errorLocations = new Map<number, string[]>();
  
  for (let rowID: number = 0; rowID < 81; rowID = rowID + 9) {
    for (let elementID: number = 0; elementID < 9; elementID++) {
      numbersOfID.push(inputValues[elementID + rowID].toString());
    }
    const duplicates: string[] = numbersOfID.filter((elementOfArray, dupIndex, dupNumbers) => {
      return dupNumbers.indexOf(elementOfArray) !== dupIndex;
    })
    if (duplicates.length != 0) {
      errorLocations.set(rowID, duplicates);
      console.log(errorLocations.set(rowID, duplicates));
    }
    else {
      continue;
    }
  }
  return errorLocations;
}

function checkSudokuSquare(inputValues: string[]) { //функция просматривает все значения в квадрате. Если есть хотя бы один дубликат, функция возвращает ID всех элементов квадрата (чтобы потом красным их закрасить)
  let numbersOfID: string[] = [];
  let k: number = 0;
  const errorLocations: string[] = [];
  for (let rowID: number = 0; rowID < 81; rowID = rowID + 9) { //сделано пока только для самого первого квадрата
      for (let i: number = 0; i < 3; i++) {
        numbersOfID.push(inputValues[i + rowID].toString());
        k++;
      }
    if (k == 9) {
      const duplicates: string[] = numbersOfID.filter((elementOfArray, dupIndex, dupNumbers) => { //пересмотреть и проверить
        return dupNumbers.indexOf(elementOfArray) !== dupIndex;
      })
      if (duplicates.length != 0) {
        for (let p= 0; p < duplicates.length; p++) {
          errorLocations.push(duplicates[p]);
        }
      }
    }
    
  }
 

}



let fullSudokuField: string[] = generateFullSudokuBoard(partiallyFilledField);
let sudokuField: string[] = generatePartiallyFilledSudokuBoard(fullSudokuField, 46);

console.log(sudokuField);
