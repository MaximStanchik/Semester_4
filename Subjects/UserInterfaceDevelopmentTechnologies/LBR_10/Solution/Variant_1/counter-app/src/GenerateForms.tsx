import React, { useEffect, useState } from 'react';
import SudokuButton from './SudokuButton';
import { sudokuField, checkEmptyCells, generateFullSudokuBoard, partiallyFilledField, checkSudokuRow, checkSudokuColumn, convOneDimArrToTwoDim, checkSudokuSquaresInFirstColumn, checkSudokuSquaresInSecondColumn, checkSudokuSquaresInThirdColumn } from './SetRandomValues'

const fullSudokuField: string[] = generateFullSudokuBoard(partiallyFilledField);

function GenerateForms() {
  let m: number = 0;
  let forms: JSX.Element[] = [];

  const [inputValues, setInputValues] = useState<string[]>(Array(81).fill(''));
  console.log(fullSudokuField)

  const setValuesOnBoard = () => {
    setInputValues(sudokuField);
  };

  function changeCell(emptyCellIndex: number, inputValues: string[], fullSudokuField: string[]): string[] {
    return inputValues.map((value, index) => {
      if (index === emptyCellIndex) {
        return fullSudokuField[emptyCellIndex];
      } else {
        return value;
      }
    });
  }

  useEffect(() => {
    const handleKeyDown = (event: any) => {
      if (event.key === 'j') {
        setValuesOnBoard();
      }
    };

    window.addEventListener('keydown', handleKeyDown);

    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, []);

  useEffect(() => {
    const handleKeyDown = (event: any) => {
      if (event.key === 'k') {
        const emptyCellIndex = checkEmptyCells(inputValues);
        if (emptyCellIndex != -1) {
          setInputValues(changeCell(emptyCellIndex, [...inputValues], fullSudokuField)); 
        }
      }
    };

    window.addEventListener('keydown', handleKeyDown);

    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [inputValues]);

  const checkTheValuesOnTheBoard = () => {

    const rowsErrors: number[] = checkSudokuRow(inputValues);
    const columnErrors: number[] = checkSudokuColumn(inputValues);
    const squaresErrorsInFirstColumn: string[] = checkSudokuSquaresInFirstColumn(convOneDimArrToTwoDim(inputValues));
    const squaresErrorsInSecondColumn: string[] = checkSudokuSquaresInSecondColumn(convOneDimArrToTwoDim(inputValues));
    const squaresErrorsInThirdColumn: string[] = checkSudokuSquaresInThirdColumn(convOneDimArrToTwoDim(inputValues));

    let element: HTMLElement | null;
    let errorLocations: string[] = [];

    if (rowsErrors.length === 0 && columnErrors.length === 0 && squaresErrorsInFirstColumn.length === 0) {
      for (let i: number = 0; i < 81; i++) {
        element = document.getElementById(i.toString());
        if (element != null  && element.style.backgroundColor != 'rgb(255, 10, 124)') {
          element.style.backgroundColor = 'yellow';
        }
        else {
          console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
        }
      }
    }
    else {
      for (let k = 0; k < rowsErrors.length; k++) {
        for (let l: number = 0; l < 9; l++) {
          element = document.getElementById((rowsErrors[k] + l).toString());
          errorLocations.push((rowsErrors[k] + l).toString());
          if (element != null) {
            element.style.backgroundColor = 'red';
          }
          else {
            console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
          }
        }
      }
      for (let l: number = 0; l < columnErrors.length; l++) {
        for (let p: number = 0; p < 9; p++) {
          const element = document.getElementById((columnErrors[l] + p * 9).toString());
          errorLocations.push((columnErrors[l] + p * 9).toString());
          if (element != null) {
            element.style.backgroundColor = 'red';
          } else {
            console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
          }
        }
      }
      for (let z: number = 0; z < squaresErrorsInFirstColumn.length; z++) {
        const element = document.getElementById(squaresErrorsInFirstColumn[z]);
        errorLocations.push(squaresErrorsInFirstColumn[z]);
        if (element != null) {
          element.style.backgroundColor = 'red';
        } else {
          console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
        }
      }
      for (let z: number = 0; z < squaresErrorsInSecondColumn.length; z++) {
        const element = document.getElementById(squaresErrorsInSecondColumn[z]);
        errorLocations.push(squaresErrorsInSecondColumn[z]);
        if (element != null) {
          element.style.backgroundColor = 'red';
        } else {
          console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
        }
      }
      for (let z: number = 0; z < squaresErrorsInThirdColumn.length; z++) {
        const element = document.getElementById(squaresErrorsInThirdColumn[z]);
        errorLocations.push(squaresErrorsInThirdColumn[z]);
        if (element != null) {
          element.style.backgroundColor = 'red';
        } else {
          console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
        }
      }
      for (let i: number = 0; i < 81; i++) {
        const elementId = i.toString();
        if (!errorLocations.includes(elementId)) {
          element = document.getElementById(elementId);
          if (element != null) {
            element.style.backgroundColor = 'yellow';
          } else {
            console.log("ОШИБКА. ЭЛЕМЕНТ С ЗНАЧЕНИЕМ 0");
          }
        }
      }
    }
  }

  useEffect(() => {
    checkTheValuesOnTheBoard();
  }, [inputValues]);

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>, i: number) => {
    const newInputValues = [...inputValues];
    newInputValues[i] = event.target.value;
    setInputValues(newInputValues);
  };
  for (let i: number = 0; i < 81; i++) {
    if (i < 27) {
      if (i % 3 === 0) {
        m++;
      }
      if (i % 9 === 0) {
        m = 1;
      }
    } else if (i >= 27 && i < 54) {
      if (i % 3 === 0) {
        m++;
      }
      if (i % 9 === 0) {
        m = 4;
      }
    } else if (i >= 54) {
      if (i % 3 === 0) {
        m++;
      }
      if (i % 9 === 0) {
        m = 7;
      }
    }

    let classValue: string = "Field_" + m;
    let idValue: string = i.toString();

    if (sudokuField[i] !== '') {
      forms.push(
        <form key={i}>
          <input className={classValue} id={idValue} type="text" value={inputValues[i]} onChange={(event) => handleInputChange(event, i)} readOnly={true} style={{ color: 'black' }} />
        </form>
      );
    }
    else {
      forms.push(
        <form key={i}>
          <input className={classValue} id={idValue} type="text" value={inputValues[i]} onChange={(event) => handleInputChange(event, i)} style={{ color: 'grey' }} />
        </form>
      );
    }
  }

  return (
    <>
      {forms}
      <SudokuButton title="New game" event={setValuesOnBoard} idValue="NewGameButton" />
      <SudokuButton title="Check" event={checkTheValuesOnTheBoard} idValue="CheckButton" />
    </>
  );
}

export default GenerateForms;


