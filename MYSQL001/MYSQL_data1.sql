MySQL Shell 8.0.38

Copyright (c) 2016, 2024, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \SQL
Unknown command: '\SQL'
 MySQL  JS > /SQL
SyntaxError: Invalid regular expression: missing /
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \connect username@hostname:port
Invalid URI: Illegal character [p] found at position 18
\connect [--mx|--mysqlx|--mc|--mysql] [--ssh <sshuri>] <URI>
 MySQL  SQL > \connect root@localhost:3306
Creating a session to 'root@localhost:3306'
Please provide the password for 'root@localhost:3306': ******************
Save password for 'root@localhost:3306'? [Y]es/[N]o/Ne[v]er (default No): Y
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 27
Server version: 8.0.39 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE IF NOT EXISTS expense_tracker;
Query OK, 1 row affected (0.0090 sec)
 MySQL  localhost:3306 ssl  SQL > USE expense_tracker;
Default schema set to `expense_tracker`.
Fetching global names, object names from `expense_tracker` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Users table
Query OK, 0 rows affected (0.0003 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Users (
                                                ->     user_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     username VARCHAR(50) NOT NULL UNIQUE,
                                                ->     email VARCHAR(100) NOT NULL UNIQUE,
                                                ->     password_hash VARCHAR(255) NOT NULL,
                                                ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                                                -> );
Query OK, 0 rows affected (0.0464 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Categories table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Categories (
                                                ->     category_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     name VARCHAR(100) NOT NULL UNIQUE,
                                                ->     description TEXT
                                                -> );
Query OK, 0 rows affected (0.0468 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Payment_Methods table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Payment_Methods (
                                                ->     payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     method_name VARCHAR(100) NOT NULL UNIQUE,
                                                ->     description TEXT
                                                -> );
Query OK, 0 rows affected (0.0360 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Expenses table
Query OK, 0 rows affected (0.0004 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Expenses (
                                                ->     expense_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     user_id INT,
                                                ->     category_id INT,
                                                ->     amount DECIMAL(10, 2) NOT NULL,
                                                ->     expense_date DATE NOT NULL,
                                                ->     description TEXT,
                                                ->     FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                                ->     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
                                                -> );
Query OK, 0 rows affected (0.0418 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Expense_Payment_Methods table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Expense_Payment_Methods (
                                                ->     expense_payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     expense_id INT,
                                                ->     payment_method_id INT,
                                                ->     FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id),
                                                ->     FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(payment_method_id)
                                                -> );
Query OK, 0 rows affected (0.0441 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Create the Recurring_Expenses table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > CREATE TABLE Recurring_Expenses (
                                                ->     recurring_expense_id INT AUTO_INCREMENT PRIMARY KEY,
                                                ->     user_id INT,
                                                ->     category_id INT,
                                                ->     amount DECIMAL(10, 2) NOT NULL,
                                                ->     start_date DATE NOT NULL,
                                                ->     end_date DATE,
                                                ->     frequency ENUM('daily', 'weekly', 'monthly', 'yearly') NOT NULL,
                                                ->     description TEXT,
                                                ->     FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                                ->     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
                                                -> );
Query OK, 0 rows affected (0.0413 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > STATUS;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'STATUS' at line 1
 MySQL  localhost:3306 ssl  expense_tracker  SQL > mysql -u your_username -p
                                                -> STATUS;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql -u your_username -p
STATUS' at line 1
 MySQL  localhost:3306 ssl  expense_tracker  SQL > \status
MySQL Shell version 8.0.38

Connection Id:                27
Current schema:               expense_tracker
Current user:                 root@localhost
SSL:                          Cipher in use: TLS_AES_256_GCM_SHA384 TLSv1.3
Using delimiter:              ;
Server version:               8.0.39 MySQL Community Server - GPL
Protocol version:             Classic 10
Client library:               8.0.38
Connection:                   localhost via TCP/IP
TCP port:                     3306
Server characterset:          utf8mb4
Schema characterset:          utf8mb4
Client characterset:          utf8mb4
Conn. characterset:           utf8mb4
Result characterset:          utf8mb4
Compression:                  Disabled
Uptime:                       42 min 10.0000 sec

Threads: 4  Questions: 6612  Slow queries: 0  Opens: 324  Flush tables: 3  Open tables: 232  Queries per second avg: 2.613
 MySQL  localhost:3306 ssl  expense_tracker  SQL > mysql -u your_username -p
                                                -> USE expense_tracker;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql -u your_username -p
USE expense_tracker' at line 1
 MySQL  localhost:3306 ssl  expense_tracker  SQL > USE expense_tracker;
Default schema set to `expense_tracker`.
Fetching global names, object names from `expense_tracker` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SHOW TABLES;
+---------------------------+
| Tables_in_expense_tracker |
+---------------------------+
| categories                |
| expense_payment_methods   |
| expenses                  |
| payment_methods           |
| recurring_expenses        |
| users                     |
+---------------------------+
6 rows in set (0.0066 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE table_name;
ERROR: 1146 (42S02): Table 'expense_tracker.table_name' doesn't exist
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE table_name;
ERROR: 1146 (42S02): Table 'expense_tracker.table_name' doesn't exist
 MySQL  localhost:3306 ssl  expense_tracker  SQL > ^C
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SHOW TABLES;
+---------------------------+
| Tables_in_expense_tracker |
+---------------------------+
| categories                |
| expense_payment_methods   |
| expenses                  |
| payment_methods           |
| recurring_expenses        |
| users                     |
+---------------------------+
6 rows in set (0.0022 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'categories' table
Query OK, 0 rows affected (0.0003 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE categories;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| category_id | int          | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100) | NO   | UNI | NULL    |                |
| description | text         | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'expense_payment_methods' table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE expense_payment_methods;
+---------------------------+------+------+-----+---------+----------------+
| Field                     | Type | Null | Key | Default | Extra          |
+---------------------------+------+------+-----+---------+----------------+
| expense_payment_method_id | int  | NO   | PRI | NULL    | auto_increment |
| expense_id                | int  | YES  | MUL | NULL    |                |
| payment_method_id         | int  | YES  | MUL | NULL    |                |
+---------------------------+------+------+-----+---------+----------------+
3 rows in set (0.0022 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'expenses' table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE expenses;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| expense_id   | int           | NO   | PRI | NULL    | auto_increment |
| user_id      | int           | YES  | MUL | NULL    |                |
| category_id  | int           | YES  | MUL | NULL    |                |
| amount       | decimal(10,2) | NO   |     | NULL    |                |
| expense_date | date          | NO   |     | NULL    |                |
| description  | text          | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
6 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'payment_methods' table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE payment_methods;
+-------------------+--------------+------+-----+---------+----------------+
| Field             | Type         | Null | Key | Default | Extra          |
+-------------------+--------------+------+-----+---------+----------------+
| payment_method_id | int          | NO   | PRI | NULL    | auto_increment |
| method_name       | varchar(100) | NO   | UNI | NULL    |                |
| description       | text         | YES  |     | NULL    |                |
+-------------------+--------------+------+-----+---------+----------------+
3 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'recurring_expenses' table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE recurring_expenses;
+----------------------+-------------------------------------------+------+-----+---------+----------------+
| Field                | Type                                      | Null | Key | Default | Extra          |
+----------------------+-------------------------------------------+------+-----+---------+----------------+
| recurring_expense_id | int                                       | NO   | PRI | NULL    | auto_increment |
| user_id              | int                                       | YES  | MUL | NULL    |                |
| category_id          | int                                       | YES  | MUL | NULL    |                |
| amount               | decimal(10,2)                             | NO   |     | NULL    |                |
| start_date           | date                                      | NO   |     | NULL    |                |
| end_date             | date                                      | YES  |     | NULL    |                |
| frequency            | enum('daily','weekly','monthly','yearly') | NO   |     | NULL    |                |
| description          | text                                      | YES  |     | NULL    |                |
+----------------------+-------------------------------------------+------+-----+---------+----------------+
8 rows in set (0.0018 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Describe the 'users' table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE users;
+---------------+--------------+------+-----+-------------------+-------------------+
| Field         | Type         | Null | Key | Default           | Extra             |
+---------------+--------------+------+-----+-------------------+-------------------+
| user_id       | int          | NO   | PRI | NULL              | auto_increment    |
| username      | varchar(50)  | NO   | UNI | NULL              |                   |
| email         | varchar(100) | NO   | UNI | NULL              |                   |
| password_hash | varchar(255) | NO   |     | NULL              |                   |
| created_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+---------------+--------------+------+-----+-------------------+-------------------+
5 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT *
                                                ->
                                                -> FROM expenses;
Empty set (0.0014 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT amount, category
                                                ->
                                                -> FROM expenses;
ERROR: 1054 (42S22): Unknown column 'category' in 'field list'
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT *
                                                ->
                                                -> FROM expenses
                                                ->
                                                -> WHERE description LIKE '%office supplies%';
Empty set (0.0008 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT *
                                                ->
                                                -> FROM expenses
                                                ->
                                                -> WHERE amount > 50;
Empty set (0.0004 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Check if there are records in the 'expenses' table
Query OK, 0 rows affected (0.0009 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT * FROM expenses;
Empty set (0.0003 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com');
ERROR: 1364 (HY000): Field 'password_hash' doesn't have a default value
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE users;
+---------------+--------------+------+-----+-------------------+-------------------+
| Field         | Type         | Null | Key | Default           | Extra             |
+---------------+--------------+------+-----+-------------------+-------------------+
| user_id       | int          | NO   | PRI | NULL              | auto_increment    |
| username      | varchar(50)  | NO   | UNI | NULL              |                   |
| email         | varchar(100) | NO   | UNI | NULL              |                   |
| password_hash | varchar(255) | NO   |     | NULL              |                   |
| created_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+---------------+--------------+------+-----+-------------------+-------------------+
5 rows in set (0.0023 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email, password_hash)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com', 'hashed_password');

Query OK, 1 row affected (0.0036 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email, password_hash)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com', '1234');
ERROR: 1062 (23000): Duplicate entry '1' for key 'users.PRIMARY'
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert or update if duplicate key exists
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email, password_hash)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com', '1234')
                                                -> ON DUPLICATE KEY UPDATE
                                                ->     username = VALUES(username),
                                                ->     email = VALUES(email),
                                                ->     password_hash = VALUES(password_hash);
Query OK, 2 rows affected, 3 warnings (0.0031 sec)
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT * FROM expenses;
Empty set (0.0012 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into users
Query OK, 0 rows affected (0.0003 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email, password_hash)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com', 'hashed_password');

ERROR: 1062 (23000): Duplicate entry '1' for key 'users.PRIMARY'
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into categories
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO categories (category_id, category_name)
                                                -> VALUES (1, 'Office Supplies');
ERROR: 1054 (42S22): Unknown column 'category_name' in 'field list'
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into payment_methods
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO payment_methods (payment_method_id, method_name)
                                                -> VALUES (1, 'Credit Card');
Query OK, 1 row affected (0.0040 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into expenses
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO expenses (expense_id, user_id, category_id, amount, description, date)
                                                -> VALUES (1, 1, 1, 100.00, 'Office Supplies Purchase', '2024-08-22');
ERROR: 1054 (42S22): Unknown column 'date' in 'field list'
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into expense_payment_methods
Query OK, 0 rows affected (0.0001 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO expense_payment_methods (expense_id, payment_method_id)
                                                -> VALUES (1, 1);
ERROR: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`expense_tracker`.`expense_payment_methods`, CONSTRAINT `expense_payment_methods_ibfk_1` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`expense_id`))
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert into recurring_expenses
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO recurring_expenses (recurring_expense_id, user_id, category_id, amount, description, start_date, frequency)
                                                -> VALUES (1, 1, 1, 50.00, 'Monthly Office Supplies', '2024-08-01', 'Monthly');
ERROR: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`expense_tracker`.`recurring_expenses`, CONSTRAINT `recurring_expenses_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`))
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Insert or update if duplicate key exists, using alias for inserted values
Query OK, 0 rows affected (0.0005 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO users (user_id, username, email, password_hash)
                                                -> VALUES (1, 'JohnDoe', 'johndoe@example.com', '1234')
                                                -> ON DUPLICATE KEY UPDATE
                                                ->     username = VALUES(username),
                                                ->     email = VALUES(email),
                                                ->     password_hash = VALUES(password_hash);
Query OK, 0 rows affected, 3 warnings (0.0004 sec)
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
Warning (code 1287): 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT * FROM users WHERE user_id = 1;
+---------+----------+---------------------+---------------+---------------------+
| user_id | username | email               | password_hash | created_at          |
+---------+----------+---------------------+---------------+---------------------+
|       1 | JohnDoe  | johndoe@example.com | 1234          | 2024-08-22 01:40:32 |
+---------+----------+---------------------+---------------+---------------------+
1 row in set (0.0013 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE categories;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| category_id | int          | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100) | NO   | UNI | NULL    |                |
| description | text         | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.0017 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO categories (category_id, name)
                                                -> VALUES (1, 'Office Supplies');
Query OK, 1 row affected (0.0026 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > DESCRIBE expenses;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| expense_id   | int           | NO   | PRI | NULL    | auto_increment |
| user_id      | int           | YES  | MUL | NULL    |                |
| category_id  | int           | YES  | MUL | NULL    |                |
| amount       | decimal(10,2) | NO   |     | NULL    |                |
| expense_date | date          | NO   |     | NULL    |                |
| description  | text          | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
6 rows in set (0.0023 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > INSERT INTO expenses (expense_id, user_id, category_id, amount, description, expense_date)
                                                -> VALUES (1, 1, 1, 100.00, 'Office Supplies Purchase', '2024-08-22');
Query OK, 1 row affected (0.0031 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Check if the record exists in the `expenses` table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT * FROM expenses WHERE expense_id = 1;
+------------+---------+-------------+--------+--------------+--------------------------+
| expense_id | user_id | category_id | amount | expense_date | description              |
+------------+---------+-------------+--------+--------------+--------------------------+
|          1 |       1 |           1 | 100.00 | 2024-08-22   | Office Supplies Purchase |
+------------+---------+-------------+--------+--------------+--------------------------+
1 row in set (0.0004 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >
 MySQL  localhost:3306 ssl  expense_tracker  SQL > -- Check if the record exists in the `categories` table
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL > SELECT * FROM categories WHERE category_id = 1;
+-------------+-----------------+-------------+
| category_id | name            | description |
+-------------+-----------------+-------------+
|           1 | Office Supplies | NULL        |
+-------------+-----------------+-------------+
1 row in set (0.0003 sec)
 MySQL  localhost:3306 ssl  expense_tracker  SQL >