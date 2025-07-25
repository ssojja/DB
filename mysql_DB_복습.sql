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


USE HRDB2019;
SELECT DATABASE();
-- 20250723
/******************************************
	내장함수 : 숫자함수, 문자함수, 날짜함수
    호출되는 위치 - [컬럼리스트], [조건절의 컬럼명]
*******************************************/
-- [숫자함수]
-- 함수 실습을 위한 테이블 : DUAL 테이블
-- (1) ABS(숫자) : 절대값
SELECT ABS(100), ABS(-100) FROM DUAL;

-- (2) FLOOR(숫자), TRUNCATE(숫자, 자리수) : 소수점 버리기
SELECT FLOOR(123.456), TRUNCATE(123.456, 0), TRUNCATE(123.456, 2) FROM DUAL;

-- 사원테이블의 SYS 부서 사람들의 사번, 사원명, 부서아이디, 폰번호, 급여, 보너스(급여의 25%) 추가하여 조회
-- 보너스 컬럼은 소수점 1자리로 출력
SELECT EMP_ID, EMP_NAME, DEPT_ID, PHONE, SALARY, TRUNCATE(SALARY*0.25, 1) AS BONUS 
FROM EMPLOYEE
WHERE DEPT_ID = 'SYS';

-- (3) RAND() : 임의의 수를 난수로 발생시키는 함수, 0 ~ 1 사이의 난수 생성
SELECT RAND() FROM DUAL;

-- 정수 3자리 난수 발생
SELECT FLOOR(RAND()*1000) RAND_NUM FROM DUAL;

-- 정수 4자리(0 ~ 9999) 난수 발생, 소수점 2자리
SELECT TRUNCATE(RAND()*10000, 2) AS RAND_NUM FROM DUAL;


-- (4) MOD(숫자, 나누는수) : 나머지 함수
SELECT MOD(123, 2) ODD, MOD(124, 2) EVEN FROM DUAL;

-- 3자리 수를 랜덤으로 발생시켜, 2로 나누어 홀수, 짝수를 구분
SELECT MOD(FLOOR(RAND() * 1000), 2) AS RESULT FROM DUAL;

-- [문자함수]
-- (1) CONCAT(문자열1, 문자열2 ...) : 문자열 합쳐주는 함수
SELECT CONCAT("안녕하세요! ", "저는 ", '홍길동입니다.') AS STR FROM DUAL;

-- 사번, 사원명, 사원명2 컬럼을 생성하여 조회
-- 사원명2 컬럼의 데이터 형식은 S0001(홍길동) 출력
SELECT 
	EMP_ID, EMP_NAME, CONCAT(EMP_ID, "(", EMP_NAME, ")") AS EMP_INFO 
FROM EMPLOYEE;

-- 사번, 사원명, 영어이름, 입사일, 폰번호, 급여를 조회
-- 영어이름의 출력형식을 '홍길동/HONG' 타입으로 출력
-- 영어이름이 NULL인 경우에는 'SMITH'를 기본으로 조회
SELECT
	EMP_ID, EMP_NAME, CONCAT(EMP_NAME, "/" , IFNULL(ENG_NAME, 'smith')) AS ENG_NAME, HIRE_DATE, PHONE, SALARY
FROM EMPLOYEE;

-- (2) SUBSTRING(문자열, 위치, 갯수) : 문자열 추출, 공백도 하나의 문자 처리
SELECT 
	SUBSTRING("대한민국 홍길동", 1, 4) AS STR1,
	SUBSTRING("대한민국 홍길동", 1, 6) AS STR2
FROM DUAL;

-- 사원테이블의 사번, 사원명, 입사연도, 입사월, 입사일, 급여를 조회
SELECT 
	EMP_ID, 
	EMP_NAME,
    HIRE_DATE,
	SUBSTRING(HIRE_DATE, 1, 4) AS YEAR, 
	SUBSTRING(HIRE_DATE, 6, 2) AS MONTH,
    SUBSTRING(HIRE_DATE, 9, 2) AS DAY,
    SALARY
FROM EMPLOYEE;

-- 2015년도에 입사한 모든 사원조회
SELECT *
FROM EMPLOYEE
WHERE SUBSTRING(HIRE_DATE, 1, 4) = '2015';

-- 2018년도에 입사한 정보시스템(SYS) 부서 사원 조회
SELECT *
FROM EMPLOYEE
WHERE SUBSTRING(HIRE_DATE, 1, 4) = '2018'
AND DEPT_ID = 'SYS';

-- (3) LEFT(문자열, 갯수), RIGHT(문자열, 갯수) : 왼쪽, 오른쪽 기준으로 문자열 추출
SELECT LEFT(CURDATE(), 4) AS YEAR, RIGHT('010-1234-4567', 4) AS PHONE FROM DUAL;

-- 2018년도에 입사한 모든 사원 조회
SELECT *
FROM EMPLOYEE
WHERE LEFT(HIRE_DATE, 4) = '2018';

-- 2015년부터 2017년 사이에 입사한 모든 사원 조회
SELECT * 
FROM EMPLOYEE
WHERE LEFT(HIRE_DATE, 4) BETWEEN '2015' AND '2017';

-- 사원번호, 사원명, 입사일, 폰번호, 급여를 조회
-- 폰번호는 마지막 4자리만 출력
SELECT EMP_ID, EMP_NAME, HIRE_DATE, RIGHT(PHONE, 4) AS PHONE, SALARY
FROM EMPLOYEE;

