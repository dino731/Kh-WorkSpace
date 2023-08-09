/*
    *DML (DATA MANIPULATION LANGUAGE)
    데이터 조작 언어
    
    테이블에 새로운 데이터를 삽입(INSERT)하거나
    기존의 데이터를 수정(UPDATE)하거나
    삭제 (DELETE)하는 구문
*/

/*
    1. INSERT : 테이블에 새로운 "행"을 추가하는 구문
    
    [표현법]
    
    *INSERT INTO 계열
    
    1. INSERT INTO 테이블명 VALUES(값1,값2,값3,...);
    ->해당 테이블에 존재하는 "모든"칼럼에 대해 추가하고자하는 값을 내가 직접 제시해서
    "한 행" 을 INSERT하고자 할 때 쓰는 표현법
    ** 주의사항 **
    1. 컬럼의 순서, 자료형, 갯수를 맞춰서 VALUES괄호 안에 값을 나열해야 함
    - 부족하게 제시하면 : NOT ENOUGH VALUE 오류
    - 더 많이 제시하면 : TOO MANY VALUE 오류가 발생한다.
*/

INSERT INTO EMPLOYEE
VALUES(900,'민경민','880218-1234567','AA@AAA.COM',01012345678,'D1','J7','S6',1800000,
        0.9,200,SYSDATE,NULL,DEFAULT);

SELECT * FROM EMPLOYEE;
----------------------------------------------------------------------------------

/*
    2. INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3...)
    VALUES(값1, 값2, 값3,...)
    => 해당 테이블에 "특정"컬럼만 선택해서 그 컬럼에 추가할 값만 제시하고자 할 때 사용
    - 그래도 한행단위로 추가되기 때문에 선택 안된 칼럼은 NULL값이 들어감(단, DEFAULT설정이 되어 있을 경우 그 값이 들어감)
    주의 사항 : NOT NULL 제약 조건이 걸려있는 컬럼은 반드시 선택해서 직접 값을 제시해야한다.
                단, DEFAULT설정이 되어 있다면 선택 안해도된다.
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, DEPT_CODE, JOB_CODE, SAL_LEVEL)
VALUES(901,'민경민2', '123456-1234567','D1','J6','S5');

SELECT * FROM EMPLOYEE WHERE EMP_ID = 901;

/*
    3. INSERT INTO 테이블명 (서브쿼리);
    =>VALUES()로 값을 직접 기입하는 것이 아니라
        서브쿼리로 조회한 값을 통째로 INSERT하는 구문
        즉, 여러행을 한번에 INSERT 할 수 있다.
*/

-- 새로운 테이블 생성

CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    DEPT_TITLE VARCHAR2(20)
);
-- 전체 사원들의 사번, 이름, 부서명을 조회한 결과를 EMP_01테이블에 통째로 추가
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

-- 2.INSERT
INSERT INTO EMP_01(
                    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
                    FROM EMPLOYEE
                    LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
);

