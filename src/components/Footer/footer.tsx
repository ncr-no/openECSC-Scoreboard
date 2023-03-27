import * as React from 'react';
import './footer.css';
import ntnuLogo from '../../img/ntnu_logo.jpg';
import enisaLogo from '../../img/enisa-logo.jpg';
import capgeminiLogo from '../../img/Capgemini-logo.jpg';
import europeanLogo from '../../img/European.jpg';

export default function waves() {
  return (
    <><br />
    <div className="container">
    <div className="logo-container">
        <img src={capgeminiLogo} alt="Capgemini logo" className="logo-lg" />
      </div>
      <div className="logo-container">
        <img src={ntnuLogo} alt="NTNU logo" className="logo-lg" />
      </div>
      <div className="logo-container">
        <img src={enisaLogo} alt="ENISA logo" className="logo" />
      </div>
      <div className="logo-container">
        <img src={europeanLogo} alt="European logo" className="logo-lg" />
      </div>


    </div>
    </>
    );
  }