-- (4) UPPER(문자열), LOWER(문자열) : 대문자, 소문자로 치환
SELECT UPPER('welcomeToMysql!!'), lower('welcomeToMysql!!') from dual;

-- 사번, 사원명, 영어이름, 부서아이디, 이메일, 급여를 조회
-- 영어이름은 전체 대문자, 부서아이디는 소문자, 이메일은 대문자
SELECT EMP_ID, EMP_NAME, UPPER(ENG_NAME) AS ENG_NAME, LOWER(DEPT_ID) AS DEPT_ID, UPPER(EMAIL) AS EMAIL, SALARY
FROM EMPLOYEE;

-- (5) TRIM(문자열) : 공백 제거(중간 공백 제거 X)
SELECT
	TRIM('   대한민국') AS T1,
    TRIM('대한민국		') AS T2,
    TRIM('대한           민국') AS T3,
	TRIM('	대한민국	') AS T4
FROM DUAL;

-- (6) FORMAT(문자열, 소수점자리) : 문자열 포맷
SELECT FORMAT(123456, 0) AS FORMAT FROM DUAL;
SELECT FORMAT('123456', 0) AS FORMAT FROM DUAL;

-- 사번, 사원명, 입사일, 폰번호, 급여, 보너스(급여의 20%)를 조회
-- 급여, 보너스는 소수점 없이 3자리 콤마(,)로 구분하여 출력
-- 급여가 NULL인 경우에는 기본값 0
-- 2016년 부터 2017년 사이에 입사한 사원!
-- 사번 기준으로 내림차순 정렬
SELECT 
EMP_ID, 
EMP_NAME, 
HIRE_DATE, 
PHONE, 
FORMAT(IFNULL(SALARY, 0) , 0) AS SALARY,
FORMAT(IFNULL(SALARY*0.2, 0), 0) AS BONUS
FROM EMPLOYEE
WHERE LEFT(HIRE_DATE, 4) BETWEEN '2016' AND '2017'
ORDER BY EMP_ID DESC;

-- [날짜함수]
-- CURDATE() : 현재 날짜 (년, 월, 일)
-- SYSDATE(), NOW() : 현재 날짜 (년, 월, 일, 시, 분, 초)
SELECT CURDATE(), SYSDATE(), NOW() FROM DUAL;

-- [형변환 함수]
-- CAST(변환하고자 하는 값 AS 데이터 타입)
-- CONVERT(변환하고자 하는 값 AS 데이터 타입) --> MySQL에서 지원하는 OLD버전
SELECT 1234 AS NUMBER, CAST('1234' AS CHAR) AS STRING FROM DUAL;
SELECT '1234' AS STRING, CAST('1234' AS SIGNED INTEGER) AS NUMBER FROM DUAL;
SELECT '20250723' AS STRING, CAST('20250723' AS DATE) AS DATE FROM DUAL;
SELECT 
NOW() AS NOW_DATE, 
CAST(NOW() AS CHAR) AS STRING,
CAST(CAST(NOW() AS CHAR)AS DATE) AS DATE,
CAST(CAST(NOW() AS CHAR)AS DATETIME) AS DATETIME,
CAST(CURDATE() AS DATETIME) AS CUR_DATETIME
FROM DUAL;

SELECT 
'12345' AS STRING,
CAST('12345' AS SIGNED INTEGER) AS CAST_INT,
CAST('12345' AS UNSIGNED INTEGER) AS CAST_INT2,
CAST('12345' AS DECIMAL(10,2)) AS CAST_DECIMAL
FROM DUAL;

-- [문자 치환 함수]
-- REPLACE(문자열, OLD, NEW)
SELECT 
'홍-길-동' AS OLD,
REPLACE('홍-길-동', '-', ',') AS NEW
FROM DUAL;

-- 사원테이블의 사번, 사원명, 입사일, 퇴사일, 부서아이디, 폰번호, 급여를 조회
-- 입사일, 퇴사일 출력은 '-'을 '/'로 치환하여 출력
-- 재직중인 사원은 퇴사 컬럼에 현재날짜를 출력
-- 급여 출력시 3자리 콤마(,) 구분
SELECT 
EMP_ID, 
EMP_NAME, 
REPLACE(HIRE_DATE, '-', '/') AS HIRE_DATE, 
REPLACE(IFNULL(RETIRE_DATE, CURDATE()), '-', '/') AS RETIRE_DATE, 
DEPT_ID, 
PHONE, 
FORMAT(SALARY, 0) AS SALARY
FROM EMPLOYEE;

-- '20150101' 입력된 날짜를 기준으로 해당 날짜 이후에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
SELECT *
FROM EMPLOYEE
WHERE CAST('20150101' AS DATE) <= HIRE_DATE;

-- '20150101' ~ '20171231' 사이에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN CAST('20150101' AS DATE) AND CAST('20171231' AS DATE);

/**********************************************************
	그룹(집계) 함수 : sum(), avg(), min(), max(), count()..
    group by - 그룹 함수를 적용하기 위한 그룹핑 컬럼 정의
    having - 그룹 함수에서 사용하는 조건절
    ** 그룹함수는 그룹핑이 가능한 반복된 데이터를 가진 컬럼과 많이 사용됨
***********************************************************/
-- (1) sum(숫자) : 전체 총합을 구하는 함수
-- 사원들 전체의 급여 총액을 조회, 3자리 구분, 마지막 '만원'표시
SELECT CONCAT(FORMAT(SUM(SALARY), 0), '만원') AS 총급여 FROM EMPLOYEE;

