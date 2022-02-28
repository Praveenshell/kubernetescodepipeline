'use strict';

const express = require('express');

// Constants
const PORT = 9000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Container Hardening Done on Feb 28 2021 - Soumitra');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
