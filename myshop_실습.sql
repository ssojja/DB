/******************************************************
		실습 데이터베이스 연결 : myshop2019
		실습 내용 - 기본적인 데이터 조회 	 
******************************************************/
SHOW DATABASES;
USE myshop2019;
SELECT DATABASE();
SHOW TABLES;
-- Q01) customer 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
DESC CUSTOMER;
SELECT * FROM CUSTOMER;
-- Q02) employee 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
DESC EMPLOYEE;
SELECT * FROM EMPLOYEE;
-- Q03) product 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
DESC PRODUCT;
SELECT * FROM PRODUCT;
-- Q04) order_header 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
DESC ORDER_HEADER;
SELECT * FROM ORDER_HEADER;
-- Q05) order_detail 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
DESC ORDER_DETAIL;
SELECT * FROM ORDER_DETAIL;
-- Q06) 모든 고객의 아이디, 이름, 지역, 성별, 이메일, 전화번호를 조회하세요.
SELECT customer_id, customer_name, city, gender, email, phone 
FROM CUSTOMER;
-- Q07) 모든 직원의 이름, 사원번호, 성별, 입사일, 전화번호를 조회하세요.
SELECT employee_name, employee_id, gender, hire_date, phone 
FROM EMPLOYEE;
-- Q08) 이름이 '홍길동'인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point 
FROM CUSTOMER
WHERE CUSTOMER_NAME = '홍길동';
-- Q09) 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point 
FROM CUSTOMER
WHERE GENDER = 'F';
-- Q10) '울산' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point 
FROM CUSTOMER
WHERE city = '울산';
-- Q11) 포인트가 500,000 이상인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point 
FROM CUSTOMER
WHERE point >= 500000
ORDER BY point DESC;
-- Q12) 이름에 공백이 들어간 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point  
FROM CUSTOMER
WHERE CUSTOMER_NAME LIKE '_ %';
-- Q13) 전화번호가 010으로 시작하지 않는 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE LEFT(PHONE, 3) != '010';
-- Q14) 포인트가 500,000 이상 '서울' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE POINT >= 500000 AND CITY = '서울';
-- Q15) 포인트가 500,000 이상인 '서울' 이외 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE POINT >= 500000 AND CITY != '서울';

SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE POINT >= 500000 
AND CITY NOT IN ('서울');
-- Q16) 포인트가 400,000 이상인 '서울' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE POINT >= 400000 AND CITY = '서울' AND GENDER = 'M';
-- Q17) '강릉' 또는 '원주' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE CITY IN ('강릉', '원주');
-- Q18) '서울' 또는 '부산' 또는 '제주' 또는 '인천' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM CUSTOMER
WHERE CITY IN ('서울', '부산', '제주', '인천');
-- Q19) 포인트가 400,000 이상, 500,000 이하인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point 
FROM CUSTOMER
WHERE POINT BETWEEN '400000' AND '500000';
-- Q20) 1990년에 출생한 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, birth_date, point 
FROM CUSTOMER
WHERE LEFT(birth_date, 4) = '1990';
-- Q21) 1990년에 출생한 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, birth_date, point 
FROM CUSTOMER
WHERE LEFT(birth_date, 4) = '1990' AND GENDER = 'F';
-- Q22) 1990년에 출생한 '대구' 또는 '경주' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, birth_date, point 
FROM CUSTOMER 
WHERE LEFT(BIRTH_DATE, 4) = '1990' 
AND CITY IN ('대구', '경주') 
AND GENDER = 'M';
-- Q23) 1990년에 출생한 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, 홍길동(gildong) 형태로 이름과 아이디를 묶어서 조회하세요.
SELECT CONCAT(customer_name, '(' ,customer_id, ')') AS name, gender, city, phone, birth_date, point 
FROM CUSTOMER 
WHERE LEFT(BIRTH_DATE, 4) = '1990' 
AND GENDER = 'M';
-- Q24) 근무중인 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
SELECT employee_name, employee_id, gender, phone, hire_date
FROM EMPLOYEE
WHERE RETIRE_DATE IS NULL;
-- Q25) 근무중인 남자 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
SELECT employee_name, employee_id, gender, phone, hire_date
FROM EMPLOYEE
WHERE RETIRE_DATE IS NULL AND GENDER = 'M';
-- Q26) 퇴사한 직원의 이름, 사원번호, 성별, 전화번호, 입사일, 퇴사일를 조회하세요.
SELECT employee_name, employee_id, gender, phone, hire_date, retire_date
FROM EMPLOYEE 
WHERE RETIRE_DATE IS NOT NULL;
-- Q28) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 고객아이디를 기준으로 오름차순 정렬해서 조회하세요.
SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
FROM ORDER_HEADER
WHERE CAST(ORDER_DATE AS DATE) BETWEEN '2019-01-01' AND '2019-01-07'
ORDER BY ORDER_ID ASC;

