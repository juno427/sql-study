
-- 서브쿼리
-- Popp 직원보다 고용일(입사일)이 최근(이후)에 고용한 사람
-- 주의점 : 단일행 서브쿼리를 사용할 때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야 한다.
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp');

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees );

-- 예제 1) 사원 'Abel'(last_name)보다 급여가 많은 사원의 last_name, salary를 나타내어라.(서브쿼리 사용)
SELECT last_name, salary
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel' );

-- 예제 2) 'Bull'이란 last_name을 가진 사원의 부서에서 Bull보다 높은 급여를 받는 사원들을 출력하라.(서브쿼리 사용)
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE   salary > ( SELECT salary FROM employees WHERE last_name = 'Bull' )
        AND department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull' );

-- 예제 3) 'Russell'이란 last_name의 직원번호를 manager_id로 가지는 직원들의 last_name, salary, manager_id를 출력하시오.
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell' );

-- 예제 4) jobs 테이블에 job_title이 'stock Manager'의 job_id를 가진 직원들의 정보를 Employees 테이블에서 찾아서 출력하시오.
SELECT *
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );

SELECT MIN(salary)
FROM employees
GROUP BY department_id; --부서별 최저월급

SELECT employee_id, department_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY 도 값이 하나라도 맞으면 검색됨
SELECT department_id, last_name, salary
FROM employees
WHERE   salary < ANY ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' )
        AND job_id != 'IT_PROG'
        ORDER BY salary DESC;

-- 예제 1) 부서번호(department_id)가 20번인 직원들의 매니저아이디(manager_id)와 같은 매니저를 가지는 직원들을 출력하라.(단 20번 부서의 직원은 제외!)
SELECT employee_id, first_name, manager_id 직종, salary 급여
FROM employees
WHERE manager_id IN ( SELECT manager_id FROM employees WHERE department_id = 20 );

-- 예제 2) job_id가 'ST_MAN'인 직원들 중 어느 한직원 보다도 급여가 작은 직원들을 출력하라.(ANY)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE   salary < ANY ( SELECT salary FROM employees WHERE job_id = 'ST_MAN' );

-- 예제 3) 직책이 'iT_PROG'인 직원들보다 급여가 작은 직원들을 출력하시오.(ALL)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' );

-- 다중열 서브쿼리 (열이 여러개일 때)
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id 
                                FROM employees 
                                WHERE first_name = 'Bruce')
AND first_name != 'Bruce';

-- 부서별 최소 급여를 받는 직원들을 검색
SELECT department_id 부서번호,  employee_id 사원번호, first_name, salary
FROM employees
WHERE (department_id, salary) IN   (SELECT department_id, min(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

-- 예제) employees 테이블에서 job_id 별로 가장 낮은 salary가 얼마인지 찾아보고, 
--      찾아낸 job_id별 salary에 해당하는 직원의 first_name, job_id, department_id를 출력하시오.
--      (salary 내림차순 정렬)
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN  (SELECT job_id, min(salary)
                            FROM employees
                            GROUP BY job_id)
ORDER BY salary DESC;

-- 집합
-- UNION 합집합 : 중복을 제거한다.(결과줄 수 115)
SELECT employee_id 직원번호, job_id 직종
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL 합집합 : 두개의 select문의 결과를 합친다.(결과줄 수 117)
SELECT employee_id 직원번호, job_id 직종
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history;

-- INTERSECT 교집합
SELECT employee_id 직원번호, job_id 직종
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS 차집합 (결과줄 수 : 105 => 107 - 2)
SELECT employee_id 직원번호, job_id 직종
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

-- 예제 1) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을
-- UNION 연산자를 위용해 합쳐보세요.
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

-- 예제 2) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을
-- UNION ALL 연산자를 이용해 합쳐보세요.
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

-- 예제 3) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합의
-- 교집합을 INTERSECT 연산자를 이용해 출력해 보세요.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- 예제 4) departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을
-- MINUS 연산자를 이용해 빼 보세요.
SELECT department_id
FROM employees
MINUS
SELECT department_id
FROM departments;
=======
-- 서브쿼리
-- Popp 직원보다 고용일(입사일)이 최근(이후)에 고용한 사람
-- 주의점 : 단일행 서브쿼리를 사용할 때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야 한다.
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp');

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees );

