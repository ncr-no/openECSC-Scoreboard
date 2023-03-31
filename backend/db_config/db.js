const { Sequelize } = require('sequelize');

const DB_NAME = process.env.DB_NAME || 'scoreboard'; 

const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: `./${DB_NAME}.sqlite`,
  logging: false
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Connected to database successfully.');
  })
  .catch(error => {
    console.error('Unable to connect to database:', error);
  });

module.exports = sequelize;