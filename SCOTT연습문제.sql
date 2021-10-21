-- 연습문제 1~10
--1
SELECT empno, ename, sal 
FROM emp
WHERE deptno = 10;
--2
SELECT ename, hiredate, deptno 
FROM emp
WHERE empno = 7369;
--3
SELECT *
FROM emp
WHERE ename = 'ALLEN';
--4
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '1981-02-20';
--5
SELECT *
FROM emp
WHERE job <> 'MANAGER'; -- !=, <>
--6
SELECT *
FROM emp
WHERE hiredate >= '1981/04/02';
--7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;
--8
SELECT *
FROM emp
WHERE deptno >= 20;
--9
SELECT *
FROM emp
WHERE ename >= 'L';
--10
SELECT *
FROM emp
WHERE hiredate < '1981/12/09';

--11
SELECT empno, ename
FROM emp
WHERE empno <= 7698;
--12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate >= '1981-04-02'
AND hiredate <= '1982-12-09';

SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '1981-04-02' AND '1982-12-09';

--13
SELECT ename, job, sal
FROM emp
WHERE sal > 1600 AND sal < 3000;
--14
SELECT *
FROM emp
WHERE empno < 7654 OR empno > 7782;

SELECT *
FROM emp
WHERE NOT (empno >= 7654 AND empno <= 7782);

SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;
--15
SELECT *
FROM emp
WHERE ename >= 'B' AND ename <= 'J';

SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';
--16
SELECT *
FROM emp
WHERE NOT (hiredate >= '81/01/01' AND hiredate <= '81/12/31');

SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

SELECT *
FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') <> '1981';
--WHERE hiredate NOT LIKE '81%';
--17﻿
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

SELECT *
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');
--18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);
-- deptno != 20 AND deptno != 30;
--19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';
--20
SELECT *
FROM emp
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';

--21
SELECT *
FROM emp
WHERE ename LIKE '%S%';
--22
SELECT *
FROM emp
WHERE ename LIKE 'M____N';
--23
SELECT *
FROM emp
WHERE ename LIKE '_A%';
--24
SELECT *
FROM emp
WHERE comm IS NULL;
--25 IS NOT NULL
--26
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500;
--27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;
--28
SELECT *
FROM emp
WHERE sal >= 1500
AND deptno = 30
AND job = 'MANAGER';
--29
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno;
--30
SELECT *
FROM emp
ORDER BY sal DESC;

--31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;
--32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;
--33
select ename, sal, ROUND(sal*0.13) bonus, deptno
from emp
where deptno = 10;
--34
select ename,sal,nvl(comm, 0), sal+nvl(comm, 0) total
from emp
order by  total desc ;
--35
select ename ,sal ,TO_char( sal*0.15 , '$999.9') 회비
from emp
where sal  between 1500 and 3000;

--36
select d.dname , count(*)
from emp e JOIN dept d  ON e.deptno = d.deptno
group by d.dname
having count(*) > 5;

--37
SELECT job, SUM(sal) 급여합계
FROM emp  
--WHERE job != 'SALESMAN'     
GROUP BY job              
HAVING SUM(sal) > 5000
AND job != 'SALESMAN';   


--38
select e.empno,e.ename,e.sal,s.grade
from emp e JOIN salgrade s
ON e.sal between s.losal and s.hisal;

--39
select deptno, count(*) as 사원수,count(comm) as "커미션 받은 사원수"
from emp
group by deptno;

--40
select ename,deptno,
     decode(deptno, 10, '총무부',
                    20, '개발부',
                    30, '영업부'
           ) 부서명
from emp;

