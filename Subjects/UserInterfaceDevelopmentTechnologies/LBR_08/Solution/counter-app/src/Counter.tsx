import React from 'react';
import Button from './Button';

function Counter({colorValue, counter, increaseValue, resetValue}:counterProps) {
    return (
      <div className="container">
      <div className="rectangle">
        <div style = {{color: colorValue}} className="count">{counter}</div>
        <div className="button-container">
          <Button title="Increase" callbackFunction = {increaseValue} disabled = {counter == 5} />
          <Button title = "Reset" callbackFunction={resetValue} disabled = {counter == 0}/>
        </div>
      </div>
    </div>
    )
  }

  type counterProps = {
    colorValue: any,
    counter: any,
    increaseValue: any,
    resetValue:any
}

  export default Counter;