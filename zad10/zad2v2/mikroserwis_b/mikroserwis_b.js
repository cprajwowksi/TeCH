const express = require('express')

const app = express()

app.get('/', (req,res) => { 
	console.log('Dostalem tez')
	res.send('Mikro b do aaa')
})

app.listen(5000, () => { console.log('Server is running on port 5000')})
