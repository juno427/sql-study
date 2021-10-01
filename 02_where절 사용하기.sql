-- 월급이 14000보다 많은 직원
SELECT *
FROM employees
WHERE salary > 14000;

-- 문자열은 따옴표로 표시, 이름이 King인 직원
SELECT *
FROM employees
WHERE last_name = 'King';

-- 날짜를 비교, 고용일이 2002년 6월 10일 이전
SELECT *
FROM employees
WHERE hire_date < '2002/06/10';

-- 예제 1) employees 테이블에서 employee_id가 100인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE  employee_id = '100';

-- 예제 2) employees 테이블에서 first_name이 David인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE first_name = 'David';

-- 예제 3) employees 테이블에서 employee_id가 105 이하인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE employee_id <= '105';

-- 예제 4) job_history 테이블에서 start_date가 2006년 3월 3일 이후인 정보를 출력.
SELECT *
FROM job_history
WHERE start_date > '2006/03/03';

-- 예제 5) departments 테이블에서 location_id가 1700이 아닌 모든 부서를 출력하라.
SELECT *
FROM departments
WHERE location_id != '1700';

-- 논리 연산자 AND, OR, NOT
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
OR (department_id = 80
AND salary > 10000);

SELECT *
FROM employees
WHERE NOT( hire_date > '2004/01/01' OR salary > 5000 );
-- hire_date <= '2004/01/01' AND salary <= 5000

-- 예제 1) employees 테이블에서 salary가 4000보다 크면서, job_id가 IT_PROG인 employee들을 조회하세요.
SELECT *
FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG';

-- 예제 2) employees 테이블에서 우선 salary는 4000보다 커야되고 job_id는 IT_PROG거나(OR) FI_ACCOUNT인 경우를 조회하세요.
SELECT *
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN 연산자 () 안의 값과 같을 때 OR로 연결
SELECT *
FROM employees
WHERE salary > 4000 OR salary = 3000 OR salary = 2700;

-- IN 연산자 활용
SELECT *
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );

-- 예제) employees 테이블에서 salary가 10000, 17000, 24000인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE salary IN ( 10000, 17000, 24000);

-- 예제) employees 테이블에서 department_ID가 30, 50, 80, 100, 110이 아닌 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE department_ID NOT IN ( 30, 50, 80, 100, 110 );

-- BETWEEN 연산자
SELECT *
FROM employees
WHERE salary >= 9000 AND salary <= 10000;

-- 
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

-- 예제 1) employees 테이블에서 salary가 10,000 이상이고 20,000 이하인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

-- 예제 2) employees 테이블에서 hire_date가 2004년 1월 1일부터 2004년 12월 30일 사이인 직원 정보를 출력하세요.
SELECT *
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';

-- 예제 3) employees 테이블에서 salary가 7000 미만이거나, 17000 보다 많은 사원을 출력하라.
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

-- LIKE 연산자 _, %를 같이 사용해서 문자열을 검색
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; -- 대문자 B로 시작하면 전부 출력. 뒤에는 어떤 문자가와도 상관없음.

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; -- 문자열의 중간에 b가 있으면 전부 출력.

SELECT *
FROM employees
WHERE last_name LIKE '____y'; -- 언더바(_) 정확한 자릿수를 표현

-- 예제 1) employees 테이블에서 job_id 값이 AD를 포함하는 모든 데이터를 조회하세요.
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

-- 예제 2) employees 테이블에서 job_id가 AD를 포함하면서 AD 뒤에 따라오는 문자열이 3자리인 데이터 값을 갖는 직원 정보를 조회하세요.
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

-- 예제 3) employees 테이블에서 전화번호 뒷자리가 1234로 끝나는 직원 정보를 조회하세요.
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

-- 예제 4) employees 테이블에서 전화번호에 3이 들어가지 않으면서 전화번호 끝자리가 9로 끝나는 직원 정보를 출력하시오.
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

-- is null 연산자
-- null값을 검색하기 위해 IS NULL을 사용
SELECT *
FROM employees
WHERE commission_pct IS NULL;

-- 널(NULL) 이란?
-- 입력되지 않은 사용할수 없는 값이고 0 또는 공백(' ')이 아니다.
-- null값이 아닌 경우를 찾을 때 IS NOT NULL을 사용
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- 예제) employees 테이블에서 manager_id가 null 값인 직원 정보를 출력해 보세요.
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY 열 이름 [ASC or DESC]
-- ASC : 오름차순, DESC : 내림차순
-- ORDER BY 열 + ASC or DESC 열의 오름차순 내림차순 정렬
SELECT *
FROM employees
ORDER BY employee_id; -- ASC 기본 정렬은 생략가능

SELECT *
FROM employees
ORDER BY employee_id DESC;

-- 정렬 열이 2개 이상일 때 첫번째 열로 정렬 후 두번째 열 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

-- 별칭으로 정렬
SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC;

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 3 DESC;

-- 예제 1) employees 테이블에서 employee_id, first_name, last_name을 출력하고 employees_id를 기준으로 내림차순 정렬하세요.
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

-- 예제 2) employees 테이블에서 job_id에 CLERK란 단어가 들어가는 직원들의 salary가 높은 순으로 정렬하세요.
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

-- 예제 3) employees 테이블에서 employee_id(직원번호)가 120에서 150번까지 직원을 부서번호(department_id)가 큰 순으로 정렬하고 부서번호가 같을시 월급(salary)이 큰 순으로 정렬하라.
SELECT employee_id, first_name, department_id, salary
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY Department_id DESC, salary DESC;
