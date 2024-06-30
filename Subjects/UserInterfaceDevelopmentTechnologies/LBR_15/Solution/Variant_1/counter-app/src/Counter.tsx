import React from 'react';
import { Provider } from 'react-redux';
import store from './store';
import GenerateForms from './GenerateForms';

function Counter() {
  return (
    <Provider store={store}>
      <div>
        <div id="SudokuField">
          <GenerateForms/>
        </div>
      </div>
    </Provider>
  );
}

export default Counter;

