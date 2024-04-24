const express = require('express');
const router = express.Router();
const Todo = require('../models/Todo');

// Get all todos
router.get('/', async (req, res) => {
    try {
        const todos = await Todo.find();
        res.json(todos);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// Create a new todo
router.post('/', async (req, res) => {
    const todo = new Todo({
        title: req.body.title,
        description: req.body.description,
        dueDate: req.body.dueDate
    });

    try {
        const newTodo = await todo.save();
        res.status(201).json(newTodo);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

// Get a single todo by ID
router.get('/:id', getTodo, (req, res) => {
  res.json(res.todo);
});

// Update a todo by ID
router.put('/:id', getTodo, async (req, res) => {
  if (req.body.title != null) {
      res.todo.title = req.body.title;
  }
  if (req.body.description != null) {
      res.todo.description = req.body.description;
  }
  if (req.body.completed != null) {
      res.todo.completed = req.body.completed;
  }
  try {
      const updatedTodo = await res.todo.save();
      res.json(updatedTodo);
  } catch (err) {
      res.status(400).json({ message: err.message });
  }
});

// Delete a todo
router.delete('/:id', getTodo, async (req, res) => {
  try {
      await res.todo.remove();
      res.json({ message: 'Deleted Todo' });
  } catch (err) {
      res.status(500).json({ message: err.message });
  }
});