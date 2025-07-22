/**
* MYSQL :: 정형 데이터를 저장하는 데이터베이스
- SQL 문법을 사용하여 데이터를 CRUD 한다.
- C(Create : 생성, insert)
- R(Read   : 조회, select)
- U(Update : 수정, update)
- D(Delete : 삭제, delete)
- 개발자는 DML에 대한 명령어를 잘 사용할 수 있어야한다!!!!!
- SQL은 대소문자 구분하지 않음, 보통 소문자로 작성
- snake 방식의 네이밍 규칠을 가짐
- SQL은 크게 DDL, DML, DCL, DTL로 구분할 수 있다.
1. DDL(Data Definition Language) : 데이터 정의어
	-> 데이터를 저장하기 위한 공간을 생성하고 논리적으로 정의하는 언어
    -> create, alter, truncate, drop ..
2. DML(Data Manipulation Language) : 데이터 조작어
	-> 데이터를 CRUD하는 명령어
    -> insert, select, update, delete
3. DCL(Data Control Language) : 데이터 제어어
	-> 데이터에 대한 권한과 보안을 정의하는 언어
    -> grant, revoke
4. DTL(Data Transaction Language, TCL) : 트랜잭션 제어어
	-> 데이터베이스의 처리 작업 단위인 트랜잭션을 관리하는 언어
    -> commit, save, rollback
*/

/* 반드시 기억해주세요! - 워크벤치 실행 할때 마다 명령어 실행해야함! */
show databases; -- 모든 데이터베이스 조회
use hrdb2019;	-- 사용할 데이터베이스 오픈
select database();	-- 사용할 데이터베이스 선택!
show tables;	-- 데이터베이스의 모든 테이블 조회

-- use market_db;	-- 사용할 데이터베이스 오픈
-- select database();	-- 사용할 데이터베이스 선택!
-- show tables;	-- 데이터베이스의 모든 테이블 조회


/************************************
	DESC(DESCRIBE) : 테이블 구조 확인
    형식> desc(describe) [테이블명];
*************************************/
show tables;
desc employee;
desc department;
desc unit;
desc vacation;

/******************************************
	SELECT : 테이블 내용 조회
    형식> select [컬럼리스트] from [테이블명];
*******************************************/
select emp_id, emp_name from employee;
select * from employee;
select emp_name, gender, hire_date from employee;

-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여를 조회
select * from employee;
select emp_id, emp_name, gender, hire_date, salary from employee;

-- 부서 테이블의 모든 정보 조회
select * from department;

-- AS : 컬럼명 별칭 부여
-- 형식> select [컬럼명 as 별칭, ...] from [테이블명];
-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여 컬럼을 조회한 한글 컬럼명으로 출력
select 
	emp_id as 사번, 
	emp_name as 사원명, 
	gender as 성별, 
	hire_date as 입사일, 
	salary as 급여 
from employee;

-- 사원테이블의 id, name, gender, hdate, salary 컬럼명으로 조회
select
	emp_id as id,
    emp_name as name,
    gender,
    hire_date as hdate,
    salary
from employee;

-- 사원테이블의 사번, 사원명, 부서명, 폰번호, 이메일, 급여, 보너스(급여*10%)를 조회
-- 기존의 컬럼에 연산을 수행하여 새로운 컬럼을 생성할 수 있다.
desc employee;
select
	emp_id,
    emp_name,
    phone,
    email,
    salary,
    (salary*0.1) as bonus
from employee;

-- 현재 날짜를 조회 : curdate()


/*********************************
	SELECT : 테이블 내용 상세 조회
    형식> select [컬럼리스트] 
			from [테이블명];
			where [조건절];
**********************************/
-- 정주고 사원의 정보를 상세 조회
desc employee;
select * from employee 
where emp_name = '정주고';	-- ""도 사용 가능

-- sys 부서에 속한 모든 사원을 조회
select * from employee;
select * from employee
where dept_id = 'SYS';

-- 사번이 S0005인 사원의 사원명, 성별, 입사일, 부서아이디, 이메일, 급여를 조회
SELECT 
	emp_name, gender, hire_date, dept_id, email, salary 
FROM employee 
    where emp_id = 'S0005';

-- SYS 부서에 속한 모든 사원들을 조회, 단 출력되는 emp_id 컬럼은 '사원번호' 별칭으로 조회
select * from employee;
select emp_id as '사원번호', emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary
	from employee 
where dept_id = 'sys';

-- emp_name '사원명' 별칭 수정
select emp_id as '사원번호', emp_name as '사원명', eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary
	from employee 
where dept_id = 'sys';

