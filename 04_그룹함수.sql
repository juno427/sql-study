-- 그룹함수 (다중행 함수)
SELECT  ROUND (AVG(salary)) 평균값, MAX(salary) 최대값, MIN(salary) 최소값, 
        SUM(salary) 합계, count(salary) 카운트
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 80; -- 80번 부서의 직원들

-- 그룹함수에서는 널값을 제외하고 계산한다.(예외 COUNT(*))
SELECT COUNT(department_id)
FROM employees; --1명이 부서가 없음(사장)

SELECT COUNT(distinct department_id)
FROM employees; --중복되지 않은 부서의 개수


SELECT AVG(commission_pct)
FROM employees; --널값을 제외한 모든 직원들의 커미션 평균

-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id ORDER BY 부서번호; -- 부서번호로 그룹나눔

SELECT *
FROM employees
WHERE department_id is null; -- 

-- 예제 1) 부서별 사원수, 최대급여, 최소급여, 급여합계, 평균급여를 급여합계 큰순으로 조회
SELECT  department_id 부서명, COUNT(*) 사원수, MAX(salary) 최대급여, 
        MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

-- 예제 2) 부서별, 직업별(job_id), 상사번호(manager_id)별로 그룹을 지어 salary 합계와 그룹별 직원의 숫자를 출력하라.
SELECT department_id 부서번호, job_id 직업, SUM(salary), COUNT(*) 직원수
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- 예제 3) 부서별로 최고 월급을 뽑아서 평균을 내고, 최저월급 또한 평균을 내어 출력하라
SELECT AVG(MAX(salary)) 부서별최고월급평균, AVG(MIN(salary)) 부서별최저월급평균
FROM employees
GROUP BY department_id;

-- 그룹 함수의 조건절 HAVING
SELECT department_id 부서번호, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5; -- 사원수 5명이 넘는 부서

-- 예제 1) 아래 예제는 직종별 평균 월급이 $10000을 초과하는 직종에 대해서 job_id와 월 굽여 합계를 조회하는 예이다. 단 어카운트 매니저(AC_MGR)은 제외하고 월 급여 합계로 내림차순 정렬하시오.
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY 월급여합계 DESC;

-- 예제 2) 부서번호 40을 제외한 부서별 평균 급여가 7000 이하인 부서들의 평균 급여를 출력
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

-- 예제 3) 직종별로 월급(salary)의 합계가 13000 이상인 직종을 출력하라. 급여총액을 내림차순으로 정렬하고, 직종(job_id)에 'REP' 들어있는 직종은 제외한다.
SELECT job_id 직업번호, SUM(salary) 급여합계
FROM employees
WHERE job_id
NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) >= 13000
ORDER BY 급여합계 DESC;
