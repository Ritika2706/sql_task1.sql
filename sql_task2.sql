TASK 2:
-- Create student_scores table
CREATE TABLE student_scores (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50),
    semester INT,
    marks INT,
    city VARCHAR(50)
);

-- Insert data into student_scores table:
INSERT INTO student_scores (student_id, student_name, course, semester, marks, city) VALUES
(1, 'Aarav Sharma', 'B.Tech CSE', 1, 85, 'Mumbai'),
(2, 'Priya Verma', 'B.Tech CSE', 1, 78, 'Delhi'),
(3, 'Rahul Mehta', 'B.Tech CSE', 2, 82, 'Bengaluru'),
(4, 'Sneha Reddy', 'B.Tech CSE', 2, 91, 'Hyderabad'),
(5, 'Ankit Kapoor', 'B.Tech CSE', 3, 76, 'Pune'),
(6, 'Kavya Joshi', 'B.Tech CSE', 3, 88, 'Ahmedabad'),
(7, 'Aman Bhatnagar', 'BBA', 1, 74, 'Jaipur'),
(8, 'Isha Nair', 'BBA', 2, 80, 'Kochi'),
(9, 'Rohan Das', 'BBA', 3, 67, 'Kolkata'),
(10, 'Neha Singh', 'BBA', 3, 84, 'Chandigarh'),
(11, 'Aditya Chatterji', 'B.Sc Physics', 1, 79, 'Mumbai'),
(12, 'Meera Patel', 'B.Sc Physics', 2, 83, 'Vadodara'),
(13, 'Tanvi Rao', 'B.Sc Physics', 2, 86, 'Chennai'),
(14, 'Yash Gupta', 'B.Sc Physics', 3, 72, 'Lucknow'),
(15, 'Divya Iyer', 'B.Sc Physics', 3, 89, 'Coimbatore');

student_scores Table:
student_id	student_name	course	    semester	marks	city
1	        Aarav Sharma	B.Tech CSE	1	85	Mumbai
2	        Priya Verma	B.Tech CSE	1	78	Delhi
3	        Rahul Mehta	B.Tech CSE	2	82	Bengaluru
4	        Sneha Reddy	B.Tech CSE	2	91	Hyderabad
5	        Ankit Kapoor	B.Tech CSE	3	76	Pune
6	        Kavya Joshi	B.Tech CSE	3	88	Ahmedabad
7	        Aman Bhatnagar	BBA	        1	74	Jaipur
8	        Isha Nair	BBA	        2	80	Kochi
9	        Rohan Das	BBA	        3	67	Kolkata
10	        Neha Singh	BBA	        3	84	Chandigarh
11	      Aditya Chatterji  B.Sc Physics	1	79	Mumbai
12	        Meera Patel	B.Sc Physics	2	83	Vadodara
13	        Tanvi Rao	B.Sc Physics	2	86	Chennai
14	        Yash Gupta	B.Sc Physics	3	72	Lucknow
15	        Divya Iyer	B.Sc Physics	3	89	Coimbatore

A. CTE + Window Function: Rank students within each course
WITH RankedScores AS (
    SELECT 
        student_id,
        student_name,
        course,
        semester,
        marks,
        RANK() OVER (PARTITION BY course ORDER BY marks DESC) AS course_rank
    FROM student_scores
)
SELECT * FROM RankedScores
WHERE course_rank <= 3;

B. Subquery: Average marks by course
SELECT 
    student_id,
    student_name,
    course,
    marks,
    (SELECT AVG(marks) 
     FROM student_scores s2 
     WHERE s2.course = s1.course) AS avg_course_marks
FROM student_scores s1;

C. Window Function: Running average over semesters per course
SELECT 
    student_id,
    student_name,
    course,
    semester,
    marks,
    ROUND(AVG(marks) OVER (PARTITION BY course ORDER BY semester ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS running_avg
FROM student_scores;

D. CTE + Aggregation: Course-wise performance trend
WITH CourseAvg AS (
    SELECT 
        course,
        semester,
        AVG(marks) AS avg_marks
    FROM student_scores
    GROUP BY course, semester
)
SELECT * FROM CourseAvg
ORDER BY course, semester;

E. Combined: High performers above course average
WITH CourseAvg AS (
    SELECT 
        course,
        AVG(marks) AS avg_marks
    FROM student_scores
    GROUP BY course
)
SELECT 
    s.student_name,
    s.course,
    s.marks,
    c.avg_marks
FROM student_scores s
JOIN CourseAvg c ON s.course = c.course
WHERE s.marks > c.avg_marks

