import React from 'react';
import App from './App';

function Name({arrayOfNames,}: NameFunc) {
    
 return <p>{arrayOfNames}</p>
}

type NameFunc = {
    arrayOfNames:string
};

export default Name;