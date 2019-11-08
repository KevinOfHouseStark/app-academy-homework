import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {
  if (props.currentUser) {
    return (
      <div className="header-greeting">
        <h2 className="welcome-message">Hi, {props.currentUser.username} </h2>
        <button className="logout-button" onClick={props.logout}>Logout</button>
      </div>
    );
  } else {
    return (
      <nav className="login-signup">
        <Link to="/login">Login</Link>
        &nbsp;or&nbsp;
        <Link to="/signup">Signup</Link>
      </nav>
    );
  }
}

export default Greeting;