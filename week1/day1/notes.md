
# SQL Practice Queries: Basic to Order By

## 1. Basic Queries
-- 1. Select all columns from the Employee table.
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments.
SELECT name FROM Department;

-- 5. Select employees who work in the IT department.
SELECT * FROM Employee 
WHERE department_id = (SELECT department_id FROM Department WHERE name = 'IT');

---

## 2. String Matching Queries
-- 6. Select employees whose names start with 'J'.
SELECT * FROM Employee WHERE name LIKE 'J%';

-- 7. Select employees whose names end with 'e'.
SELECT * FROM Employee WHERE name LIKE '%e';

-- 8. Select employees whose names contain 'a'.
SELECT * FROM Employee WHERE name LIKE '%a%';

-- 9. Select employees whose names are exactly 9 characters long.
SELECT * FROM Employee WHERE name LIKE '_________';

-- 10. Select employees whose names have 'o' as the second character.
SELECT * FROM Employee WHERE name LIKE '_o%';

---

## 3. Date Queries
-- 11. Select employees hired in the year 2020.
SELECT * FROM Employee WHERE hire_date BETWEEN '2020-01-01' AND '2020-12-31';

-- 12. Select employees hired in January of any year.
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

-- 13. Select employees hired before 2019.
SELECT * FROM Employee WHERE hire_date < '2019-01-01';

-- 14. Select employees hired on or after March 1, 2021.
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

-- 15. Select employees hired in the last 2 years.
SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

---

## 4. Aggregate Queries
-- 16. Select the total salary of all employees.
SELECT SUM(salary) FROM Employee;

-- 17. Select the average salary of employees.
SELECT AVG(salary) FROM Employee;

-- 18. Select the minimum salary in the Employee table.
SELECT MIN(salary) FROM Employee;

-- 19. Select the number of employees in each department.
SELECT department_id, COUNT(*) FROM Employee GROUP BY department_id;

-- 20. Select the average salary of employees in each department.
SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id;

---

## 5. Group By Queries
-- 21. Select the total salary for each department.
SELECT department_id, SUM(salary) FROM Employee GROUP BY department_id;

-- 22. Select the average age of employees in each department.
SELECT department_id, AVG(age) FROM Employee GROUP BY department_id;

-- 23. Select the number of employees hired in each year.
SELECT YEAR(hire_date), COUNT(*) FROM Employee GROUP BY YEAR(hire_date);

-- 24. Select the highest salary in each department.
SELECT department_id, MAX(salary) FROM Employee GROUP BY department_id;

-- 25. Select the department with the highest average salary.
SELECT department_id FROM Employee 
GROUP BY department_id 
ORDER BY AVG(salary) DESC 
LIMIT 1;

---

## 6. Having Queries
-- 26. Select departments with more than 2 employees.
SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

-- 27. Select departments with an average salary greater than 55000.
SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

-- 28. Select years with more than 1 employee hired.
SELECT YEAR(hire_date) FROM Employee 
GROUP BY YEAR(hire_date) 
HAVING COUNT(*) > 1;

-- 29. Select departments with a total salary expense less than 100000.
SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING SUM(salary) < 100000;

-- 30. Select departments with the maximum salary above 75000.
SELECT department_id FROM Employee 
GROUP BY department_id 
HAVING MAX(salary) > 75000;

---

## 7. Order By Queries
-- 31. Select all employees ordered by their salary in ascending order.
SELECT * FROM Employee ORDER BY salary ASC;

-- 32. Select all employees ordered by their age in descending order.
SELECT * FROM Employee ORDER BY age DESC;

-- 33. Select all employees ordered by their hire date in ascending order.
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34. Select employees ordered by their department and then by their salary.
SELECT * FROM Employee ORDER BY department_id, salary;

-- 35. Select departments ordered by the total salary of their employees.
SELECT department_id, SUM(salary) as total_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY total_salary DESC;
