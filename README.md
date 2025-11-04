
# 💼 Employee Payroll Management System (SQL Project)

## 📘 Project Overview
This project is a **SQL-based Employee Payroll Management System** that demonstrates how to design and query a relational database.  
It includes **Employees**, **Departments**, and **Salaries** tables with relationships between them.

---

## 🧩 ER Diagram
The database design follows a **3-table relational schema**:

- **departments** → Stores department details  
- **employees** → Stores employee personal & job details  
- **salaries** → Stores salary-related information

## 🏗️ Database Schema
### Create Tables
All schema definitions are available in `create_tables.sql`.

```sql
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
