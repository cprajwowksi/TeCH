const axios = require('axios');
const express = require('express');

const app = express();

app.get('/endpoint', (req, res) => {
    console.log('Received request');
    axios.get('http://mikroserwis-b/')
        .then(response => {
            res.send(response.data);
        })
        .catch(err => {
            console.error(err);
            res.status(500).send('Error occurred');
        });
});

app.get('/', (req, res) => {
    console.log('Received request');
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
