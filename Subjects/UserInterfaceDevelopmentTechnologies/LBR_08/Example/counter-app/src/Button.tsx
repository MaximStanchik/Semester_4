import React from 'react';

function Button({title, callbackFunction,  disabled}: buttonProps) { 
    return <button onClick = {callbackFunction} disabled = {disabled}>{title}</button> 
}; 

type buttonProps = {
    title: string,
    callbackFunction: () => number,
    disabled: boolean
}

export default Button;