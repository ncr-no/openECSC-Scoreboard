import * as React from 'react';
import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { getUsers } from '../../api/users';
import DataBox from '../DataBox/databox';

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 100,disableColumnMenu: true, sortable: false  },
  { field: 'username', headerName: 'Nickname', width: 150,disableColumnMenu: true , sortable: false},
  { field: 'country', headerName: 'Country', width: 150, sortable: false },
  { field: 'age', headerName: 'Age Range', width: 150, sortable: false },
  { field: 'gender', headerName: 'Gender', width: 150 , sortable: false},
  { field: 'points', headerName: 'Score', width: 130,disableColumnMenu: true, sortable: false},
];

export default function DataTable() {
  const [rows, setRows] = React.useState([]);
  const [totalUsers, setTotalUsers] = React.useState(0);
  const [highestScore, setHighestScore] = React.useState(0);
  const [top3Users, setTop3Users] = React.useState([]);
  const [value, setValue] = React.useState('all');

  React.useEffect(() => {
    async function fetchData() {
      const data = await getUsers();
      setTotalUsers(data.length);
      const filteredData = data.filter((row: { type: string; }) => row.type !== 'admin');
      setRows(filteredData);
      const highestScore = filteredData.reduce((max: number, user: { total_score: number; }) => Math.max(max, user.total_score), 0);
      setHighestScore(highestScore);
      const sortedData = filteredData.sort((a: { total_score: number; }, b: { total_score: number; }) => b.total_score - a.total_score);
      const top3Users = sortedData.slice(0,3);
      setTop3Users(top3Users);
    }
    fetchData();
  }, []);

  const handleChange = (event: React.SyntheticEvent, newValue: string) => {
    setValue(newValue);
  };

  const handleGenderChange = (event: React.SyntheticEvent, newValue: string) => {
    console.log(newValue);
    // Add code to filter the rows based on the gender
  };

  return (
    <div>
      <DataBox totalUsers={totalUsers} highestScore={highestScore} top3Users={top3Users} />
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