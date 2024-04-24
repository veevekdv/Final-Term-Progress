const express = require('express');
const mongoose = require('mongoose');
const app = express();
const todoRoutes = require('./routes/todoRoutes');

mongoose.connect('your-mongodb-connection-string', { useNewUrlParser: true });

app.use(express.json()); // Middleware to parse JSON

app.use('/todos', todoRoutes);

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
