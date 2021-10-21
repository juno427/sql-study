
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

-- 직원번호가 짝수번인 직원들만 출력하라
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY employee_id;

-- 날짜형 함수, sysdate는 현재 날짜를 의미
-- 일은 시간이 12시 이상이면 반올림
SELECT sysdate 현재날짜, ROUND(sysdate, 'dd') 일, ROUND(sysdate, 'mm') 월, ROUND(sysdate, 'yyyy') 년도, 
ROUND(MONTHS_BETWEEN('2021/10/5', '2021/06/10'), 1 ) 월차이
FROM dual;

SELECT hire_date
FROM employees;

-- 날짜에 더하기 빼기를 하면 → 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날짜, sysdate + 1 내일, sysdate - 1 어제
FROM dual;

-- 예제 1) employees 테이블에서 department_id가 100인 직원에 대해 오늘 날짜, hire_date, 오늘 날짜와 hire_date 사이의 개월수를 출력하세요.
SELECT sysdate 오늘날짜, hire_date 입사날짜, MONTHS_BETWEEN(sysdate, hire_date) 적용결과
FROM employees
WHERE department_id = '100';

-- 예제 2) employees 테이블에서 employee_id가 100과 106 사이인 직원의 hire_date에 3개월을 더한 값, hire_date에 3개월을 뺀 값을 출력하세요.
SELECT hire_date, ADD_MONTHS(hire_date, 3) 더하기_3개월, ADD_MONTHS(hire_date, -3) 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
-- 숫자 → 문자로 변환
SELECT to_char( 12345678, '999,999,999') 콤마형식,
to_char(12345678.678, '999,999,999.99') 콤마소수점형식,
to_char(12345678, '$999,999,999') 달러형식,
to_char(12345678, 'L999,999,999') 로컬통화
FROM dual;

-- 날짜 → 문자로 변환
SELECT to_char( sysdate, 'yyyy-mm-dd') 날짜표시,
to_char( sysdate, 'yyyy-mm-dd hh24:mi:ss') 시간표시
FROM dual;

-- 예제 1) employees 테이블에서 department)id가 100인 사원들의 입사일을 이용하여 아래와 같이 나타내어라. 날짜 형식 '월/년도'
SELECT employee_id, to_char( hire_date, 'yy/mm' )
FROM employees
WHERE department_id = '100';

-- 예제 2) employees 테이블에서 salary가 10000달러가 넘는 사원들의 이름과 월급을 월급이 많은 순으로 나타내어라.
SELECT last_name 이름, to_char( salary, '$999,999,999.99' ) 월급
FROM employees
WHERE salary > 10000 ORDER BY salary DESC;

-- 문자열 → 날짜 변환
SELECT to_date('2011-01-01', 'yyyy-mm-dd')
FROM dual;

-- 문자열 → 숫자 변환
SELECT to_number('0123')+100
FROM dual;

-- 널값 관련 함수(null)
-- NVL( 값, 0 ) → 만약 값이 널이면 0으로 변환
SELECT last_name, NVL( manager_id, 0 )
FROM employees
WHERE last_name = 'King';

-- NVL2( 값, 첫번째, 두번째 ) → 만약 값이 널값이 아니면 첫번째, 아니면 두번째
SELECT last_name 이름, NVL2 ( manager_id, 1, 0 ) 매니저
FROM employees
WHERE last_name = 'King';

-- 예제 1) employees 테이블에서 아래와 같이 이름. 월급(salary), 커미션(commission_pct)를 NVL 함수사용, 연봉은(월급*12) + (월급*12*커미션)이다.
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
salary*12 + salary*12*NVL(commission_pct, 0) 연봉
FROM employees
ORDER BY 연봉 DESC;

SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
salary*12 + salary*12*NVL(commission_pct, 0) 연봉, 
NVL2(commission_pct, '월급+보너스', '월급만') 연봉계산방법
FROM employees
ORDER BY 연봉 DESC;

-- decode 함수
SELECT last_name 이름, job_id, salary,
decode(job_id, 
'IT_PROG', salary * 1.10, 
'ST_CLERK', salary * 1.15, 
'SA_REP', salary * 1.20, 
salary) "수정월급"
FROM employees;

-- 예제) employees 테이블에서 DECODE 함수를 이용해서 월급에 따른 세율을 나타내세요. TRUNC( salary/2000 )의 값이 0일때 0%, 1일때 9%, ...
SELECT last_name 이름, job_id 직무, salary 월급,
decode( TRUNC(salary/2000), 0, 0,
                            1, 0.09, 
                            2, 0.2, 
                            3, 0.3, 
                            4, 0.4, 
                            5, 0.42, 
                            6, 0.44, 
                            7, 0.45 ) 세율
FROM employees;

-- CASE 함수 비교가능
SELECT last_name 이름, job_id, salary,
    CASE    WHEN salary<5000    THEN 'low'
            WHEN salary<10000   THEN 'medium'
            WHEN salary<20000   THEN 'good'
            ELSE                     'excellent'
    END "급여 수준"
FROM employees;

-- 예제) employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salary가 9000 이상이면 '상위급여', 6000과 8999 사이면 '중위급여, 그 외는 '하위급여'라고 출력하세요.
SELECT employee_id, first_name, last_name, salary,
    CASE    WHEN salary>=9000   THEN '상위급여'
            WHEN salary>=6000   THEN '중위급여'
            ELSE                     '하위급여'
    END 급여등급
FROM employees
WHERE job_id = 'IT_PROG';




