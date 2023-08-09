/* 
    Context?
    기존에 props를 이용하여 부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달할 수 있었다

    단, 해당 데이터를 자식컴포넌트가 아니라 후손 컴포넌트에서만 필요로 하는 데이터라면 자식 컴포넌트에서는 불필요하게 코드를 작성해줘야하는데,
    이때 Context를 사용하면 데이터 공급자와, 소비자를 정의하여 데이터가 필요한 컴포넌트만 사용할 수 있게 구현할 수 있다.

    컨텍스트를 사용하면 하위 컴포넌트가 여러개인 구조에서 유용하게 사용할 수 있다.
    먼 후손 컴포넌트도 소비자를 임포트해서 필요한 데이터를 쓸 수 있다.

    props VS Context
    props는 부모 컴포넌트에서 직계 자식 컴포넌트에게만 전달되는 데이터라면,
    Context는 모든 컴포넌트에 전반적으로 영향을 끼칠 수 있다. ( 안쓸 이유가 없겠죵?? MKM)
*/
import {useState, createContext} from 'react';
import Children from './ContextChildren1';

const MyContext = createContext();

function ContextApi(){

  const [name, setName] = useState('');

  const setStateFunc = (value)=> {
    setName(value);

  }

  const content = {
    name,
    setStateFunc
  }
  /* 
    자식에게 넘겨줄 데이터에 상태값(name)과 상태값을 변경해줄 수 있는 함수를 넘겨준다. (세번 말씀 드리는 거 같은데 되게되게되게 중요합니다~ MKM)
  */
  return(
    // 자식 태그(Children)를 Provider로 감싸고 전달한 데이터는, vlaue값으로 할당.
    <MyContext.Provider value={content}>
       <Children/>
    </MyContext.Provider>
   

  )

}
export {ContextApi, MyContext};

