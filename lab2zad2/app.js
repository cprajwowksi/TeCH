
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  const currentDate = new Date();
  res.json({ date: currentDate });
});


app.listen(8080, () => {
  console.log(`Aplikacja działa na porcie 8080`);
});
