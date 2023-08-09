/*
    <JOIN>
    
    �� �� �̻��� ���̺��� �����͸� ���� ��ȸ�ϰ��� �� �� ���Ǵ� ���� => SELECT�� �̿�
    ��ȸ ����� �ϳ��� �����(RESULTSET)���� ����
    
    JOIN�� �ؾ��ϴ� ����?
    ������ �����ͺ��̽������� �ּ����� �����ͷ� ������ ���̺� �����͸� �����ϰ� ����
    ��� ������ ������̺�, ���� ������ ���� ���̺�, ... �� => �ߺ��� �ּ�ȭ �ؼ� ������
    => �� JOIN������ �̿��ؼ� ���� ���̺��� "����"�� �ξ ���� ��ȸ�ؾ���
    => ��, ������ JOIN�� �ϴ� ���� �ƴ϶� ���̺��� "�����"�� �ش��ϴ� Į���� ��Ī���Ѽ� ��ȸ�ؾ��Ѵ�.
    
    ������ �з� : JOIN�� ũ�� "����Ŭ ���� ����" "ANSI(�̱� ���� ǥ�� ��ȸ )����"���� ��������
    
            ����Ŭ ���� ����                               ANSI����(����Ŭ+��ŸDBMS)
    ======================================================================================
            �����(EQUAL JOIN)            |           ��������(INNER JOIN) -> JOIN USING/ON
    ======================================================================================
            ���� ����                       |           �ܺ�����(OUTER JOIN) -> JOIN USING
            (LEFT OUTER JOIN)             |           ���� �ܺ�����(LEFT OUTERJOIN)
            (RIGHT OUTER JOIN)            |           ������ �ܺ�����(RIGHT OUTER JOIN)
                                          |           ��ü �ܺ�����(FULL OUTER JOIN)
    =====================================================================================
            ī�׽þ��� ��                    |           ��������(CRODD JOIN)
    ---------------------------------------------------------------------------------------
        ��ü����
        ������
        ��������(���̺�3���̻��� ����)
*/

-- JOIN�� ������� �ʴ� ��
-- ��ü ������� ���, �����, �μ��ڵ�, �μ������ �˾Ƴ����� �Ѵٸ�?
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

--> ������ ���ؼ� ������� �ش�Ǵ� Į���鸸 ����� ��Ī��Ű�� �ϳ��� ������� ��ȸ�� �����ϴ�.
/*
    1. �����(EQUAL JOIN) / �������� (INNER JOIN)
    �����Ű�����ϴ� Į���� ���� ��ġ�ϴ� ��鸸 ���εǾ ��ȸ
    (��ġ���� �ʴ� �ܿ� ������� ����)
    => ���񱳿����� = (��ġ�Ѵٶ�� ������ ������)
    
    [ǥ����]
    ����� (����Ŭ ����)
    SELECT Į��1, Į��2...
    FROM �����ϰ��� �ϴ� ���̺��� ����
    WHERE ������ �÷��� ���� ������ ���� (=) ����񱳿�����
    
    �������� <ANSI����)
    SELECT Į��1, Į��2,...
    FROM �������� ���� ���̺�� 1���� ����
    JOIN ������ ���̺�� 1���� ���� ON(������ �÷��� ���� ������ ���� (=) )
    
    �������� <ANSI����)
    SELECT Į��1, Į��2,...
    FROM �������� ���� ���̺�� 1���� ����
    JOIN ������ ���̺�� 1���� ���� USING(������ Į���� 1���� ����) -- ������ Į������ ������ ���� ����.
    
    + ���࿡ ������ �÷����� �����ϴٸ�(EMPLOYEE�� JOB_CODE, JOB�� JOB_CODE) USING������ �����ϰ�
        ��������� ������̺�� ���� �� �÷������� ��������Ѵ�(���̺���̳� ��Ī�� Ȱ���ؼ�)
*/
-->> ����Ŭ ���� ����
-- FROM ���� ��ȸ�ϰ��� �ϴ� ���̺���� ����(,�� ����ؼ�)
-- WHERE���� ��Ī��ų Į���� ���� ������ ����

-- ��ü ����鿡 ���� ���, �����, �μ��ڵ�, �μ���

-- 1. ������ Į������ �ٸ����̽�(EMPLOYEE - " DEPT_CODE", DEPARTMENT- "DEPT_ID")
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID; -- DEPT_CODE�� DEPT_ID�� �����ϴٸ� �ϳ��� ���ļ� ��ȸ�ϰڴ�.
--> ��ġ���� �ʴ� ���� ��ȸ���� ����(NULL, D3, D4, D7 �����ʹ� ��ȸ���� �ʴ´�)
--> �ΰ� �̻��� ���̺��� ������ �� ��ġ�ϴ� ���� ���� ����� ������� ���ܰ� �Ǿ���

