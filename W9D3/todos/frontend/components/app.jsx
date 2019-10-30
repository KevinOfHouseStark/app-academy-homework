import React from 'react';
import TodoListContainer from "./todos/todo_list_container";

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="app">
        <h1>Todo List</h1>
        <TodoListContainer />
      </div>
    );
  }
}

export default App;