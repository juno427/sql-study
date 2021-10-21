
-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

SELECT *
FROM departments
ORDER BY department_id DESC;
-- 테이블 열의 구조를 확인
DESC departments;

-- 특정 열만 입력(미입력시 NULL)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');

-- 열의 이름들을 생략하면 다 적어야 함
INSERT INTO departments
VALUES (290, 'Pusan', NULL, 1700);

-- 예제 1) departments 테이블에 다음과 같이 각각의 department_id, departnemt_name, manager_id가
-- 200, location_id가 1700인 행을 3개 입력하세요.
INSERT INTO departments VALUES (271, 'sample 1', 200, 1700);
INSERT INTO departments VALUES (272, 'sample 2', 200, 1700);
INSERT INTO departments VALUES (273, 'sample 3', 200, 1700);

-- 데이터의 수정 UPDATE : 특정 행을 업데이트 하므로 WHERE절을 작성해야한다!
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

SELECT * FROM departments;

-- 예제) departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_id를 100으로 수정하라.
UPDATE departments
SET manager_id = 100 
WHERE department_id BETWEEN 150 AND 200;

-- 두개 이상 열을 업데이트 (열, 열, ...)
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';

-- 데이터의 삭제 DELETE
DELETE FROM departments
WHERE department_id = 290;

SELECT * FROM departments;

DELETE FROM departments
WHERE department_name LIKE '%sample%';

-- 전체 삭제 (WHERE을 안적었을 때)
-- 삭제오류는 직원 테이블에서 사용하고 있는 부서는 바로 삭제 불가.
DELETE FROM departments;

-- 120번 이상 부서들 삭제
DELETE FROM departments
WHERE departement_id >= 120;

-- 커밋 전에 롤백 가능
ROLLBACK;

-- 게임부서를 생성하고 commit
COMMIT;


-- 자동 커밋 설정
show autocommit;
-- on : 실행시에 자동으로 commit
set autocommit on;
-- off : 실행시에 수동으로 commit
set autocommit off;

=======
-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

SELECT *
FROM departments
ORDER BY department_id DESC;
-- 테이블 열의 구조를 확인
DESC departments;

-- 특정 열만 입력(미입력시 NULL)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');

-- 열의 이름들을 생략하면 다 적어야 함
INSERT INTO departments
VALUES (290, 'Pusan', NULL, 1700);

-- 예제 1) departments 테이블에 다음과 같이 각각의 department_id, departnemt_name, manager_id가
-- 200, location_id가 1700인 행을 3개 입력하세요.
INSERT INTO departments VALUES (271, 'sample 1', 200, 1700);
INSERT INTO departments VALUES (272, 'sample 2', 200, 1700);
INSERT INTO departments VALUES (273, 'sample 3', 200, 1700);

-- 데이터의 수정 UPDATE : 특정 행을 업데이트 하므로 WHERE절을 작성해야한다!
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

SELECT * FROM departments;

-- 예제) departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_id를 100으로 수정하라.
UPDATE departments
SET manager_id = 100 
WHERE department_id BETWEEN 150 AND 200;

-- 두개 이상 열을 업데이트 (열, 열, ...)
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';

-- 데이터의 삭제 DELETE
DELETE FROM departments
WHERE department_id = 290;

SELECT * FROM departments;

DELETE FROM departments
WHERE department_name LIKE '%sample%';

-- 전체 삭제 (WHERE을 안적었을 때)
-- 삭제오류는 직원 테이블에서 사용하고 있는 부서는 바로 삭제 불가.
DELETE FROM departments;

-- 120번 이상 부서들 삭제
DELETE FROM departments
WHERE departement_id >= 120;

-- 커밋 전에 롤백 가능
ROLLBACK;

-- 게임부서를 생성하고 commit
COMMIT;


-- 자동 커밋 설정
show autocommit;
-- on : 실행시에 자동으로 commit
set autocommit on;
-- off : 실행시에 수동으로 commit
set autocommit off;
