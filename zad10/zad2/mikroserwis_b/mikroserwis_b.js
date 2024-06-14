const express = require('express')
const { MongoClient } = require('mongodb')

const url = 'mongodb://mongodb-pod:27017';

const client = new MongoClient(url);

const dbName = 'ogien'

const app = express()

app.get('/', async (req,res) => { 
	console.log('Dostalem tez')
	await client.connect();
    const db = client.db(dbName);
    let users = await db.collection("user");
    let results = await users.find({}).toArray();
    res.send(results)
        
})

app.listen(5000, () => { console.log('Server is running on port 5000')})

