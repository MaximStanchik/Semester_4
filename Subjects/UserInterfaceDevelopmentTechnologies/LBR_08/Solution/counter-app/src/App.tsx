import React, { useState } from 'react';
import './App.css';
import Counter from './Counter';

function App() {
  const [counter, setCounter] = useState(0);
  const [colorValue, setColor] = useState('aqua'); 

  function resetValue() {
    setCounter(0);
    setColor('aqua');
  }

  function increaseValue() {
    if (counter < 5) {
      setCounter(counter + 1);
    }
    if (counter == 4) {
      setColor('red');
    }
  }

  return(<Counter colorValue= {colorValue} counter = {counter} increaseValue = {increaseValue} resetValue = {resetValue}/>);
}

export default App;