import React, { useState } from 'react';
import './App.css';
import Counter from './Counter';
import Name from './Name';

function App() {
  const [counter, setCounter] = useState(0);
  const [colorValue, setColor] = useState('aqua'); 

  function resetValue() {
    setCounter(0);
    setColor('aqua');
  }

  function increaseValue() {
    if (counter < 4) {
      setCounter(counter + 1);
    }
    if (counter == 3) {
      setColor('red');
    }
  }

  let m: string[] = ["Max", "Ann", "Bob", "Ivan", "Robert"];
  let j: string = m[counter];



  return(<Counter colorValue= {colorValue} counter = {counter} increaseValue = {increaseValue} resetValue = {resetValue} m = {j}/>);
}

export default App;