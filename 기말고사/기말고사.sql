-- 학생 테이블
CREATE TABLE 학생 (
    학번 INT PRIMARY KEY,
    학생명 VARCHAR(50)
);

-- 교수 테이블
CREATE TABLE 교수 (
    교번 INT PRIMARY KEY,
    교수명 VARCHAR(50),
    강의실번호 INT,
    과목번호 INT,
	FOREIGN KEY (강의실번호) REFERENCES 강의실(강의실번호),
    FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);

-- 과목 테이블
CREATE TABLE 과목 (
    과목번호 INT PRIMARY KEY,
    과목명 VARCHAR(50),
    학번 INT,
    교번 INT,
    강의실번호 INT,
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (교번) REFERENCES 교수(교번),
    FOREIGN KEY (강의실번호) REFERENCES 강의실(강의실번호)
);

-- 강의실 테이블
CREATE TABLE 강의실 (
    강의실번호 INT PRIMARY KEY,
    좌석수 INT,
    과목번호 INT,
    교번 INT,
    FOREIGN KEY (과목번호) REFERENCES 과목(과목번호),
    FOREIGN KEY (교번) REFERENCES 교수(교번)
);

SELECT * FROM 학생;
SELECT * FROM 교수;
SELECT * FROM 과목;
SELECT * FROM 강의실;