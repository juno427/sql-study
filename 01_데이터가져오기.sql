-- 주석 단축키 ctrl+/
-- 여러줄 주석 /* + */
-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 ctrl + enter

-- 열은 전체 열(*), 명령문의 끝에는 항상 세미콜론(;)이 있어야 한다.
SELECT *
FROM departments;

-- 2. 특정 열만 조회하기
SELECT department_id, department_name
FROM departments;

-- 3. 별칭 붙이기 (열의 이름)

SELECT department_id as 부서번호, department_name 부서이름
from departments;

-- 4. 산술 연산자(+,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
from employees;
-- 월급에 100씩 뺀 열을 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정
from employees;
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정
from employees;

-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT
    last_name,
    first_name,
    job_id,
    salary,
    (salary-1000)*0.05 AS 보너스
FROM employees;

-- distinct : 중복 값을 제거
SELECT distinct job_id
FROM employees;


-- 예제 1,2,3
-- 예제 1) employees 테이블에서 employee_id, first_name, last_name을 출력하세요.
SELECT first_name, last_name
FROM employees;

-- 예제 2) employees 테이블로부터 first_name, salary, salary * 1.1 AS 뉴셀러리를 출력하세요.
SELECT first_name, salary, salary * 1.1 AS newsalary
FROM employees;

--예제 3) employees 테이블에서 employee_id는 '사원번호', first_name은 '이름', last_name은 '성'으로 출력하세요.
SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;

-- 연결 연산자 || : 열을 붙여서 하나의 열로 출력
SELECT last_name || ' is a ' || job_id as 직업정보
FROM employees;

--예제 4) employees 테이블에서 employee_id를 출력하고, first_name과 last_name을 붙여서 출력하되 가운데 한칸을 띄워 주세요. 다음 열에는 email을 출력하되 @company.com 문구를 붙여서 출력하세요.
-- 예제 4 : 이름을 한칸 띄우고 붙여서 열, email에 문자열 붙여서 출력
SELECT employee_id, first_name || ' ' || last_name 풀네임,
email || '@company.com' 이메일
FROM employees;


