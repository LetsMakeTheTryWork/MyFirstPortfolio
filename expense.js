const expenses = []; // In-memory expense store

const addExpense = (req, res) => {
  const { amount, description } = req.body;
  const username = req.user.username; // Assume req.user is set by authentication middleware

  expenses.push({ username, amount, description, date: new Date() });
  res.status(201).send('Expense added');
};

const getExpenses = (req, res) => {
  const username = req.user.username; // Assume req.user is set by authentication middleware

  const userExpenses = expenses.filter(expense => expense.username === username);
  res.json(userExpenses);
};

const getTotalExpenses = (req, res) => {
  const username = req.user.username;

  const userExpenses = expenses.filter(expense => expense.username === username);
  const total = userExpenses.reduce((acc, expense) => acc + expense.amount, 0);
  res.json({ total });
};

module.exports = { addExpense, getExpenses, getTotalExpenses };
