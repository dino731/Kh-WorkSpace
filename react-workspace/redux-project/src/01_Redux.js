/* 
  Redux?
  state같은 경우 각 컴포넌트의 상태를 관리했다면, Redux는 전체적인 애플리케이션의 상태를 관리하는 
  패키지로 모든 컴포넌트에서 공유하는 앱 상태(state)를 다룰 수 있다.
  
  리덕스 구성요소 : 저장소(store), 액션(action), 리듀서(reducers), [미들웨어(middleware)]
  
  저장소 : 앱의 상태를 저장하는 저장소(저장소는 어려개 저장될 수 있음 = 폴더 단위로). state는 애플리케이션당 한개만 존재하며 
            configureStore()에 의해 생성되면서 리듀서와 결합함.
            useSelector(state) 훅을 통해 저장소의 상태(state)를 가져올 수 있다.
  액션   : 개발자가 만드는 객체로 , userDispatch훅을 통해 저장소르 action을 전달
  리듀서 : 현재 앱상태(oldstate)와 액션개체 2가지를 매개변수로 입력받는 함수로, 
           상태값 + 액션을 결합하여 새로운 상태(newState)를 저장소로 전달해준다.
  미들웨어 : 액션을 dispatch함수로 전달하고, 리듀서가 실행되기 전과, 실행된 후 처리되는 기능 (필수는 아닙니돠 mkm)
*/
import {configureStore} from '@reduxjs/toolkit';
import { Provider as ReduxProvider } from 'react-redux';
import Clock from './Clock';
import CallMiddleware from './CallMiddleware';

// 타이머 (시계앱)
const initialAppState = {today : new Date()};
/* 
   첫 번째 매개변수 Appstate의 초기 값은 initialAppstate로 셋팅
   두 번째 매개변수 action은 내부의 값중 속성명(type)이 반드시 있어야만하는 객체

   action에 type속성을 반드시 추가하는 이유는 리듀서 함수의 몸통에서 switch문으로 분기처리를 하기 위해서
*/
const rootReducer = (state = initialAppState, action)=>{
  switch(action.type){
    case 'setToday' :
      return {...state, today : action.today};
    case 'action_type2' :
      return {...state};
  }

  return state;
}

const store = configureStore({ reducer : rootReducer, middleware:[CallMiddleware] });

export default function ReduxApp(){
  return(
    <ReduxProvider store={store}>
      <Clock/>
    </ReduxProvider>
  )
}