SELECT DEPT_ID, SUM(SALARY) 
FROM EMPLOYEE 
GROUP BY DEPT_ID;

-- (2) avg(숫자) : 전체 평균을 구하는 함수
-- 사원들 전체의 평균을 조회, 3자리 구분, 앞에 '$' 표시
SELECT CONCAT('$',FORMAT(AVG(SALARY), 0)) AS 평균급여
FROM EMPLOYEE;

-- 정보시스템(SYS) 부서 전체의 급여 총액과 평균을 조회
-- 3자리 구분, 마지막 '만원'표시
SELECT 
CONCAT(FORMAT(SUM(SALARY), 0), '만원') AS 총급여, 
CONCAT(FORMAT(AVG(SALARY), 0), '만원') AS 평균급여 
FROM EMPLOYEE
WHERE DEPT_ID = 'SYS';

-- (3) max(숫자) : 최대값 구하는 함수
-- 가장 높은 급여를 받는 사원의 급여를 조회
SELECT MAX(SALARY) FROM EMPLOYEE;

-- (4) min(숫자) : 최소값 구하는 함수
-- 가장 낮은 급여를 받는 사원의 급여를 조회
SELECT MIN(SALARY) FROM EMPLOYEE;

-- 사원들의 총급여, 평균급여, 최대급여, 최소급여를 조회
-- 3자리 구분
SELECT 
	FORMAT(SUM(SALARY), 0) AS 총급여, 
	FORMAT(AVG(SALARY), 0) AS 평균급여, 
	FORMAT(MAX(SALARY), 0) AS 최대급여, 
	FORMAT(MIN(SALARY), 0) AS 최소급여
FROM EMPLOYEE;

-- (5) count(컬럼) : 조건에 맞는 데이터의 row 수를 조회, NULL은 제외
-- 전제 row count
SELECT COUNT(*) FROM EMPLOYEE;		-- 20
-- 급여 컬럼의 ROW COUNT
SELECT COUNT(SALARY) FROM EMPLOYEE;	-- 19

-- 재직중인 사원의 ROW COUNT
-- 퇴사한 사원의 ROW COUNT
SELECT 
	COUNT(*) AS 총사원,
	COUNT(RETIRE_DATE) AS 퇴사자,
    COUNT(*) - COUNT(RETIRE_DATE) AS 재직자
FROM EMPLOYEE;

-- '2015'년도에 입사한 입사자 수
SELECT COUNT(*)
FROM EMPLOYEE
WHERE LEFT(HIRE_DATE, 4) = '2015';

-- 정보시스템(SYS) 부서의 사원수
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_ID = 'SYS';

-- 가장 빠른 입사자, 가장 늦은 입사자를 조회 : MAX(), MIN() 함수를 사용
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE) FROM EMPLOYEE;

-- 가장 빨리 입사한 사람의 정보를 조회 : 서브쿼리로 그룹함수로 조회
SELECT * 
FROM EMPLOYEE 
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEE);

SELECT * 
FROM EMPLOYEE 
WHERE HIRE_DATE = '2013-01-01';

-- [GROUP BY] : 그룹함수와 일반 컬럼을 함께 사용할 수 있도록 함
-- ~별 그룹핑이 가능한 컬럼으로 쿼리를 실행

-- 부서별, 총급여, 평균급여, 사원수, 최대급여, 최소급여 조회
SELECT DEPT_ID, SUM(SALARY), AVG(SALARY), COUNT(*) 사원수, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 연도별, 총급여, 평균급여, 사원수, 최대급여, 최소급여 조회
-- 소수점X, 3자리 구분
-- 총 급여가 3000 이상인 년도 출력
SELECT 
	LEFT(HIRE_DATE, 4) 연도,
    FORMAT(SUM(SALARY), 0) 총급여,
    FORMAT(AVG(SALARY), 0) 평균급여,
    COUNT(*) 사원수,
    FORMAT(MAX(SALARY), 0) 최대급여,
    FORMAT(MIN(SALARY), 0) 최소급여
FROM EMPLOYEE 
GROUP BY LEFT(HIRE_DATE, 4)
HAVING SUM(SALARY) >= 3000;

-- 사원별 총급여, 평균급여 조회 : 그룹핑의 의미가 없음

-- [HAVING 조건절] : 그룹함수를 적용한 결과에 조건을 추가
-- 부서별 총급여, 평균급여를 조회
-- 부서의 총급여가 30000 인상인 부서만 출력
-- 급여 컬럼의 NULL은 제외
SELECT DEPT_ID, 
	FORMAT(SUM(SALARY), 0) AS SUM, 
    FORMAT(AVG(SALARY), 0) AS AVG,
    COUNT(*) AS CNT
FROM EMPLOYEE
WHERE SALARY IS NOT NULL
GROUP BY DEPT_ID
HAVING SUM(SALARY) >= 30000;

-- 연도별, 총급여, 평균급여, 사원수, 최대급여, 최소급여 조회
-- 소수점X, 3자리 구분
-- 총 급여가 30000 이상인 년도 출력
-- 급여 협상이 안된 사원은 제외
SELECT 
	LEFT(HIRE_DATE,4) AS 연도,
    COUNT(*) AS 사원수,
	FORMAT(SUM(SALARY),0) AS 총급여, 
	FORMAT(AVG(SALARY), 0) AS 평균급여, 
	FORMAT(MAX(SALARY),0) AS 최대급여, 
	FORMAT(MIN(SALARY),0) AS 최소급여
