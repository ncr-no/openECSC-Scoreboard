import axios from 'axios';

export async function getUsers(ageRange: string, gender: string, country: string) {
  try {
    const secretKey = process.env.REACT_APP_SECRET_KEY; 
    const config = {
      headers: { Authorization: `Bearer ${secretKey}` }
    };
    let url = 'http://localhost:8080/scoreboard';
    if (ageRange || gender || country) {
      url += '?';
      if (ageRange) {
        url += `ageRange=${ageRange}&`;
      }
      if (gender) {
        url += `gender=${gender}&`;
      }
      if (country) {
        url += `country=${country}&`;
      }
      // Remove the trailing '&' character
      url = url.slice(0, -1);
    }
    const response = await axios.get(url, config);
    return response.data;
  } catch (error) {
    console.error(error);
  }
}

getUsers('young', 'female', 'Norway')
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error(error);
  });