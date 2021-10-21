-- 연습문제 1~10

-- 연습문제 1) 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라.
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

-- 연습문제 2) 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라.
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

-- 연습문제 3) 이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- 연습문제 4) 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20'; -- '81-02-20'

-- 연습문제 5) 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE job != 'MANAGER'; -- !=, <>

-- 연습문제 6) 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate > '81/04/02';

-- 연습문제 7) 급여가 $800 이상인 사람의 이름, 급여, 부서번호를 출력하라.
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

-- 연습문제 8) 부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE deptno >= 20;

-- 연습문제 9) 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라.
-- (문자열 비교시 알파벳순으로 철자 비교 예 'B' > 'A'
SELECT *
FROM emp
WHERE ename >= 'L';

-- 연습문제 10) 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

-- 연습문제 11) 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력하라.
SELECT empno, ename
FROM emp
WHERE empno <= '7698';

-- 연습문제 12) 입사일이 81/04/02보다 같거나 늦고 82/12/09보다 같거나 빠른 사원의 
-- 이름, 월급, 부서번호를 출력하라.
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

-- 연습문제 13) 급여가 $1,600보다 크고 $3,000보다 작은 직원의 이름, 직업, 급여를 출력하라.
SELECT ename, job, sal
FROM emp
WHERE sal > '1600' AND sal < '3000'; -- sal < 1600 AND sal < 3000;

-- 연습문제 14) 직원번호가 7654와 7782 사이가 아닌 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE empno NOT BETWEEN '7654' AND '7782'; -- empno < 7654 OR empno > 7782;

-- 연습문제 15) 이름이 B와 J 사이의 모든 직원의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J'; -- ename >= 'B' AND ename <= 'J';

-- 연습문제 16) 입사일이 81년이 아닌 모든 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE   NOT(hiredate >= '81/01/01' AND hiredate <= '81/12/31');
        -- hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
        -- TO_CHAR(hiredate, 'YYYY') != '1981';
        -- hiredate NOT LIKE '81%'; 서치할 내용이 방대할 경우 느려짐. 잘 안쓰는게 좋음
        
-- 연습문제 17) 직업이 MANAGER이거나 SALESMAN인 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');

-- 연습문제 18) 부서번호가 20, 30번을 제외한 모든 직원으 이름, 사원번호, 부서번호를 출력하라.
SELECT ename, empno, deptno
FROM emp
WHERE   deptno NOT IN (20, 30);
        -- deptno != 20 AND deptno != 30;

-- 연습문제 19) 이름이 S로 시작하는 직원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

-- 연습문제 20) 입사일이 81년도인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

-- 연습문제 21) 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- 연습문제 22) 이름이 M로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라.
-- (단, 이름은 전체 6자리이다. 자리수를 이용한 와일드카드 '_'을 이용)
SELECT *
FROM emp
WHERE   ename LIKE 'M_____' AND ename LIKE '_____N';
        --ename LIKE 'M____N';

-- 연습문제 23) 이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- 연습문제 24) 커미션이 NULL인 사람의 정보를 출력하라.(IS NULL 또는 IS NOT NULL 사용)
SELECT *
FROM emp
WHERE comm is NULL;

-- 연습문제 25) 커미션이 NULL이 안니 사람의 모든 정보를 출력하라.(IS NULL 또는 IS NOT NULL 사용)
SELECT *
FROM emp
WHERE comm is NOT NULL;

-- 연습문제 26) 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal > 1500;

-- 연습문제 27) 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

-- 연습문제 28) 급여가 $1,500 이상이고 부서번호가 30번인 사원 중 직업이 MANAGER인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE sal > 1500 AND deptno = 30 AND job = 'MANAGER';

-- 연습문제 29) 부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라.
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

-- 연습문제 30) 직원들의 급여가 많은 순으로 SORT(정렬)하라.
SELECT *
FROM emp
ORDER BY sal DESC;

-- 연습문제 31) 부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 출력하라.
-- (한개 이상의 열로 정렬시 콤마(,)를 사용합니다.)
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 연습문제 32) 부서번호가 DESCEMDING SORT하고, 이름 순으로 ASCENDING SORT 급여순으로 DESCENDING SORT 하라.
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC;
            -- deptno DESC, ename, sal DESC;

-- 연습문제 33) 10번 부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다. 
-- 이름, 급여, 보너스금액, 부서번호를 출력하라.(소수점은 반올림함.)

SELECT ename, sal, ROUND(sal*0.13) bonus, deptno
FROM emp
WHERE deptno = 10;

-- 연습문제 34) 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하여라.
-- (단, 커미션이 null인 사원도 0으로 해서 포함.)
SELECT ename, sal, nvl(COMM, 0), sal+nvl(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

--연습문제 35) 급여가 $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
-- 모든 사원의 이름, 급여, 회비(소수이하 2자리에서 반올림)를 출력하여라.
-- (단, 회비는 달러표시($)로 시작하고 소수점 1자리까지 출력)
SELECT ename, sal, TO_char(sal*0.15, '$999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000; 

-- 연습문제 36) 사원수가 5명이 넘는 부서의 부서명과 사원수 조회(조인필요)
SELECT d.dname, count(*)                   -- SELECT d.dname, count(e.empno)
FROM emp e JOIN dept d ON e.deptno = d.deptno   -- FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname                                -- GROUP BY d.dname
HAVING count(*) > 5;                      -- HAVING count(e.empno) > 5;

-- 연습문제 37) 직업별 급여합계가 5000을 초과한느 각 직무에 대해서 직무와 급여 합계를 조회.
-- (단 판매원(SALESMAN)은 제외)
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
 
-- 연습문제 38) 사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여등급(grade)을 출력하시오.
-- (테이블 salgrade 비동등 조인)
SELECT e.empno, e.ename, e.sal, s.grade
from emp e JOIN salgrade s
ON e.sal BETWEEN s.losal and s.hisal;

-- 연습문제 39) 부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력하여 보시오
SELECT deptno, count(*) as 사원수, count(comm) as "커미션 받은 사원수"
FROM emp
GROUP BY deptno;

-- 연습문제 40) 부서번호(deptno)가 10은 '총무부', 20은 '개발부', 30은 '영업부'라고 하여 
-- 이름, 부서번호, 부서명 순으로 출력하여 보시오.(decode나 case 함수 사용)
SELECT ename, deptno, decode(deptno, 10, '총무부', 
                                     20, '개발부', 
                                     30, '영업부') 부서명
FROM emp;

-- SELECT ename, deptno, case deptno
-- WHEN 10 THEN '총무부'
-- WHEN 20 THEN '개발부'
-- WHEN 30 THEN '영업부'
-- END "부서명"
-- FROM EMP;


