import React from 'react';
import SideBar from './components/Sidebar/sidebar';
import Waves from './components/waves/waves';
import Footer from './components/Footer/footer';
function App() {
  const divStyle: React.CSSProperties = {
    backgroundColor: '#0077BA',
  };
  const footerStyle: React.CSSProperties = {
    backgroundColor: '#FFFFFF',
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
