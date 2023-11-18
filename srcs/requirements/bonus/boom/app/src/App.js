import React from 'react';
import './App.css';

const Header = () => {
  return (
    <div className="header">
      <h1>@adardour</h1>
      <p>Full stack devlooper</p>
    </div>
  );
};

const Experience = () => {
  return (
    <div className="experience">
      <h2>Experience</h2>
      <ul>
        <li>
          <strong>Company Name</strong> - Position
          <p>Details about the role, responsibilities, achievements, etc.</p>
        </li>
      </ul>
    </div>
  );
};

const Education = () => {
  return (
    <div className="education">
      <h2>Education</h2>
      <ul>
        <li>
          <strong>University Name</strong> - Degree
          <p>Additional details such as GPA, relevant coursework, etc.</p>
        </li>
      </ul>
    </div>
  );
};

const App = () => {
  return (
    <div className="resume">
      <Header />
      <Experience />
      <Education />
    </div>
  );
};

export default App;