FROM EMPLOYEE
WHERE SALARY IS NOT NULL
GROUP BY LEFT(HIRE_DATE,4)
HAVING SUM(SALARY) >= 30000;

-- ROLLUP 함수 : 리포팅을 위한 함수
-- 부서별 사원수, 총급여, 평균급여 조회
SELECT DEPT_ID,
	COUNT(*) 사원수,
    SUM(IFNULL(SALARY,0)) 총급여,
    FLOOR(AVG(IFNULL(SALARY,0))) 평균급여
FROM EMPLOYEE
GROUP BY DEPT_ID WITH ROLLUP;
    
-- ROLLUP한 결과의 부서아이디를 정의
SELECT IF(GROUPING(DEPT_ID), '부서총합계', IFNULL(DEPT_ID, '-')) 부서명,
	COUNT(*) 사원수,
    SUM(IFNULL(SALARY,0)) 총급여,
    FLOOR(AVG(IFNULL(SALARY,0))) 평균급여
FROM EMPLOYEE
GROUP BY DEPT_ID WITH ROLLUP;

-- ROLLUP한 결과의 연도를 정의
SELECT 
	LEFT(HIRE_DATE,4) AS 연도,
    COUNT(*) AS 사원수,
	FORMAT(SUM(SALARY),0) AS 총급여, 
	FORMAT(AVG(SALARY), 0) AS 평균급여, 
	FORMAT(MAX(SALARY),0) AS 최대급여, 
	FORMAT(MIN(SALARY),0) AS 최소급여
FROM EMPLOYEE
WHERE SALARY IS NOT NULL
GROUP BY LEFT(HIRE_DATE,4) WITH ROLLUP;

-- LIMIT 함수 : 출력 갯수 제한 함수
SELECT * FROM EMPLOYEE
LIMIT 3;

-- 급여 기준 5순위 조회
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC
LIMIT 5;

-- 20250724
/*********************************************************************
	조인(JOIN) : 두 개 이상의 테이블을ㄹ 연동해서 sql 실행
    ERD(Entity Relationship Diagram) : 데이터 베이스 구조도(설계도)
    - 데이터 모델링 : 정규화 과정
    
    
    ** ANSI SQL : 모든 데이터베이스 시스템들의 표준 SQL
    조인(JOIN) 종류
    (1) CROSS JOIN(Cartesian) - 합집합 : 테이블들의 데이터 전체를 조인 -> 테이블A(10) * 테이블B(10)
    (2) INNER JOIN(Natural) - 교집합 : 두 개 이상의 테이블을 연결 고리를 통해 조인 실행
    (3) OUTER JOIN : INNER JOINT + 선택한 테이블의 조인 제외 ROW 포함
    (4) SELF JOIN : 한 테이블을 두 개 테이블처럼 조인 실행
**********************************************************************/
SHOW DATABASES;
USE HRDB2019;
SHOW TABLES;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM VACATION;

-- CROSS JOIN : 합집합
-- 형식> SELECT [컬럼리스트] FROM [테이블1], [테이블2], ...
-- 		WHERE [조건절 ~]
-- ANSI> SELECT [컬럼리스트] FROM [테이블1] CROSS JOIN [테이블2], ...
-- 		WHERE [조건절 ~]
SELECT *
FROM EMPLOYEE, DEPARTMENT;

SELECT COUNT(*)
FROM EMPLOYEE CROSS JOIN DEPARTMENT;

SELECT COUNT(*) FROM VACATION;		-- 102

-- 사원, 부서, 휴가 테이블 cross join : 20 * 7 * 102 = 14280
select count(*) from employee, department, vacation;
select count(*) from employee cross join department cross join vacation;

-- INNER JOIN : 교집합
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID
ORDER BY EMP_ID;

-- INNER JOIN : ANSI
SELECT *
FROM EMPLOYEE INNER JOIN DEPARTMENT 
ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID
ORDER BY EMP_ID;

-- 사원테이블, 부서테이블, 본부테이블 INNER JOIN
-- NULL 제외한 상태에서 출력됨
SELECT *
FROM EMPLOYEE E, DEPARTMENT D, UNIT U
WHERE 
	E.DEPT_ID = D.DEPT_ID 
AND D.UNIT_ID = U.UNIT_ID
ORDER BY E.EMP_ID;

SELECT * 
FROM EMPLOYEE E
	LEFT OUTER JOIN DEPARTMENT D
	ON E.DEPT_ID = D.DEPT_ID
    LEFT OUTER JOIN UNIT U
    ON D.UNIT_ID = U.UNIT_ID;

SELECT * FROM DEPARTMENT;

-- 사원테이블, 부서테이블, 본부테이블 INNER JOIN : ANSI
SELECT * 
FROM EMPLOYEE E 
	INNER JOIN DEPARTMENT D 
	ON E.DEPT_ID = D.DEPT_ID 
	INNER JOIN UNIT U
	ON D.UNIT_ID = U.UNIT_ID;

-- 사원테이블, 부서테이블, 본부테이블, 휴가테이블 INNER JOIN
SELECT * 
FROM EMPLOYEE E, DEPARTMENT D, UNIT U, VACATION V
WHERE E.DEPT_ID = D.DEPT_ID
	AND D.UNIT_ID = U.UNIT_ID
    AND E.EMP_ID = V.EMP_ID;

