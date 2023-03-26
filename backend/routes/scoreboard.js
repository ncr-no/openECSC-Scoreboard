const express = require('express');
const Scoreboard = require('../models/scoreboard');
const router = express.Router();
const { Op } = require('sequelize');


// Create multiple score entries
router.post('/', async (req, res) => {
  try {
    const scores = req.body;
    const createdScores = [];

    for (const score of scores) {
      const { username, age, points, country, gender } = score;
      const createdScore = await Scoreboard.create({ username, age, points, country, gender });
      createdScores.push(createdScore);
    }

    res.json(createdScores);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});


// Get all score entries or with filters
router.get('/', async (req, res) => {
  try {
    let filter = {};
    const ageRange = req.query.ageRange;
    const gender = req.query.gender;
    const country = req.query.country;

    if (ageRange) {
      switch (ageRange) {
        case 'junior':
          filter.age = { [Op.between]: [14, 20] };
          break;
        case 'young':
          filter.age = { [Op.between]: [21, 25] };
          break;
        case 'senior':
          filter.age = { [Op.gt]: 25 };
          break;
        default:
          break;
      }
    }

    if (gender) {
      filter.gender = gender;
    }

    if (country) {
      filter.country = country;
    }

    const scores = await Scoreboard.findAll({ where: filter });
    res.json(scores);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});

module.exports = router;
