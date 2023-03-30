import * as React from 'react';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import MuiAppBar, { AppBarProps as MuiAppBarProps } from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import ScoreTable from '../ScoreTable/scoretable';
import Button from '@mui/material/Button';





const drawerWidth = 240;

// const openedMixin = (theme: Theme): CSSObject => ({
//   width: drawerWidth,
//   transition: theme.transitions.create('width', {
//     easing: theme.transitions.easing.sharp,
//     duration: theme.transitions.duration.enteringScreen,
//   }),
//   overflowX: 'hidden',
// });



// const closedMixin = (theme: Theme): CSSObject => ({
//   transition: theme.transitions.create('width', {
//     easing: theme.transitions.easing.sharp,
//     duration: theme.transitions.duration.leavingScreen,
//   }),
//   overflowX: 'hidden',
//   width: `calc(${theme.spacing(7)} + 1px)`,
//   [theme.breakpoints.up('sm')]: {
//     width: `calc(${theme.spacing(8)} + 1px)`,
//   },
// });

const DrawerHeader = styled('div')(({ theme }) => ({
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'flex-end',
  padding: theme.spacing(0, 1),
  // necessary for content to be below app bar
  ...theme.mixins.toolbar,
}));

interface AppBarProps extends MuiAppBarProps {
  open?: boolean;
}

const AppBar = styled(MuiAppBar, {
  shouldForwardProp: (prop) => prop !== 'open',
})<AppBarProps>(({ theme, open }) => ({
  zIndex: theme.zIndex.drawer + 1,
  transition: theme.transitions.create(['width', 'margin'], {
    easing: theme.transitions.easing.sharp,
    duration: theme.transitions.duration.leavingScreen,
  }),
  ...(open && {
    marginLeft: drawerWidth,
    width: `calc(100% - ${drawerWidth}px)`,
    transition: theme.transitions.create(['width', 'margin'], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
  }),
}));




export default function MiniDrawer() {
  const [open] = React.useState(false);


  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <AppBar position="fixed" open={open} sx={{ bgcolor: "white" }}>
      <Toolbar sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>

          <Typography variant="h6" noWrap component="div" style={{ color: 'black' }}>
            Scoreboard
          </Typography>
          <Box sx={{ display: 'flex' ,alignItems: 'center' , marginRight: '50px' }}>
          <Button  sx={{ backgroundColor:"white" ,fontWeight: 'bold', color:"black",height:"150%" , '&:hover': { backgroundColor: '#FCBD2A' }}}>Home</Button>
          <Button   sx={{ backgroundColor:"white" ,fontWeight: 'bold', color:"black",height:"100%", '&:hover': { backgroundColor: '#FCBD2A' } }}>Users</Button>
          <Button   sx={{ backgroundColor:"white",fontWeight: 'bold', color:"black" , '&:hover': { backgroundColor: '#FCBD2A' } }}>Scoreboard</Button>
          <Button   sx={{ backgroundColor:"white",fontWeight: 'bold', color:"black" , '&:hover': { backgroundColor: '#FCBD2A' } }}>Challenges</Button>
          <Button   sx={{ backgroundColor:"white" ,fontWeight: 'bold', color:"black", '&:hover': { backgroundColor: '#FCBD2A' } }}>Notifications</Button>
          </Box>
          
        </Toolbar>
      </AppBar>

      <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
        <DrawerHeader />
        <ScoreTable />
      </Box>
    </Box>
  );
}