import { useDispatch, useSelector } from 'react-redux';
import {Button} from 'reactstrap';
import { incremant, decrement } from '../redux/counterSlice';


export default function Counter(){
  const count = useSelector( (state) => state.counter.value);
  const dispatch = useDispatch(); // dispatch  저장소에 액션을 전달 택배기사(mkm)
  return(
    <div>
      <div style={{display:"flex",justifyContent:"center"}}>
        <Button color="warning" onClick={ () => { dispatch(decrement()) }}>-</Button>
        <div style={{width:"100%"}}>{count}</div>
        <Button color="primary" onClick={ () => {dispatch(incremant()) }}>+</Button>
      </div>
    </div>
  )
}