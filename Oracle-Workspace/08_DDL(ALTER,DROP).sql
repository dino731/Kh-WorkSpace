/*
    *DDL(DATE DEFINISTION LANGUAGE)
    ������ ���� ���
    ��ü���� ���Ӱ� ����(CREATE)�ϰ�, ����(ALTER)�ϰ�, ����(DROP)�ϴ� ��ɾ�
    
    1. ALTER
    ��ü ������ �������ִ� ����
    
    <���̺� ����>
    [ǥ����]
    ALTER ��ü��(TABLE, INDEX, USER...) ���̺�� ������ ����;
    
    - ������ ����
    1. Į�� �߰�/ ����/ ����
    2. �������� �߰� / ���� => ���� XX
    (�����ϰ��� �Ѵٸ� ������ ���Ӱ� �߰��ؾ���)
    3. ���̺��/ �÷��� / �������Ǹ� ��������.
    
*/
-- 1. �÷� �߰�/ ����/ ����
-- 1_1. Į�� �߰� (ADD): ADD �߰����÷��� �ڷ��� [DEFAULT �⺻��] 
SELECT * FROM DEPT_COPY;

-- CNAME Į�� �߰��ϱ�
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
-- ���ο� Į���� �߰��ǰ�, NULL������ ä������.

-- LNAMEĮ�� �߰� DEFAULT������ '�ѱ�'�̶�� �����ϱ�
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '�ѱ�';

-- 1_2. Į�� ���� (MODIFY)
--      Į���� �ڷ��� ���� : MODIFY ������ Į���� �ٲٰ����ϴ� �ڷ���
--      DEFAULT �� ������ : MODIFY ������ Į���� DEFAULT �ٲٰ��� �ϴ� �⺻��

-- DEPT_COPY ���̺��� DEPT_ID�� �ڷ����� CHAR(3)�� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);

-- ���� �����ϰ��� �ϴ� �÷��� �̹� ����ִ� ���� ������ �ٸ� Ÿ������ �����غ���(�Ұ���X)
--"column to be modified must be empty to change datatype"
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;

--���� �����ϰ��� �ϴ� Į���� �̹� ����ִ� ������ �� ���� ũ��� �����غ���
-- "cannot decrease column length because some value is too big"
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(1);

--> ���� ->����(X) / ������ ���(X) / ������ Ȯ�� (O)

-- �ѹ��� �������� �÷� ���� ����
-- DEPT_TITLE Į���� ������ Ÿ���� VARCHAR2(4)����,
-- LOCATION_ID �÷��� ������ Ÿ���� VARHCAT2(2)��
-- LNAME�÷��� �⺻���� '�̱�'����
ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE VARCHAR2(40)
MODIFY LOCATION_ID VARCHAR2(2)
MODIFY LNAME DEFAULT '�̱�';

-- 1_3. �÷� ����(DROP COLUMN) : DROP COLUMN �����ϰ��� �ϴ� Į����
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY;

-- DEPT_COPY2���̺� DEPT_IDĮ�� �����.
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;

SELECT * FROM DEPT_COPY2;

-- ROLLBACK���� ������ �ȵ�. (��� DDL�� ��ü)
ROLLBACK;

-- ��� �÷� ��������
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;
ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;

ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;
-- "cannot drop all columns in a table"
-- ������ Į���� ������ �� ����.
SELECT * FROM DEPT_COPY2;

-- 2) �������� �߰� / ����
/*
    2_2. �������� �߰�
    - PRIMARY KEY   : ADD PRIMARY KEY(�÷���);
    - FOREIGN KEY   : ADD FOREIGN KEY(�÷���) REFERENCES ������ ���̺�� [(������Į����)];
    - UNIQUE        : ADD UNIQUE(Į����);
    - CHECK         : ADD CHECK(�÷��� ���� ����);
    ===========================================================================
    - NOT NULL      : MODIFY �÷��� NOT NULL;
    
    ������ �������Ǹ��� �ο��ϰ��� �Ѵٸ�, CONSTRAINT �������Ǹ� �տ��ٰ� ���̱�
*/

/*
    DEPT_COPY���̺�� ����
    - DEPT_IDĮ���� PRIMARY KEY �������� �߰�
    - DEPT_TITLE Į���� UNIQUE �������� �߰�
    - LNAME �÷��� NOT NULL �������� �߰�
*/
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_TITLE)
MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL;

/*
    2_2. �������� ����
    PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK : DROP CONSTRAINT �������Ǹ�
    NOT NULL : MODIFY Į���� NULL;
*/
-- DEPT_COPY ���̺�� ���� DCOPY_PK �������� �����
ALTER TABLE DEPT_COPY DROP CONSTRAINT DCOPY_PK;
-- ������ �ѹ��� �����
ALTER TABLE DEPT_COPY 
DROP CONSTRAINT DCOPY_UQ
MODIFY LNAME NULL;

-- 3. �÷��� / �������Ǹ� / ���̺�� ����(RENAME)
-- 3_1. Į���� ���� : RENAME COLUMN �����÷Ÿ� TO �ٲ��÷���
-- DEPT_COPY ���̺��� DEPT_TITLE�� DEPT_NAME���� �ٲٱ�
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

-- 3_2. �������Ǹ� ���� : RENAME CONSTRAINT �������Ǹ� TO �ٲ� �÷���
-- DEPT_COPY���̺��� SYS_C007149�� DCOPY_DID_NN�� �ٲٱ�
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C007149 TO DCOPY_DID_NN;

-- 3_3. ���̺�� ���� : RENAME[�������̺��] TO �ٲ����̺��
-- DEPT_COPY ���̺� �̸��� DEPT_TEST�� ����
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST;

-----------------------------------------------------------------------------------------

/*
    2. DROP
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    DROP TABLE �����ϰ��� �ϴ� ���̺� �̸�.
*/
--EMP_NEW ����
DROP TABLE EMP_NEW;

-- �θ����̺��� ������ ����? �׽�Ʈ ȯ�� �����
-- DEPT_TEST���̺� DEPT_ID�÷��� ���� PRIMARY KEY �������� �߰���Ű��
ALTER TABLE DEPT_TEST ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID);
-- EMPLOYEE_COPY3�� �ܷ�Ű (DEPT_CODE)�� �߰� (�ܷ�Ű �̸� : ECOPY_FK)
-- �̶� �θ����̺��� DEPT_TEST ���̺��� DEPT_IDĮ���� ������ų ��.
ALTER TABLE EMPLOYEE_COPY3
ADD CONSTRAINT ECOPY_FK FORRIGN KEY(DEPT_CODE) REFERENCES DEPT_TEST;

-- ��𼱰��� �����ǰ� �ִ� �θ��פӺ���� �����ȵ�
-- ���࿡ �θ����̺��� �����ϰ� �ʹٸ�?
-- ��� 1.
DROP TABLE �ڽ����̺�;
DROP TABLE �θ����̺�;

-- ��� 2. �θ����̺� �����ϵ�, �¹����ִ� �ܷ�Ű �������ǵ� �Բ� �����ϴ� ���
DROP TABLE DEPT_TEST CASCADE CONSTRAINT;