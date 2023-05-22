import axios from 'axios';


export const getInfo = () => {
  let url = process.env.API_URL || 'https://open.ecsc.no/api/v1/scoreboard/info/';

  return axios.get(url)
    .then(response => {
      return response.data;
    })
    .catch(error => {
      console.error(error);
      return null;
    });
};