/*
    *INSERT ALL 계열
    두 개 이상의 테이블에 각각 INSERT할 때 사용
    조건 : 그 때 사용되는 서브쿼리가 동일해야 한다.
    
    1.  INSERT ALL
        INTO 테이블명1 VALUES(컬럼명, 컬럼명, ...)
        INTO 테이블명1 VALUES(컬럼명, 컬럼명, ...)
            서브쿼리;
    
*/
-- 새로운 테이블을 먼저 만들기
-- 첫번째 테이블 : 급여가 300만원 이상인 사원들의 사번, 사원명, 직급명을 보관할 테이블
-- 테이블명 : EMP_JOB / EMP_ID(NUMBER), EMP_NAME(VARCHAR(30), JOB_NAME(VARCHAR2(20)
CREATE TABLE EMP_JOB(
    EMP_ID NUMBER ,
    EMP_NAME VARCHAR2(30),
    JOB_NAME VARCHAR2(20)
);


-- 첫번째 테이블 : 급여가 300만원 이상인 사원들의 사번, 사원명, 직급명을 보관할 테이블
-- 테이블명 : EMP_DEPT / EMP_ID(NUMBER), EMP_NAME(VARCHAR(30), DEPT_TITLE(VARCHAR2(20)
CREATE TABLE EMP_DEPT(
    EMP_ID NUMBER ,
    EMP_NAME VARCHAR2(30),
    JOB_NAME VARCHAR2(20)
);

--  급여가 300만원 이상인 사원들의 사번, 이름, 직급명, 부서명 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE SALARY >= 3000000;
-- EMP_JOB 테이블에는 급여가 300만원 이상인 사원들의 EMP_ID, EMP_NAME, JOB_NAME 삽입
-- EMP_DEPT 테이블에는 급여가 300만원 이상인 사원들의 EMP_ID, EMP_NAME, DEPT_TITLE을 삽입
INSERT ALL
INTO EMP_JOB VALUES(EMP_ID, EMP_NAME, JOB_NAME)
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_TITLE)
    SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
    FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE SALARY >= 3000000;
    
SELECT * FROM EMP_JOB;
SELECT * FROM EMP_DEPT;
---------------------------------------------------------------------------

/*
    2. INSERT ALL
        WHEN 조건1 THEN
            INTO 테이블명 1 VALUES(컬럼명, 컬러명,...)
        WHEN 조건2 THEN
            INTO 테이블명2 VALUES(컬럼명, 컬럼명,...)
        서브쿼리
        
        - 조건에 맞는 값들만 넣겠다
*/
-- 조건을 사용해서 각 테이블에 값 INSERT
-- 새로운 테스트용 테이블 생성
-- 2010년도 기준으로 이전에 입사한 사원들의 사번, 사원명, 입사일, 급여를 담는 테이블 (EMP_OLD)
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;

-- 2010년도 기준으로 이후에(2010년 포함) 입사한 사원들의 사번, 사원명, 입사일, 급여를 담는 테이블 (EMP_NEW)
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;


-- 1. 서브쿼리 부분
-- 2010년 이전, 이후
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE
WHERE HIRE_DATE < '2010/01/01'; -- 15

SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE
WHERE HIRE_DATE >= '2010/01/01'; -- 9

INSERT ALL
WHEN HIRE_DATE < '2010/01/01' THEN
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2010/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
    SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY FROM EMPLOYEE;
    
SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

/*
    2. UPDATE
    테이블에 기록된 기존의 데이터를 수정하는 구문
    [표현법]
    UPDATE 테이블명
    SET 컬럼명 = 바꿀 값,
        컬럼명 = 바꿀 값,
        ... -- 여러개의 컬럼값을 동시변경 가능 이때 AND가 아니라 , 로 나열한다
        WHERE 조건; -- WHERE절은 생략 가능한데, 생략시 모든 테이블의 모든행이 바뀌게 된다
*/
CREATE TABLE DEPT_COPY
AS SELECT *
    FROM DEPARTMENT;
SELECT * FROM DEPT_COPY;

-- DEPT_COPY 테이블에서 D9부서의 부서명을 전략기획팀으로 수정
UPDATE DEPT_COPY
SET DEPT_TITLE = '전략기획팀'; -- 9개 행이 수정
-- 전체 행의 모든 DEPT_TITLE 값들이 모두 전략기획팀으로 수정됨.

-- 참고. 변경사항에 대해서 되돌리는 명령어 : ROLLBACK;
ROLLBACK;

UPDATE DEPT_COPY
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9';

SELECT * FROM DEPT_COPY;

CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE;
SELECT * FROM EMP_SALARY;

-- EMP_SALARY 테이블에서 노옹철 사원의 급여를 1000만원으로 변경
UPDATE EMP_SALARY
SET SALARY = 10000000
WHERE EMP_NAME = '노옹철';
SELECT * FROM EMP_SALARY;

-- EMP_SALARY 테이블에서 선동일 사원의 급여를 700만원 보너스를 0.2로 변경
UPDATE EMP_SALARY
SET SALARY = 7000000,
    BONUS = 0.2
WHERE EMP_NAME = '선동일';
SELECT * FROM EMP_SALARY;

-- EMP_SALARY 테이블에서 전체사원의 급여를 기존의 급여에 20% 인상한 금액으로 변경
UPDATE EMP_SALARY
SET SALARY = SALARY * 1.2;
SELECT * FROM EMP_SALARY;

/*
    UPDATE시 서브쿼리 사용
    서브쿼리를 수행한 결과 값으로 기존의 값으로 부터 변경하겠다.
    
    - CREATE시에 서브쿼리 사용시 : 서브쿼리 수행한 결과로 테이블을 만들겠다.
    - INSERT 시에 서브쿼리 사용시 : 서브쿼리 수행한 결과를 해당 테이블에 새롭게 삽입하겠다.
    
    [표현법]
    UPDATE 테이블명
    SET 컬럼명 = (서브쿼리)
    WHERE 조건; 
*/
-- EMP_SALARY 테이블에 민경민 사원의 부서코드를 선동일 사원의 부서코드로 변경
UPDATE EMP_SALARY
SET DEPT_CODE = (
                    SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '선동일'
                    )
WHERE EMP_NAME = '민경민';
SELECT * FROM EMP_SALARY;

--  방명수 사원의 급여와 보너스를 유재식 사원의 급여와 보너스 값으로 변경.
UPDATE EMP_SALARY
--SET SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '유재식'),
--    BONUS = (SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME = '유재식')
SET(SALARY , BONUS) = (SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식')
WHERE EMP_NAME = '방명수';
SELECT * FROM EMP_SALARY;
-- 주의사항 : UPDATE시에도 변경할 값에 대해서 해당 칼럼의 제약조건에 위배되면 안됨.
-- 송종기 사원의 사번을 200
UPDATE EMPLOYEE
SET EMP_ID = 200
WHERE EMP_NAME = '송종기';
-- unique constrain (KH.EMPLOYEE_PK)violated : PRIMARY KEY 제약조건 위배.

UPDATE EMPLOYEE
SET EMP_NAME = NULL
WHERE EMP_NAME = '송종기';
-- ORA-01407: cannot update ("KH"."EMPLOYEE"."EMP_NAME") to NULL
--NOT NULL 제약조건 위배.
COMMIT;
-- 모든 변경사항을 확정하는 명령어
/*
    4. DELETE
    테이블에 기록된 데이터를 "행"단위로 삭제하는 구문
    [표현법]
    DELETE FROM 테이블명
    WHERE 조건; -- WHERE 절 생략 가능. 단, 생략시 해당 테이블의 모든 행이 삭제.
*/
DELETE FROM EMPLOYEE;   -- 지우기
SELECT * FROM EMPLOYEE; -- 확인
ROLLBACK;               -- 되돌리기. 마지막 커밋 시점으로 돌아간다.

--EMPLOYEE 테이블로 부터 민경민, 민경민2 사원의 정보를 지우기
DELETE FROM EMPLOYEE
WHERE EMP_NAME IN ('민경민','민경민2');

COMMIT;

-- DEPARTMENT 테이블로 부터 DEPT_ID 가 D1인 부서를 삭제.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';
ROLLBACK;
/*
    *TRUNCATE : 테이블의 전체 행을 다 삭제할 때 사용하는 구문
                DELETE 구문보다 수행속도가 훨씬 빠름
                별도의 조건을 제시 불가
                ROLLBACK이 불가능함. (신중하게 삭제해야 한다)
                
    [표현법]
    TRUNCATE TABLE 테이블명;
    
    DELETE 구문과 비교
        TRUNCATE TABLE 테이블명;            |       DELETE FROM 테이블명;
        ---------------------------------------------------------------------
        별도의 조건 제시 불가 (WHERE X)       |      특정조건 제시 가능 (WHERE O)
        수행속도가 빠름                      |      수행속도가 느림
        ROLLBACK 불가능                    |       ROLLBACK 가능
*/
SELECT * FROM EMP_SALARY;
DELETE FROM EMP_SALARY;
ROLLBACK; -- DELETE 문은 롤백 가능.
TRUNCATE TABLE EMP_SALARY; -- ROLLBACK을 시켜도 진행은 되는데 복구할 데이터는 없음. (아무것도 안뜸)




