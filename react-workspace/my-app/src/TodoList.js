import {useState, useCallback} from 'react';

function TodoList(){
  // useState를 활용하여 todolist를 state에 저장
  const [todos, setTodos] = useState([]);

  // todolist 추가기능
  const handleAddTodo = useCallback(() => {
    const newtodos = document.getElementById("intodo").value;
    setTodos([...todos,newtodos]);

  },[todos]);

  // 완료한 투두리스트 삭제기능.
  const handleDeleteTodo = (index) => {
    const todolist = [...todos];
    todolist.splice(index,1);
    setTodos(todolist);
   
  };

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
        <input type="text" id="intodo" onKeyDown={enter}/>
        <button onClick={handleAddTodo}>추가</button>
        <ul>
        {todos.map((todo, index) => (
          <li style={style} key={index}>{todo}<a onClick={() => handleDeleteTodo(index)}>✅</a></li>
        ))}
        </ul>
    </div>
  )
  
}
export default TodoList;