-- ��ü ������� ���, �����, �����ڵ�, ���޸���� �˾Ƴ����� �Ѵ�
-- 2. ������ Į������ ������ ��� (EMPLOYEE - "JOB_CODE" / JOB- "JOB_CODE")
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE JOB_CODE = JOB_CODE;
-- AMBIGUGUOUSLY : �ָ��ϴ�, ��ȣ�ϴ� => ��ȸ�ϰ��ڴ� Į���� � ���̺��� Į���� �� ����������.

-- ��� 1. ���̺� ���� �̿��ϴ� ��� => ���̺��.Į����(JOB.JOB_CODE)
SELECT EMP_ID, EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

-- ��� 2. ���̺� ��Ī�� �ٿ��� ����ϴ� ��� (��Ī.Į����)
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J -- ���̺� ��Ī���� AS�� ���� �� ����.
WHERE E.JOB_CODE = J.JOB_CODE;

-->> ANSI����
-- FROM���� ���� ���̺��� "�ϳ�"�� ��� �� ��
-- �� �ڿ� JOIN������ ���� ��ȸ�ϰ��� �ϴ� ���̺� ���, ���� ��Ī��ų �÷��� ���� ���ǵ� ���� ���
-- USING, ON ������ ����

-- ��ü ����鿡 ���� ���, �����, �μ��ڵ�, �μ���
-- 1. ������ Į������ �ٸ����̽�(EMPLOYEE - " DEPT_CODE", DEPARTMENT- "DEPT_ID")
--      ������ ON ������ ��밡����.
SELECT EMP_NAME, EMP_ID, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
/*INNER*/ JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID; -- INNER�� ���� ����. ���� �����ؼ� ���� ����� ����

-- ��ü ������� ���, �����, �����ڵ�, ���޸���� �˾Ƴ����� �Ѵ�
-- 2. ������ Į������ ������ ��� (EMPLOYEE - "JOB_CODE" / JOB- "JOB_CODE")
--     ON����, USING���� ��� ������
SELECT EMP_NO, EMP_NAME, E.DEPT_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;

-- 2-2. USING ���� : �÷����� ������ ��츸 ��� ����, ������ �÷����� �ϳ��� ���ָ� �˾Ƽ� ��Ī�� �ȴ�.
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

-- [����] �ڿ�����(NATURAL JOIN) : ����� ����� �ϳ�
-- => ������ Ÿ�԰� �̸��� ���� Į���� ���� �������� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB; -- ������� �ʴ°� ����. ���� �𸣰� �� ���̺��� ������� ���� �� ����.
-- �����Ե� �ΰ��� ���̺� ��ġ�ϴ� Į���� �����ϰ� �� �Ѱ��� �����ߴ�..(JOB_CODE)

-- ������ �븮�� ������� ������ ��ȸ(���, �����, ����, ���޸�)
-- ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, SALARY, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '�븮';

-- ANSI ����
SELECT EMP_ID, EMP_NAME, SALARY, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '�븮';


-- 2. �μ��� �λ�������� ������� ���, �����, ���ʽ��� ��ȸ(����Ŭ���뱸��1, ANSI1)
-- ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE = '�λ������';

-- ANSI ����
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE DEPT_TITLE = '�λ������';

-- 3. �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿�, �Ի��� ��ȸ(1,1)
-- ����Ŭ ���� ����
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND DEPT_TITLE <> '�ѹ���';

-- ANSI ����
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE
WHERE DEPT_TITLE ^= '�ѹ���';

-- 4. ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
-- ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND BONUS IS NOT NULL;

-- ANSI ����
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE
WHERE BONUS IS NOT NULL;


-- 5. �Ʒ��� �� ���̺��� �����ؼ� �μ��ڵ�, �μ���, �����ڵ�, ������(LOCAL_NAME)��ȸ�Ͻÿ�
-- DEPARTMENT, LOCATION ����
-- ����Ŭ ���� ����
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCAL_NAME
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

-- ANSI ����
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON LOCATION_ID = LOCAL_CODE;

-- �����/ ����(�̳�)���� : ��ġ���� �ʴ� ����� ���ܵǰ� ��ȸ�� ��.
------------------------------------------------------------------------------
-- ��ü ������� �����, �޿�, �μ���
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE;
-- DEPT_CODE�� NULL���� 2���� ����� ��ȸ���� ����.
-- ��, �μ����� ���� ���� ������� ��ȸ���� �ʾҴ�.
-- �ƹ��� �������� �ʴ� �μ��� D3, D4, D7�� ���ؼ��� ��ȸ���� �ʾҴ�.

/*
    2. ��������/ �ܺ�����(OUTER JOIN)
    ���̺��� JOIN�ÿ� "��ġ���� �ʴ� ��"�� ���Խ��Ѽ� ��ȸ ����
    ��, �ݵ�� LEFT/RIGHT�� �����ؾ��� => ������ �Ǵ� ���̺��� �����̶�� LEFT, �������̶��RIGHT
    
    ��ġ�ϴ� �� + ������ �Ǵ� ���̺� �������� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ
*/

