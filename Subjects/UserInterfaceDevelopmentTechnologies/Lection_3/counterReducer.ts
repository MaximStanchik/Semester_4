import {loadState} from "../localStorage"

const INCREMENT : "INCREMENT" = 'INCREMENT'
const RESET : "RESET" = 'RESET'

export type StateCounterType = {
    value:number,
}

type ActionType = 
    ReturnType<typeof incrementCounterAC>
    | ReturnType<typeof resetCounterAC>

export const incrementCounterAC = (value: number) => ({type: INCREMENT, value} as const)
export const resetCounterAC = () => ({type: RESET} as const)