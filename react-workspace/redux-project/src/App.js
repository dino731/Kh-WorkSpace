import logo from './logo.svg';
import './App.css';
import Counter from './components/Counter';
import TodoList from './components/TodoList';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import {Navbar, NavbarBrand} from 'reactstrap';

function App() {
  return (
    <>
    <Router>
      <Navbar>
        <NavbarBrand href="/">Home</NavbarBrand>
        <NavbarBrand href="/todolist">TodoList</NavbarBrand>
        <NavbarBrand href="/counter">Counter</NavbarBrand>
      </Navbar>
      <div className='container'>
        <Routes>
          <Route path="/" element={<TodoList/>}/>
          <Route path="/todolist" element={<TodoList/>}/>
          <Route path="/counter" element={<Counter/>}/>
         </Routes>
      </div>
    </Router>

    </>
  );
}

export default App;
