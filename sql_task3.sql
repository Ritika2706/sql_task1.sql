TASK 3:
Table: employees (in MySQL)
emp_id	emp_name	department	city	    salary	     joining_date
1	Aarav Sharma	IT	        Mumbai	    65000	2021-01-15
2	Priya Verma	HR	        Delhi	    48000	2021-03-12
3	Rahul Mehta	Finance	        Bengaluru   53000	2021-05-10
4	Sneha Reddy	IT	        Hyderabad   70000	2021-06-22
5	Ankit Kapoor	Sales	        Pune	    45000	2021-07-30
6	Kavya Joshi	HR	        Ahmedabad   47000	2021-08-18
7	Aman Bhatnagar	Marketing	Jaipur	    52000	2021-09-01
8	Isha Nair	IT	        Kochi	    68000	2021-09-12
9	Rohan Das	Finance	        Kolkata	    56000	2021-10-05
10	Neha Singh	Sales	        Chandigarh  46000	2021-11-16
11     Aditya Chatterji HR	        Mumbai	    50000	2021-12-03
12	Meera Patel	Finance	        Vadodara    54000	2022-01-10
13	Tanvi Rao	Marketing	Chennai	    51000	2022-02-22
14	Yash Gupta	IT	        Lucknow	    72000	2022-03-18
15	Divya Iyer	HR	        Coimbatore  49500	2022-04-14


A. Create Schema in PostgreSQL:
CREATE TABLE employees_pg (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary NUMERIC(10, 2),
    joining_date DATE);

B. Export Data from MySQL:
SELECT * FROM employees
INTO OUTFILE '/tmp/employees.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

C. Import Data into PostgreSQL:
-- PostgreSQL: Import CSV
COPY employees_pg(emp_id, emp_name, department, city, salary, joining_date)
FROM '/tmp/employees.csv'
DELIMITER ','
CSV;

D. Data Integrity Checks:
-- Row count check
SELECT COUNT(*) FROM employees_pg;

-- Sample record check
SELECT * FROM employees_pg WHERE emp_id = 4;

-- Salary range validation
SELECT MIN(salary), MAX(salary) FROM employees_pg;

-- Null value check
SELECT * FROM employees_pg
WHERE emp_id IS NULL OR emp_name IS NULL;

