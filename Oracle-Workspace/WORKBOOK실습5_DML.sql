--1 
INSERT INTO TB_CLASS_TYPE VALUES('','');
INSERT INTO TB_CLASS_TYPE VALUES('04','교양선택');
INSERT INTO TB_CLASS_TYPE VALUES('05','');

--2 
CREATE TABLE TB_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT;

SELECT * FROM TB_학생일반정보;
--3
CREATE TABLE TB_국어국문학과
AS SELECT  STUDENT_NO, STUDENT_NAME, EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,2),'RR'))출생년도,
            PROFESSOR_NAME
FROM TB_STUDENT T
LEFT JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE T.DEPARTMENT_NO = (
                            SELECT DEPARTMENT_NO
                            FROM TB_DEPARTMENT
                            WHERE DEPARTMENT_NAME = '국어국문학과'
                        );

--4 
UPDATE TB_DEPARTMENT
SET CAPACITY = ROUND(CAPACITY*1.1);

--5
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
WHERE STUDENT_NO = 'A413042';

--6
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);

-- 7
UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = (
                    SELECT STUDENT_NO
                    FROM TB_STUDENT
                    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
                    WHERE STUDENT_NAME ='김명훈' AND
                    DEPARTMENT_NAME = '의학과'
                    )
    AND CLASS_NO = (
                    SELECT *
                    FROM TB_CLASS
                    WHERE CLASS_NAME = '피부생리학'
                    )
    AND TERM_NO = '200501';

DELETE FROM TB_GRADE
WHERE STUDENT_NO IN (
                    SELECT STUDENT_NO
                    FROM TB_STUDENT
                    WHERE ABSENCE_YN ='Y'
                    );