-- 사원테이블, 부서테이블, 본부테이블, 휴가테이블 INNER JOIN : ANSI
SELECT COUNT(*) 
FROM EMPLOYEE E 
	INNER JOIN DEPARTMENT D 
	ON E.DEPT_ID = D.DEPT_ID 
	INNER JOIN UNIT U
	ON D.UNIT_ID = U.UNIT_ID
    INNER JOIN VACATION V
    ON V.EMP_ID = E.EMP_ID
    ;

-- 모든 사원들의 사번, 사원명, 부서아이디, 부서명, 입사일, 급여를 조회
SELECT
	E.EMP_ID ,
    E.EMP_NAME,
	E.DEPT_ID,
    D.DEPT_NAME,
    E.HIRE_DATE,
    E.SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID = D.DEPT_ID;

-- 영업부에 속한 사원들의 사번, 사원명, 입사일, 퇴사일, 폰번호, 급여, 부서아이디, 부서명 조회
SELECT E.EMP_ID, E.EMP_NAME, E.HIRE_DATE, E.RETIRE_DATE, E.PHONE, E.SALARY, E.DEPT_ID, D.DEPT_NAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID = D.DEPT_ID
	AND D.DEPT_NAME = '영업';

-- 인사과에 속한 사원들 중에 휴가를 사용한 사원들의 내역을 조회
SELECT *
FROM EMPLOYEE E, DEPARTMENT D, VACATION V
WHERE E.DEPT_ID = D.DEPT_ID
	AND E.EMP_ID = V.EMP_ID
    AND D.DEPT_NAME = '인사';

-- 영업부서인 사원의 사원명, 폰번호, 부서명, 휴가사용 이유 조회
-- 휴가 사용 이유가 '두통'인 사원, 소속본부 조회
SELECT E.EMP_NAME, E.PHONE, D.DEPT_NAME, V.REASON, U.UNIT_NAME
FROM EMPLOYEE E, DEPARTMENT D, VACATION V, UNIT U
WHERE E.DEPT_ID = D.DEPT_ID
	AND E.EMP_ID = V.EMP_ID
    AND D.UNIT_ID = U.UNIT_ID
    AND D.DEPT_NAME = '영업'
    AND V.REASON = '두통';

-- 2014년부터 2016년까지 입사한 사원들 중에서 퇴사하지 않은 사원들의
-- 사원아이디, 사원명, 부서명, 입사일, 소속본부를 조회
-- 소속본부 기준으로 오름차순 정렬
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_NAME, E.HIRE_DATE, U.UNIT_NAME
FROM EMPLOYEE E, DEPARTMENT D, UNIT U
WHERE 
	E.DEPT_ID = D.DEPT_ID
    AND D.UNIT_ID = U.UNIT_ID
	-- AND CAST(E.HIRE_DATE AS DATE) BETWEEN '2014-01-01' AND '2016-12-31'
    AND LEFT(HIRE_DATE, 4) BETWEEN '2014' AND '2016'
	AND E.RETIRE_DATE IS NULL
ORDER BY U.UNIT_ID;

-- 부서별 총 급여, 평균 급여, 총휴가 사용일수를 조회
-- 부서명, 부서아이디, 총급여, 평균급여, 휴가사용일수
SELECT  
	D.DEPT_ID, 
	D.DEPT_NAME, 
	SUM(SALARY) SUM_SALARY, 
	AVG(SALARY) AVG_SALARY, 
	SUM(DURATION) CNT_VACATION
FROM EMPLOYEE E, DEPARTMENT D, VACATION V
WHERE E.EMP_ID = V.EMP_ID
	AND E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME;

-- 본부별, 부서의 휴가사용 일수
SELECT  
	U.UNIT_NAME, 
	D.DEPT_NAME,
    D.DEPT_ID,
	SUM(DURATION) AS 휴가사용일수
FROM EMPLOYEE E, DEPARTMENT D, VACATION V, UNIT U
WHERE E.EMP_ID = V.EMP_ID
	AND E.DEPT_ID = D.DEPT_ID
    AND D.UNIT_ID = U.UNIT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME, U.UNIT_NAME;

-- OUTER JOIN : INNER JOIN + 조인에서 제외된 ROW(테이블별 지정)
-- 오라클 형식의 OUTER JOIN은 사용불가, ANSI SQL 형식 사용 가능!
-- SELECT [컬럼리스트] FROM 
-- [테이블명1 테이블 별칭] LEFT/RIGHT OUTER JOIN 테이블명2 [테이블 별칭], ...
-- ON [테이블명1.조인컬럼 = 테이블명2.조인컬럼]

-- ** 오라클 형식 OUTER JOIN 사용불가 ㅠㅠ
-- SELECT * FROM TABLE T1, TABLE T2
-- WHERE T1.COL(+) = T2.COL;

-- 모든 부서의 부서아이디, 부서명, 본부명을 조회
SELECT * FROM DEPARTMENT;

SELECT 
D.DEPT_ID, D.DEPT_NAME, IFNULL(U.UNIT_NAME, '협의중') UNIT_NAME
FROM DEPARTMENT D LEFT OUTER JOIN UNIT U
ON D.UNIT_ID = U.UNIT_ID
ORDER BY UNIT_NAME;

