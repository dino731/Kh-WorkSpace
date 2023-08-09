/*
    *OBJECT
    �����ͺ��̽��� �̷�� ������ ��������
    
    *OBJECT�� ����
    - TABLE, USER, VIEW, SEQUENCE, INDEX, PACKAGAE, TRIGGER, FUNCTION...
    
    <VIEW ��>
    SELECT���� ������ �� �� �ִ� ��ü
    (���� ���� �� SELECT���� VIEW�� �����صθ� �Ź� �� SELECT���� �ٽ� ����� �ʿ䰡 ����)
    => ��ȸ�� �ӽ����̺� ���� ����(���� �����Ͱ� ����ִ� ���� �ƴ�)
    
*/
--------------------�ǽ�����-------------------------
-- '�ѱ�'���� �ٹ��ϴ� ������� ���, �̸�, �μ���, �޿�, �ٹ�������, ���޸��� ��ȸ�Ͻÿ�
SELECT  EMP_ID, EMP_NAME, DEPT_CODE, SALARY, LOCAL_NAME, JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB J USING(JOB_CODE)
WHERE NATIONAL_NAME IN ('�ѱ�');

/*
    1. VIEW ���� ���
    [ǥ����]
    CREATE VIEW �θ� AS ��������;
    
    CREATE OR REPLACE VIEW ��� AS ��������;
    => �� ������ ������ �ߺ��� �̸��� �䰡 ���ٸ� ���Ӱ� �䰡 �����ǰ�
        ������ �ߺ��� �̸��� �䰡 �ִٸ� �� �̸��� �並 �����Ѵ�
        OR REPLACE�� ���� ����
*/

CREATE VIEW VW_EMPLOYEE
AS SELECT  
    EMP_ID, EMP_NAME, DEPT_CODE, SALARY, LOCAL_NAME, JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB J USING(JOB_CODE)
WHERE NATIONAL_NAME IN ('�ѱ�');

-- ���� ���� ������ �������� ����
GRANT CREATE VIEW TO KH;
-- KH �������� ����

SELECT * FROM VW_EMPLOYEE;
SELECT * FROM ( /*(�������� �־ ��� ����)*/ );

-- ���� ���� ������ ���������� �̿��Ͽ� �����͵��� ��ȸ�ϴ� �� ����
-- �ѹ� �並 ������ �� ���� �̸����� �����ϰ� ��ȸ�ϴ°� ȿ���� �� ����

-- ���ʽ� �÷��� ���� �信�� ���ʽ��� ��ȸ�ϰ� ���� ��� ���Ӱ� �並 ����������ϴµ�,
-- �����ϰ� �ٽ� �����ϴ� �� ���� CREATE OR REPLACE VIEW�� ����ϸ� �� �� �����ϰ� ���� ����

CREATE OR REPLACE VIEW VW_EMPLOYEE
AS SELECT  
    EMP_ID, EMP_NAME, DEPT_CODE, SALARY, LOCAL_NAME, JOB_NAME , BONUS
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB J USING(JOB_CODE);

SELECT * FROM VW_EMPLOYEE;
--------------------------------------------------------------------------------
/*
    ��� ������ ���� ���̺� => ���������� �����͸� �����ϰ� ������ ����
    �������� TEXT������ ����Ǿ� ����
    �ش� ������ ������ �ִ� VIEW�鿡 ���� ������ ��ȸ�ϰ��� �Ѵٸ� USER_VIEWS
    ������ ��ųʸ��� �̿��ϸ� �ȴ�.
*/
SELECT * FROM USER_VIEWS;

/*
    �� �÷��� ��Ī �ξ�
    �������� �κп� SELECT���� �Լ� OR ���������� ����Ǿ� �ִ� ��� "�ݵ��" ��Ī���� �����������
*/
-- ����� ���, �̸�, ���޸�, ����, �ٹ������ ��ȸ�� �� �ִ� SELECT���� VIEW�� ����
CREATE OR REPLACE VIEW VW_EMP_JOB
AS SELECT EMP_ID, EMP_NAME,JOB_NAME,
            DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��'),
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
-- "must name this expression with a column alias"

