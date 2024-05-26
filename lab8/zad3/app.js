const express = require('express');
const { Pool } = require('pg')

const Redis = require('ioredis');
const redis = new Redis({
	host: 'redis',
}
);

const app = express();

const pool = new Pool({
    user: process.env.POSTGRES_USER || 'user',
    host: 'postgres',
    database: process.env.POSTGRES_DB || 'myapp',
    password: process.env.POSTGRES_PASSWORD || 'password',
  });


app.post('/users', async (req, res) => {
    const { username, password } = req.body;
    if (!username || !password) {
        return res.status(400).send('Username and password are required');
      }
      try {
        const result = await pool.query(
          'INSERT INTO users (username, password) VALUES ($1, $2) RETURNING *',
          [username, password]
        );
        res.status(201).send(result.rows[0]);
      } catch (err) {
        console.error('Error inserting user:', err);
        res.status(500).send('Error inserting user into PostgreSQL');
      }
    })


app.get('/users', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM users');
        res.status(200).json(result.rows);
    
    } catch (err){
        console.error('Error getting users:', err);
        res.status(500).send('Error getting users from PostgreSQL')
    }
})

app.get('/messages', (req, res) => {
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

app.post('/messages', (req, res) => {
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

app.delete('/messages', (req, res) => {
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
