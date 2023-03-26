const express = require('express');
const Scoreboard = require('../models/scoreboard');
const router = express.Router();


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


// Get all score entries
router.get('/', async (req, res) => {
  try {
    const scores = await Scoreboard.findAll();
    res.json(scores);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});

module.exports = router;
