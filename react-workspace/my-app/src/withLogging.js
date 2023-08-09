const withLogging = (WrappedComponent, logging) =>{
  return function withLoggingComponent(props){
    console.log("마운트된 컴포넌트? ",logging);

    // 매개변수로 전달받은 컴포넌트를 최종적으로 return
    return <WrappedComponent{...props}/>
  }
}

export default withLogging;