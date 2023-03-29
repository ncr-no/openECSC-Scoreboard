import axios from 'axios';

export async function getUsers(ageRange: string | undefined, gender: string | undefined, country: string | undefined) {
  try {
    let url = process.env.API_URL || 'https://open.ecsc.no/api/scoreboard/'; 

    let filters = {};
    if (ageRange) {
      switch (ageRange) {
        case 'junior':
          filters = { ...filters, ageRange: 'junior' };
          break;
        case 'young':
          filters = { ...filters, ageRange: 'young' };
          break;
        case 'senior':
          filters = { ...filters, ageRange: 'senior' };
          break;
        default:
          break;
      }
    }

    if (gender) {
      filters = { ...filters, gender };
    }

    if (country) {
      filters = { ...filters, country };
    }

    if (Object.keys(filters).length > 0) {
      const params = new URLSearchParams(filters);
      url = `${url}?${params.toString()}`;
    }

    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    console.error(error);
  }
}
