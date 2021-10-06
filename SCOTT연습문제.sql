-- 연습문제 1~10

-- 연습문제 1
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

-- 연습문제 2
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

-- 연습문제 3
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- 연습문제 4 @
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20'; -- '81-02-20'

-- 연습문제 5
SELECT *
FROM emp
WHERE job != 'MANAGER'; -- !=, <>

-- 연습문제 6 @
SELECT *
FROM emp
WHERE hiredate > '81/04/02';

-- 연습문제 7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

-- 연습문제 8
SELECT *
FROM emp
WHERE deptno >= 20;

-- 연습문제 9 @
SELECT *
FROM emp
WHERE ename >= 'L';

-- 연습문제 10 @
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

-- 연습문제 11
SELECT empno, ename
FROM emp
WHERE empno <= '7698';

-- 연습문제 12 @
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

-- 연습문제 13
SELECT ename, job, sal
FROM emp
WHERE sal > '1600' AND sal < '3000'; -- sal < 1600 AND sal < 3000;

-- 연습문제 14
SELECT *
FROM emp
WHERE empno NOT BETWEEN '7654' AND '7782'; -- empno < 7654 OR empno > 7782;

-- 연습문제 15
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J'; -- ename >= 'B' AND ename <= 'J';

-- 연습문제 16 @
SELECT *
FROM emp
WHERE   NOT(hiredate >= '81/01/01' AND hiredate <= '81/12/31');
        -- hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
        -- TO_CHAR(hiredate, 'YYYY') != '1981';
        -- hiredate NOT LIKE '81%'; 서치할 내용이 방대할 경우 느려짐. 잘 안쓰는게 좋음
        
-- 연습문제 17 @
SELECT *
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');

-- 연습문제 18 @
SELECT ename, empno, deptno
FROM emp
WHERE   deptno NOT IN (20, 30);
        -- deptno != 20 AND deptno != 30;

-- 연습문제 19 @
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

-- 연습문제 20 @
SELECT *
FROM emp
WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

-- 연습문제 21
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- 연습문제 22
SELECT *
FROM emp
WHERE   ename LIKE 'M_____' AND ename LIKE '_____N';
        --ename LIKE 'M____N';

-- 연습문제 23
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- 연습문제 24
SELECT *
FROM emp
WHERE comm is NULL;

-- 연습문제 25
SELECT *
FROM emp
WHERE comm is NOT NULL;

-- 연습문제 26
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal > 1500;

-- 연습문제 27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

-- 연습문제 28
SELECT *
FROM emp
WHERE sal > 1500 AND deptno = 30 AND job = 'MANAGER';

-- 연습문제 29
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

-- 연습문제 30
SELECT *
FROM emp
ORDER BY sal DESC;

-- 연습문제 31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 연습문제 32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC;

--연습문제 33 @
SELECT ename, sal, NVL(COMM, 0) bonus, deptno
FROM emp
WHERE deptno = 10;












