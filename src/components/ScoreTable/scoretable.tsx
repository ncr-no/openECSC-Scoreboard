import * as React from 'react';
import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { getUsers } from '../../api/users';
import DataBox from '../DataBox/databox';
import { Button, MenuItem, Select, SelectChangeEvent } from '@mui/material';
import { ReactNode } from 'react';
import { countriesList } from '../../countriesList';
import './scoretable.css';
import IconButton from '@mui/material/IconButton';
import TimerSharpIcon from '@mui/icons-material/TimerSharp';
import Menu from '@mui/material/Menu';
import MapChart from '../Map/map';
import { Grid } from '@mui/material'


const columns: GridColDef[] = [
  { field: 'rank', headerName: 'Rank', headerClassName: 'yellow-header', flex: 0.5, minWidth: 80, disableColumnMenu: true, sortable: false },
  { field: 'username', headerName: 'Nickname', headerClassName: 'yellow-header', width: 150, disableColumnMenu: true, sortable: false },
  { field: 'points', headerName: 'Score', headerClassName: 'yellow-header', flex: 0.3, minWidth: 50, disableColumnMenu: true, sortable: false },
];


const countryOptions = [
  ...countriesList.map(country => ({ value: country.label, label: country.label })),
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
    const highestScore = filteredData.reduce((max: number, user: { points: number; }) => Math.max(max, user.points), 0);
    setHighestScore(highestScore);
    const sortedData = filteredData.sort((a: { points: number; }, b: { points: number; }) => b.points - a.points);
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

  const handleFilterClick = async (intervalInMinutes?: number) => {
    let filteredData = await getUsers(ageRange, gender, country);
    console.log(filteredData);
    setTotalUsers(filteredData.length);
    filteredData = filteredData.filter((row: { type: string; }) => row.type !== 'admin');
    setRows(filteredData);

    const highestScore = filteredData.reduce((max: number, user: { points: number; }) => Math.max(max, user.points), 0);
    setHighestScore(highestScore);

    const sortedData = filteredData.sort((a: { points: number; }, b: { points: number; }) => b.points - a.points);

    const top3Users = sortedData.slice(0, 3);

    if (intervalInMinutes) {
      setInterval(() => {
        setTop3Users(top3Users);
        console.log('update');
      }, intervalInMinutes * 60 * 1000);
    } else {
      setTop3Users(top3Users);
    }

  };

  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);


  const handleResetClick = () => {
    setAgeRange('');
    setGender('');
    setCountry('');
    fetchData();
  };
  const handleMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };


  return (
    <div style={{ padding: '0 20px' }}>

        <DataBox totalUsers={totalUsers} highestScore={highestScore} top3Users={top3Users} />

        <Grid container spacing={2}  justifyContent="center" alignItems="center" sx={{ marginTop: '20px' }}>
        
          <Grid item xs={12} sm={6} md={4} lg={3} xl={1} >
            <Select
              labelId="age-range-label"
              id="age-range-select"
              value={ageRange}
              onChange={handleAgeRangeChange}
              displayEmpty
              sx={{ backgroundColor: '#fff' , width: '100%' }}
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
          </Grid>
          <Grid item xs={12} sm={6} md={4} lg={3} xl={1} >
            <Select
              labelId="gender-label"
              id="gender-select"
              value={gender}
              onChange={handleGenderChange}
              displayEmpty
              sx={{ backgroundColor: '#fff' , width: '100%' }}
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
          </Grid>
          <Grid item xs={12} sm={6} md={4} lg={3} xl={1}>
            <Select
              labelId="country-label"
              id="country-select"
              value={country}
              onChange={handleCountryChange}
              displayEmpty
              sx={{ backgroundColor: '#fff' , width: '100%' }}
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
          </Grid>
                


          <Grid  item xs={12} sm={6} md={4} lg={3} xl={1} >

              <Button variant="contained" sx={{ backgroundColor: '#FCBD2A', color: '#000000',  width: '100%', '&:hover': { backgroundColor: '#FFD54F', color: '#000000' } }} onClick={() => handleFilterClick()}>Filter</Button>
              </Grid>

              <Grid item xs={12} sm={6} md={4} lg={3} xl={1} >

              <Button variant="contained" color="secondary" sx={{  width: '100%'}} onClick={handleResetClick} >Reset</Button>
              </Grid>

              <Grid item xs={12} sm={6} md={4} lg={3} xl={1} >


              <IconButton
                size="large"
                aria-label="account of current user"
                aria-controls="menu-appbar"
                aria-haspopup="true"
                onClick={handleMenu}
                color="default"
                title="Timer for refreshing the page"
                sx={{ marginRight: '10px', color: 'white' }}
              >
                <TimerSharpIcon />
              </IconButton>
              <Menu
                id="menu-appbar"
                anchorEl={anchorEl}
                anchorOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                keepMounted
                transformOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                open={Boolean(anchorEl)}
                onClose={handleClose}
              >
                <MenuItem onClick={() => { handleFilterClick(2); handleClose(); }}>2 min</MenuItem>
                <MenuItem onClick={() => { handleFilterClick(15); handleClose(); }}>15 min</MenuItem>
                <MenuItem onClick={() => { handleFilterClick(30); handleClose(); }}>30 min</MenuItem>
              </Menu>
              

            </Grid>

        </Grid>
                <br />

      <Grid container spacing={0.5} justifyContent="center">
        <Grid item xs={12} sm={12} md={6} lg={6} xl={7} display={{ xs: "none", lg: "block" }}>
           <MapChart /> 
          <br />
        </Grid>
      </Grid>

      <Grid container spacing={2} justifyContent="center">

        <Grid item xs={12} sm={12} md={8} lg={6} xl={7}>
          <DataGrid
            rows={rows}
            columns={columns}
            pageSize={10}
            rowsPerPageOptions={[10]}
            disableColumnSelector={true}
            autoHeight={true}
            sx={{ backgroundColor: '#fff' }}


          />
        </Grid>


      </Grid>

      <Grid container spacing={2} justifyContent="center">
        <Grid item xs={12}>

        </Grid>
      </Grid>

    </div >

  );

}

