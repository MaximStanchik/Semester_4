import {combineReducers, legacy_createStore} from 'redux'
import {} from "./counterReducer";
import {savestate} from "../localStorage";

const rootReducer :Reducer<CombinedState<{counter... = combineReducers ({
    counter: counterReducer,
})

export const store: Store<EmptyObject & {counter:... = legacy_createStore(rootReducer)
export type AppRootStateType = ReturnType<typeof rootReducer>

store.subscribe((): void => {
    saveState(store.getState().counter);
})