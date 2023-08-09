import {useState, useCallback} from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { addTodos, deleteTodos } from '../redux/todoSlice';
import { useRef } from 'react';

function TodoList(){
  // useState를 활용하여 todolist를 state에 저장
  const todos = useSelector((state)=> state.todoList.todos);
  const dispatch = useDispatch();
  const inputRef = useRef(null);

  // todolist 추가기능
  const handleAddTodo = useCallback(() => {
    const inputValue = inputRef.current.value;
    return dispatch(addTodos(inputValue));
    inputRef.current.value = "";
  },[]);

  // 완료한 투두리스트 삭제기능.
  // const handleDeleteTodo = (index) => {
  //   return dispatch(deleteTodos(index));
  // };
  const handleDeleteTodo = (item) =>{
    dispatch(deleteTodos(item));
  }

  const style = {
    listStyle : "none"
  }
  const enter = (e) =>{
    if(e.key == 'Enter'){
      handleAddTodo();
    }
  }

    return(
      <div>
          <h2>Todo List</h2>
          <input ref={inputRef} type="text"/>
          <button onClick={handleAddTodo}>추가</button>
          <ul>
              {
                  todos.map((item) => {                        
                      return (<li key={item.id}>
                              {item.todo}
                              <a onClick={() => handleDeleteTodo(item.id)}>✅</a>
                          </li>)
                  })
              }
          </ul>
      </div>
  )
  
}
export default TodoList;