-- ��ü ������� �����, �޿�, �μ���
-- 1. LEFT OUTER JOIN : �� ���̺� �� ���� ����� ���̺��� �������� JOIN
--                      ��, ���� �Ǿ��� ���� ���ʿ� ����� ���̺��� �����ʹ� ������ �� ��ȸ�ϰ� �ȴ�.
--                      (��ġ�ϴ� ���� ã�� ���ϴ��� ��ȸ�ϰڴ�.)

-->> ANSI����
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
LEFT /*OUTER*/ JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
--> EMPLOYEE ���̺��� �������� ��ȸ�߱� ������ EMPLOYEE�� �����ϴ� �����ʹ� ���� �Ǿ��簣�� �� ��ȸ�ǰԲ� �Ѵ�.
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

--> ����Ŭ���뱸��
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);
-- ���� �������� ���� ���̺��� �÷����� �ƴ� �ݴ� ���̺��� �÷��� +�� �ٿ��ָ� �ȴ�.

-- 2. RIGHT OUTER JOIN : �� ���̺��� �����ʿ� ����� ���̺��� �������� JOIN
--                        ���� �Ǿ��� ���� �����ʿ� ����� ���̺��� �����ʹ� ������ ��ȸ�ǰ� �Ѵ�
--> ANSI ����
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

-- ����Ŭ���뱸��
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
WHERE DEPT_CODE(+) = DEPT_ID;

-- 3. FULL OUTER JOIN : �� ���̺��� ���� ������� ��ȸ
-- ��ġ�ϴ� ��� + LEFT OUTER JOIN ���� ���Ӱ� �߰��� ��� + RIGHT OUTER JOIN ���� ���Ӱ� �߰��� ���
SELECT
    EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
FULL OUTER JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE;
--> ����Ŭ ���� ������ ���Ұ��� X

/*
    3. ī�׽þ��� ��(CARTESIAN PRODUCT) / ��������(CROSS JOIN)
    ��� ���̺��� �� ����� ���μ��� ���ε� �����Ͱ� ��ȸ��(������) N * M
    �� ���̺��� ����� ��� ������ ����� ������ ��µȴ�.
    
    ==> ���� N��, M���� ���� ���� ���̺���� ī�׽þ� ���� ������� N*M��
    ==> ��� ����� ���� �� ������ ��ȸ�ϰڴ�.
    ==> ����� �����͸� ��� (������ ������ �߻��� �� �ִ�.)
*/

--> ����Ŭ ���뱸�� (ī�׽þ��� ��)
-- �����, �μ���
SELECT EMP_NAME, DEPT_TITLE
--FROM EMPLOYEE, DEPARTMENT; -- 23*9=207�� ���
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_CODE;
-- ANSI����
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;
-- ī�׽þ��� ���� ��� : WHERE���� ����ϴ� ���� ������ �߸��Ǿ��ų�, ���� ��� �߻�

/*
    4. ������ (NON EQUAL JOIN)
    '='�� ������� �ʴ� ���ι� => �ٸ� �񱳿����ڸ� �Ἥ �����ϰڴ�.(>,<>=,<=,BETWEEN A AND B)
    => ������ Į�������� ��ġ�ϴ� ��찡 �ƴ϶� ������ ���ԵǴ� ��� ��Ī�ؼ� ��ȸ�ϰڴ�.
    
    ����� => =�� ���� ��ġ�ϴ� ��츸 ��ȸ
    ������ => =�� �ƴ� �ٸ� �񱳿����ڵ�� ������ ���ԵǴ� ��츦 ��ȸ
*/

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

SELECT *
FROM SAL_GRADE;

-- �����, �޿�, �޿����(SAL_LEVEL)
SELECT EMP_NAME, SALARY, SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE, SAL_GRADE
--WHERE SALARY >= MIN_SAL AND SALARY < MAX_SAL;
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

-- ANSI����
SELECT EMP_NAME, SALARY, SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

/*
    5. ��ü���� (SELF JOIN)
    ���� ���̺��� �����ϴ� ���
    ��, �ڱ� �ڽ��� ���̺�� �ٽ� ������ �ΰڴ�.
    => ��ü������ ��� ���̺��� �ݵ�� ��Ī�� �ο��ؾ��Ѵ�.
*/

-- ����� ���, �����, ����� ���, �����
--> ����Ŭ
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID(+); -- LEFT OUTER JOIN

-- ANSI����
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);

/*
    <���� JOIN>
    3�� �̻��� ���̺��� �����ؼ� ��ȸ�ϰڴ�.
    => ���� ������ �߿��ϴ�.
*/
-- ���, �����, �μ���, ���޸�
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID(+)
    AND E.JOB_CODE = J.JOB_CODE;
    
--> ANSI ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;


