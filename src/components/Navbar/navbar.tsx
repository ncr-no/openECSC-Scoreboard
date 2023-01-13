import * as React from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import SideBar from '../Sidebar/sidebar';

export default function ButtonAppBar() {
  
  return (
    <Box sx={{ display: 'flex' }}>
      <AppBar position="static" style={{ zIndex: 2 }}>
        <Toolbar>
          <SideBar />
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            Score Dashboard
          </Typography>
          <Button color="inherit">Login</Button>
        </Toolbar>
      </AppBar>
      <Box
        sx={{
          position: 'fixed',
          height: '100%',
          top: 64,
          left: 0,
          zIndex: 1,
          overflow: 'auto',
        }}
      ></Box>
    </Box>
  );
}