-- 예제 1) 사원 'Abel'(last_name)보다 급여가 많은 사원의 last_name, salary를 나타내어라.(서브쿼리 사용)
SELECT last_name, salary
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel' );

-- 예제 2) 'Bull'이란 last_name을 가진 사원의 부서에서 Bull보다 높은 급여를 받는 사원들을 출력하라.(서브쿼리 사용)
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE   salary > ( SELECT salary FROM employees WHERE last_name = 'Bull' )
        AND department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull' );

-- 예제 3) 'Russell'이란 last_name의 직원번호를 manager_id로 가지는 직원들의 last_name, salary, manager_id를 출력하시오.
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell' );

-- 예제 4) jobs 테이블에 job_title이 'stock Manager'의 job_id를 가진 직원들의 정보를 Employees 테이블에서 찾아서 출력하시오.
SELECT *
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );

SELECT MIN(salary)
FROM employees
GROUP BY department_id; --부서별 최저월급

SELECT employee_id, department_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY 도 값이 하나라도 맞으면 검색됨
SELECT department_id, last_name, salary
FROM employees
WHERE   salary < ANY ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' )
        AND job_id != 'IT_PROG'
        ORDER BY salary DESC;

-- 예제 1) 부서번호(department_id)가 20번인 직원들의 매니저아이디(manager_id)와 같은 매니저를 가지는 직원들을 출력하라.(단 20번 부서의 직원은 제외!)
SELECT employee_id, first_name, manager_id 직종, salary 급여
FROM employees
WHERE manager_id IN ( SELECT manager_id FROM employees WHERE department_id = 20 );

-- 예제 2) job_id가 'ST_MAN'인 직원들 중 어느 한직원 보다도 급여가 작은 직원들을 출력하라.(ANY)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE   salary < ANY ( SELECT salary FROM employees WHERE job_id = 'ST_MAN' );

-- 예제 3) 직책이 'iT_PROG'인 직원들보다 급여가 작은 직원들을 출력하시오.(ALL)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' );

-- 다중열 서브쿼리 (열이 여러개일 때)
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id 
                                FROM employees 
                                WHERE first_name = 'Bruce')
AND first_name != 'Bruce';

-- 부서별 최소 급여를 받는 직원들을 검색
SELECT department_id 부서번호,  employee_id 사원번호, first_name, salary
FROM employees
WHERE (department_id, salary) IN   (SELECT department_id, min(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

-- 예제) employees 테이블에서 job_id 별로 가장 낮은 salary가 얼마인지 찾아보고, 
--      찾아낸 job_id별 salary에 해당하는 직원의 first_name, job_id, department_id를 출력하시오.
--      (salary 내림차순 정렬)
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN  (SELECT job_id, min(salary)
                            FROM employees
                            GROUP BY job_id)
ORDER BY salary DESC;

-- 집합
-- UNION 합집합 : 중복을 제거한다.(결과줄 수 115)
SELECT employee_id 직원번호, job_id 직종
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL 합집합 : 두개의 select문의 결과를 합친다.(결과줄 수 117)
SELECT employee_id 직원번호, job_id 직종
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history;

-- INTERSECT 교집합
SELECT employee_id 직원번호, job_id 직종
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS 차집합 (결과줄 수 : 105 => 107 - 2)
SELECT employee_id 직원번호, job_id 직종
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

-- 예제 1) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을
-- UNION 연산자를 위용해 합쳐보세요.
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

-- 예제 2) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을
-- UNION ALL 연산자를 이용해 합쳐보세요.
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

-- 예제 3) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합의
-- 교집합을 INTERSECT 연산자를 이용해 출력해 보세요.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- 예제 4) departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을
-- MONUS 연산자를 이용해 빼 보세요.
SELECT department_id
FROM employees
MINUS
SELECT department_id
FROM departments;
