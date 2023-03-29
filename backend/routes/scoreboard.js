const express = require('express');
const Scoreboard = require('../models/scoreboard');
const router = express.Router();
const { Op } = require('sequelize');
const authenticate = require('../auth');

function toSentenceCase(str) {
  return str.toLowerCase().replace(/(^\s*\w|[\.\?!]\s*\w)/g, function (c) {
    return c.toUpperCase();
  });
}

// Create multiple score entries
router.post('/', authenticate, async (req, res) => {
  try {
    const scores = req.body;
    const createdScores = [];

    for (const score of scores) {
      const { username, age, points, country, gender } = score;
      const existingScore = await Scoreboard.findOne({ where: { username: username } });

      let createdScore;
      if (existingScore) {
        // Update the existing record
        existingScore.age = age;
        existingScore.points = points;
        existingScore.country = country;
        existingScore.gender = gender;
        await existingScore.save();
        createdScore = existingScore;
      } else {
        // Create a new record
        createdScore = await Scoreboard.create({ username, age, points, country, gender });
      }

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

    if (gender && gender !== 'all') {
      filter.gender = toSentenceCase(gender);
    }

    if (country && country !== 'all') {
      filter.country = country;
    }

    const scores = await Scoreboard.findAll({ where: filter, order: [['points', 'DESC']], attributes: { exclude: ['id'] } });

    // Create a new array of scores with updated IDs
    const scoresWithNewIds = scores.map((score, index) => {
      return {
        id: index + 1,
        username: score.username,
        points: score.points
      }
    });
    res.json(scoresWithNewIds);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});

module.exports = router;
