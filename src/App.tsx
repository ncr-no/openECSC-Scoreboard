import React from 'react';
import SideBar from './components/Navbar/navbar';
import Waves from './components/waves/waves';
import Footer from './components/Footer/footer';
import 'typeface-open-sans';

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
        <Waves />
    <footer style={footerStyle}>
      <Footer />
      </footer></>  );
}

export default App;
