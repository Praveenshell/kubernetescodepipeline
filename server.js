'use strict';

const express = require('express');

// Constants
const PORT = 9000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('TCS DEMO - Container Hardening and Zero touch deployment done successfully is a big question mark');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

  
