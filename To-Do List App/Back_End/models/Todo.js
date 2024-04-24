const mongoose = require('mongoose');

// Define the schema for the Todo item
const todoSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        trim: true
    },
    completed: {
        type: Boolean,
        default: false
    },
    createdAt: {
        type: Date,
        default: Date.now
    },
    dueDate: {
        type: Date
    }
});

// Create a model using the schema
const Todo = mongoose.model('Todo', todoSchema);

// Export the model
module.exports = Todo;
