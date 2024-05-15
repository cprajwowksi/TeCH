const express = require('express')
const { MongoClient } = require('mongodb')
const app = express()

const url = 'mongodb://172.21.159.123:2717';
const client = new MongoClient(url);

const dbName = 'ogien'

async function main(){
	await client.connect();
	const db = client.db(dbName);
	let users = await db.collection("user");
	let results = await users.find({}).toArray();
	return results
	}

async function wstawDane() {
	await client.connect();
        const db = client.db(dbName);
        let users = await db.collection("user");
        let results = await users.insertOne({"name": "ziomeczek!"})
        return results
        }

app.get('/', async (req, res) => {
	await wstawDane()
	console.log("Doszedł get")
	const dane = await main()
	res.send(dane)
} )

app.listen(3000, "0.0.0.0", () => { console.log("App is listening on port 8080")} )
