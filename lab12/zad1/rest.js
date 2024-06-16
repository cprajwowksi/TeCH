const express = require('express')
const app = express()

let baza_danych = []

app.get('/', (req, res) => {
	console.log('get')
	res.send(baza_danych)
})

app.post('/user', (req, res) => {
	console.log('post')
	baza_danych.push(baza_danych.length)
	res.send('added')
})

app.delete('/user', (req, res) => {
	console.log('delete')
	baza_danych = baza_danych.filter((x, i) => i != baza_danych.length - 1 )
	res.send('deleted')
})

app.listen(3000, () => {
	console.log('Server is listening on port 3000')
})
