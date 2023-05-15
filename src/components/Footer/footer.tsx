import * as React from 'react';
import './footer.css';
import logos from '../../img/logos.jpg';

export default function Waves() {
  const [showFooter, setShowFooter] = React.useState(true);

  React.useEffect(() => {
    function handleResize() {
      setShowFooter(window.innerWidth >= 532);
    }

    window.addEventListener("resize", handleResize);
    handleResize();

    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return (
    <>
      {showFooter && (
        <div className="container">
          <div className="logo-container">
            <img src={logos} alt="Logos" className="logo-lg" />
          </div>
          <div className="copyright">
            <p>
              Copyright © 2023
              NTNU. Hosted by Norwegian Cyber Range
            </p>
          </div>
        </div>
      )}
    </>
  );
}
