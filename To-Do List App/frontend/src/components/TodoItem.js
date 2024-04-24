// src/components/TodoItem.js
import React from 'react';

function TodoItem({ todo, toggleComplete, deleteTodo }) {
  return (
    <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '10px' }}>
      <span style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}>
        {todo.title}
      </span>
      <div>
        <button onClick={() => toggleComplete(todo.id)}>Complete</button>
        <button onClick={() => deleteTodo(todo.id)}>Delete</button>
      </div>
    </div>
  );
}

export default TodoItem;
