-- 주석 단축키 ctrl+/
-- 여러줄 주석 /* + */
-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 ctrl + enter

-- 열은 전체 열(*), 명령문의 끝에는 항상 세미콜론(;)이 있어야 한다.
SELECT *
FROM departments;

-- 2. 특정 열만 조회하기
SELECT department_id, department_name
FROM departments;

-- dot