-- Q29) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 전체금액을 기준으로 내림차순 정렬해서 조회하세요.
SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due 
FROM ORDER_HEADER
WHERE CAST(ORDER_DATE AS DATE) BETWEEN '2019-01-01' AND '2019-01-07'
ORDER BY TOTAL_DUE DESC;

-- Q30) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 사원번호를 기준으로 오름차순, 같은 사원번호는 주문일시를 기준으로 내림차순 정렬해서 조회하세요.
SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due 
FROM ORDER_HEADER
WHERE CAST(ORDER_DATE AS DATE) BETWEEN '2019-01-01' AND '2019-01-07'
ORDER BY employee_id ASC, order_date DESC;
/**
	그룹함수
**/
/** customer 테이블 사용 **/
-- Q01) 고객의 포인트 합을 조회하세요.
SELECT SUM(POINT) AS SUM_POINT 
FROM CUSTOMER;
-- Q02) '서울' 지역 고객의 포인트 합을 조회하세요.
SELECT CITY, SUM(POINT) SUM_POINT 
FROM CUSTOMER WHERE CITY = '서울';
-- Q03) '서울' 지역 고객의 수를 조회하세요.
SELECT COUNT(*) 서울고객수 FROM CUSTOMER WHERE CITY = '서울';
-- Q04) '서울' 지역 고객의 포인트 합과 평균을 조회하세요.
SELECT 
FORMAT(SUM(POINT), 0) 서울포인트합계, 
FORMAT(AVG(POINT), 2) 서울포인트평균
FROM CUSTOMER WHERE CITY = '서울';
-- Q05) '서울' 지역 고객의 포인트 합, 평균, 최댓값, 최솟값을 조회하세요.
SELECT 
FORMAT(SUM(POINT), 0) 서울포인트합계, 
FORMAT(AVG(POINT), 2) 서울포인트평균,
FORMAT(MAX(POINT), 0) 서울포인트최대값, 
FORMAT(MIN(POINT), 2) 서울포인트최소값
FROM CUSTOMER WHERE CITY = '서울';

-- Q06) 남녀별 고객의 수를 조회하세요.
SELECT COUNT(*) 여성고객수 FROM CUSTOMER WHERE GENDER = 'F';	-- 134
SELECT COUNT(*) 남성고객수 FROM CUSTOMER WHERE GENDER = 'M';	-- 155

SELECT GENDER, COUNT(*) 고객수
FROM CUSTOMER
GROUP BY GENDER;
-- Q07) 지역별 고객의 수를 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, COUNT(*) 지역별고객수
FROM CUSTOMER
GROUP BY CITY
ORDER BY CITY;
 
-- Q08) 지역별 고객의 수를 조회하세요.
--      단, 고객의 수가 10명 이상인 행만 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, COUNT(*) 지역별고객수
FROM CUSTOMER
GROUP BY CITY
HAVING COUNT(*) >= 10
ORDER BY CITY;
    
-- Q09) 남녀별 포인트 합을 조회하세요.
SELECT GENDER, SUM(POINT) 포인트합계
FROM CUSTOMER
GROUP BY GENDER;
-- Q10) 지역별 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, SUM(POINT) 포인트합계
FROM CUSTOMER
GROUP BY CITY
ORDER BY CITY;
    
-- Q11) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합이 1,000,000 이상인 행만 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT CITY, FORMAT(SUM(POINT), 0) 포인트합계
FROM CUSTOMER
GROUP BY CITY
HAVING SUM(POINT) >= 1000000
ORDER BY SUM(POINT) DESC;
      
-- Q12) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT CITY, SUM(POINT) 포인트합계
FROM CUSTOMER
GROUP BY CITY
ORDER BY SUM(POINT) DESC;

-- Q13) 지역별 고객의 수, 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, COUNT(*) 고객수 , SUM(POINT) 포인트합계
FROM CUSTOMER
GROUP BY CITY
ORDER BY CITY ASC;

-- Q14) 지역별 포인트 합, 포인트 평균을 조회하세요.
--      단, 포인트가 NULL이 아닌 고객을 대상으로 하며, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, SUM(POINT) 포인트합계, AVG(POINT) 포인트평균
FROM CUSTOMER
WHERE POINT IS NOT NULL
GROUP BY CITY
ORDER BY CITY ASC;

