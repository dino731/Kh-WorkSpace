/*
    * TCL (TRANSACTION CONTROL LANGUAGE)
        트랜잭션을 제어하는 언어
    
    * 트랜잭션()
    - 데이터베이스의 논리적 작업 단위
    - 데이터의 변경사항(DML)들을 하나의 트랜잭션으로 묶어서 처리
      => COMMIT(확정)하기 전까지의 변경 사항들을 하나의 트랜잭션에 담다
    - 트랜잭션의 대상이 되는 SQL : INSERT, UPDATE, DELETE(DML)
    
    * 트랜잭션의 종류
    - COMMIT;   : 하나의 트랜잭션에 담겨있는 변경 사항들을 실제 DB에 반영하겠다는 것을 의미함
                  실제 DB에 반영시킨 후 트랜잭션은 비워짐 => 확정의 개념
    - ROLLBACK; : 하나의 트랜잭션에 담겨있는 변경 사항들을 실제 DB에 반영하지 않겠다 의미.
                  트랜잭션에 담겨있는 변경사항도 다 삭제한 후 마지막 COMMIT 시점으로 돌아감
    - SAVEPOIN 포인트명;    :  현재 이 시점에 임시 저장점을 정의 해두는 것
    - ROLLBACK TO 포인트명; :  전체 변경 사항들을 삭제 (마지막 COMMIT시점까지 돌려놓기)
                            하는 것이 아니라 해당 포인트 지점까지의 트랜잭션을 롤백한다
*/
SELECT * FROM EMP_01; -- 25명

-- 사번이 901인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 901;

-- 900번 사원 삭제
DELETE FROM EMP_01 
WHERE EMP_ID = 900;

ROLLBACK; -- 25명으로 삭제한 사원 다시 복구

-- 사번이 200인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 200;

-- 사번 800, 이름 홍길동, 부서 총무부인 사원 추가
INSERT INTO EMP_01
VALUES(800,'홍길동','총무부');

COMMIT;

SELECT * FROM EMP_01; -- 커밋 후 25명

ROLLBACK; -- COMMIT을 한 시점으로 돌아가기 때문에 롤백해도 변화가 없음 25명(롤백할 데이터가 없다)
-------------------------------------------------------------------------------4
--EMP_01 테이블에서 사번이 217 216, 214인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID IN (217, 216, 214);

SELECT * FROM EMP_01; -- 22명
-- 3개의 행이 삭제된 시점을 SAVEPOINT로 지정
SAVEPOINT SP1;

-- EMP_01 테이블에 사번 801, 이름 김말똥, 부서 인사부인 사원을 추가
INSERT INTO EMP_01
VALUES(801, '김말똥','인사부');

--EMP_01 테이블에 사번이 218인 사원
DELETE FROM EMP_01
WHERE EMP_ID=218;

SELECT * FROM EMP_01; -- SAVEPOINT 지정 전 마지막 SELECT한 시점과 동일한 결과가 나올 것

ROLLBACK TO SP1;-- 22명
COMMIT;

-- 사번이 900, 901인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID IN(900,901);
SELECT * FROM EMP_01; -- 20명

-- 테이블 생성(DDL)
CREATE TABLE TEST(
    TID NUMBER      -- 보이지않지만 DDL 구문(CREATE, ALTER, DROP) 안에 COMMIT이 들어가 있음
);
SELECT * FROM EMP_01; -- 20 명

ROLLBACK;

SELECT * FROM EMP_01; -- 22명(X) 20명(O)
/*
    주의사항 :
    DDL 구문(CREATE, ALTER, DROP)을 실행하는 순간
    기존에 트랜잭션에 있던 모든 변경사항들을 무조건 실제 DB에 반영 시킨 후에 DDL이 수행됨
    => 즉, DDL 수행전에 변경사항이 있었다면 정확하게 픽스(COMMIT OR ROLLBACK)를 하고 DDL을 실행해야 한다.
*/