-- 본부별, 부서의 휴가사용 일수 조회
-- 부서의 누락없이 모두 출력
SELECT  
	U.UNIT_NAME, 
	D.DEPT_NAME,
    D.DEPT_ID,
	SUM(DURATION) AS 휴가사용일수
FROM EMPLOYEE E
LEFT OUTER JOIN VACATION V
ON E.EMP_ID = V.EMP_ID
RIGHT OUTER JOIN DEPARTMENT D 
ON E.DEPT_ID = D.DEPT_ID
INNER JOIN UNIT U
ON	D.UNIT_ID = U.UNIT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME, U.UNIT_NAME;



SELECT 
	D.DEPT_NAME, U.UNIT_NAME, COUNT(V.DURATION) 휴가일수
FROM EMPLOYEE E 
	LEFT OUTER JOIN VACATION V
	ON E.EMP_ID = V.EMP_ID
	RIGHT OUTER JOIN DEPARTMENT D
	ON E.DEPT_ID = D.DEPT_ID
	LEFT OUTER JOIN UNIT U
	ON D.UNIT_ID = U.UNIT_ID
GROUP BY U.UNIT_NAME, D.DEPT_NAME
ORDER BY U.UNIT_NAME DESC;

-- 2017년부터 2018년도 까지 입사한 사원들의 사원명, 입사일, 연봉, 부서명 조회해주세요.
-- 단, 퇴사한 사람들 제외
-- 소속본부를 모두 조회
SELECT EMP_NAME, HIRE_DATE, RETIRE_DATE, SALARY, D.DEPT_NAME, U.UNIT_NAME
FROM EMPLOYEE E 
	INNER JOIN DEPARTMENT D
	ON E.DEPT_ID = D.DEPT_ID
    LEFT OUTER JOIN UNIT U
    ON U.UNIT_ID = D.UNIT_ID
WHERE LEFT(HIRE_DATE, 4) BETWEEN '2017' AND '2018'
    AND RETIRE_DATE IS NULL;

-- SELF JOIN : 자기 자신의 테이블을 조인
-- SELF JOIN은 서브 쿼리 형태로 실행하는 경우가 많음
-- SELECT [컬럼리스트] FROM [테이블1], [테이블2] WHERE [테이블1.컬럼명] = [테이블2.컬럼명]
-- 사원테이블을 SELF JOIN
SELECT E.EMP_ID, E.EMP_NAME, M.EMP_ID, M.EMP_NAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.EMP_ID = M.EMP_ID;

SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = (SELECT EMP_ID FROM EMPLOYEE WHERE EMP_NAME = '홍길동');

-- 20250725
/***********************************************************
	서브쿼리(SubQuery) : 메인 쿼리에 다른 쿼리를 추가하여 실행하는 방식
    형식 : select [컬럼리스트 : (스칼라서브쿼리)]
			from [테이블명 : (인라인뷰)]
		  where [조건절 : (서브쿼리)]
************************************************************/
use hrdb2019;
select database();
show tables;

-- [서브쿼리]
-- 정보시스템 부서의 사원들을 모두 조회
-- 사번, 사원명, 부서아이디, 폰번호, 급여
select emp_id, emp_name, dept_id, phone, salary
from employee
where dept_id = (select dept_id from department where dept_name = '정보시스템');

-- [스칼라서브쿼리] : 오라클 서버에서는 실행 안됨
-- 정보시스템 부서의 사원들을 모두 조회
-- 사번, 사원명, 부서아이디, 부서명(부서테이블), 폰번호, 급여
select 
	emp_id, 
	emp_name, 
    dept_id, 
    (select dept_name from department where dept_name = '정보시스템') dept_name,
    phone, 
    salary
from employee
where dept_id = (select dept_id from department where dept_name = '정보시스템');

-- 홍길동 사원이 속한 부서명을 조회
-- '='로 조건절 비교하는 경우 :: 단일행 서브쿼리
select dept_name 
from department
where dept_id = (select dept_id from employee where emp_name = '홍길동');

-- 홍길동 사원의 휴가사용 내역을 조회
desc vacation;
select *
from vacation
where emp_id = (select emp_id from employee where emp_name = '홍길동');

-- 제3본부에 속한 모든 부서를 조회
desc unit;
select * from unit;

select * 
from department
where unit_id = (select unit_id from unit where unit_name = '제3본부');

-- 급여가 가장 높은 사원의 정보 조회
desc employee;

select *
from employee
where salary = (select max(salary) as salary from employee);

-- 급여가 가장 낮은 사원의 정보 조회
select *
from employee
where salary = (select min(salary) as salary from employee);

-- 가장 빨리 입사한 사원의 정보 조회
select *
from employee
where hire_date = (select min(hire_date) as hire_date from employee);

-- 가장 최근 입사한 사원의 정보 조회
select *
from employee
where hire_date = (select max(hire_date) as hire_date from employee);

-- [서브쿼리 : 다중행 - in]
-- '제3본부'에 속한 모든 사원 정보를 조회
select * 
from employee
where dept_id in (select dept_id from department where unit_id = (select unit_id from unit where unit_name = '제3본부'));

-- '제3본부'에 속한 모든 사원들의 휴가 사용 내역 조회
select * 
from vacation
where emp_id in (select emp_id
					from employee
				where dept_id in (select dept_id from department where unit_id = (select unit_id from unit where unit_name = '제3본부')));

