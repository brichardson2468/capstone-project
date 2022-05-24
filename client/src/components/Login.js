import { useState } from "react";
import { useNavigate } from 'react-router-dom'

function Login ({setCurrentUser, setIsAuthenticated}) {


    const navigate = useNavigate()
    const [formData, setFormData] = useState({
        username: '',
        password: ''
    })

    const handleChange = (e) => {
        setFormData({
          ...formData,
          [e.target.name]: e.target.value,
        });
      };
      const handleSubmit = (event) => {
        event.preventDefault();
        fetch("/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(formData),
        }).then((res) => {
          if (res.ok) {
            res.json().then((user) => {
              setCurrentUser(user);
              setIsAuthenticated(true)
              navigate('/profile')
            });
          } else {
            res.json().then((errors) => {
              console.error(errors);
            });
          }
        });
      };

    return(
        <div className="contain">
            <div className="login">
                <img id="login-img"src="https://www.homecareassistancewinnipeg.ca/wp-content/uploads/2019/02/Senior-Couple-in-the-Park.jpg" alt="Happy Couple"/>
                <form className="login_form" onSubmit={handleSubmit}>
                    <h2>Enter User login information or click signup to register a new doctor or patient:</h2>
                <div className="form-inputs"> 
                <h3>Welcome!</h3>   
                <p>Username:<input type="text" required placeholder="Username..." name="username" value={formData.username} onChange={handleChange}/></p>
                <p>Password:<input type="password" required placeholder="Password..." value={formData.password} name="password" onChange={handleChange}/></p>
                <button type="submit">Submit</button>
                <a href="/signup" id="signup_link">Need an Account? Click here to signup.</a>
                </div>
                </form>
            </div>
        </div>
    )
}

export default Login;