-- !! where 조건절 컬럼으로 별칭을 사용할 수 있을까요~?
-- 사원명이 홍길동인 사원을 별칭으로 조회? :::where 조건절에서 별칭을 컬럼명으로 사용 xa
select emp_id as '사원번호', emp_name as '사원명', eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary
	from employee 
where 사원명 = '홍길동';

-- 전략기획(STG) 부서의 모든 사원들의 사번, 사원명, 입사일, 급여를 조회
select * from department;
select emp_id, emp_name, hire_date, salary 
from employee 
where dept_id = 'stg';

-- 입사일이 2014년 8월 1일인 사원들을 조회(date 타입은 표현은 문자열처럼, 처리는 숫자처럼)
select * from employee where hire_date = '20140801';
-- 급여가 5000인 사원들을 조회!
select * from employee where salary = 5000;
-- 성별이 남자인 사원들을 조회
select * from employee where gender = 'M';
-- 성별이 여자인 사원들을 조회
select * from employee where gender = 'F';

-- NULL : 아직 정의되지 않은 미지수
-- 숫자에서는 가장 큰 수로 인식, 논리적인 의미를 포함하고 있으므로 등호(=)로는 검색X, IS 키워드와 함께 사용O
-- 급여가 NULL인 값을 가진 사원들을 조회
select * from employee where salary is null;

-- 영어이름이 정해지지 않은 사원들을 조회
select * from employee where eng_name is null;

-- 퇴사하지 않은 사원들의 보너스 컬럼(급여*20%)을 추가하여 조회
select emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary, salary*0.2 as bonus  
from employee 
where retire_date is null;

-- 퇴시한 사원들의 사번, 사원명, 이메일, 폰번호, 급여를 조회
select emp_id, emp_name, email, phone, salary, retire_date 
from employee 
where retire_date is not null;

-- IFNULL 함수 : NULL 값을 다른 값으로 대체하는 방법
-- 형식> IFNULL(NULL포함 컬럼명, 대체값)
-- stg 부서에 속한 사원들의 정보 조회, 단, 급여가 NULL인 사원은 0원으로 치환
SELECT emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, IFNULL(salary, 0) AS SALARY
FROM EMPLOYEE
WHERE DEPT_ID = 'STG';

-- 사원 전체 테이블의 내용을 조회, 단 영어이름이 정해지지 않은 사원들은 'smith' 이름으로 치환
SELECT emp_id, emp_name, IFNULL(eng_name,'SMITH') AS eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary
FROM EMPLOYEE
ORDER BY eng_name;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 RETIRE_DATE 컬럼은 현재 날짜로 치환
SELECT emp_id, emp_name, eng_name, gender, hire_date, IFNULL(retire_date, CURDATE()) AS retire_date, dept_id, phone, email, salary
FROM EMPLOYEE
WHERE DEPT_ID = 'MKT'
ORDER BY retire_date;

/***************************************
	DISTINCT : 중복된 데이터를 배제하고 조회
    형식> select distinct [컬럼리스트] ~
****************************************/
-- 사원 테이블의 부서리스트를 조회
SELECT DISTINCT DEPT_ID FROM EMPLOYEE;
-- 주의!! UNIQUE한 컬럼과 함께 조회하는 경우 DISTINCT가 적용되지 않음.
SELECT DISTINCT EMP_ID, DEPT_ID FROM EMPLOYEE;

/***************************************
	ORDER BY : 데이터 정렬
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [조건절]
		ORDER BY [컬럼명, ...] ASC/DESC
****************************************/
-- 급여를 기준으로 오름차순 정렬
SELECT * 
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- 모든 사원을 급여, 성병을 기준으로 오름차순 정렬
SELECT *
FROM EMPLOYEE
ORDER BY SALARY, GENDER;

-- ENG_NAME이 NULL인 사원들을 입사일 기준으로 내림차순 정렬
SELECT * 
FROM EMPLOYEE
WHERE ENG_NAME IS NULL
ORDER BY HIRE_DATE DESC;

-- 퇴직한 사원들을 급여 기준으로 내림차순 정렬
SELECT *
FROM EMPLOYEE
WHERE RETIRE_DATE IS NOT NULL
ORDER BY SALARY DESC;

-- 퇴직한 사원들을 급여 기준으로 내림차순 정렬, SALARY 컬럼을 '급여' 별칭으로 치환
-- '급여' 별칭으로 ORDER BY가 가능할까요? 넵 별칭으로 ORDER BY 가능함!
-- WHERE 조건절 데이터 탐색 > 컬럼리스트 > 정렬 순서로 진행하기 때문에 가능
SELECT emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary AS 급여
FROM EMPLOYEE
WHERE RETIRE_DATE IS NOT NULL
ORDER BY 급여 DESC;

