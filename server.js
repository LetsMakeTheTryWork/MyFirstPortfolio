const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

const userRoutes = require('./user');
const expenseRoutes = require('./expense');
const jwt = require('jsonwebtoken');

// Middleware
app.use(bodyParser.json());

// Authentication middleware
const authenticateJWT = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (token == null) return res.sendStatus(401);

  jwt.verify(token, 'secret', (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
};

// Routes
app.post('/register', userRoutes.register);
app.post('/login', userRoutes.login);
app.post('/expenses', authenticateJWT, expenseRoutes.addExpense);
app.get('/expenses', authenticateJWT, expenseRoutes.getExpenses);
app.get('/expenses/total', authenticateJWT, expenseRoutes.getTotalExpenses);

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
