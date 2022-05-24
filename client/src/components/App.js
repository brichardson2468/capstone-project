import '../App.css';
import {BrowserRouter, Routes, Route,} from "react-router-dom";
import Login from './Login';
import Doctor from './Doctor'
import Patient from './Patient'
import SignUp from './SignUp';
import { useState, useEffect } from 'react';

function App() {

  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [currentUser, setCurrentUser] = useState(null);
  
  

  //   useEffect(() => {
  //   fetch('/me')
  //   .then((res) => {
  //     if (res.ok) {
  //       res.json()
  //       .then((user) => {
  //         setIsAuthenticated(false);
  //         setCurrentUser(user);
  //         console.log("patient authenticated")
  //       });
  //     }
  //   });
  // }, []);

  useEffect(() => {
    fetch('/auth')
    .then((res) => {
      if (res.ok) {
        res.json()
        .then((user) => {
          setIsAuthenticated(false);
          setCurrentUser(user);
          console.log("doctor authenticated")
        });
      }
    });
  }, []);

  if (!isAuthenticated) return <Login error={'please login'} setIsAuthenticated={setIsAuthenticated} setCurrentUser={setCurrentUser} />;
  
  return (
    <div className="App">
      <BrowserRouter>
      <Routes>
        <Route path="/" index element={<Login setCurrentUser={setCurrentUser}  setIsAuthenticated={setIsAuthenticated}/>}></Route>
        <Route path="/signup" element={<SignUp setCurrentUser={setCurrentUser} setIsAuthenticated={setIsAuthenticated}/>}></Route>
        <Route path="/login" element={<Login />}></Route>
       { currentUser.role === "doctor" ?
        <Route path="/profile" element={<Doctor currentUser={currentUser} />}></Route>
        :
        <Route path="/profile" element={<Patient currentUser={currentUser} />}></Route>}
      </Routes>
    </BrowserRouter>
    </div>
  );
}

export default App;