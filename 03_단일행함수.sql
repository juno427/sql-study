-- 단일행 함수

-- 문자 함수
-- 대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL Course'), LOWER('SQL COURSE'), INITCAP('SQL Course')
FROM dual; -- 듀얼 테스트용 테이블을 이용하여 연습

-- 문자 조작 함수
SELECT substr('abcdef',3,4)
FROM dual;

SELECT substr('abcdef',3,4), LENGTH('abcdefg')
FROM dual;

SELECT substr('abcdef',3,4), LENGTH('abcdefg'), INSTR('abcdefg','d')
FROM dual;

SELECT
TRIM(' 헬로우 '), ' 헬로우 '
FROM Dual; -- 공백을 없애준다.

-- 문자 함수 예제
SELECT department_id, last_name
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT department_id, last_name, email
FROM employees
WHERE INITCAP(email) = 'Sking';

SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

-- 문자열 가장 끝 문자 (-1은 문자열의 가장 끝)
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

SELECT first_name, last_name,
UPPER(CONCAT(first_name, SUBSTR(last_name, 1, 3))) 이름합성
FROM employees
WHERE department_id = 60;

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제 1) employees 테이블에서 last_name을 소문자와 대문자로 각각 출력하고, email의 첫 번째 문자는 대문자로 출력하세요.
SELECT last_name,
LOWER(last_name), UPPER(last_name), UPPER(email), INITCAP(email)
FROM employees;

-- 예제 2) employees 테이블에서 job_id 데이터 값의 첫째 자리부터 시작해서 두 개의 문자를 출력하세요.
SELECT job_id,
SUBSTR(job_id, 1, 2)
FROM employees;

-- 숫자형 함수
-- 반올림 함수 ROUND(숫자, 자릿수), 자릿수가 없으면 정수로 반올림
SELECT round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2)
FROM dual;

SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY employee_id;

-- 예제) employees 테이블에서 salary를 30으로 나눈 후 나눈 값의 결과를 반올림하여 정수, 소수점 첫째 자리, 10의 자리로 나타내시오.
SELECT salary
FROM employees
WHERE MOD(salary, 30) = round(salary, 0);
