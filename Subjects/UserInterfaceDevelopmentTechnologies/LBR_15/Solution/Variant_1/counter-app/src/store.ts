import { createStore } from 'redux';

interface AppState {
  inputValues: string[];
  gameStarted: boolean;
}

const initialState: AppState = {
  inputValues: Array(81).fill(''),
  gameStarted: false,
};

type AppAction =
  | { type: 'SET_INPUT_VALUES'; payload: string[]; }
  | { type: 'SET_GAME_STARTED'; payload: boolean; };

function reducer(state = initialState, action: AppAction): AppState {
  switch (action.type) {
    case 'SET_INPUT_VALUES':
      return {
        ...state,
        inputValues: action.payload,
      };
    case 'SET_GAME_STARTED':
      return {
        ...state,
        gameStarted: action.payload,
      };
    default:
      return state;
  }
}

const store = createStore(reducer, initialState);

export default store;
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;