const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'ptcglogger',
  password: '123456',
  port: 5432,
});

app.get('/', (req, res) => {
  res.send('PTCG Logger server is running.');
});

app.get('/api/sets', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT *
      FROM sets
      ORDER BY set_id;
    `);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching sets:', err);
    res.status(500).json({ error: err.message });
  }
});

app.get('/api/cards', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT *
      FROM cards
      ORDER BY card_id;
    `);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching cards:', err);
    res.status(500).json({ error: err.message });
  }
});

app.get('/api/collectors', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT *
      FROM collectors
      ORDER BY collector_id;
    `);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching collectors:', err);
    res.status(500).json({ error: err.message });
  }
});

app.get('/api/collection', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT *
      FROM collection
      ORDER BY collection_id;
    `);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching collection:', err);
    res.status(500).json({ error: err.message });
  }
});

app.get('/api/test', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW() AS current_time;');
    res.json({
      message: 'Database connection successful',
      time: result.rows[0].current_time,
    });
  } catch (err) {
    console.error('Database test failed:', err);
    res.status(500).json({ error: err.message });
  }
});

app.post('/api/collectors', async (req, res) => {
  const { name, email, country } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO collectors (name, email, country) VALUES ($1, $2, $3) RETURNING *`,
      [name, email, country || null]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error creating collector:', err);
    res.status(500).json({ error: err.message });
  }
});

app.post('/api/collection', async (req, res) => {
  const { collector_id, card_id, acquired_date } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO collection (collector_id, card_id, acquired_date) VALUES ($1, $2, $3) RETURNING *`,
      [collector_id, card_id, acquired_date || null]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error adding to collection:', err);
    res.status(500).json({ error: err.message });
  }
});

app.delete('/api/collection/:id', async (req, res) => {
  try {
    await pool.query(`DELETE FROM collection WHERE collection_id = $1`, [req.params.id]);
    res.json({ success: true });
  } catch (err) {
    console.error('Error removing from collection:', err);
    res.status(500).json({ error: err.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});