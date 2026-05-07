SQL PRACTICE QUERIES: QUESTIONS 31 - 65

31.
SELECT * FROM Employee ORDER BY salary ASC;

32.
SELECT * FROM Employee ORDER BY age DESC;

33.
SELECT * FROM Employee ORDER BY hire_date ASC;

34.
SELECT * FROM Employee ORDER BY department_id, salary;

35.
SELECT department_id, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY total_salary;

36.
SELECT e.name AS employee_name, d.name AS department_name 
FROM Employee e 
JOIN Department d ON e.department_id = d.department_id;

37.
SELECT p.name AS project_name, d.name AS department_name 
FROM Project p 
JOIN Department d ON p.department_id = d.department_id;

38.
SELECT e.name AS employee_name, p.name AS project_name 
FROM Employee e 
JOIN Project p ON e.department_id = p.department_id;

39.
SELECT e.name, d.name 
FROM Employee e 
LEFT JOIN Department d ON e.department_id = d.department_id;

40.
SELECT d.name, e.name 
FROM Department d 
LEFT JOIN Employee e ON d.department_id = e.department_id;

41.
SELECT e.name 
FROM Employee e 
LEFT JOIN Project p ON e.department_id = p.department_id 
WHERE p.project_id IS NULL;

42.
SELECT e.name, COUNT(p.project_id) AS project_count 
FROM Employee e 
LEFT JOIN Project p ON e.department_id = p.department_id 
GROUP BY e.name;

43.
SELECT d.name 
FROM Department d 
LEFT JOIN Employee e ON d.department_id = e.department_id 
WHERE e.emp_id IS NULL;

44.
SELECT name 
FROM Employee 
WHERE department_id = (SELECT department_id FROM Employee WHERE name = 'John Doe') 
AND name <> 'John Doe';

45.
SELECT d.name 
FROM Department d 
JOIN Employee e ON d.department_id = e.department_id 
GROUP BY d.name 
ORDER BY AVG(e.salary) DESC 
LIMIT 1;

46.
SELECT * FROM Employee WHERE salary = (SELECT MAX(salary) FROM Employee);

47.
SELECT * FROM Employee WHERE salary > (SELECT AVG(salary) FROM Employee);

48.
SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);

49.
SELECT department_id 
FROM Employee 
GROUP BY department_id 
ORDER BY COUNT(*) DESC 
LIMIT 1;

50.
SELECT * FROM Employee e1 
WHERE salary > (SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

51.
SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 2;

52.
SELECT * FROM Employee 
WHERE age > ALL (SELECT age FROM Employee WHERE department_id = (SELECT department_id FROM Department WHERE name = 'HR'));

53.
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

54.
SELECT * FROM Employee 
WHERE department_id IN (SELECT department_id FROM Project GROUP BY department_id HAVING COUNT(*) >= 2);

55.
SELECT * FROM Employee 
WHERE hire_date = (SELECT hire_date FROM Employee WHERE name = 'Jane Smith') 
AND name <> 'Jane Smith';

56.
SELECT SUM(salary) FROM Employee WHERE hire_date LIKE '2020%';

57.
SELECT department_id, AVG(salary) AS avg_sal 
FROM Employee 
GROUP BY department_id 
ORDER BY avg_sal DESC;

58.
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

59.
SELECT * FROM Employee 
WHERE hire_date >= '2022-01-01' 
ORDER BY hire_date;

60.
SELECT department_id, COUNT(*), AVG(salary) 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

61.
SELECT name, salary 
FROM Employee e1 
WHERE salary > (SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

62.
SELECT name FROM Employee 
WHERE hire_date = (SELECT hire_date FROM Employee WHERE age = (SELECT MAX(age) FROM Employee));

63.
SELECT d.name, COUNT(p.project_id) AS project_count 
FROM Department d 
LEFT JOIN Project p ON d.department_id = p.department_id 
GROUP BY d.name 
ORDER BY project_count;

64.
SELECT name FROM Employee e1 
WHERE salary = (SELECT MAX(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

65.
SELECT name, salary FROM Employee e1 
WHERE age > (SELECT AVG(age) FROM Employee e2 WHERE e1.department_id = e2.department_id);


README: DATABASE DOCUMENTATION

SCHEMA:
Employee: [emp_id, name, age, salary, department_id, hire_date]
Department: [department_id, name]
Project: [project_id, name, department_id]

NOTES:
- This file contains SQL queries for questions 31-65.
- Queries are formatted for standard SQL environments.
- For the "Nth salary" query (51), OFFSET 2 retrieves the 3rd highest salary.
