/* 
  useSelector() ? 리덕스 저장소에 저장된 특정 상태를 얻어올 때 사용한다.

  useDispatch() ? 액션을 저장소로 운반하는 역할을 함
                  Reducer의 두 번째 매개변수로 action객체를 전달시켜줌
*/
import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
export default function Clock(){
  // 초기 값으로 셋팅해두었던 today상태값 얻어오기
  const today = useSelector( (state) => state.today);
                        //( ({today}) => today ); 둘다 가능하다
  const dispatch = useDispatch(); // dispatch 함수 얻어오기.
/* 
  interval 함수를 활용하여 dispatch 함수를 호출함
  새로운 시간을 설정하는 액션 객체를 리듀서에 두번째 매개변수로 전달
*/
  useEffect( () => { // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!흐름을 이해 못하는 중 흐름 파악하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    const id = setInterval(  // 원하는 시간마다 리턴하는 콜백함수를 저장하는 함수
      () => {
        dispatch( {type : "setToday", today : new Date() }); // type을 꼭 설정해줘야한다.dispatch?
      }
    )
    return () => clearInterval(id)
  },[])
  // useSelector훅을 사용하여 현재시간을 저장소에서 꺼낸후 화면에 출력하기
  return (
    <div  className="flex flex-col items-center justify-center mt-16">
      <h1 className="text-5xl">Clock</h1>
      <p className="mt-4 text-3xl">{today.toLocaleTimeString()}</p>
      <p className="mt-4 text-2xl">{today.toLocaleDateString()}</p>

    </div>
  )
}

