const express = require('express')
const app = express()

app.get('/', (req, res) => {
	const date = new Date();
	res.send(date)
	})

app.listen(8080, () => { console.log('Server is running') })
