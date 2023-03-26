import * as React from 'react';
import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { getUsers } from '../../api/users';
import DataBox from '../DataBox/databox';
import { Button, MenuItem, Select, SelectChangeEvent } from '@mui/material';
import { ReactNode } from 'react';

const columns: GridColDef[] = [
  { field: 'id', headerName: 'Rank', width: 100, disableColumnMenu: true, sortable: false },
  { field: 'username', headerName: 'Nickname', width: 150, disableColumnMenu: true, sortable: false },
  { field: 'country', headerName: 'Country', width: 150, sortable: false },
  { field: 'age', headerName: 'Age Range', width: 150, sortable: false },
  { field: 'gender', headerName: 'Gender', width: 150, sortable: false },
  { field: 'points', headerName: 'Score', width: 130, disableColumnMenu: false },
];


const countryOptions = [
  { value: 'USA', label: 'USA' },
  { value: 'tunisia', label: 'Tunisia' },
  { value: 'norway', label: 'Norway' },
];

const ageOptions = [
  { value: 'junior', label: 'Junior' },
  { value: 'young', label: 'Young' },
  { value: 'senior', label: 'Senior' },
];

const genderOptions = [
  { value: 'male', label: 'Male' },
  { value: 'female', label: 'Female' },
  { value: 'other', label: 'Other' },
];

export default function DataTable() {
  const [rows, setRows] = React.useState([]);
  const [totalUsers, setTotalUsers] = React.useState(0);
  const [highestScore, setHighestScore] = React.useState(0);
  const [top3Users, setTop3Users] = React.useState([]);
  const [ageRange, setAgeRange] = React.useState('');
  const [gender, setGender] = React.useState('');
  const [country, setCountry] = React.useState('');

  async function fetchData() {
    const data = await getUsers('', '', '');
    setTotalUsers(data.length);
    const filteredData = data.filter((row: { type: string; }) => row.type !== 'admin');
    setRows(filteredData);
    const highestScore = filteredData.reduce((max: number, user: { total_score: number; }) => Math.max(max, user.total_score), 0);
    setHighestScore(highestScore);
    const sortedData = filteredData.sort((a: { total_score: number; }, b: { total_score: number; }) => b.total_score - a.total_score);
    const top3Users = sortedData.slice(0, 3);
    setTop3Users(top3Users);
  }

  React.useEffect(() => {
    fetchData();
  }, []);

  const handleAgeRangeChange = (event: SelectChangeEvent<string>, child: ReactNode) => {
    setAgeRange(event.target.value as string);
  };
  const handleGenderChange = (event: SelectChangeEvent<string>, child: ReactNode) => {
    setGender(event.target.value as string);
  };
  const handleCountryChange = (event: SelectChangeEvent<string>, child: ReactNode) => {
    setCountry(event.target.value as string)
  };

  const handleFilterClick = async () => {

    let filteredData = await getUsers(ageRange, gender, country);
    console.log(filteredData);

    filteredData = filteredData.filter((row: { type: string; }) => row.type !== 'admin');
    setRows(filteredData);

    const highestScore = filteredData.reduce((max: number, user: { total_score: number; }) => Math.max(max, user.total_score), 0);
    setHighestScore(highestScore);

    const sortedData = filteredData.sort((a: { total_score: number; }, b: { total_score: number; }) => b.total_score - a.total_score);

    const top3Users = sortedData.slice(0, 3);

    setTop3Users(top3Users);
  };

  const handleResetClick = () => {
    setAgeRange('');
    setGender('');
    setCountry('');
    fetchData();
  };

  return (
    <div>
      <DataBox totalUsers={totalUsers} highestScore={highestScore} top3Users={top3Users} />
      <br />
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <div style={{ marginRight: '20px' }}>
            <Select
              labelId="age-range-label"
              id="age-range-select"
              value={ageRange}
              onChange={handleAgeRangeChange}
              displayEmpty
            >
              <MenuItem value="">
                <em>All Ages</em>
              </MenuItem>
              {ageOptions.map((option) => (
                <MenuItem key={option.value} value={option.value}>
                  {option.label}
                </MenuItem>
              ))}
            </Select>
          </div>
          <div style={{ marginRight: '20px' }}>
            <Select
              labelId="gender-label"
              id="gender-select"
              value={gender}
              onChange={handleGenderChange}
              displayEmpty
            >
              <MenuItem value="">
                <em>All Genders</em>
              </MenuItem>
              {genderOptions.map((option) => (
                <MenuItem key={option.value} value={option.value}>
                  {option.label}
                </MenuItem>
              ))}
            </Select>
          </div>
          <div>
            <Select
              labelId="country-label"
              id="country-select"
              value={country}
              onChange={handleCountryChange}
              displayEmpty
            >
              <MenuItem value="">
                <em>All Countries</em>
              </MenuItem>
              {countryOptions.map((option) => (
                <MenuItem key={option.value} value={option.value}>
                  {option.label}
                </MenuItem>
              ))}
            </Select>
          </div>
        </div>
        <div>
          <Button variant="contained" color="primary" onClick={handleFilterClick}>Filter</Button>
          <Button variant="contained" color="secondary" onClick={handleResetClick} style={{ marginLeft: '10px' }} >Reset</Button>
        </div>
      </div>
      <div style={{ height: 700, width: '100%', marginTop: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
        <DataGrid
          rows={rows}
          columns={columns}
          pageSize={20}
          rowsPerPageOptions={[20]}
          disableColumnSelector={true}
          autoHeight={true}
          style={{ justifyContent: 'center' }}

        />
      </div>
    </div>

  );
}

