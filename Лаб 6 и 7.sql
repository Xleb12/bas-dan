--lab 6
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    start_year int
);
CREATE Table Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT CHECK(credits>0)
);
CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE,
    grade char(1),
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO Students(student_id, full_name, email, start_year) VALUES
(DEFAULT, 'Алексей Смирнов', 'alex_sm@inbox.ru', 2021),
(DEFAULT, 'Елена Кузницова', 'elena_ky@inbox.ru', 2022),
(DEFAULT, 'Дмитрий Новиков', 'dima_now@inbox.ru', 2021),
(DEFAULT, 'Ольга Морозова', 'oliga_moroz@inbox.ru', 2023);
INSERT INTO Courses(course_id, course_name, credits) VALUES
(DEFAULT, 'Введение в програмирование', 5),
(DEFAULT, 'Базы данных', 4),
(DEFAULT, 'Веб-технологии', 4);
INSERT INTO Enrollments(student_id, course_id, grade) VALUES
(1, 2, 'A'),
(2, 2, 'B'),
(2, 1, 'A'),
(3, 1, NULL),
(3, 2, NULL),
(3, 3, NULL);
UPDATE Students
SET email = 'elena.kuznetsova@newmail.com'
WHERE full_name = 'Елена Кузницова';
UPDATE Enrollments
SET grade = 'A'
WHERE student_id = '3' AND course_id = '1';
DELETE FROM Students
WHERE full_name = 'Ольга Морозова';

--lab 7

SELECT * FROM Students;
SELECT course_name, credits FROM Courses;
SELECT * FROM Students WHERE start_year = 2021;
SELECT * FROM Courses where credits>4;
SELECT * from Students where email = 'elena.kuznetsova@newmail.com';
SELECT * from Students where full_name LIKE 'Дмитрий %';
SELECT * FROM Enrollments where grade is NULL;
SELECT * FROM Courses ORDER BY course_name;
SELECT * FROM Students ORDER BY start_year, full_name;
SELECT * FROM Students ORDER BY start_year DESC LIMIT 2;