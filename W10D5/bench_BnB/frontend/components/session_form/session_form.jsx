import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
    this.setState({
      username: "",
      password: ""
    });
  }

  update(property) {
    return event => this.setState({
      [property]: event.currentTarget.value
    });
  }

  render() {
    const loginContainer = ( 
    <div className="login-form-div">
      <form className="login-form" onSubmit={this.handleSubmit}>
        Welcome to BenchBnB!
        Please login or&nbsp;
        <Link to="/signup">sign up instead</Link>

        <div className="login-input">
          <label>Username:
            <input type="text"
              className="username-input"
              value={this.state.username}
              onChange={this.update('username')} />
          </label>
          <br></br>
          <label>Password:
            <input type="password"
              className="password-input"
              value={this.state.password}
              onChange={this.update('password')} />
          </label>
          <br></br>
          <input type="submit" className="login-submit" value={this.props.formType} />
        </div>
      </form>
    </div> );

    const signupContainer = (
    <div className="signup-form-div">
      <form className="signup-form" onSubmit={this.handleSubmit}>
        Welcome to BenchBnB!
        Please signup or&nbsp;
        <Link to="/login">login instead</Link>

        <div className="signup-input">
          <label>Username:
            <input type="text"
              className="username-input"
              value={this.state.username}
              onChange={this.update('username')} />
          </label>
          <br></br>
          <label>Password:
            <input type="password"
              className="password-input"
              value={this.state.password}
              onChange={this.update('password')} />
          </label>
          <br></br>
          <input type="submit" className="signup-submit" value={this.props.formType} />
        </div>
      </form>
    </div>);

    if (this.props.formType === 'login') {
      return loginContainer;
    } else if (this.props.formType === 'signup') {
      return signupContainer;
    }
  }
}

export default SessionForm;