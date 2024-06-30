import { connect} from 'react-redux';
import { addTodo, TodoActionTypes } from '../actions/index';
import { Dispatch } from 'redux';

interface AddTodoOnwProps {
  dispatch: Dispatch<TodoActionTypes>;
}

const AddTodo: React.FC<AddTodoOnwProps> = ({dispatch}) => {
  
  let input: HTMLInputElement

  return (
    <div>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          
          if (!input.value.trim()) {
            return;
          }
          dispatch(addTodo(input.value)); // input-value -- это текст, который вписывает пользователь
          input.value = ''; 
        }}
      >
        <input ref={(node: HTMLInputElement) => (input = node)} />
        <button type="submit">Add Todo</button> 
      </form>
    </div>
  );
};

export default connect()(AddTodo);

//в четверг в районе 12:00 будет доп. задача: переложить схемну на лабу 14, в документации будет упрщенная схема (пересдачи после сессии)
//надо будет посмотреть расписание допа (в 14-ой нужно объяснить схему по кругу (в документации), ее надо почитать и разобрать. у нас есть входная точка, и потом все остальное)
//редьюсер (14, 15) + action, dispatch, глобальное (можно прийти завтра, по одной лабе могу сдать, а то и две, примерно в 11.00 в 102-1), генератор action-ов + куда передается addToto в какой редьюсер

