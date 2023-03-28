require('dotenv').config(); 
const SECRET_KEY = process.env.SECRET_KEY;

const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || authHeader.split(' ')[1] !== SECRET_KEY) {
    return res.status(401).send('Authentication failed. Invalid secret key.');
  }
  res.header('Authorization', `Bearer ${SECRET_KEY}`);
  next();
};

module.exports = authenticate;