CREATE OR REPLACE VIEW VW_EMP_JOB
AS SELECT EMP_ID, EMP_NAME,JOB_NAME,
            DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') "����",
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)"�ٹ����"
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

-- �� �ٸ� ������� ��Ī �ο��ϱ� (��,, ��� Į���� ���ؼ� ��� ��Ī�� ����ؾ���)
CREATE OR REPLACE VIEW VW_EMP_JOB(���, �����, ���޸�, ����, �ٹ����)
AS SELECT EMP_ID, EMP_NAME,JOB_NAME,
            DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��'),
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

SELECT * FROM VW_EMP_JOB;

SELECT �����, ���޸�
FROM VW_EMP_JOB
WHERE ���� = '��';
-- �信�� �����Ҷ� ���� ��Ī, ���ͷ� ������ SELECT�� Ȱ�� �����ϴ�.

-- �並 �����ϰ��� �Ѵٸ�
DROP VIEW VW_EMP_JOB;

SELECT * FROM USER_VIEWS;
/*
    *������ �並 �̿��ؼ� EML(INSERT, UPDATE, DELETE) ��밡��
    
    ���� ���� : �並 ���ؼ� �����ϰ� �ȴٸ� ���� �����Ͱ� ����ִ� ���̺��� ��������� ����ȴ�.
*/
CREATE VIEW VW_JOB
AS SELECT * FROM JOB;

SELECT * FROM VW_JOB;
SELECT * FROM JOB;

-- �信 INSERT
INSERT INTO VW_JOB
VALUES('J8','����');

SELECT * FROM VW_JOB;
SELECT * FROM JOB;
-- JOB���̺��� ���� INSERT�� ���� Ȯ�� �����ϴ�.

-- VW_JOB�̶� �信�� JOB_CODE J8�� JOB_NAME�� '�˹�'�� ����
UPDATE VW_JOB
SET JOB_NAME = '�˹�'
WHERE JOB_CODE = 'J8';

SELECT * FROM JOB;

-- VW_JOB��κ��� JOB_CODE�� J8�� ���� ����
DELETE FROM VW_JOB
WHERE JOB_CODE = 'J8';

SELECT * FROM JOB;
/*
    DML�� ������ ��� : ���������� �̿��ؼ� ������ ���̺��� ������ ó�� ���� �����ϰ��� �� ���
    
    * ������ �並 ������ DML�� �Ұ����� ���̽��� �� ����. => �ѹ��� ó���� �� ��쿡�� �Ұ�����
    1. �信 ���ǵǾ� ���� ���� �÷��� �����ϴ� ���
    2. �信 ���ǵǾ� ���� ���� �÷� �߿� ���̽����̺� �� NOT NULL ���� ������ ������ ���
    3. �������� �Ǵ� �Լ��� ���ؼ� ���ǵǾ� �ִ� ���
    4. �׷��Լ��� GROUP BY ���� ���Ե� ���
    5. DISTINCT ������ ���Ե� ���
    6. JOIN�� �̿��ؼ� ���� ���̺��� ��Ī ���ѳ��� ���
*/
-- 1. �信 ���ǵǾ� ���� ���� Į���� �����ϴ� ���
CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_NAME FROM JOB;

SELECT * FROM VW_JOB;

INSERT INTO VW_JOB(JOB_CODE, JOB_NAME)
VALUES('J8','����'); -- ����

UPDATE VW_JOB
SET JOB_NAME = '����'
WHERE JOB_CODE = 'J7';

-- 2. �信 ���ǵǾ� ���� ���� �÷��߿� ���̽����̺� �� NOT NULL ���������� ������ ���
INSERT INTO VW_JOB(JOB_NAME)
VALUES('����');

UPDATE VW_JOB
SET JOB_NAME = '����'
WHERE JOB_NAME = '���';

ROLLBACK;

DELETE FROM VW_JOB
WHERE JOB_NAME = '���';

ROLLBACK;

