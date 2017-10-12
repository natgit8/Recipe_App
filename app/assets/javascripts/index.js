import React from 'react';
import ReactDOM from 'react-dom';

import Survey from './components/Survey';


ReactDOM.render(
  <div>
    <div className="container">
      <div className="title">componentWillReceiveProps()</div>
      <Survey />
    </div>
  </div>,
  document.getElementById('root')
);
