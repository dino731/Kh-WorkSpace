import {useEffect} from 'react';
/* 
  Fetch?
  자바스크립트 내장 함수로, 비동기 통신을 구현할 때 사용 (ajax로 사용할 수 있지만 그러려면 뭐를 다 불러와야해서 번거롭다)
  * 비동기 통신 -> 먼저 시작한 작업의 완료 여부와 상관없이 다음 작업을 실행하는 것.

  fetch함수를 이용하여 get/post 방식으로 url호출하여 데이터를 가져온다.

 */

  function FetchGet(){
    useEffect(() => {
      const fetchData = async () =>{
        /* 
          Get방식 요청시 별도의 추가메소드는 사용하지 않고
          url뒤에 내가 전달하고자하는 값을 붙여서 전송한다.
        */
        const response = await fetch("http://date.jsontest.com?a=1");
        // console.log(response.json()); 
        // json? response중 body에 있는 부분을 JSON형식으로 디코딩한다. => Javascript 객체로 변환.  JSON 형태의 문자열 데이터가 자바스크립트의 데이터가 되는 것
        /*
          async ~ await 을 붙인 이유?
          fetch함수, json함수 같은 경우 비동기적으로 작동하기 때문에 url을 호출하고
          데이터를 가져오기 전에 response.json()메서드가 실행되면 에러가 발생할 수 있다.
          (json 합수는 JSON형태의 문자열 객체에서만 사용이 가능하다.)

          따라서 데이터를 전부 다 가져온 후에 아래 json함수가 호출되도록 흐름을 동기적으로 변환시켰다.
        */

        const body = await response.json(); // 디코딩된 자바스크립트 파일이 담긴게 아니기 때문에 언디파인드가 되는 것 await로 동기전 변환을 해줘야 해결 할 수 있다.
        alert(body.date);

      };
      fetchData();
    });

    return <h1>fetch get test</h1>

  }
  function FetchPost(){
    useEffect( () => {
      const fetchData = async () => {
        const response = await fetch("hppt://date.jsontest.com",
        {
          method : 'POST',
          headers : {
            'Content-Type' : 'application/json'
            // json형태의 데이터를 사용하기 위한 설정.
          },
          body : JSON.stringify ({
            a : "test1",
            b : "test2"
          })
        });
        const body = await response.json();
        alert(body.time);
      }

      fetchData();
    },[])

    return(
      <h1>Fetch Post Text</h1>
    )
  }
  export {FetchGet, FetchPost};