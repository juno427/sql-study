-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

SELECT * FROM departments ORDER BY department_id DESC;
-- 테이블 열의 구조를 확인
DESC departments;

-- 특정 열만 입력 ( 미입력시 NULL)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');
-- 열의 이름들을 생략하면 다 적어야 함
INSERT INTO departments
VALUES (290, 'Pusan', NULL, 1700);

-- 예제
INSERT INTO departments VALUES (271, 'Sample 1', 200, 1700);
INSERT INTO departments VALUES (272, 'Sample 2', 200, 1700);
INSERT INTO departments VALUES (273, 'Sample 3', 200, 1700);

-- 데이터의 수정 UPDATE : 특정행을 업데이트 하므로 WHERE 절을 작성!!!
UPDATE departments 
SET manager_id = 200 
WHERE department_name = 'Game';

SELECT * FROM departments;

rollback;

-- 예제 
UPDATE departments SET manager_id = 100 
WHERE department_id BETWEEN 150 AND 200;

-- 두개이상 열을 업데이트 ( 열, 열, ...)
UPDATE departments 
SET manager_id = 100, location_id = 1800 
WHERE department_name = 'Game';

-- 데이터의 삭제 DELETE
-- 특정 행을 WHERE 절을 넣어서 삭제
DELETE FROM departments
WHERE department_name = 'Music';

SELECT * FROM departments;

DELETE FROM departments
WHERE department_name = 'Game';

DELETE FROM departments
WHERE department_id = 290;

DELETE FROM departments
WHERE department_name LIKE '%Sample%';

-- 전체 삭제 (where을 안적었을때)
-- 삭제오류는 직원 테이블에서 사용하고 있는 부서는 바로 삭제 불가.
DELETE FROM departments;

-- 120번 이상 부서들 삭제
DELETE FROM departments
WHERE department_id >= 120;

-- 커밋 전에 롤백 가능
ROLLBACK;

-- 게임부서를 생성하고 commit
commit;


-- 자동 커밋 설정 확인
show autocommit;
-- ON 실행시에 자동으로 commit됨
set autocommit on;
-- OFF 실행시에 수동
set autocommit off;



