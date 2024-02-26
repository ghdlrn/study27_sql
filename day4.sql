show databases;
use sakila;
-- 서브 퀘리
select *
from customer;

select first_name, last_name
from customer
where customer_id = 1;

select email
from customer
where customer_id = 1;

select first_name, last_name
from customer
where email = 'MARY.SMITH@sakilacustomer.org';

select first_name, last_name
from customer
where email = (  select email
            from customer
            where customer_id = 1 );
                
                
select customer_id,first_name, last_name, email
from customer                
-- where customer_id in (16, 64,124,169,10000);                
where    customer_id in (   
            select customer_id
            from customer                
            where active = 0 
) ;
                
                
select customer_id,first_name, last_name, email
from customer                
where active = 0 ;
                    
-- INSERT
-- INSERT INTO 테이블명(필드1, 필드2,  ....)
-- VALUES(값1,값2, ....);

DESC ACTOR;

INSERT INTO actor(actor_id, first_name, last_name, last_update)
values(201, '최', '민식', now());

INSERT INTO actor(actor_id, first_name, last_name, last_update)
values(202, '김', '고은', now());

INSERT INTO actor
values(203, '유', '해진', now());

select * from actor order by actor_id desc;

rollback;


-- UPDATE
-- UPDATE 테이블명
-- SET 필드1 = '값1', 필드2='값2'....
-- WHERE 필드 = '값;  --반드시 기입

UPDATE ACTOR SET first_name = '박', last_name='수진', last_update = now()
where actor_id = 203;

rollback;


-- DELETE 

-- DELETE FROM 테이블
-- WHERE 조건;

DELETE FROM ACTOR;

DELETE FROM ACTOR WHERE ACTOR_ID > 1;


-- 테이블 생성

/*
고객
-고객ID -- 자동증가
-이름
-핸드폰번호
-성별
-주소
-나이
*/
CREATE TABLE 고객(
   고객ID  INT  NOT NULL auto_increment primary KEY,
    이름 VARCHAR(30) NOT NULL,
    핸드폰 CHAR(13),
    주소 VARCHAR(100),
    나이 INT NOT NULL
);

SELECT * FROM 고객;
DESC 고객;

INSERT INTO 고객(이름, 핸드폰, 주소, 나이)
VALUES('미풍','010-1111-2222', '충청도',  23);

/*
상품
-상품ID --INT AUTO PRIMARY KEY
-상품명 --VARCHAR(30)
-가격   -- INT
-고객ID --INT 
*/

CREATE TABLE 상품(
   상품ID INT  NOT NULL auto_increment ,
    상품명 varchar(30) NOT NULL,
    가격 int DEFAULT 0  ,
    고객ID  INT NOT NULL,
    PRIMARY KEY(상품ID)    
);

INSERT INTO 상품(상품명, 가격, 고객ID)
VALUES('새우깡', 1200, 1);

INSERT INTO 상품(상품명, 가격, 고객ID)
VALUES('감자칩', 1400, 2);

INSERT INTO 상품(상품명, 가격, 고객ID)
VALUES('새우깡', 1200, 3);

INSERT INTO 상품(상품명, 가격, 고객ID)
VALUES('새우깡', 1200, 5);

SELECT * FROM 상품;
                
-- -------- join 연습

select a.고객id, 상품id, 상품명, 가격
from 고객 a inner join 상품 b
on a.고객id = b.고객id;

select a.고객id, 상품id, 상품명, 가격
from 고객 a, 상품 b
where a.고객id = b.고객id;

select a.고객id, 이름, 상품id, 상품명, 가격
from 고객 a inner join 상품 b
on a.고객id = b.고객id;      

select a.고객id, 이름, 상품id, 상품명, 가격
from 고객 a left join 상품 b
on a.고객id = b.고객id;         
                
select a.고객id, 이름, 상품id, 상품명, 가격
from 고객 a right join 상품 b
on a.고객id = b.고객id;       

select * from 고객;
select * from 상품;
desc 고객;             

alter table 고객 add column gender boolean default 0;   
alter table 고객 modify column 이름 varchar(20) not null; 
alter table 고객 change gender 성별 boolean default 0;

alter table 고객 drop column 성별;

drop table 고객;

/*
CREATE TABLE 상품(
   상품ID INT  NOT NULL auto_increment ,
    상품명 varchar(30) NOT NULL,
    가격 int DEFAULT 0  ,
    고객ID  INT NOT NULL,
    PRIMARY KEY(상품ID) ,
    foreign key(고객id) references 고객(고객id)
);
*/ 

delete from 상품 where 상품id = 5;

alter table 상품
add constraint fk_고객ID
foreign key(고객ID) references 고객(고객id);

desc 상품;

INSERT INTO 상품(상품명, 가격, 고객ID)
VALUES('새우깡', 1200, 5);

SELECT * FROM 상품;

DELETE FROM 상품 WHERE 고객ID =5;

SELECT * FROM 고객;

DELETE FROM 고객 WHERE 고객ID = 5;

ALTER TABLE 상품
ADD constraint fk_고객ID
foreign key(고객ID) references 고객(고객ID)
ON delete cascade;


