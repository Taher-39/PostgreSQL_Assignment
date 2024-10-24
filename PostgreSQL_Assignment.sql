-- Active: 1729749757999@@127.0.0.1@5432@university_db@public

--Create a "students" table with the following fields
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(20) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(20) NOT NULL,
    frontend_mark INTEGER NOT NULL,
    backend_mark INTEGER NOT NULL,
    status VARCHAR(10)
);

--Create a "courses" table with the following fields
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(20) NOT NULL,
    credits INTEGER NOT NULL
);
--Create a "enrollment" table with the following fields
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students (student_id),
    course_id INT REFERENCES courses (course_id)
);

--Query 1:
--Insert students record with the following details:

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Sameer',
        21,
        'sameer@example.com',
        48,
        60,
        NULL
    ),
    (
        'Zoya',
        23,
        'zoya@example.com',
        52,
        58,
        NULL
    ),
    (
        'Nabil',
        22,
        'nabil@example.com',
        37,
        46,
        NULL
    ),
    (
        'Rafi',
        24,
        'rafi@example.com',
        41,
        40,
        NULL
    ),
    (
        'Sophia',
        22,
        'sophia@example.com',
        50,
        52,
        NULL
    ),
    (
        'Hasan',
        23,
        'hasan@gmail.com',
        43,
        39,
        NULL
    );

--Insert courses record with the following details:
INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3);

--Insert enrollment record with the following details:
INSERT INTO
    enrollment (student_id, course_id)
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

--Query 2:
--Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

SELECT s.student_name
from
    enrollment e
    INNER JOIN students s ON e.student_id = s.student_id
    INNER JOIN courses c ON e.course_id = c.course_id
WHERE
    c.course_name = 'Next.js'

--Query 3:
--Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET
    status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
        SELECT MAX(frontend_mark + backend_mark)
        FROM students
    );


-- Query 4:
-- Delete all courses that have no students enrolled.
DELETE FROM courses WHERE course_id NOT IN ( SELECT course_id FROM enrollment)

-- Query 5:
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name from students LIMIT 2 OFFSET 1;

-- Query 6:
-- Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
    JOIN enrollment e ON c.course_id = e.course_id
GROUP BY
    c.course_name
HAVING
    COUNT(e.student_id) > 0;

--Query 7:
-- Calculate and display the average age of all students.
SELECT ROUND(AVG(age), 2) AS average_age FROM students;

-- Query 8:
-- Retrieve the names of students whose email addresses contain 'example.com'.

SELECT student_name FROM students WHERE email LIKE '%example.com%';