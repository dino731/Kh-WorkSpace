/* 
    Ref ? reference의 약자. 참조변수
    자바스크립트에서 html요소를 선택할 때
    document.getElementById('아이디값')와 같은 선택 함수와 같이 요소를 가져온 후 조작하였다.

    React에서는 위 방식에 더해서 Ref를 통해 html요소를 조작할 수 있도록 지원한다.
 */
import {useRef} from 'react';

function ReactRef(){

  const inputRef = useRef(null); // Ref변수 생성

  const refFocus = () => {

    console.log(inputRef, inputRef.current); // 여러개 참조 가능한데 현재 참조를 보려면 current를 넣어줘야한다.
    // 현재 참조하고 있는 요소에 대한 정보가 current에 할당되어 있다.
    inputRef.current.focus();

  }

  // 자바스크립트 방식 요소 선택
  const javascriptFocus = () =>{
    document.getElementById("id1").focus();

  }

  return(
    <>
      {/* 
          input 요소에 ref속성을 추가하고 inputRef 변수에 할당 시,
          현재 input요소에 대한 정보를 inputRef를 통해 참조할 수 있다.
      */} 
      <input id="id1" type='text' ref={inputRef}/>
      <input type="button" value="REF" onClick={refFocus}/>
      <input type="button" value="Javascript Focus" onClick={javascriptFocus}/>
    </>
  )

}
export default ReactRef;