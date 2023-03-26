const express = require('express');
const sequelize = require('./Db_config/db');
const scoreboardRoutes = require('./routes/scoreboard');
const cors = require('cors');
require('dotenv').config(); 
const app = express();


app.use(cors({
  origin: 'http://localhost:3000',
  allowedHeaders: ['Content-Type', 'Authorization']

}));
const PORT = process.env.PORT || 8080;
const SECRET_KEY = process.env.SECRET_KEY; 

app.use(express.json());

// middleware to check for the secret key in the request headers
const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || authHeader.split(' ')[1] !== SECRET_KEY) {
    return res.status(401).send('Unauthorized');
  }
  res.header('Authorization', `Bearer ${SECRET_KEY}`);
  next();
};

app.use('/scoreboard', authenticate, scoreboardRoutes); 
app.use(authenticate);
app.use(express.json());

sequelize
  .authenticate()
  .then(() => {
    console.log('Connected to database successfully.');
    return sequelize.sync();
  })
  .then(() => {
    console.log('Table created successfully.');
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  })
  .catch(error => {
    console.error('Unable to connect to database:', error);
  });
