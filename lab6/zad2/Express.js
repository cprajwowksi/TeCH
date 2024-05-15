const mysql = require('mysql')

var con = mysql.createConnection({
  host: "db",
  user: "root",
  password: "my-secret-pw"
 });

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
