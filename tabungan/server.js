const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

// Konfigurasi koneksi MySQL
const db = mysql.createConnection({
  host: 'localhost',   // Ganti dengan host MySQL Anda
  user: 'readonly_user', // User dengan hak akses read-only
  password: 'password',  // Ganti dengan password MySQL Anda
  database: 'your_database' // Ganti dengan nama database Anda
});

// Koneksi ke database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database');
});

// Endpoint untuk mendapatkan data
app.get('/data', (req, res) => {
  db.query('SELECT * FROM your_table', (err, results) => {
    if (err) {
      res.status(500).send('Error fetching data');
      return;
    }
    res.json(results); // Kirimkan hasil dalam bentuk JSON
  });
});

// Mulai server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
