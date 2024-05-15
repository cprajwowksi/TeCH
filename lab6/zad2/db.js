const mysql = require('mysql2');
const express = require('express')

const app = express()

// Konfiguracja połączenia z bazą danych MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'my-secret-pw'
});

// Nawiązanie połączenia
connection.connect((err) => {
  if (err) {
    console.error('Błąd połączenia: ', err);
    return;
  }
  console.log('Połączenie z bazą danych MySQL zostało nawiązane.');
});

// Zapytanie SQL do pobrania danych
const query = 'SELECT NOW()';

// Wykonanie zapytania
app.get('/', (req, res) => {
connection.query(query, (error, results, fields) => {
  if (error) {
    console.error('Błąd podczas wykonywania zapytania: ', error);
    return;
  }
  console.log('Pobrane dane: ', results);
  res.send(results)
});
})

app.listen(5000, () => { "Serwer dziala na porice 3000" } )
