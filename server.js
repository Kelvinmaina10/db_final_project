const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'ContactBookDB'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// CRUD Operations

// Create Contact
app.post('/contacts', (req, res) => {
    const contact = req.body;
    db.query('INSERT INTO Contacts SET ?', contact, (err, result) => {
        if (err) throw err;
        res.send(`Contact added with ID: ${result.insertId}`);
    });
});

// Read Contacts
app.get('/contacts', (req, res) => {
    db.query('SELECT * FROM Contacts', (err, results) => {
        if (err) throw err;
        res.send(results);
    });
});

// Update Contact
app.put('/contacts/:id', (req, res) => {
    const { id } = req.params;
    const updatedContact = req.body;
    db.query('UPDATE Contacts SET ? WHERE contact_id = ?', [updatedContact, id], (err) => {
        if (err) throw err;
        res.send('Contact updated successfully.');
    });
});

// Delete Contact
app.delete('/contacts/:id', (req, res) => {
    const { id } = req.params;
    db.query('DELETE FROM Contacts WHERE contact_id = ?', id, (err) => {
        if (err) throw err;
        res.send('Contact deleted successfully.');
    });
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
