const { Sequelize } = require('sequelize');

const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: './scoreboard.sqlite',
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