const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/authRoutes');

const app = express();

mongoose.connect('your-mongodb-connection-string', { useNewUrlParser: true, useUnifiedTopology: true });

app.use(express.json()); // Middleware to parse JSON

app.use('/auth', authRoutes);

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
