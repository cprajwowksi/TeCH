const express = require('express')
const { MongoClient } = require('mongodb');

const username = process.env.MONGO_INITDB_ROOT_USERNAME;
const password = process.env.MONGO_INITDB_ROOT_PASSWORD;
const database_url = process.env.ME_CONFIG_MONGODB_SERVER;

const uri = `mongodb://${username}:${password}@my-mongo-service:27017`;

const client = new MongoClient(uri);

const app = express()
app.get('/', async (req,res) => { 
	console.log('Dostalem tez')
	try {
		await client.connect();
		const db = client.db('admin');
		let users = await db.collection("user");
		let results = await users.find({}).toArray();
		res.send(results)
	  } finally {
		await client.close();
	  }
	
})

app.listen(5000, () => { console.log('Server is running on port 5000')})
