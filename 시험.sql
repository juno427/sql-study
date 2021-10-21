-- 문제 1)
desc emp;

-- 문제 2)
SELECT job
FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

-- 문제 3)
SELECT *
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- 문제 4)
CREATE TABLE EMP_TEMP
AS
SELECT *
FROM emp
WHERE 1 != 1;

-- 문제 5)
INSERT INTO emp(empno, ename, job, MGR, hiredate, sal, COMM, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

-- 문제 6)
CREATE TABLE DEPT_TEMP2
AS
SELECT * FROM dept;

SELECT * FROM DEPT_TEMP2;
DESC DEPT_TEMP2;

-- 문제 7)
UPDATE DEPT_TEMP2
SET dname = 'DATABASE', loc = 'SEOUL'
WHERE deptno = 40;

select *
from DEPT_TEMP2;

-- 문제 8)
ROLLBACK;

-- 문제 9)
SELECT *
FROM emp
WHERE UPPER(ename) = 'SMITH';

-- 문제 10)
SELECT *
FROM emp
WHERE ename LIKE '____';

-- 문제 11)
SELECT job
,SUBSTR(job, 1, 3)
FROM emp;

-- 문제 12)
SELECT *
FROM emp
WHERE hiredate > '1981/06/01';

-- 문제 13)
SELECT empno, ename, sal, NVL(COMM, 0) 수당, sal*12+NVL(COMM, 0) 연봉
FROM emp;

-- 문제 14)
SELECT count(distinct job)
FROM emp;

-- 문제 15)
SELECT ename, dname
FROM emp e
JOIN dept d on e.deptno = d.deptno
WHERE sal >= 3000;

-- 문제 16)
SELECT *
FROM emp
WHERE sal < (SELECT sal FROM emp WHERE ename = 'MARTIN');

-- 문제 17)
SELECT *
FROM emp
WHERE sal > ALL ( SELECT sal FROM emp WHERE deptno = 30 );

-- 문제 18
SELECT *
FROm emp e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE s.grade = 3 AND deptno = 30;

-- 문제 19)
CREATE TABLE EMP_DDL
empno       number(4)
ename       varchar(10)
job         varchar(9)
MGR         int(4)
hiredate    
sal         
comm        
deptno      int(2);
-- 문제 20)
