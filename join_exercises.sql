USE join_test_db;
USE employees;

# Create new database named join_test_db

# Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
INSERT INTO users (id, name, email, role_id) VALUES
(7, 'richard', 'rich@example.com', 4),
(8, 'monica', 'monica@example.com', 3),
(9, 'natasha', 'natasha@example.com', 2),
(10, 'miso', 'miso@example.com', 1);

# Use JOIN, LEFT JOIN, and RIGHT JOIN to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

# JOIN
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

# LEFT JOIN - all users and jobs or no jobs listed
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

# RIGHT JOIN - user names without jobs are eliminated
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

# Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use COUNT and the appropriate join type to get a list of roles along with the number of users that have a given role. Hint: You will also need to use GROUP BY in the query.
SELECT COUNT(users.name) AS user_name, roles.name AS role_name FROM users RIGHT JOIN roles ON users.role_id = roles.id GROUP BY role_name;

# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT CONCAT(e.first_name, " ", e.last_name) AS Department_Manager, d.dept_name as Department_Name
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no;

