-- 1. ������а�(�а��ڵ�002) �л����� �й��� �̸�, ���г⵵�� ���� �⵵�� ���������� �ۼ�
--(��, ����� "�й�","�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT  STUDENT_NO �й�, 
        STUDENT_NAME �̸� , 
        TO_CHAR(ENTRANCE_DATE ,'YYYY-MM-DD')���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ���г⵵;

-- 2. �� ������б��� ���� �� �̸��� �����ڰ� �ƴ� ������ �� �� �ִٰ� ��.
--      �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� ������ �ۼ�
--      (�̶� �ùٸ��� �ۼ��� ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ ���� �����Ͻ�)
SELECT 
        PROFESSOR_NAME, 
        PROFESSOR_SSN
FROM TB_PROFESSOR
--WHERE PROFESSOR_NAME NOT LIKE '___';
WHERE LENGTH(PROFESSOR_NAME) != 3; -- �ι�° ���

-- 3. ���� �������� �̸��� ���̸� ����ϴ� ������ �ۼ��Ͻÿ�
--    �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�.
--    (��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸� ", "����"�� �Ѵ�. ���̴� '��'���� ���)
SELECT PROFESSOR_NAME �����̸�,
       EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(PROFESSOR_SSN,1,2)) ����
--     DECODE(SUBSTR(PROFESSOR_SSN,8,1), 1,(123- TO_NUMBER(SUBSTR(PROFESSOR_SSN,8,2))) ) "����"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY ����; 

-- 4.
SELECT SUBSTR(PROFESSOR_NAME, 2) �̸�
FROM TB_PROFESSOR;

-- 5.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN, 1, 6))) > 19;

-- 6. 2020�� ũ�������� ���� ����? 20201225
SELECT TO_CHAR(TO_DATE('20201225'), 'DAY')
FROM DUAL;

-- 7.


-- 8. 2000�⵵ ���� �����ڵ��� �й��� 'A'�� �����Ѵ�
-- ���� �й��� ���� �л����� �й��� �̸� �ۼ�
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
--WHERE STUDENT_NO NOT LIKE 'A%';
--WHERE ENTRANCE_DATE < '2000/01/01'; -- �ι�° ���
WHERE SUBSTR(STUDENT_NO,1,1) != 'A'; -- ����° ���

-- 9. �й��� A517178�� �ѾƸ� �л��� ���� �� ������ ���Ͻÿ�
--    ��, ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ��� ǥ��
SELECT ROUND(AVG(POINT),1) ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10.
SELECT DEPARTMENT_NO �а���ȣ, COUNT(*) "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11.
SELECT COUNT(*) 
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12.
SELECT SUBSTR(TERM_NO,1,4) �⵵,  ROUND(AVG(POINT),1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

-- 13.
SELECT DEPARTMENT_NO, COUNT( DECODE(ABSENCE_YN,'Y','1','N',NULL) ) "���л���"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 14.
SELECT STUDENT_NAME, COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1;

-- 15.
SELECT NVL(SUBSTR(TERM_NO, 1,4),'��') �⵵, NVL(SUBSTR(TERM_NO, 5, 2), '��') �б�, ROUND(AVG(POINT),1) ���
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP (SUBSTR(TERM_NO, 1,4), SUBSTR(TERM_NO, 5, 2));
--ORDER BY 1; NVL((),' ') ���鿡 ������ 1�� ������ �־��ָ� �����




