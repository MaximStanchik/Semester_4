import React from 'react';
import Button from './Button';
import Name from './Name';

function Counter({colorValue, counter, increaseValue, resetValue, m}:counterProps) {
    return (
      <div className="container">
      <div className="rectangle">
        <div style = {{color: colorValue}} className="count">{counter}</div>
        <div className="button-container">
          <Button title="Increase" callbackFunction = {increaseValue} disabled = {counter == 5} />
          <Button title = "Reset" callbackFunction={resetValue} disabled = {counter == 0}/>
          <Name arrayOfNames = {m}/>
        </div>
      </div>
    </div>
    )
  }

  type counterProps = {
    colorValue: any,
    counter: any,
    increaseValue: any,
    resetValue:any,
    m: string
}

  export default Counter;