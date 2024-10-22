-- 테이블 생성하기 (4개)
CREATE TABLE teacher (
	id bigserial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO teacher (first_name, last_name)
VALUES ('Taylah', 'Booker'),
       ('Sarah-Louise', 'Blake');

CREATE TABLE course (
	id bigserial PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

INSERT INTO course (name, teacher_id)
VALUES ('Database design', 1),
       ('English literature', 2),
       ('Python programming', 1);

CREATE TABLE student (
	id bigserial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO student (first_name, last_name)
VALUES ('Shreya', 'Bain'),
       ('Rianna', 'Foster'),
       ('Yosef', 'Naylor');

CREATE TABLE student_course (
    student_id bigserial,
    course_id bigserial
);

INSERT INTO student_course (student_id, course_id)
VALUES (1, 2),
       (1, 3),
       (2, 1),
       (2, 2),
       (2, 3),
       (3, 1);

SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM student;
SELECT * FROM student_course;

-- 조인문 사용하기 (3개)
-- 1. student 테이블을 student_course에 조인하세요.
SELECT student.id, student.first_name, student.last_name, student_course.course_id FROM student
JOIN student_course ON student.id = student_course.student_id;

-- 2. teacher 테이블을 course에 조인하세요.
SELECT course.id, course.name, teacher.first_name, teacher.last_name FROM course
JOIN teacher ON course.teacher_id = teacher.id;

-- 3. course 테이블을 Student_course에 조인하세요.
SELECT course.id, course.name, student_course.student_id FROM course
JOIN student_course ON course.id = student_course.course_id;

-- SELECT문 사용하여 데이터 탐색하기 (3개)
-- 1. 데이터베이스 설계 (Database Design)에 등록한 모든 학생의 이름을 표시합니다.
SELECT * FROM student;

-- 2. Taylah Brooker가 가르친 모든 과정을 표시합니다.
SELECT name FROM course
WHERE teacher_id = (SELECT id FROM teacher WHERE first_name = 'Taylah' AND last_name = 'Booker');

-- 3. 성이 "B"로 시작하는 모든 학생과 교사를 표시합니다.
SELECT * FROM student
WHERE last_name LIKE 'B%'

UNION

SELECT * FROM teacher 
WHERE last_name LIKE 'B%';
