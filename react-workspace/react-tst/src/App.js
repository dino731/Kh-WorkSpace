import './App.css';
import { BrowserRouter as Router, Link, Route , Routes  } from 'react-router-dom';
import { useState } from 'react';

function App() {
  const [messages, setMessages] = useState([
    { id : 1, writer : 'Writer1', message : 'Message1', writer_date : '2022-01-01'},
    { id : 2, writer : 'Writer2', message : 'Message2', writer_date : '2022-02-01'},
    { id : 3, writer : 'Writer3', message : 'Message3', writer_date : '2022-03-01'},
  ]);
  const [newMessage, setNewMessage] = useState({
    id : '',
    writer : '',
    message : '',
    writer_date : ''
  });

  const HandleAddMessage = () =>{
    if(!(newMessage.id.length>0) || !(newMessage.writer.length>0) || !(newMessage.message.length>0) || !(newMessage.writer_date.length>0) ){  //  
      console.log(newMessage.newMessage.writer_date);
      alert("입력이 되지 않았습니다. 다시 입력해주세요");
      return;
    }
    const isd = messages.some((message)=>String(message.id) === newMessage.id)
    if(isd){
      alert("ID가 중복되었습니다.")
      return;
    }
    setMessages([...messages,newMessage]);
    setNewMessage({ id : '', writer : '', message: '', writer_date : ''});
  }
  
  const HandelInputChange = (event)=>{
    const {name, value} = event.target;
    setNewMessage({...newMessage, [name] : value});
  }
  
  const HandleDeleteMessages = (id)=>{
    const updateMessage = messages.filter((message)=> message.id !== id);
    setMessages(updateMessage);
  }

 
  return (
    <Router>
      <div className='container'>
        <nav>
          <ul>
            <li>
              <Link to="/">List</Link>
            </li>
            <li>
              <Link to="/CreateMassage">Add New Message</Link>
            </li>
          </ul>
        </nav>
        <Routes>
          <Route path="/" element={<Home  messages={messages} onDeleteMessages={HandleDeleteMessages}/>}/>
          <Route path="/CreateMassage" element={<CreateMassage newMessage={newMessage} onAddMessage={HandleAddMessage} onInputChange={HandelInputChange} />}/>
        </Routes>
      </div>
    </Router>
   
  );
}
  const Home = (props) =>{

    const{messages, onDeleteMessages} = props;
  
    return(
      <div>
        <h1>Messages</h1>
        <from>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Writer</th>
                <th>Messages</th>
                <th>Write Date</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {
                messages.map((message)=>
                <tr key="message.id">
                  <td>{message.id}</td>
                  <td>{message.writer}</td>
                  <td>{message.message}</td>
                  <td>{message.writer_date}</td>
                  <td>
                    <button onClick={()=> onDeleteMessages(message.id)}>Delete</button>
                  </td>
                  </tr>
                )
              }
          
            </tbody>
          </table>
        </from>
      </div>
    )
  }
  const CreateMassage = (props) =>{
    const {newMessage, onAddMessage ,onInputChange } = props;

    return(
      <div>
        <h1>Create Movie</h1>
        <form>
            <input id="id"
              type="number"
              name="id"
              value={newMessage.id}
              onChange={onInputChange}
              placeholder="input message id"
            />
            <br/>
            <input 
              type="text"
              name="writer"
              value={newMessage.writer}
              onChange={onInputChange}
              placeholder="input message writer "
            />
            <br/>
            <input 
                type="test"
                name="message"
                value={newMessage.message}
                onChange={onInputChange}
                placeholder="input message content"
              />
            <br/>
            <label>작성일 : </label>
            <input 
                type="date"
                name="writer_date"
                value={newMessage.writer_date}
                onChange={onInputChange}
              />
            <br/>
        </form>
        <button onClick={onAddMessage}>Add Message</button>
  
  
      </div>
  
      
  
      )
  }

export default App;
