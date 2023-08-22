import './App.css';
import 'bootstrap/dist/css/bootstrap.css';
import Header from './components/Hander';
import GetMenus from './components/GetMenus';
import PostMenus from './components/PostMenus';

function App() {
  return (
    <div id="container">
      <Header/>
      <section id="content">
        <div id="menu-container" className='text-center'>
          <GetMenus/>
          <PostMenus/>
        </div>
      </section>

    </div>
  );
}

export default App;
