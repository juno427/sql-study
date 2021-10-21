-- 단일행 함수

-- 문자 함수
-- 대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('SQL Course')  FROM DUAL; -- 듀얼 테스트용 테이블을 이용하여 연습

-- 문자 조작 함수
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM('  헬로우  '),'  헬로우  ' FROM DUAL; -- 공백을 없애준다.

-- 문자 함수 예제
SELECT department_id, last_name
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT last_name, CONCAT('직업명이 ',job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

-- 문자열 가장 끝 문자 (-1은 문자열의 가장 끝)
 SELECT last_name, SUBSTR(last_name, -1, 1)
 FROM employees;
 
-- 문자열 바꾸기 
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제 1,2
SELECT last_name 이름, LOWER(last_name), UPPER(last_name), email 이메일, INITCAP(email)
FROM employees;

SELECT job_id 직업명, SUBSTR(job_id, 1,2) 앞의2개 FROM employees;

-- 숫자형 함수
-- 반올림 함수 ROUND(숫자,자릿수), 자릿수가 없으면 정수로 반올림
SELECT ROUND(15.193), ROUND(15.193, 0), ROUND(15.193, 1), ROUND(15.193, 2) FROM DUAL;

-- 직원번호가 짝수번인 직원들만 출력하라
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0 -- 짝수
ORDER BY employee_id;


--  날짜형 함수 , sysdate는 현재 날짜를 의미

-- 일은 시간이 12시 이상이면 반올림
SELECT SYSDATE 현재날짜, ROUND(sysdate, 'DD') 일, ROUND(sysdate, 'MM') 월, ROUND(sysdate, 'YYYY') 년도
        , ROUND( MONTHS_BETWEEN('2021/10/5', '2021/06/10') , 1 ) 월차이
FROM DUAL;

SELECT hire_date FROM employees;

-- 날짜에 더하기 빼기를 하면 => 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날자, sysdate + 1 내일 , sysdate - 1 어제
FROM dual;

-- 예제 1, 2
SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) 월차이
FROM employees where department_id = 100;

SELECT hire_date, ADD_MONTHS(hire_date , 3) 더하기3개월, ADD_MONTHS(hire_date , -3) 빼기3개월
FROM employees WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
-- 숫자 => 문자로 변환
SELECT 
    TO_CHAR( 12345678 , '999,999,999') 콤마형식,
    TO_CHAR( 12345678.678 , '999,999,999.99') 콤마소수점형식,
    TO_CHAR( 12345678 , '$999,999,999') 달러형식,
    TO_CHAR( 12345678 , 'L999,999,999') 로컬통화
FROM DUAL;

-- 날짜 => 문자로 변환

SELECT 
    TO_CHAR( sysdate , 'YYYY/MM/DD') 날짜표시,
    TO_CHAR( sysdate , 'YYYY/MM/DD HH24:MI:SS') 시간표시
FROM DUAL;

-- 예제 1,2
SELECT employee_id , TO_CHAR(hire_date, 'YY/MM') 입사월
FROM employees WHERE department_id = 100;

SELECT last_name 이름 , TO_CHAR( salary, '$99,999.99') 월급
FROM employees WHERE salary > 10000 ORDER BY salary DESC;

-- 문자열 => 날짜 변환
SELECT TO_DATE('2011/01/01', 'YYYY/MM/DD')
FROM DUAL;

-- 문자열 => 숫자 변환
SELECT TO_NUMBER('0123')+100
FROM DUAL;

-- 널값 관련 함수 (null)

-- NVL( 값 , 0 ) => 만약 값이 널이면 0으로 변환
SELECT last_name 이름, NVL( manager_id , 0 ) 매니저
FROM employees WHERE last_name = 'King';

-- NVL2( 값 , 첫번째, 두번째 ) => 만약 값이 널값이 아니면 첫번째 , 아니면 두번째
SELECT last_name 이름, NVL2( manager_id , 1 , 0 ) 매니저
FROM employees WHERE last_name = 'King';

-- 예제 1,2
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
        salary*12 + salary*12*NVL(commission_pct, 0) 연봉
FROM employees ORDER BY 연봉 DESC;

SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, 
        salary*12 + salary*12*NVL(commission_pct, 0) 연봉,
        NVL2(commission_pct, '월급+보너스' ,'월급만' ) 연봉계산방법
FROM employees ORDER BY 연봉 DESC;

-- decode 함수
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary) 수정월급
FROM employees;

--예제 
SELECT last_name 이름, job_id 직무, salary 월급,
    DECODE( TRUNC(salary/2000),  0,  0,
                                 1,  0.09,
                                 2,  0.2,
                                 3,  0.3,
                                 4,  0.4,
                                 5,  0.42,
                                 6,  0.44,
                                     0.45 )  세율
FROM employees;

-- CASE 함수 비교가능
SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "급여 수준"
FROM employees;

-- CASE 예제 
SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary>=9000   THEN '상위급여'
          WHEN salary>=6000   THEN '중위급여'
          ELSE                     '하위급여'  
    END  급여등급
FROM employees WHERE job_id = 'IT_PROG';
