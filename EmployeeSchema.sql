CREATE TABLE employees(
	emp_no  SERIAL PRIMARY KEY, 
	birth_date DATE,
	first_name VARCHAR(30) Not Null,
	last_name VARCHAR(30) Not Null,
	gender VARCHAR(10),
	hire_date DATE
);

SELECT *
FROM employees;

-- "dept_no","dept_name"
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

SELECT *
FROM departments;


-- emp_no,salary,from_date,to_date

CREATE TABLE salaries(
	emp_no  INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL,
	from_date DATE, 
	to_date DATE
);

SELECT *
FROM salaries;

-- "emp_no","title","from_date","to_date"
CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR (30) NOT NULL,
	from_date DATE,
	to_date DATE
);
	
SELECT *
FROM titles;


-- Junction Table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no),
	from_date DATE,
	to_date DATE
);

SELECT *
FROM dept_manager;

--Junction Table
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no),
	from_date DATE,
	to_date DATE
);

SELECT *
FROM dept_emp;