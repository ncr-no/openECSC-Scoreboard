import axios from 'axios';

export async function getUsers() {
  try {
    const response = await axios.get('http://localhost:3010/users');
    return response.data;
  } catch (error) {
    console.error(error);
  }
}

const users = getUsers();
console.log(users);
