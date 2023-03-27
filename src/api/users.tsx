import axios from 'axios';

export async function getUsers(ageRange: string | undefined, gender: string | undefined, country: string | undefined) {
  try {
    const secretKey = process.env.SECRET_KEY || "73dfa922d5cedf521a5e7d4baec59d3ee82aa45277f32a7c7da852e8bccadb5b"; 
    let url = process.env.API_URL || 'http://localhost:8080/scoreboard'; 
    const config = {
      headers: { Authorization: `Bearer ${secretKey}` }
    };
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

    const response = await axios.get(url, config);
    return response.data;
  } catch (error) {
    console.error(error);
  }
}
