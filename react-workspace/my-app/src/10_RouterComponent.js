/* 
    라우터를 지원하는 패키지 다운로드
    1. npm install react-router-dom
    
    react-router-dom BrowserRouter, Routes, Link기능을 제공함
    Route는 호출되는 url에 따라 이동하고자하는 Component를 정의한다.
    Link는 <a>태그와 같이 페이지에 표시되는 링크를 클릭하면 url을 호출한다.
    Route를 사용하기 위해서는 BrowserRouter라는 태그로 감싸줘야한다

    라우팅? 웹 서버에서 명시된 자원을 찾는 과정이다.
    서블릿프레임워크에서는 클라이언트가 호출한 url에 해당하는 웹 페이지를 서버에서 제공해주었다.(Server Side Routing)

    리액트에서는 url이동이 서버에서 forwading해주거나, redirect해주는 것이 아니라 location객체, history객체를 
    이용해서 클라이언트 측에서 페이지이동이 이루어지는 것 처럼 보이게 한다. (Client Side Routing CSR)
*/
import { BrowserRouter, Route, Routes } from "react-router-dom";
import ReactRouter from "./router/ReactRouter1";
import NoMatch from "./router/NoMatch";
import ReactRouter2 from "./router/ReactRouter2";
import ReactRouter3 from "./router/ReactRouter3";

function RouterComponent(){

  return(
    <div>
         {/* Route를 사용하기 위해서는 BrowserRouter로 감싸줘야한다.(보통 최상위 컴포넌트에 추가한다.) */} 
        <BrowserRouter> 
          <Routes>
               {/* 
                  Path속성 : 호출되는 url경로
                  element  : url호출시 사용할 컴포넌트를 지정
               */}
              <Route path="/" element={<ReactRouter/>}/>
              <Route path="/route1" element={<ReactRouter2/>}/>
              <Route path="/route2" element={<ReactRouter3/>}/>
              <Route path="*" element={<NoMatch/>}/>
          </Routes>
         
        </BrowserRouter>
    </div>
  )
}
export default RouterComponent;