-- Q15) '서울', '부산', '대구' 지역 고객의 지역별, 남녀별 포인트 합과 평균을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순, 같은 지역은 성별을 기준으로 오름차순 정렬해서 조회하세요.
SELECT CITY, GENDER, FORMAT(SUM(POINT), 0) 합계, FORMAT(AVG(POINT), 2) 평균
FROM CUSTOMER
WHERE CITY IN ('서울', '부산', '대구')
GROUP BY CITY, GENDER
ORDER BY CITY ASC, GENDER ASC;

/** order_header 테이블 사용 **/
    
-- Q16) 2019년 1월 주문에 대하여 고객아이디별 전체금액 합을 조회하세요.
SELECT customer_id, SUM(TOTAL_DUE) 전체금액합계
FROM order_header
WHERE CAST(ORDER_DATE AS DATE) BETWEEN '2019-01-01' AND '2019-01-31'
GROUP BY customer_id;

-- Q17) 주문연도별 전체금액 합계를 조회하세요.
SELECT LEFT(order_date, 4) 주문연도, FORMAT(SUM(TOTAL_DUE), 0) 전체금액합계 
FROM order_header 
GROUP BY LEFT(order_date, 4);

-- Q18) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합을 조회하세요.
SELECT LEFT(order_date, 4) 주문연도, SUBSTRING(order_date,6,2) 주문월, FORMAT(SUM(TOTAL_DUE), 0) 전체금액합계 
FROM order_header
WHERE CAST(order_date AS DATE) BETWEEN '2019-01-01' AND '2019-06-30'
GROUP BY LEFT(order_date, 4), SUBSTRING(order_date,6,2);

-- Q19) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합과 평균을 조회하세요.
SELECT LEFT(order_date, 4) 주문연도, SUBSTRING(order_date,6,2) 주문월, FORMAT(SUM(TOTAL_DUE), 0) 전체금액합계, FORMAT(AVG(TOTAL_DUE), 2) 전체금액평균 
FROM order_header
WHERE CAST(order_date AS DATE) BETWEEN '2019-01-01' AND '2019-06-30'
GROUP BY LEFT(order_date, 4), SUBSTRING(order_date, 6, 2);

-- Q20) 주문연도별, 주문월별 전체금액 합과 평균을 조회하고, rollup 함수를 이용하여 소계와 총계를 출력해주세요.

select 
	if(grouping(year), '연도별 총합계', ifnull(year, '-')) 주문연도,
    if(grouping(month), '월별 총합계', ifnull(month, '-')) 주문월,
    format(sum(total_due), 0) 합계, 
    format(avg(total_due), 0) 평균금액
from (SELECT 
	left(order_date, 4) year, 
	substring(order_date, 6, 2) month, 
	total_due
	FROM order_header) T
group by year, month with rollup;

/**
	테이블 조인 : 기본 SQL 방식, ANSI SQL
*/
SHOW DATABASES;
USE myshop2019;
show tables;
-- Q01) 전체금액이 8,500,000 이상인 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 전체금액을 조회하세요.
SELECT 
	order_id, customer_id, e.employee_id, order_date, total_due
FROM employee e, order_header o
WHERE e.employee_id = o.employee_id
	AND TOTAL_DUE >= 8500000;
-- Q02) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름도 같이 조회되게 수정하세요.
SELECT 
	order_id, o.customer_id, c.customer_name, e.employee_id, order_date, total_due
FROM employee e, order_header o, customer c
WHERE e.employee_id = o.employee_id
	AND o.customer_id = c.customer_id
	AND TOTAL_DUE >= 8500000;
    
-- Q03) Q01 쿼리를 복사해 붙여 넣은 후 직원이름도 같이 조회되게 수정하세요.
SELECT 
	order_id, customer_id, e.employee_id, e.employee_name, order_date, total_due
FROM employee e, order_header o
WHERE e.employee_id = o.employee_id
	AND O.TOTAL_DUE >= 8500000;
    
-- Q04) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름, 직원이름도 같이 조회되게 수정하세요.
SELECT 
	order_id, o.customer_id, c.customer_name, e.employee_id, e.employee_name, order_date, total_due
FROM employee e, order_header o, customer c
WHERE e.employee_id = o.employee_id
	AND o.customer_id = c.customer_id
	AND O.TOTAL_DUE >= 8500000;
    
-- Q05) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 고객만 조회되게 수정하세요.
SELECT 
	order_id, o.customer_id, c.customer_name, e.employee_id, e.employee_name, order_date, total_due
