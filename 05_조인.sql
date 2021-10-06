-- 조인
-- on 을 사용한 기본 조인
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_id 부서번호, d.department_name 부서이름
FROM    employees e JOIN departments d
        ON e.department_id = d.department_id;
        
-- where 절을 사용한 예전 조인방법
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_id 부서번호, d.department_name 부서이름
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 3개 테이블 직원 부서 로케이션 테이블 조인하기
SELECT e.employee_id 직원번호, d.department_name 부서명, l.city 도시
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;

-- 예제) 부서명(department_name), 시티명(city), 국가명(country_name)을 나타내는 테이블을 출력합니다. 
--      테이블들은 countries와 departments와 locations를 조인합니다. 
--      조건은 시티가 'Seattle' 혹은 'London'이어야 하고 국가명은 앞쪽에 'United'가 들어가야 합니다.
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments d
JOIN locations l ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id
WHERE l.city IN('seattle', 'London') AND c.country_name LIKE 'united%';

-- 자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;


