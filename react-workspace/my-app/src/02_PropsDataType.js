import datatype from 'prop-types';
import { Component } from 'react';


/*  
  prop-types?
  일반적으로 자바스크립트의 유연한 특성은 개발을 하는데 있어 도움을 주지만,
  관리해야할 파일이 많아지면 생산성 및 유지 보수성이 떨어진다라는 단점이 있음.

  이런점 때문에 명확한 자료형으로 개발을 해야하는 타입스크립트가 각광받고 있는 추세인데
  반드시 자바스크립트로 개발을 해야만 하는 상황에서는 propTypes를 활용해서 해결할 수 있다.

  PropTypes는 부모로부터 전달받은 props의 데티어틔 type(자료형)을 검사해준다
  자식 컴포넌트에서 명시해 놓은 데이터타입과 부모로부터 넘겨받은 데이터 타입이 일치하지 않으면 콘솔에 경고를 띄워준다.
*/
class PropsDataType extends Component{
  render(){
      let {String, Number, Boolean, Array, Object, Function, StringDefault} = this.props;
      // 구조분해할당 -> 객체를 변수로 저장하는 ES6방식 문법
      console.log(this.props);
      return( // 값을 반드시 하나만 return 해야 에러가 발생하지 않는다.
        <div style={{padding:"0px"}}>
          <p>StringProps : {String}</p>
          <p>NumberProps : {Number}</p>
          <p>BooleanProps : {Boolean.toString()}</p>
          <p>ArrayProps : {Array.toString()}</p>
          <p>Object : {JSON.stringify(Object)}</p>
          <p>FunctionProps : {Function("react")}</p>
          <p>StringDefaultProps : {StringDefault}</p>
        </div> 
      )
  }
}
PropsDataType.Propstypes={
  // 대입되는 값의 자료형을 명확하게 일치시켜서 전달해줘야한다.
  String : datatype.string.isRequired,
  Number : datatype.number,
  Boolean : datatype.bool,
  Array : datatype.array,
  Object : datatype.object,
  // 객체 내부의 자료형을 선언할때는 shape유형을 사용
  Object : datatype.shape({
    react : datatype.string,
    today : datatype.number
  }),
  Function : datatype.func
}
PropsDataType.defaultProps ={
  StringDefault :  "기본값"
}
export default PropsDataType;