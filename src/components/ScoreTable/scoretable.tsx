import * as React from 'react';
import { DataGrid, GridColDef, GridValueGetterParams } from '@mui/x-data-grid';
import { getUsers } from '../../api/users';
import DataBox from '../DataBox/databox';

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 100 },
  { field: 'name', headerName: 'Name', width: 200 },
  { field: 'total_score', headerName: 'Score', width: 130 },];

export default function DataTable() {
  const [rows, setRows] = React.useState([]);
  const [totalUsers, setTotalUsers] = React.useState(0);
  const [highestScore, setHighestScore] = React.useState(0);
  const [top3Users, setTop3Users] = React.useState([]);

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
  return (
    <div>
    <DataBox totalUsers={totalUsers} highestScore={highestScore} top3Users={top3Users} />
    <div style={{ height: 700, width: '100%', marginTop: '20px' }}>
      <DataGrid
        rows={rows}
        columns={columns}
        pageSize={20}
        rowsPerPageOptions={[20]}
        checkboxSelection
      />
</div>
  </div>
);
}