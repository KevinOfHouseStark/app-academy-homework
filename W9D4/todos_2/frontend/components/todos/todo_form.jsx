import React from 'react';
import uniqueId from '../../util/unique_id';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: "",
      body: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  updateTodo(property) {
   return (e) => {
     this.setState({[property]: e.target.value});
    }
  }
  
  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.createTodo(todo).then(() => this.setState({title: "", body: "" }));
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <label htmlFor="todo-title">Title:
          <input 
          id="todo-title" 
          onChange={this.updateTodo('title')}
          value={this.state.title}
          type="text"
          />
        </label>

        <label htmlFor="todo-body">Body:
          <input 
          id="todo-body"
          onChange={this.updateTodo('body')}
          value={this.state.body}
          type="text"
          />
        </label>
        
        <button>Create Todo!!!</button>
      </form>
    )
  }
}

export default TodoForm;