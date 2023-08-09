-- * DCL
/*
    ������ ���� ���(DATA CONTROLLER LANGUAGE)
    
    �������� �ý��۱��� �Ǵ� ��ü���ٱ����� �ο�(GRANT)�ϰų� ȸ��(REVOKE)�ϴ� ���
    
    - ���� �ο� (GRANT)
        �ý��� ���� : Ư�� DB�� �����ϴ� ����, ��ü���� ������ �� �ִ� ����
        ��ü ���� ���� : Ư�� ��ü�鿡 �����ؼ� ������ �� �ִ� ����
        
    - �ý��� ����
        [ǥ����]
        GRANT ����1, ����2 ...TO ������;
        
    - �ý��� ������ ����
        CREATE SESSION  : ������ ������ �� �ִ� ����
        CREATE TABLE    : ���̺��� ������ �� �ִ� ����
        CREATE VIEW     : �並 ������ �� �ִ� ����
        CREATE SEQUENCDE : �������� ������ �� �ִ� ����
*/
-- 1. SAMPLE ���� ����
CREATE USER SAMPLE IDENTIFIED BY SAMPLE;

-- 2. SAMPLE ������ �����ϱ� ���� CREATE SESSION ���� �ο�
GRANT CREATE SESSION TO SAMPLE; -- CREATE SESSION

-- 3_1.SAMPLE ������ ���̺��� ������ �� �ִ� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO SAMPLE;

-- 3_2. SAMPLE������ ���̺����̽��� �Ҵ����ֱ�(SAMPLE���� ����)
ALTER USER SAMPLE QUOTA 2M ON SYSTEM;
-- QUOTA : �� => �������ִ�, �Ҵ��ϴ�
-- 2M : 2 MAGE BYTE

-- 4_1.SAMPLE ������ �並 ������ �� �ִ� CREATE VIEW ���� �ο�
GRANT CREATE VIEW TO SAMPLE;

/*
    - ��ü����
    Ư�� ��ü���� ���� �� �� �ִ� ����
    ���� : SELECT, INSERT, UPDATE, DELETE => DML.
    
    [ǥ����]
    GRANT �������� ON Ư����ü TO ������;
    
    ���� ����       |       Ư����ü
    =====================================================
    SELECT          | TABLE, VIEW, SEQUENCE
    INSERT          | TABLE, VIEW
    UPDATE          | TABLE, VIEW
    DELETE          | TABLE, VIEW
*/
-- 5. SAMPLE ������ KH.EMPLOYEE ���̺��� ��ȸ�� �� �ִ� ���� �ο�
GRANT SELECT ON KH.EMPLOYEE TO SAMPLE;

-- 6. SAMPLE ������ KH.DEPARTMENT ���̺� ���� ������ �� �ִ� ���� �ο�
GRANT INSERT ON KH.DEPARTMENT TO SAMPLE;

-- �ּ����� ���Ѹ� �ο��ϰ��� �� �� CONNECT, RESOURCE�� �ο�
-- GRANT CONNECT, RESOURCE TO ������;
/*
    <ROLE ��>
    Ư�� ���ѵ��� �ϳ��� �������� ��� ���� ��
    
    CONNECT : CREATE SESSION(�����ͺ��̽��� ������ �� �ִ� ����)
    RESOURCE : CREATE TABLE, CREATE SEQUENCE, SELECT, INSERT....
                (Ư�� ��ü���� ���� �� ������ �� �ִ� ���� == ������ �� �ִ� ����)
*/
/*
    * ���� ȸ�� (REVOKE)
    ������ �������� ����ϴ� ��ɾ�
    
    [ǥ����]
    REVOKE ����1, ����2,...FROM ������;
*/
-- 7. SAMPLE �������� ���̺��� ������ �� ������ ���� ȸ��
REVOKE CREATE TABLE FROM SAMPLE;

-- �ǽ�����

-- ����ڿ��� �ο��� ���� : CONNECT, RESOURCE
-- ������ �ο����� ����� : MYMY

CREATE USER MYMY IDENTIFIED BY MYMY;
GRANT CONNECT, RESOURCE TO MYMY;

DROP USER MYMY;