-- [인라인뷰 : 메인쿼리의 테이블 자리에 들어가는 서브쿼리 형식]
-- [휴가를 사용한 사원정보만!]
-- 사원별 휴가사용 일수를 그룹핑하여, 사원아이디, 사원명, 입사일, 연봉, 휴가사용일수를 조회해주세요.
desc vacation;

select e.emp_id, e.emp_name, e.hire_date, e.salary, v.duration 
from employee e, 
	(select emp_id, sum(duration) duration
							from vacation
							group by emp_id) v
where e.emp_id = v.emp_id;

-- ansi : inner join
select e.emp_id, e.emp_name, e.hire_date, e.salary, IFNULL(v.duration, 0) AS duration
from employee e inner join 
	(select emp_id, sum(duration) duration
							from vacation
							group by emp_id) v
on e.emp_id = v.emp_id;

-- [휴가를 사용한 사원정보 + 사용하지 않은 사원 포함!]
-- 사원별 휴가사용 일수를 그룹핑하여, 사원아이디, 사원명, 입사일, 연봉, 휴가사용일수를 조회해주세요.
-- 휴가를 사용하지 않은 사원은 기본값 0
-- 사용일수 기준으로 내림차순 정렬
-- left outer join
select e.emp_id, e.emp_name, e.hire_date, e.salary, IFNULL(v.duration, 0) AS duration
from employee e left outer join 
	(select emp_id, sum(duration) duration
							from vacation
							group by emp_id) v
on e.emp_id = v.emp_id
order by duration desc;


-- 1) 2016 ~ 2017년도 입사한 사원들의 정보 조회
select * from employee where hire_date between '2016-01-01' and '2017-12-31';
select * from employee where left(hire_date, 4) between '2016' and '2017';
-- 2) 1번의 실행 결과와 vacation 테이블을 조인하여 휴가사용 내역 출력
select * 
from vacation v, 
	(select * from employee where hire_date between '2016-01-01' and '2017-12-31') e
where v.emp_id = e.emp_id;

-- 1) 부서별 총급여, 평균 급여를 구하여 30000 이상인 부서 조회
select dept_id, sum(salary) as sum, avg(salary) as avg
from employee
group by dept_id
having sum(salary) >= 30000;

-- 2) 1번의 실행 결과와 employee 테이블을 조인하여 사원아이디, 사원명, 급여, 부서아이디, 부서명, 부서별 총급여, 평균급여 출력
select e.emp_id, e.emp_name, e.salary, e.dept_id, d.dept_name, t.sum, t.avg
from 
	department d,
	employee e,
		(select dept_id, sum(salary) sum, avg(salary) avg
		from employee
		group by dept_id
		having sum(salary) >= 30000) t
where 
	e.dept_id = d.dept_id
    and d.dept_id = t.dept_id;

/*********************************************
	테이블 결과 합치기 : union, union all
    형식> 쿼리1 실행 결과 union 쿼리2 실행 결과
		 쿼리1 실행 결과 union all 쿼리2 실행 결과
	** 실행결과 컬럼이 동일(컬럼명, 데이터타입)
**********************************************/
-- 영업부, 정보시스템 부서의 사원아이디, 사원명, 급여, 부서아이디 조회
-- UNION : 영업 부서 사원들이 한번만 출력
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '영업')
union	-- 같은 내용 중복 X
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '영업')
union
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '정보시스템');

-- UNION ALL : 영업 부서 사원들이 중복되어 출력
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '영업')
union all	-- 같은 내용 중복 O
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '영업')
union all
select emp_id, emp_name, salary, dept_id
from employee
where dept_id = (select dept_id from department where dept_name = '정보시스템');

/****************************************************************
	논리적인 테이블 : view(뷰), SQL을 실행하여 생성된 결과를 가상테이블로 정의
    뷰 생성 : create view [view 이름]
				as [SQL 정의];
	뷰 삭제 : drop view [view 이름]
	** 뷰 생성시 권한을 할당 받아야 함 - mysql, maria 제외
*****************************************************************/
select * 
from information_schema.views
where table_schema = 'hrdb2019';

-- 부서 총 급여가 30000 이상인 테이블
create view view_salary_sum
as
select e.emp_id, e.emp_name, e.salary, e.dept_id, d.dept_name, t.sum, t.avg
from 
	department d,
	employee e,
		(select dept_id, sum(salary) sum, avg(salary) avg
		from employee
		group by dept_id
		having sum(salary) >= 30000) t
where 
	e.dept_id = d.dept_id
    and d.dept_id = t.dept_id;

-- view_salary_sum 실행
select * 
from view_salary_sum;

-- view_salary_sum 삭제
drop view view_salary_sum;
select *
from information_schema.views
where table_schema = 'hrdb2019';

/***************************************************************
	DDL(Data Definition Language) : 생성, 수정, 삭제 -> 테이블 기준
    DML : C(insert), R(select), U(update), D(delete)
****************************************************************/
-- 모든 테이블 목록
show tables;

-- [테이블 생성]
-- 형식> create table [테이블명](
-- 			컬럼명	데이터타입(크기),
-- 			....
-- 		);
-- 데이터 타입 : 정수형(int, long), 실수형(float, double), 문자형(char, varchar, longtext..)
-- 				이진데이터(longblob), 날짜형(date, datetime)..

