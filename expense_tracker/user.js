const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const users = []; // In-memory user store

const register = async (req, res) => {
  const { username, password } = req.body;

  // Check if user already exists
  const existingUser = users.find(user => user.username === username);
  if (existingUser) return res.status(400).send('User already exists');

  // Hash password
  const hashedPassword = await bcrypt.hash(password, 10);

  // Save user
  users.push({ username, password: hashedPassword });
  res.status(201).send('User registered');
};

const login = async (req, res) => {
  const { username, password } = req.body;

  // Find user
  const user = users.find(user => user.username === username);
  if (!user) return res.status(400).send('User not found');

  // Check password
  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) return res.status(400).send('Invalid credentials');

  // Create JWT
  const token = jwt.sign({ username }, 'secret', { expiresIn: '1h' });
  res.json({ token });
};

module.exports = { register, login };
