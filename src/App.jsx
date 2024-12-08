import chillGuyImage from './assets/chill-guy.png';
import './App.css';

function App() {
  return (
    <div className="container">
      <h1 className="heading">Chill Guy</h1>
      <img src={chillGuyImage} alt="Chill Guy" className="image" />
      <p>By Phillip "philb" Banks</p>
    </div>
  );
}

export default App
