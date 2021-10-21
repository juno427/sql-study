-- where 절
SELECT *
FROM EMPLOYEES
WHERE SALARY > 14000; -- 월급이 14000보다 많은 직원

SELECT * 
FROM employees
WHERE last_name = 'King';  -- 문자열은 따옴표로 표시, 이름이 King인 직원

SELECT * 
FROM employees
WHERE hire_date < '2002/06/10'; -- 날짜를 비교, 고용일이 2002년 6월 10일 이전

-- 예제 1
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
-- 예제 2
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'David';
-- 예제 3
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID <= 105;
-- 예제 4
SELECT * FROM JOB_HISTORY WHERE START_DATE >= '2006/03/03';
-- 예제 5
SELECT * FROM DEPARTMENTS WHERE LOCATION_ID <> 1700; -- !=

-- 논리 연산자 AND OR NOT
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
    OR (DEPARTMENT_ID = 80
    AND SALARY > 10000);
    
SELECT *
FROM employees
WHERE NOT( hire_date > '2004/01/01' OR salary > 5000 );
--  hire_date <= '2004/01/01' AND salary <= 5000   

-- 예제 1
SELECT *
FROM employees 
WHERE salary > 4000 AND job_id = 'IT_PROG';

-- 예제 2
SELECT *
FROM employees 
WHERE salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN 연산자 : ()안의 값과 같을때 OR로 연결
SELECT * 
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );

-- 예제 1
SELECT * FROM employees WHERE salary IN ( 10000, 17000, 24000 );
-- 예제 2
SELECT * FROM employees WHERE department_id NOT IN ( 30,50,80,100,110 );

-- between 사이값
SELECT * FROM employees WHERE salary BETWEEN 9000 AND 10000;

-- 예제 1
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;
-- 예제 2
SELECT * FROM employees WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';
-- 예제 3
SELECT * FROM employees WHERE salary NOT BETWEEN 7000 AND 17000;

-- LIKE 연산자 _ %를 같이 사용해서 문자열을 검색
SELECT * FROM employees WHERE last_name LIKE 'B%'; -- 대문자B로 시작 뒤에는 상관없음
SELECT * FROM employees WHERE last_name LIKE '%b%'; --  문자열의 중간이 b가 있으면 전부 출력 
SELECT * FROM employees WHERE last_name LIKE '____y'; -- 언더바(_) 정확한 자릿수를 표현

-- 예제 1,2,3,4,5
SELECT * FROM employees WHERE job_id LIKE '%AD%';
SELECT * FROM employees WHERE job_id LIKE '%AD___';
SELECT * FROM employees WHERE phone_number LIKE '%1234';
SELECT * FROM employees WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
SELECT * FROM employees WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

SELECT commission_pct FROM employees;
-- 널(NULL) 이란?
-- 입력되지 않은 사용할수 없는 값이고 0 또는 공백('')이 아니다.
-- 널값을 검색하기 위해 is NULL 
SELECT * FROM employees WHERE commission_pct is NULL;
-- 널값이 아닐 경우면 찾을때 is NOT NULL
SELECT * FROM employees WHERE commission_pct is NOT NULL;

-- ORDER BY 열 + ASC or DESC  열의 오름차순 내림차순 정렬
SELECT * FROM employees ORDER BY employee_id DESC;
SELECT * FROM employees ORDER BY employee_id; -- ASC 기본정렬은 생략가능

-- 정렬 열이 2개 이상일때 첫번째 열로 정렬후 두번째 열 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

-- 별칭으로 정렬
SELECT department_id, last_name, salary*12 연봉
FROM employees ORDER BY 연봉 DESC;

-- 예제 1,2,3
SELECT department_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT * FROM employees WHERE job_id LIKE '%CLERK%' 
ORDER BY salary DESC;

SELECT employee_id 직원번호, last_name 직원이름, department_id 부서번호, salary 월급
FROM employees WHERE employee_id BETWEEN 120 AND 150
ORDER BY 부서번호 DESC, 월급 DESC;



