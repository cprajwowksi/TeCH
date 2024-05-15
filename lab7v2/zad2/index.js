const express = require('express')
const mongodb = require('mongodb')
const app = express()

const MongoClient = require('mongodb').MongoClient;

const url = 'mongodb://zad2-db-1:27017'; // adres URL bazy danych
const dbName = 'users'; // nazwa bazy danych


app.get('/', async (req,res) => { 
	console.log('resultat')
	try {
		const client = await MongoClient.connect(url);
		console.log('Connected to the database');
		const db = client.db(dbName);
		const collection = db.collection('users'); // nazwa kolekcji
		const dane = await collection.find({}).toArray();
		console.log("dane", dane)
		res.send(dane)
			client.close(); // Zamknięcie połączenia z bazą danych po zakończeniu operacji
	} catch (err) {
		console.error('Error connecting to the database:', err);
	}
  	
});



app.listen(3003, () => { console.log('App is working on PORT 3003')})
