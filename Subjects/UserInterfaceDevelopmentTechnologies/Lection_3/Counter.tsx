import Button from "../Button/Button";
import s from "./Counter.module.css";
import {useDispatch, useSelector} from "react-redux";
import {incrementCounerAC, resetCounterAC, StateCounterType } from "../../store/counterReducer";
import { AppRootStateType } from "../../store/store";

const Counter = () => {
    let incrementBtnTitle: string = 'inc';
    let resetBtnTitle: string = 'reset';

    let counter: StateCounterType = useSelector<AppRootStateType, StateCounterType>(
        (state) => state.counter)

    let counterValue: number = counter.value

    const dispatch = (): void => {
        dispatch(incrementCounterAC(++counterValue))
    }

    const reset = (): void => {
        dispatch(resetCounterAC())
    }

    let disabledIncrementBtn: boolean = (counterValue >= 5);
    let disabledResetBtn: boolean = (counterValue === 0);
    let valueClassName: string = disabledIncrementBtn ? s.maxValue : s.value;

    return (
        <div className={s.counter}>
            <div className={s.valueContainer}>
                <span className={valueClassName}>{counterValue}</span>
            </div>
            <div className={s.buttons}>
                <Button title={incrementBtnTitle} callBack={increment} disabled={disabledIncrementBtn}/>
                <Button title={resetBtnTitle} callBack={reset} disabled={disabledResetBtn}/>
            </div>
        </div>
    );
    
};

export default Counter;