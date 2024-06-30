import React from 'react';

function SudokuButton({ title, event, idValue }: ButtonProps) {
    return <button onClick={event} id={idValue}>{title}</button>;
  }

type ButtonProps = {
  title: string;
  event: () => void;
  idValue: string;
};

export default SudokuButton;