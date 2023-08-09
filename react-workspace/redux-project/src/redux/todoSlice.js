import { createSlice} from "@reduxjs/toolkit";
const todoSlice = createSlice({
  name : 'todoList',
  initialState : {
    todos : []
  },
  reducers : {
    addTodos : (state, action) =>{
      console.log(action); // addTodos에 두번째 매개변수로 
      // view에서 호출한 inputValue가 넘어옴 (payload의 값으로써)
      const newTodo = {
        todo : action.payload, //야다.. 야라고 야가 todoItem.todo 야다.
        id : state.todos.length
      }

      // state에 newTodo를 추가한 후 스토어에 값을 전달
      return {...state, todos : [...state.todos, newTodo]};
    },
    deleteTodos : (state, action) =>{
      // const index = action.payload;
      // state.todos.splice(index, 1);

      const updatedTodos = state.todos.filter( (todo) => todo.id !== action.payload);
      return {...state, todos : updatedTodos };

    }
  }
});

export const {addTodos, deleteTodos} = todoSlice.actions;
export default todoSlice.reducer; // 무조건 한개 밖에 못한다