-- 3. �������� �Ǵ� �Լ��� ���ؼ� ���ǵǾ� �ִ� ���
CREATE OR REPLACE VIEW VW_EMP_SAL
AS SELECT EMP_ID, EMP_NAME, SALARY, SALARY * 12 ����
FROM EMPLOYEE;

SELECT * FROM VW_EMP_SAL;

INSERT INTO VW_EMP_SAL
VALUES (400,'�ΰ��',5000000,60000000); -- ���� �������� �ʴ� ���̺� ���� �߰��� �� ����.

-- �̷������δ� ������
-- �ش� Į���� ������������ ����� �����ϴ�
DELETE FROM Vw_EMP_SAL
WHERE ���� = 96000000;

SELECT * FROM VW_EMP_SAL;

ROLLBACK;

-- 4. �׷��Լ��� GROUP BY ���� ���Ե� ���
CREATE OR REPLACE VIEW VW_GROUPDEPT
AS SELECT DEPT_CODE, SUM(SALARY) �հ�, FLOOR(AVG(SALARY)) ��ձ޿�
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT * FROM VW_GROUPDEPT;

INSERT INTO VW_GROUPDEPT VALUES('D3',8000000,4000000); -- �ȵ�.

UPDATE VW_GROUPDEPT
SET �հ� = 8000000
WHERE DEPT_CODE ='D1'; -- �ȵ� "data manipulation operation not legal on this view"

DELETE FROM VW_GROUPDEPT
WHERE �հ� = 5210000; -- �ȵ� "data manipulation operation not legal on this view"

-- 5. DISTINCT ������ ���Ե� ���
-- 6. JOIN�� �̿��ؼ� �������̺��� ��Ī���ѳ��� ���
CREATE OR REPLACE VIEW VW_JOINEMP
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

SELECT * FROM VW_JOINEMP;

INSERT INTO VW_JOINEMP VALUES(300,'�ΰ��','�ѹ���');
--"cannot modify more than one base table through a join view"

-- �̸� �����
UPDATE VW_JOINEMP
SET EMP_NAME = '������'
WHERE EMP_ID = 200;

SELECT * FROM EMPLOYEE;

-- ȸ��η� �����
UPDATE VW_JOINEMP
SET DEPT_TITLE = 'ȸ���'
WHERE EMP_ID = 200; -- "cannot modify a column which maps to a non key-preserved table"

DELETE FROM VW_JOINEMP
WHERE EMP_ID = 200;

ROLLBACK;
-- VIEW���� ��밡���� �ɼǵ�
-- 1. OR REPLACE
CREATE OR REPLACE VIEW V_EMP_SALARY
AS SELECT * FROM EMPLOYEE;

--2. FORCE/NOFORCE �ɼ� : ���� ���̺��� ������ VIEW�� ���� ������ �� �ְ� ���ִ� �ɼ�
-- CREATE OR REPLACE NOFORCE : �⺻����.
CREATE OR REPLACE FORCE VIEW V_FORCETEST
AS SELECT A,B,C FROM NOTEXIST;

SELECT * FROM V_FORCETEST;

CREATE TABLE NOTEXIST(
    A NUMBER,
    B NUMBER,
    C NUMBER
);

-- 3. WITCH CHECK OPTION
-- SELECT���� WHERE ������ ����� Į���� �������� ���ϰ� �ϴ� �ɼ�
CREATE OR REPLACE VIEW V_CHECKOPTION
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' WITH CHECK OPTION;

SELECT * FROM V_CHECKOPTION;

UPDATE V_CHECKOPTION SET SALARY = 6000000 WHERE EMP_ID = 206;
UPDATE V_CHECKOPTION SET DEPT_CODE = 'D6'  WHERE EMP_ID = 206;

ROLLBACK;

-- 4. WITH READ ONLY
-- VIEW ��ü�� ���� ���ϰ� �����ϴ� �ɼ�
CREATE OR REPLACE VIEW V_READ
AS SELECT
    EMP_ID, EMP_NAME, SALARY, DEPT_CODE
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' WITH READ ONLY;
    
UPDATE V_READ SET EMP_NAME = 5000000;
-- "cannot perform a DML operation on a read-only view"



