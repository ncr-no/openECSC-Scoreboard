const DataTypes = require('sequelize');
const sequelize = require('../db_config/db');

const Scoreboard = sequelize.define('scoreboard', {
  username: {
    type: DataTypes.STRING,
    allowNull: false
  },
  age: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  points: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  country: {
    type: DataTypes.STRING,
    allowNull: false
  },
  gender: {
    type: DataTypes.STRING,
    allowNull: false
  }
});

module.exports = Scoreboard;