=======
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

-- 직원번호가 짝수번인 직원들만 출력하라
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY employee_id;

-- 날짜형 함수, sysdate는 현재 날짜를 의미
-- 일은 시간이 12시 이상이면 반올림
SELECT sysdate 현재날짜, ROUND(sysdate, 'dd') 일, ROUND(sysdate, 'mm') 월, ROUND(sysdate, 'yyyy') 년도, 
ROUND(MONTHS_BETWEEN('2021/10/5', '2021/06/10'), 1 ) 월차이
FROM dual;

SELECT hire_date
FROM employees;

-- 날짜에 더하기 빼기를 하면 → 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날짜, sysdate + 1 내일, sysdate - 1 어제
FROM dual;

-- 예제 1) employees 테이블에서 department_id가 100인 직원에 대해 오늘 날짜, hire_date, 오늘 날짜와 hire_date 사이의 개월수를 출력하세요.
SELECT sysdate 오늘날짜, hire_date 입사날짜, MONTHS_BETWEEN(sysdate, hire_date) 적용결과
FROM employees
WHERE department_id = '100';

-- 예제 2) employees 테이블에서 employee_id가 100과 106 사이인 직원의 hire_date에 3개월을 더한 값, hire_date에 3개월을 뺀 값을 출력하세요.
SELECT hire_date, ADD_MONTHS(hire_date, 3) 더하기_3개월, ADD_MONTHS(hire_date, -3) 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
-- 숫자 → 문자로 변환
SELECT to_char( 12345678, '999,999,999') 콤마형식,
to_char(12345678.678, '999,999,999.99') 콤마소수점형식,
to_char(12345678, '$999,999,999') 달러형식,
to_char(12345678, 'L999,999,999') 로컬통화
FROM dual;

-- 날짜 → 문자로 변환
SELECT to_char( sysdate, 'yyyy-mm-dd') 날짜표시,
to_char( sysdate, 'yyyy-mm-dd hh24:mi:ss') 시간표시
FROM dual;

-- 예제 1) employees 테이블에서 department)id가 100인 사원들의 입사일을 이용하여 아래와 같이 나타내어라. 날짜 형식 '월/년도'
SELECT employee_id, to_char( hire_date, 'yy/mm' )
FROM employees
WHERE department_id = '100';

-- 예제 2) employees 테이블에서 salary가 10000달러가 넘는 사원들의 이름과 월급을 월급이 많은 순으로 나타내어라.
SELECT last_name 이름, to_char( salary, '$999,999,999.99' ) 월급
FROM employees
WHERE salary > 10000 ORDER BY salary DESC;

-- 문자열 → 날짜 변환
SELECT to_date('2011-01-01', 'yyyy-mm-dd')
FROM dual;

-- 문자열 → 숫자 변환
SELECT to_number('0123')+100
FROM dual;

-- 널값 관련 함수(null)
-- NVL( 값, 0 ) → 만약 값이 널이면 0으로 변환
SELECT last_name, NVL( manager_id, 0 )
FROM employees
WHERE last_name = 'King';

-- NVL2( 값, 첫번째, 두번째 ) → 만약 값이 널값이 아니면 첫번째, 아니면 두번째
SELECT last_name 이름, NVL2 ( manager_id, 1, 0 ) 매니저
FROM employees
WHERE last_name = 'King';

-- 예제 1) employees 테이블에서 아래와 같이 이름. 월급(salary), 커미션(commission_pct)를 NVL 함수사용, 연봉은(월급*12) + (월급*12*커미션)이다.
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
salary*12 + salary*12*NVL(commission_pct, 0) 연봉
FROM employees
ORDER BY 연봉 DESC;

SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
salary*12 + salary*12*NVL(commission_pct, 0) 연봉, 
NVL2(commission_pct, '월급+보너스', '월급만') 연봉계산방법
FROM employees
ORDER BY 연봉 DESC;

-- decode 함수
SELECT last_name 이름, job_id, salary,
decode(job_id, 
'IT_PROG', salary * 1.10, 
'ST_CLERK', salary * 1.15, 
'SA_REP', salary * 1.20, 
salary) "수정월급"
FROM employees;

-- 예제) employees 테이블에서 DECODE 함수를 이용해서 월급에 따른 세율을 나타내세요. TRUNC( salary/2000 )의 값이 0일때 0%, 1일때 9%, ...
SELECT last_name 이름, job_id 직무, salary 월급,
decode( TRUNC(salary/2000), 0, 0,
                            1, 0.09, 
                            2, 0.2, 
                            3, 0.3, 
                            4, 0.4, 
                            5, 0.42, 
                            6, 0.44, 
                            7, 0.45 ) 세율
FROM employees;

-- CASE 함수 비교가능
SELECT last_name 이름, job_id, salary,
    CASE    WHEN salary<5000    THEN 'low'
            WHEN salary<10000   THEN 'medium'
            WHEN salary<20000   THEN 'good'
            ELSE                     'excellent'
    END "급여 수준"
FROM employees;

-- 예제) employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salary가 9000 이상이면 '상위급여', 6000과 8999 사이면 '중위급여, 그 외는 '하위급여'라고 출력하세요.
SELECT employee_id, first_name, last_name, salary,
    CASE    WHEN salary>=9000   THEN '상위급여'
            WHEN salary>=6000   THEN '중위급여'
            ELSE                     '하위급여'
    END 급여등급
FROM employees
WHERE job_id = 'IT_PROG';

