import axios from 'axios';

export async function getUsers() {
  try {
    const secretKey = process.env.REACT_APP_SECRET_KEY; 
    const config = {
      headers: { Authorization: `Bearer ${secretKey}` }
    };
    const response = await axios.get('http://localhost:8080/scoreboard', config);
    return response.data;
  } catch (error) {
    console.error(error);
  }
}

const users = getUsers();
console.log(users);