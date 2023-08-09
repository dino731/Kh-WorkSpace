import { useNavigate, useLocation, useSearchParams } from "react-router-dom";
/* 
    [1] useNavigate : 함수형 컴포넌트에서 페이지 이동을 쉽게 처리할 수 있도록 도와주는 함수.
                      Link와 비슷한 기능을 하지만, 이동하고자 하는 경로를 동적으로 조작할 수 있다.

    [2] useLocation : location객체를 다룰 수 있는 함수. 현재 페이지의 url정보를 가져올 때 사용

    [3] useSearchParam() : 쿼리스트링을 쉽게 조작하도록 도와주는 함수
 */

    function ReactRouter3(){
      const navigate = useNavigate();

      const location = useLocation();
      // const location = window.location; // 사용을 권장하지 않는 것
      // window.location과 같다. 리액트에서는 직접적인 location객체 사용을 권장하지는 않는다.

      const [parameters, setSearchParams] = useSearchParams();
      // parameters ? 쿼리스트링에 들어가 ㄴkey, value 형태의 데이터가 저장된 "객체"
      // setSearchParams ? 쿼리스트링을 업데이트 시켜주는 함수

      const paramvalue = parameters.get("name");

      const handleupdateParam = () => {
        setSearchParams({name : paramvalue+"1234"});
      }

      const handleNavigate = () => {
        navigate('/route1');
        // Route에 지정해둔 경로에 맞는 컴포넌트가 랜더링된다.
      }
      return(
        <div>
            <h3>현재 path :: {location.pathname}</h3>
            <h1>넘겨받은 쿼리 스트링 :: {location.search} </h1>
            {/* http://localhost:3000/route2?jk  이런식으로 뒷 주소가 표현됨*/}
            <button onClick={handleupdateParam}>파람값 변경하기</button><br/>
            <button onClick={handleNavigate}>route1으로 이동</button>
        </div>
      )
    }
    export default ReactRouter3;