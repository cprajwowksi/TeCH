const express = require('express');
const Redis = require('ioredis');
const redis = new Redis({
	host: 'redis',
}
);

const app = express();

app.get('/user', (req, res) => {
    const name = req.query.name;
    redis.get(name, (err, result) => {
        if (err) {
            console.error('Error getting key:', err);
            res.status(500).send('Error getting data from Redis');
        } else {
            console.log('Get result:', result);
            res.status(200).send(result); 
        }
    });
});

app.post('/user', (req, res) => {
    const name = req.query.name;
    const surName = req.query.surName;
    redis.set(name, surName, (err, result) => {
        if (err) {
            console.error('Error setting key:', err);
            res.status(500).send('Error setting data in Redis');
        } else {
            console.log('Set result:', result);
            res.status(200).send('Data saved in Redis');
        }
    });
});

app.delete('/user', (req, res) => {
    const name = req.query.name;
    redis.del(name, (err, result) => {
        if (err) {
            console.error('Error deleting key:', err);
            res.status(500).send('Error deleting data from Redis');
        } else {
            console.log('Delete result:', result);
            res.status(200).send('Data deleted from Redis');
        }
    });
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
