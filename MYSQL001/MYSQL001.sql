CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Create the Payment_Methods table
CREATE TABLE Payment_Methods (
    payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Create the Expenses table
CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    expense_date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create the Expense_Payment_Methods table
CREATE TABLE Expense_Payment_Methods (
    expense_payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT,
    payment_method_id INT,
    FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(payment_method_id)
);

-- Create the Recurring_Expenses table
CREATE TABLE Recurring_Expenses (
    recurring_expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    frequency ENUM('daily', 'weekly', 'monthly', 'yearly') NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);