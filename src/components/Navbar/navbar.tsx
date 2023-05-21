import * as React from 'react';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import MuiAppBar, { AppBarProps as MuiAppBarProps } from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import CssBaseline from '@mui/material/CssBaseline';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import Drawer from '@mui/material/Drawer';
import Divider from '@mui/material/Divider';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import logo from '../../img/LogoOpenECSC.png';
import ListItemButton from '@mui/material/ListItemButton';

const Home_URL = process.env.Home_URL || 'https://open.ecsc.no';
const Users_URL = process.env.Users_URL || 'https://open.ecsc.no/users';
const Scoreboard_URL = process.env.Scroboard_URL || 'https://open.ecsc.no/scoreboard';
const Challenges_URL = process.env.Challenges_URL || 'https://open.ecsc.no/challenges';
const Notifications_URL = process.env.Notifications_URL || 'https://open.ecsc.no/notifications';

const drawerWidth = 240;
const navItems = [
  { name: 'Home', link: Home_URL },
  { name: 'Users', link: Users_URL },
  { name: 'Scoreboard', link: Scoreboard_URL },
  { name: 'Challenges', link: Challenges_URL },
  { name: 'Notifications', link: Notifications_URL },
];


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


export default function Navbar() {
  const [mobileOpen, setMobileOpen] = React.useState(false);

  const handleDrawerToggle = () => {
    setMobileOpen((prevState) => !prevState);

  };

  const drawer = (
    <Box onClick={handleDrawerToggle} sx={{ textAlign: 'center' }}>
      <Typography variant="h6" sx={{ my: 2  }}>
        openECSC
      </Typography>
      <Divider />
      <List>
        {navItems.map((item) => (
          <ListItem key={item.link} disablePadding>
            <ListItemButton
              component="a"
              href={item.link}
              sx={{ textAlign: 'center' }}
            >
              <ListItemText primary={item.name} />
            </ListItemButton>
          </ListItem>
        ))}
      </List>
    </Box>
  );

  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />

      <AppBar position="fixed" sx={{ bgcolor: 'white' }}>

        <Toolbar
          sx={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            // '@media screen and (max-width: 960px)': {
            //   flexDirection: 'column',
            //   alignItems: 'flex-start',
            // },
          }}
        >

          <IconButton
            color="primary"
            aria-label="open drawer"
            edge="start"
            onClick={handleDrawerToggle}
            sx={{ mr: 2, display: { sm: "none" } }}
          >
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" noWrap component="div" style={{
            color: 'black', cursor: 'pointer', fontFamily: 'Open Sans',
            fontWeight: 700,  alignItems: 'center' , display: 'flex' , fontSize: '1rem'
          }}

            onClick={() => window.location.href = Home_URL}
          >
            <img src={logo} alt="Logo" style={{ marginRight: '10px', height: '30px' }} />
            openECSC
          </Typography>
          <Box sx={{ display: { xs: "none", sm: "block" } }}>
            {navItems.map((item) => (
              <Button key={item.name} onClick={() => {
                window.location.href = item.link;
              }} sx={{ color: "#000" }}>
                {item.name}
              </Button>
            ))}
          </Box>
        </Toolbar>
      </AppBar>
      <Box component="nav">

        <Drawer
          variant="temporary"
          open={mobileOpen}
          onClose={handleDrawerToggle}
          ModalProps={{
            keepMounted: true, // Better open performance on mobile.
          }}
          sx={{
            display: { xs: 'block', sm: 'none' },
            '& .MuiDrawer-paper': { boxSizing: 'border-box', width: drawerWidth },
          }}
        >
          {drawer}
        </Drawer>
      </Box>

    </Box>
  );
}