USE employee_payroll;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    emp_id INT,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    total_salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales');

INSERT INTO employees VALUES
(101, 'Amit Kumar', 'Manager', '2020-05-15', 1),
(102, 'Sneha Sharma', 'Accountant', '2021-01-10', 2),
(103, 'Ravi Patel', 'Developer', '2019-03-12', 3),
(104, 'Anita Verma', 'Sales Executive', '2022-02-25', 4),
(105, 'Vikas Singh', 'Developer', '2021-07-30', 3);

INSERT INTO salaries (emp_id, basic_salary, bonus) VALUES
(101, 50000, 10000),
(102, 40000, 5000),
(103, 55000, 8000),
(104, 30000, 4000),
(105, 45000, 7000);



select * from departments;
select * from employees;
select * from salaries;


