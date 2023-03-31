import * as React from 'react';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import MuiAppBar, { AppBarProps as MuiAppBarProps } from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import ScoreTable from '../ScoreTable/scoretable';
import Button from '@mui/material/Button';
import logo from '../../img/LogoOpenECSC.png';

const drawerWidth = 240;

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

const Home_URL = process.env.Home_URL || 'https://open.ecsc.no';
const Users_URL = process.env.Users_URL || 'https://open.ecsc.no/users';
const Scoreboard_URL = process.env.Scroboard_URL || 'https://open.ecsc.no/scoreboard';
const Challenges_URL = process.env.Challenges_URL || 'https://open.ecsc.no/challenges';
const Notifications_URL = process.env.Notifications_URL || 'https://open.ecsc.no/notifications';

export default function MiniDrawer() {
  const [open] = React.useState(false);

  const handleButtonClick = (url: string) => {
    window.location.href = url;
  };

  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <AppBar position="fixed" open={open} sx={{ bgcolor: 'white' }}>
        <Toolbar
          sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}
        >
          <Typography variant="h6" noWrap component="div" style={{ color: 'black' , cursor: 'pointer',    fontFamily: 'Open Sans',
 }} onClick={() => handleButtonClick(Home_URL)}>
          <img src={logo} alt="Logo" style={{ marginRight: '10px', height: '30px' }} />
            openECSC
          </Typography>
          <Box sx={{ display: 'flex', alignItems: 'center', marginRight: '50px' }}>
            <Button
              sx={{
                backgroundColor: 'white',
                fontWeight: 'bold',
                color: 'black',
                height: '150%',
                '&:hover': { backgroundColor: '#FCBD2A' },
              }}
              onClick={() => handleButtonClick(Home_URL)}
            >
              Home
            </Button>
            <Button
              sx={{
                backgroundColor: 'white',
                fontWeight: 'bold',
                color: 'black',
                height: '100%',
                '&:hover': { backgroundColor: '#FCBD2A' },
              }}
              onClick={() => handleButtonClick(Users_URL)}
            >
              Users
            </Button>
            <Button
              sx={{
                backgroundColor: 'white',
                fontWeight: 'bold',
                color: 'black',
                '&:hover': { backgroundColor: '#FCBD2A' },
              }}
              onClick={() => handleButtonClick(Scoreboard_URL)}
            >
              Scoreboard
            </Button>
            <Button
              sx={{ backgroundColor: "white", fontWeight: 'bold', color: "black", '&:hover': { backgroundColor: '#FCBD2A' } }}
              onClick={() => handleButtonClick(Challenges_URL)}
            >
              Challenges
            </Button>
            <Button
              sx={{ backgroundColor: "white", fontWeight: 'bold', color: "black", '&:hover': { backgroundColor: '#FCBD2A' } }}
              onClick={() => handleButtonClick(Notifications_URL)}
            >
              Notifications
            </Button>
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