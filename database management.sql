CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Students (name, date_of_birth, email, phone, address) VALUES
('Abhijeet Jadhav', '2000-01-15', 'abhijeet@gmail.com', '555-1234', '123 Elm St'),
('Dhruv Shinde', '1999-05-22', 'dhruv@gmail.com', '555-5678', '456 Oak St'),
('Chandan Gupta', '2001-02-28', 'chandan.gupta@gmail.com', '555-9101', '789 Pine St'),
('Saeesh Ghogale', '2000-11-30', 'saeesh@gmail.com', '555-1213', '234 Maple St');

INSERT INTO Courses (course_name, credits, department) VALUES
('Introduction to Programming', 3, 'Computer Science'),
('Database Management', 3, 'Information Technology'),
('Web Development', 4, 'Computer Science'),
('Data Structures', 3, 'Computer Science');

INSERT INTO Enrollments (student_id, course_id, semester, grade) VALUES
(1, 1, 'Fall 2023', 'A'),
(1, 2, 'Fall 2023', 'B'),
(2, 1, 'Spring 2024', 'A'),
(3, 3, 'Fall 2023', 'C'),
(4, 4, 'Spring 2024', 'B'),
(2, 2, 'Fall 2023', 'A');

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Enrollments;

SELECT * FROM Students 
WHERE name = 'Abhijeet Jadhav';

SELECT c.course_name, e.semester, e.grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
WHERE e.student_id = 1; 

SELECT s.name, e.semester, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
WHERE e.course_id = 2; 

SELECT c.course_name, COUNT(e.student_id) AS total_enrolled
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_id;

SELECT s.name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
WHERE e.grade = 'A' AND e.course_id = 1; 

UPDATE Students 
SET email = 'new.email@example.com' 
WHERE student_id = 1; 

DELETE FROM Enrollments 
WHERE enrollment_id = 2; 

DROP  DATABASE StudentManagement;

















