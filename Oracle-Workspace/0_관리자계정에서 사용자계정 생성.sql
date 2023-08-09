-- ���� �ּ�
/*
    ������ �ּ�
*/  
SELECT * FROM DBA_USERS;    -- ���� ��� �����鿡 ���ؼ� ��ȸ�ϴ� ��ɹ�
-- ��ɹ� ���� ����� CTRL+ENTER ������ ��� ����� OR ���� ��� ��ư Ŭ��.

-- ���� ����
-- �Ϲ� ����� ������ ���� �� �ִ� ������ ������ ������ ������ ����.
-- ����� ���� �������
-- [ǥ����] SREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER KH IDENTIFIED BY KH; -- ������ ������ ���� ����X

-- ������ ����� �������� �ּ����� ���� �ο� (ROLE���� �ο�)
-- �ּ����� ���� ���� : DB����, ������ ����
-- [ǥ����] GRANT ���� 1, ���� 2... TO ������;
GRANT CONNECT, RESOURCE TO KH;

-- ������ ���� : DB�� ������ ������ ����ϴ� �����̸�, ��� ��ȯ�� å���� ������ ����
-- ����� ���� : DB�� ���ؼ� ����, ����, ���� ���� �۾��� ������ �� �ִ� ����, ������ �ʿ���
-- �ּ����� ���Ѹ� ������ ���� ��Ģ���� ��.

-- ROLE : ����
-- CONNECT : ����ڰ� �����ͺ��̽��� ���� �����ϵ��� �ϱ����� CREATE SESSION ������ �ִ� ROLE����.
-- RESOURCE : CREATE ������ ���� ��ü�� ������ �� �ִ� �����Ѱ�, INSERT, UPDATE, DELETE������ ���
-- �� �� �ִ� ������ ��Ƶ� ROLE����

--1) �ó����� ��Ȳ
--
--����� ������ ����� ���� ������ �������� �����Ͽ�
--
--CREATE USER EMP IDENTIFIED BY EMP0123; ��ɾ ������ ��
--
--������ Ȯ���Ͽ���.

CREATE USER EMP IDENTIFIED BY EMP0123;
GRANT CONNECT, RESOURCE TO EMP;



--2) ���� ����
--
--User EMP��(��) �����Ǿ����ϴ�.
--
--ORA-01045: user EMP lacks CREATE SESSION privilege; logon denied

CREATE USER BABY IDENTIFIED BY BABY;

GRANT CONNECT, RESOURCE TO BABY;
