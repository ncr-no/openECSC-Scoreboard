const express = require('express');
const sequelize = require('./db_config/db');
const scoreboardRoutes = require('./routes/scoreboard');
const cors = require('cors');
require('dotenv').config(); 
const app = express();


app.use(cors());
const PORT = process.env.PORT || 8080;


app.use(express.json());



app.use('/scoreboard', scoreboardRoutes); 
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
