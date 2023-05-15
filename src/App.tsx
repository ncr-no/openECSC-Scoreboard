import React from 'react';
import SideBar from './components/Navbar/navbar';
import Waves from './components/waves/waves';
import Footer from './components/Footer/footer';
import 'typeface-open-sans';
import ScoreTable from './components/ScoreTable/scoretable';
import { styled } from '@mui/material/styles';

const DrawerHeader = styled('div')(({ theme }) => ({
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'flex-end',
  padding: theme.spacing(0, 1),
  ...theme.mixins.toolbar,
}));

function App() {
  const divStyle: React.CSSProperties = {
    backgroundColor: '#0077BA',
    fontFamily: 'Open Sans',
  };
  const footerStyle: React.CSSProperties = {
    backgroundColor: '#FFFFFF',
    fontFamily: 'Open Sans',

  };
  
  return (
    <><body style={divStyle}>
      <div className="App">
        <SideBar />

      </div>
    </body>
    <div>
      <DrawerHeader />
    <ScoreTable />

    </div>
        <Waves />
     <footer style={footerStyle}>
      <Footer />
      </footer> 
      </>  );
}

export default App;
