-- CREATE DATABASE dju24;

DROP TABLE teacher;

CREATE TABLE teacher (
	id bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);

INSERT INTO teacher (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D.Roosevelt H.S.', '2011-10-30', 36200),
		('Lee', 'Reynolds', 'F.D.Roosevelt H.S.', '1993-05-22', 65000),
		('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500);

SELECT * from teacher;

TABLE teacher;

-- Week 3 Code

SELECT last_name, school, salary FROM teacher;

SELECT last_name, school, salary FROM teacher
	ORDER BY salary DESC;

SELECT last_name, school, salary FROM teacher
	ORDER BY 1 ASC;

SELECT DISTINCT school FROM teacher ORDER BY school;

-- WHERE 문
SELECT last_name, school, salary FROM teacher
	ORDER BY salary DESC;

SELECT last_name, school, salary FROM teacher
	WHERE salary >= 40000
	ORDER BY salary DESC;

SELECT last_name, school, salary FROM teacher
	WHERE salary BETWEEN 20000 AND 40000
	ORDER BY salary DESC;

SELECT first_name, last_name, school, salary FROM teacher
	WHERE last_name ILIKE 'S%' OR first_name ILIKE 'S%'
	ORDER BY salary DESC;