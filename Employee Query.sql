
-- question(1) display all employee details with salary

SELECT e.emp_id, e.name, e.position, d.dept_name, s.basic_salary, s.bonus, s.total_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;

-- question(2)
-- Find employees earning more than average salary

select avg(basic_salary) from salaries
where basic_salary >( select avg(basic_salary) from salaries);

SELECT name, basic_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE basic_salary > (SELECT AVG(basic_salary) FROM salaries);


-- question (3)
-- Total salary expense by department

select d.dept_name, sum(s.total_salary) as total_expense
from salaries s
join employees e on s.emp_id = e.emp_id
join departments d on e.dept_id = d.dept_id
group by d.dept_name;

-- Question 4
-- Rank employees by salary using window function

SELECT e.name, s.total_salary,
       dense_RANK() OVER (ORDER BY s.total_salary DESC) AS salary_rank
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id;


-- question(5)
-- Create Stored Procedure (for report)

DELIMITER //
CREATE PROCEDURE GetDepartmentReport(IN deptName VARCHAR(50))
BEGIN
    SELECT e.name, s.total_salary
    FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    JOIN departments d ON e.dept_id = d.dept_id
    WHERE d.dept_name = deptName;
END //
DELIMITER ;
CALL GetDepartmentReport('IT');


-- question(6)
-- Find Department-wise Average Salary

SELECT d.dept_name, AVG(s.total_salary) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
