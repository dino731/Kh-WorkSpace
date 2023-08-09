-- 한줄 주석
/*
    여러줄 주석
*/  
SELECT * FROM DBA_USERS;    -- 현재 모든 계정들에 대해서 조회하는 명령문
-- 명령문 한줄 실행시 CTRL+ENTER 누르면 즉시 실행됨 OR 위쪽 재생 버튼 클릭.

-- 계정 생성
-- 일반 사용자 계정을 만들 수 있는 권한은 오로지 관리자 계정에 있음.
-- 사용자 계정 생성방법
-- [표현법] SREATE USER 계정명 IDENTIFIED BY 비밀번호;
CREATE USER KH IDENTIFIED BY KH; -- 계정만 생성한 상태 권한X

-- 생성된 사용자 계정에게 최소한의 권한 부여 (ROLE권한 부여)
-- 최소한의 권한 내역 : DB접속, 데이터 관리
-- [표현법] GRANT 권한 1, 권한 2... TO 계정명;
GRANT CONNECT, RESOURCE TO KH;

-- 관리자 계정 : DB의 생성과 관리를 담당하는 계정이며, 모든 권환과 책임을 가지는 계정
-- 사용자 계정 : DB에 대해서 질의, 갱신, 보고 등의 작업을 수행할 수 있는 계정, 업무에 필요한
-- 최소한의 권한만 가지는 것을 원칙으로 함.

-- ROLE : 권한
-- CONNECT : 사용자가 데이터베이스에 접속 가능하도록 하기위한 CREATE SESSION 권한이 있는 ROLE권한.
-- RESOURCE : CREATE 구문을 통해 객체를 생성할 수 있느 ㄴ권한과, INSERT, UPDATE, DELETE구문을 사용
-- 할 수 있는 권한을 모아둔 ROLE권한

--1) 시나리오 상황
--
--사용자 계정을 만들기 위해 관리자 계정으로 접속하여
--
--CREATE USER EMP IDENTIFIED BY EMP0123; 명령어를 실행한 뒤
--
--접속을 확인하였다.

CREATE USER EMP IDENTIFIED BY EMP0123;
GRANT CONNECT, RESOURCE TO EMP;



--2) 에러 내용
--
--User EMP이(가) 생성되었습니다.
--
--ORA-01045: user EMP lacks CREATE SESSION privilege; logon denied

CREATE USER BABY IDENTIFIED BY BABY;

GRANT CONNECT, RESOURCE TO BABY;
