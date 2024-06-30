import { StateCounterType } from "./store/counterReducer";

export const loadState = () : null | any  => {
    try {
        const serializedState : string | null = localStorage.getItem('state');
        if (serializedState === null) {
            return null;
        }
        return JSON.parse(serializedState);
    }
    catch (err) {
        return null;
    }

};

export const savestate = (state: StateCounterType) : void => {
    try {
        const serializedState: string = JSON.stringify(state);
        localStorage.setItem('state', serializedState);

    }
    catch {
        // ignore write errors
    }
}