-- 정보시스템(SYS) 부서 사원들 중 입사일이 빠른 순서, 급여를 많이 받는 순서로 정렬
-- HIRE_DATE, SALARY 컬럼은 '입사일', '급여' 별칭으로 컬럼리스트 생성 후 정렬
SELECT emp_id, emp_name, eng_name, gender, hire_date AS '입사일', retire_date, dept_id, phone, email, salary AS '급여'
FROM EMPLOYEE
WHERE DEPT_ID = 'SYS'
ORDER BY 입사일 ASC, 급여 DESC;

/******************************************
	조건절 + 비교연산자 : 특정 범위 혹은 데이터 검색
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [조건절]
		ORDER BY [컬럼명, ...] ASC/DESC
*******************************************/
-- 급여가 5000 이상인 사원들을 조회, 급여를 오름차순 정렬
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 5000
ORDER BY SALARY ASC;

-- 2017-01-01 이후 입사한 사원들을 조회
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE > '2017-01-01';

-- 입사일이 2015-01-01 이후이거나, 급여가 6000 이상인 사원들을 조회
-- ~ 이거나, ~ 또는 : OR -> 두 개의 조건 중 하나만 만족해도 조회 가능
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2015-01-01' OR SALARY >= 6000;

-- 입사일이 2015-01-01 이후이고, 급여가 6000 이상인 사원들을 조회
-- ~이고 : AND -> 두 개의 조건이 모두 만족해야만 조회 가능
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2015-01-01' AND SALARY >= 6000;

-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2015-01-01' AND HIRE_DATE <= '2017-12-31'
ORDER BY DEPT_ID ASC;

-- 급여가 6000 이상 8000 미만인 사람들을 모두 조회
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= 6000 AND SALARY < 8000
ORDER BY SALARY DESC;

-- MKT 부서의 사원들의 사번, 사원명, 입사일, 이메일, 급여, 보너스(급여의 20%) 조회
-- 급여가 NULL인 사원의 보너스는 기본 50
-- 보너스가 1000 이상인 사원 조회
-- 보너스가 높은 사원 기준으로 정렬
SELECT emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary, IFNULL(salary*0.2, 50) as bonus
FROM EMPLOYEE
WHERE DEPT_ID = 'STG';

SELECT EMP_ID, EMP_NAME, HIRE_DATE, EMAIL, SALARY, IFNULL(SALARY*0.2, 50) AS BONUS
FROM EMPLOYEE
WHERE DEPT_ID = 'MKT' AND SALARY*0.2 >= 1000
ORDER BY BONUS DESC;

-- 사원명이 '일지매', '오삼식', '김삼순' 인 사원들을 조회
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME = '일지매' OR EMP_NAME = '오삼식' OR EMP_NAME = '김삼순';

/*************************************************
	논리곱(AND) : BETWEEN ~ AND
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [컬럼명] BETWEEN 값1 AND 값2
	논리합(OR) : IN
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [컬럼명] IN (값1, 값2, 값3 ...);
**************************************************/
-- BETWEEN ~ AND
-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '2015-01-01' AND '2017-12-31'
ORDER BY HIRE_DATE ASC;

-- 급여가 6000 이상 8000 미만인 사람들을 모두 조회
SELECT * 
FROM EMPLOYEE
WHERE SALARY BETWEEN 6000 AND 8000;

-- IN
-- 사원명이 '일지매', '오삼식', '김삼순' 인 사원들을 조회
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME IN ('일지매' , '오삼식', '김삼순');

-- 부서아이디가 MKT, SYS, STG에 속한 모든 사원 조회
SELECT * 
FROM EMPLOYEE
WHERE DEPT_ID IN ('MKT', 'SYS', 'STG')
ORDER BY DEPT_ID ASC;

/*****************************************************
	특정 문자열 검색 : 와일드 문자(%, _) + LIKE 연산자
					% : 전체, _ : 한 글자
    형식> SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] LIKE '와일드 문자 포함 검색어';
******************************************************/
-- '한'씨 성을 가진 모든 사원을 조회
SELECT * FROM EMPLOYEE
WHERE EMP_NAME LIKE '한%';

-- 영어 이름이 'f'로 시작하는 모든 사원을 조회
SELECT * FROM EMPLOYEE
WHERE ENG_NAME LIKE 'f%';

-- 이메일 이름 중 두번째 자리에 'a'가 들어가는 모든 사원을 조회
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '_a%';

-- 이메일 아이디가 4자인 모든 사원을 조회
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '____@%';