FROM employee e, order_header o, customer c
WHERE e.employee_id = o.employee_id
	AND o.customer_id = c.customer_id
	AND O.TOTAL_DUE >= 8500000
    AND C.CITY = '서울';

-- Q06) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 '남자' 고객만 조회되게 수정하세요.
SELECT 
	order_id, o.customer_id, c.customer_name, e.employee_id, e.employee_name, order_date, total_due
FROM employee e, order_header o, customer c
WHERE e.employee_id = o.employee_id
	AND o.customer_id = c.customer_id
	AND O.TOTAL_DUE >= 8500000
    AND C.CITY = '서울'
    AND C.GENDER = 'M';

-- Q07) 주문수량이 30개 이상인 주문의 주문번호, 상품코드, 주문수량, 단가, 지불금액을 조회하세요.
select order_id, product_id, order_qty, unit_price, line_total
from order_detail
where order_qty >= 30;

-- Q08) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 상품이름도 같이 조회되도록 수정하세요.
select order_id, o.product_id, p.product_name ,order_qty, unit_price, line_total
from order_detail o, product p
where o.product_id = p.product_id
	and o.order_qty >= 30;

-- Q09) 상품코드, 상품이름, 소분류아이디를 조회하세요.
select * from product;

-- Q10) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 소분류이름, 대분류아이디가 조회되게 수정하세요.
select sub_category_name, category_id
from product p, sub_category s
where p.sub_category_id = s.sub_category_id;

-- Q11) 다정한 사원이 2019년에 주문한 상품명을 모두 출력해주세요.
select distinct product_name 
from employee e, order_header o, order_detail t, product p
where e.employee_id = o.employee_id
	and o.order_id = t.order_id
    and t.product_id = p.product_id
	and left(order_date, 4) = '2019'
    and e.employee_name = '다정한'
order by product_name;

-- Q12) 청소기를 구입한 고객아이디, 사원번호, 주문번호, 주문일시를 조회하세요.
select customer_id, employee_id, t.order_id, order_date
from product p, order_detail t, order_header o
where p.product_id = t.product_id
	and t.order_id = o.order_id
	and p.product_name like '%청소기'
order by customer_id;

desc product;
select * from order_detail;
show tables;

/**
	서브쿼리
*/
-- Q13) 'mtkim', 'odoh', 'soyoukim', 'winterkim' 고객 주문의 주문번호, 고객아이디, 주문일시, 전체금액을 조회하세요.
select order_id, customer_id, order_date, total_due
from order_header
where customer_id in (select customer_id 
						from customer 
                        where customer_id in ('mtkim', 'odoh', 'soyoukim', 'winterkim'));

-- Q14) '전주' 지역 고객의 아이디를 조회하세요.
select customer_id from customer where city = '전주';

-- Q15) 위 두 쿼리문을 조합해서 하위 쿼리를 사용해 '전주' 지역 고객 주문의 주문번호, 고객아이디, 주문일시, 전체금액을 조회하세요.
select order_id, customer_id, order_date, total_due
from order_header -- sipark, thankkim
where customer_id in (select customer_id 
						from customer 
                        where customer_id in (select customer_id from customer where city = '전주'));
                        
-- Q16) 고객의 포인트 최댓값을 조회하세요.
select max(point) 포인트최댓값 from customer;

-- Q17) 하위 쿼리를 사용해 가장 포인트가 많은 고객의 이름, 아이디, 등록일, 포인트를 조회하세요.
select customer_name, customer_id, register_date, point
from customer
where point = (select max(point) 포인트최댓값 from customer);

-- Q18) 하위 쿼리를 사용해 홍길동(gdhong) 고객보다 포인트가 많은 고객 이름, 아이디, 등록일, 포인트를 조회하세요.
select customer_name, customer_id, register_date, point
from customer
where point > (select point 
				from customer 
                where customer_name = '홍길동');

-- Q19) 하위 쿼리를 사용해 홍길동(gdhong) 고객과 같은 지역의 고객 이름, 아이디, 지역, 등록일, 포인트를 조회하세요.
--      단, 고객 이름을 기준으로 오름차순 정렬해서 조회하세요.
select customer_name, customer_id, city, register_date, point 
from customer
where city = (select city from customer where customer_id = 'gdhong')
order by customer_name asc;

-- Q20) 하위 쿼리를 사용해 홍길동(gdhong) 고객보다 포인트가 많은 고객 이름, 아이디, 등록일, 포인트를 조회하고, 행번호를 추가하여 출력하세요.
select 
	row_number() over() as rno,
	customer_name, customer_id, register_date, point
from customer
where point > (select point 
				from customer 
                where customer_name = '홍길동');
