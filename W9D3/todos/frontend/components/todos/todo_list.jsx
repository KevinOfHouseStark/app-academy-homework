import React from 'react';
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }
  
  render() {
    const todoListTitles = this.props.todos.map((todo) => {
      return (
        <TodoListItem todo={todo} key={todo.id} receiveTodo={this.props.receiveTodo} />
      );
    });

    return(
      <div>
        <ul className="todo-list">
          {todoListTitles}
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>
    );
  }
}
// export default () => <h3>Todo List goes here!</h3>
export default TodoList;