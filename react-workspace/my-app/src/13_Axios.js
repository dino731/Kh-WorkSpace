import axios from 'axios';
import { useEffect } from 'react';

function AxiosGet(){
  useEffect(()=>{
    axios.get("http://date.jsontest.com") // 비동기지만 동기적으로 먼저 자료를 불러오고
         .then( (response) =>{   // 이렇게 콜백 함수를 넣어준다.
            alert("Axios Get : "+response.data.date);
           });
        /* 
          get() : get방식으로 http호출. url호출이 완료되면 then()함수가 실행됨.
          then() : 호출결과로 response데이터가 반환되면, response와 변수명 사이에
          data를 붙이면 변수에 접근해서 사용할 수 있다.
        */
  },[]);

  return <h1>Axios Get Test</h1>
}

function AxiosPost(){
  useEffect( () =>{
    axios.post("http://date.jsontest.com/",{a:1, b:2}) // 
         .then( (response) => { // secsess : 어쩌구 랑 비슷하게 동작을 한다. (ajax방식) // Json 방식으로 전달이 된다.
          alert("Axios Post " + response.data.date);  // javascript 형식으로 디코딩을 해준다
         })
  },[])

  return <h1>Axios Post Test</h1>

}

export {AxiosGet, AxiosPost};