-- char(고정형 문자형) : 크기가 메모리에 고정되는 형식, 예) char(10) --> 3자리 입력 : 7자리 낭비
-- varchar(가변형 문자형) : 실제 저장되는 데이터 크기에 따라 메모리가 변경되는 형식, 
-- 						varchar(10) --> 3자리 입력 : 메모리 실제 3자리 공간만 생성
-- longtext : 문장형태로 다수의 문자열을 저장
-- longblob : 이진데이터 타입의 이미지, 동영상 등 데이터 저장
-- date : 년, 월, 일 -> curdate()
-- datetime : 년, 월, 일, 시, 분, 초 -> sysdate(), now()
desc employee;
select * from employee;

-- emp 테이블 생성
-- emp_id : (char, 4), ename : (varchar, 10), gender : (char, 1), hire_date : (datetime), salary : (int)
show tables;

create table emp(
	emp_id	char(4),
    ename	varchar(10),
    gender	char(1),
    hire_date	datetime,
    salary int
);

select * 
from information_schema.tables where table_schema = 'hrdb2019';

desc emp;

-- [테이블 삭제]
-- 형식 : drop table [테이블명]
show tables;
drop table emp;

-- [테이블 복제]
-- 형식 : create table [테이블명]
-- 		 as [SQL 정의]
-- employee 테이블을 복제하여 emp 테이블 생성
create table emp as
select * from employee;

show tables;
select * from emp;

desc employee;
desc emp;	-- 제약사항은 복제 안됨

-- 2016년도에 입사한 사원의 정보를 복제 : employee_2016
create table employee_2016
as
select * 
from employee
where left(hire_date, 4) = '2016';

select * from employee_2016;

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++
	데이터 생성(insert : C)
    형식> insert into [테이블명] ({컬럼리스트...})
		values(데이터1, 데이터2...)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
select * from employee;

insert into emp(emp_id, ename, gender, hire_date, salary)
values('s001', '홍길동', 'm', now(), 1000);

insert into emp(ename, emp_id,  gender, salary , hire_date)
values('s001', '홍길동', 'm', 1000, null);

insert into emp(emp_id)
values('s002');

select * from emp;

-- [테이블 절삭 : 테이블의 데이터만 영구 삭제]
-- 형식> truncate table [테이블명];
truncate table emp;
select * from emp;
drop table emp;
create table emp(
	emp_id		char(4)		not null,
    ename		varchar(10)	not null,
    gender		char(1)		not null,
    hire_date	datetime,
    salary 		int
);


desc emp;
insert into emp(emp_id, ename, gender, hire_date, salary)
values('s001', '홍길동', 'm', now(), 1000);
select * from emp;

insert into emp
values('s003', '김유신', 'm', curdate() , 2000);

-- [자동 행번호 생성 : auto_increment]
-- 정수형으로 번호를 생성하여 저장함, pk, unique 제약으로 설정된 컬럼에 주로 사용
create table emp2(
	emp_id		int auto_increment primary key,	-- primary key : unique + not null
    ename		varchar(10)	not null,
    gender		char(1) not null,
    hire_date	date,
    salary		int
);

desc emp2;
insert into emp2(ename, gender, hire_date, salary)
values('홍길동', 'm', now(), 1000);
select * from emp2;

/****************************************************************
	테이블 변경 : alter table
    형식> alter table [테이블명]
			add colmun [새로 추가하는 컬럼명, 데이터 타입] -- null 허용
            modify column [변경하는 컬럼명, 데이터 타입] -- 크기 고려
            drop column [삭제하는 컬럼명]
*****************************************************************/
select * from emp;

-- phone(char, 13) 컬럼 추가, null 허용
alter table emp
	add column phone char(13) null;

desc emp;
select * from emp;

insert into emp
	values('s004', '홍홍', 'f', now(), 4000, '010-1234-1234');

-- phone 컬럼의 크기 변경 : char(13) --> char(10)
alter table emp
	modify column phone char(10) null;	-- 저장된 데이터보다 크기가 작으면 에러 발생; 데이터 유실 위험 발생!!

-- phone 컬럼 삭제
alter table emp
	drop column phone;

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	데이터 수정(update : U)
    형식> update [테이블명]
			set [컬럼리스트...]
			where [조건절 ~ ]
	** set sql_safe_updates = 1 or 0; 
							 1 : 업데이트 X, 0 : 업데이트 가능
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
select * from emp;
set sql_safe_updates = 0;	-- 업데이트 모드 해제

-- 홍길동의 급여를 6000으로 수정
update emp
	set salary = 6000
where emp_id = 's001';

-- 김유신의 입사날짜를 '20210725'로 수정
update emp
	set hire_date = cast('20210725' as datetime)
where emp_id = 's003';

update emp
	set hire_date = '20210725'
where emp_id = 's003';

-- emp2 테이블에 retire_date 컬럼추가 : date
-- 기존 데이터는 현재 날짜로 업데이트
-- 업데이트 완료 후 retire_date 'not null' 설정 변경
select * from emp2;
desc emp2;

alter table emp2
	add column retire_date date;

update emp2
	set retire_date = curdate()
where retire_date is null;

alter table emp2
	modify retire_date date not null;

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	데이터 삭제(delete : D)
    형식> delete from [테이블명]
			where [조건절 ~ ]
	** set sql_safe_updates = 1 or 0; 
							 1 : 업데이트 X, 0 : 업데이트 가능
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
select * from emp;

-- 이순신 사원 삭제
delete from emp
	where emp_id = 's002';

-- s004 사원 삭제
delete from emp
	where emp_id = 's004';
rollback;