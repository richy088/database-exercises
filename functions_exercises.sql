USE employees;

# NOT CORRECT
SELECT emp_no, first_name, last_name, gender FROM employees WHERE CONCAT('last_name like ''E%'' OR', last_name like '%E');

# Find all employees born on Christmas — 842 rows.
SELECT first_name, birth_date FROM employees WHERE DAYOFMONTH(birth_date) = 25 AND MONTH(birth_date) = 12;
# Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999 AND month(birth_date) = 12   AND day(birth_date) = 25;
# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.

# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).

