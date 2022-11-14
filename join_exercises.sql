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

# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department. (GETTING ALL DEPT MANAGERS FOR ALL THE YEARS?)

SELECT d.dept_name as Department_Name, CONCAT(e.first_name, " ", e.last_name) AS Department_Manager
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no;

# Find the name of all departments currently managed by women.
SELECT d.dept_name as Department_Name, CONCAT(e.first_name, " ", e.last_name) AS Department_Manager
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE e.gender = 'f';

# Find the current titles of employees currently working in the Customer Service department.
# (NOT WORKING)
SELECT de.title AS Title, COUNT(E.first_name) AS Total
FROM employees as e
         JOIN titles as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no;

# SELECT title, COUNT(title)
# FROM titles t
#          JOIN employees e on e.emp_no = t.emp_no
#          JOIN dept_emp de on e.emp_no = de.emp_no
# WHERE de.dept_no LIKE '%9'
#   AND t.to_date LIKE '9%'
#   AND de.to_date LIKE '9%'
# GROUP BY title ORDER BY COUNT(title) DESC;

# Find the current salary of all current managers.

SELECT d.dept_name as Department_Name, CONCAT(e.first_name, " ", e.last_name) AS Department_Manager, s.salary AS Salary
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN salaries as s
              ON s.emp_no = de.emp_no;