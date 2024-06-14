const express = require('express')
const mongodb = require('mongodb')
const app = express()
const fs = require('fs');

const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://mydb:27017';
const dbName = 'users'; 

app.use(express.json()); 

app.get('/users', async (req, res) => {
    try {
		const client = await MongoClient.connect(url);
		console.log('Connected to the database');
		const db = client.db(dbName);
		const collection = db.collection('users');
		const dane = await collection.find({}).toArray();
		console.log("dane", dane)
		res.send(dane)
			client.close(); 
	} catch (err) {
		console.error('Error connecting to the database:', err);
	}
})

app.post('/user', async (req, res) => {
    try {
        const data = req.body
		const client = await MongoClient.connect(url);
		console.log('Connected to the database');
		const db = client.db(dbName);
		const collection = db.collection('users');
		const dane = await collection.insertOne(data)
		res.send(dane)
			client.close(); 
	} catch (err) {
		console.error('Error connecting to the database:', err);
	}
})

app.delete('/user', async (req, res) => {
    try {
        const data = req.body
		const client = await MongoClient.connect(url);
		console.log('Connected to the database');
		const db = client.db(dbName);
		const collection = db.collection('users');
		const dane = await collection.deleteOne(data)
		res.send(dane)
			client.close(); 
	} catch (err) {
		console.error('Error connecting to the database:', err);
	}
})

app.listen(3000, async () => {
    try {
        const rawData = fs.readFileSync('data.json', 'utf8');
        const data = JSON.parse(rawData);
        const documents = Array.isArray(data) ? data : data.data;
        const client = await MongoClient.connect(url);
        const db = client.db(dbName);
        const collection = db.collection('users');
        const result = await collection.insertMany(documents);
        console.log('Insert successful:', result.insertedCount);
        await client.close();
    } catch (err) {
        console.error('Error loading data:', err);
    }
    console.log('Server is running on port 3000')
})