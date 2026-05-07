SELECT * FROM Employee ORDER BY salary ASC;

SELECT * FROM Employee ORDER BY age DESC;

SELECT * FROM Employee ORDER BY hire_date ASC;

SELECT * FROM Employee ORDER BY department_id, salary;

SELECT department_id, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY total_salary;

SELECT e.name AS employee_name, d.name AS department_name 
FROM Employee e 
JOIN Department d ON e.department_id = d.department_id;

SELECT p.name AS project_name, d.name AS department_name 
FROM Project p 
JOIN Department d ON p.department_id = d.department_id;

SELECT e.name AS employee_name, p.name AS project_name 
FROM Employee e 
JOIN Project p ON e.department_id = p.department_id;

SELECT e.name, d.name 
FROM Employee e 
LEFT JOIN Department d ON e.department_id = d.department_id;

SELECT d.name, e.name 
FROM Department d 
LEFT JOIN Employee e ON d.department_id = e.department_id;

SELECT e.name 
FROM Employee e 
LEFT JOIN Project p ON e.department_id = p.department_id 
WHERE p.project_id IS NULL;

SELECT e.name, COUNT(p.project_id) AS project_count 
FROM Employee e 
LEFT JOIN Project p ON e.department_id = p.department_id 
GROUP BY e.name;

SELECT d.name 
FROM Department d 
LEFT JOIN Employee e ON d.department_id = e.department_id 
WHERE e.emp_id IS NULL;

SELECT name 
FROM Employee 
WHERE department_id = (SELECT department_id FROM Employee WHERE name = 'John Doe') 
AND name <> 'John Doe';

SELECT d.name 
FROM Department d 
JOIN Employee e ON d.department_id = e.department_id 
GROUP BY d.name 
ORDER BY AVG(e.salary) DESC 
LIMIT 1;

SELECT * FROM Employee WHERE salary = (SELECT MAX(salary) FROM Employee);

SELECT * FROM Employee WHERE salary > (SELECT AVG(salary) FROM Employee);

SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);

SELECT department_id 
FROM Employee 
GROUP BY department_id 
ORDER BY COUNT(*) DESC 
LIMIT 1;

SELECT * FROM Employee e1 
WHERE salary > (SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 2;

SELECT * FROM Employee 
WHERE age > ALL (SELECT age FROM Employee WHERE department_id = (SELECT department_id FROM Department WHERE name = 'HR'));

SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

SELECT * FROM Employee 
WHERE department_id IN (SELECT department_id FROM Project GROUP BY department_id HAVING COUNT(*) >= 2);

SELECT * FROM Employee 
WHERE hire_date = (SELECT hire_date FROM Employee WHERE name = 'Jane Smith') 
AND name <> 'Jane Smith';

SELECT SUM(salary) FROM Employee WHERE hire_date LIKE '2020%';

SELECT department_id, AVG(salary) AS avg_sal 
FROM Employee 
GROUP BY department_id 
ORDER BY avg_sal DESC;

SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

SELECT * FROM Employee 
WHERE hire_date >= '2022-01-01' 
ORDER BY hire_date;

SELECT department_id, COUNT(*), AVG(salary) 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

SELECT name, salary 
FROM Employee e1 
WHERE salary > (SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

SELECT name FROM Employee 
WHERE hire_date = (SELECT hire_date FROM Employee WHERE age = (SELECT MAX(age) FROM Employee));

SELECT d.name, COUNT(p.project_id) AS project_count 
FROM Department d 
LEFT JOIN Project p ON d.department_id = p.department_id 
GROUP BY d.name 
ORDER BY project_count;

SELECT name FROM Employee e1 
WHERE salary = (SELECT MAX(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

SELECT name, salary FROM Employee e1 
WHERE age > (SELECT AVG(age) FROM Employee e2 WHERE e1.department_id = e2.department_id);
