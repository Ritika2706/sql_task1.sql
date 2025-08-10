1-- Create students table:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender CHAR(1),
    city VARCHAR(50)
);

-- Insert data into students table
INSERT INTO students (student_id, name, age, gender, city) VALUES
(1, 'Aarav Sharma', 21, 'M', 'Mumbai'),
(2, 'Priya Verma', 22, 'F', 'Delhi'),
(3, 'Rahul Mehta', 20, 'M', 'Bengaluru'),
(4, 'Sneha Reddy', 23, 'F', 'Hyderabad'),
(5, 'Ankit Kapoor', 24, 'M', 'Pune'),
(6, 'Kavya Joshi', 22, 'F', 'Ahmedabad'),
(7, 'Aman Bhatnagar', 21, 'M', 'Jaipur'),
(8, 'Isha Nair', 22, 'F', 'Kochi'),
(9, 'Rohan Das', 23, 'M', 'Kolkata'),
(10, 'Neha Singh', 20, 'F', 'Chandigarh');

2-- Create enrollments table:
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100),
    semester INT,
    grade VARCHAR(2)
    -- FOREIGN KEY (student_id) REFERENCES students(student_id)
    -- Uncomment the above line if you want to enforce referential integrity
);

-- Insert data into enrollments table
INSERT INTO enrollments (enrollment_id, student_id, course_name, semester, grade) VALUES
(101, 1, 'B.Tech CSE', 5, 'A'),
(102, 2, 'B.Com', 6, 'B'),
(103, 3, 'B.Tech ECE', 4, 'B+'),
(104, 5, 'BBA', 6, 'A-'),
(105, 6, 'B.Sc Physics', 5, 'B'),
(106, 7, 'B.Tech IT', 4, 'A+'),
(107, 8, 'B.A Economics', 5, 'B'),
(108, 11, 'B.Tech CSE', 3, 'A'),     
(109, 12, 'B.Com', 6, 'C+'),         
(110, 4, 'B.Sc Chemistry', 6, 'A');

 students Table
student_id	name	age	gender	city
1	Aarav Sharma	21	M	Mumbai
2	Priya Verma	22	F	Delhi
3	Rahul Mehta	20	M	Bengaluru
4	Sneha Reddy	23	F	Hyderabad
5	Ankit Kapoor	24	M	Pune
6	Kavya Joshi	22	F	Ahmedabad
7	Aman Bhatnagar	21	M	Jaipur
8	Isha Nair	22	F	Kochi
9	Rohan Das	23	M	Kolkata
10	Neha Singh	20	F	Chandigarh

enrollments Table
enrollment_id	student_id	course_name	semester	grade
101	            1	         B.Tech CSE	   5	          A
102	            2	         B.Com	           6	          B
103	            3	         B.Tech ECE    	   4	          B+
104	            5	         BBA	           6	          A-
105	            6	         B.Sc Physics	   5	          B
106	            7	         B.Tech IT	   4	          A+
107	            8	         B.A Economics	   5	          B
108	            11	         B.Tech CSE	   3	          A
109	            12	         B.Com	           6	          C+
110	            4	         B.Sc Chemistry	   6	          A

A.INNER JOIN
SELECT s.student_id, s.name, s.city, e.course_name, e.grade
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id;

B. LEFT JOIN
SELECT s.student_id, s.name, s.city, e.course_name, e.grade
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id;

C. RIGHT JOIN
SELECT s.student_id, s.name, s.city, e.course_name, e.grade
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id;

D. FULL OUTER JOIN:
SELECT s.student_id, s.name, s.city, e.course_name, e.grade
FROM students s
FULL OUTER JOIN enrollments e ON s.student_id = e.student_id;
