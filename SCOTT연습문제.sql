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
            -- deptno DESC, ename, sal DESC;

-- 연습문제 33 @
SELECT ename, sal, ROUND(sal*0.13) bonus, deptno
FROM emp
WHERE deptno = 10;

-- 연습문제 34 @
SELECT ename, sal, nvl(COMM, 0), sal+nvl(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

--연습문제 35
SELECT ename, sal, TO_char(sal*0.15, '$999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000; 

-- 연습문제 36) 사원수가 5명이 넘는 부서의 부서명과 사원수 조회(조인필요)
SELECT d.dname, count(*)                   -- SELECT d.dname, count(e.empno)
FROM emp e JOIN dept d ON e.deptno = d.deptno   -- FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname                                -- GROUP BY d.dname
HAVING count(*) > 5;                      -- HAVING count(e.empno) > 5;

-- 연습문제 37) 직업별 급여합계가 5000을 초과한느 각 직무에 대해서 직무와 급여 합계를 조회.(단 판매원(SALESMAN)은 제외)
SELECT job, sum(sal) 급여합계
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING sum(sal) > 5000;

-- SELECT job, sum(sal) 급여합계
-- FROM emp
-- GROUP BY job
-- HAVING sum(sal) > 5000 AND job != 'SALESMAN';
-- → 위, 아래 차이는 'SALESMAN'을 먼저 제외하느냐, 나중에 제외하느냐(문서의 양이 방대해지면 전자가 빠름)
 
-- 연습문제 38) 사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여등급(grade)을 출력하시오.(테이블 salgrade 비동등 조인)
SELECT e.empno, e.ename, e.sal, s.grade
from emp e JOIN salgrade s
ON e.sal BETWEEN s.losal and s.hisal;

-- 연습문제 39) 부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력하여 보시오
SELECT deptno, count(*) as 사원수, count(comm) as "커미션 받은 사원수"
FROM emp
GROUP BY deptno;

-- 연습문제 40) 부서번호(deptno)가 10은 '총무부', 20은 '개발부', 30은 '영업부'라고 하여 이름, 부서번호, 부서명 순으로 출력하여 보시오.(decode나 case 함수 사용)
SELECT ename, deptno, decode(deptno, 10, '총무부', 20, '개발부', 30, '영업부') 부서명
FROM emp;

-- SELECT ename, deptno, case deptno
-- WHEN 10 THEN '총무부'
-- WHEN 20 THEN '개발부'
-- WHEN 30 THEN '영업부'
-- END "부서명"
-- FROM EMP;


