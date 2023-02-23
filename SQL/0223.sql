show databases;
create database python;
use python;

create table test(
	id int auto_increment primary key
);

desc test;

# auto_increment가 지정된 컬럼에 다시 데이터를 추가하면 1보다 하나 큰 2값이 생성되어 저장.
insert into test values();
select * from test;

# auto_increment가 지정된 컬럼에 값을 정해 데이터를 추가할 수도 있다.
# 100 값을 추가해준 것.
insert into test values (100);
# 이후 값이 없는 데이터를 추가하면 id는 100보다 하나 큰 101이 된다.
insert into test values();

select * from test;

delete from test where id = 101;
select * from test;

insert into test values ();
select * from test;

# 101 지움
delete from test where id = 101;
select * from test;

# 다시 하면 102가 생김!
insert into test values();
select * from test;

# mysql workbench를 재시작했다면 아래 명령어 실행 필요
# use python;
delete from test;
select * from test;

insert into test values ();
select * from test;

# safety mode가 켜져 있어서 오류가 남.
# 그거 꺼야 함.
delete from test;
select * from test;

insert into test values();
select * from test;

show table status where name = 'test';
# 테이블에 데이터가 1개도 없어야 한다
# 만약 테이블의 데이터가 있다면
# 그 중 가장 큰 auto_increment보다 크게만 지정할 수 있다.

# 위에 띄운 테이블에서 auto_increment를 1로 만들겠다는 
alter table test auto_increment = 1;

set @count = 0;
update test set id = @count:=@count+1;

select * from test;

create table table1 (
	column1 varchar(100),
    column2 varchar(100),
    column3 varchar(100)
);

desc table1;
insert into table1 (column1, column2, column3) values ('a', 'aa', 'aaa');
select * from table1;

insert into table1 (column1, column2) values ('b', 'bb');
select * from table1;

update table1 set column1 = 'z';
select * from table1;

update table1 set column1 = 'x' where column2 = 'aa';
select * from table1;

delete from table_1 where column_1 = 'y';
select * from table_1;

update table1
	set column1 = 'y'
    , column2 = 'yy'
where column3 = 'aaa';

select * from table_1;


# 기존테이블 삭제(테이블 존재시)
DROP TABLE IF EXISTS day_visitor_realtime;

# 테이블생성
CREATE TABLE IF NOT EXISTS day_visitor_realtime (
ipaddress varchar(16), 
iptime_first datetime, 
before_url varchar(250), 
device_info varchar(40), 
os_info varchar(40), 
session_id varchar(80));

select * from day_visitor_realtime;

insert into day_visitor_realtime(
	ipaddress, iptime_first, before_url, device_info
)
values (
	'asdf', '2021-12-19 16:14:28', 'aaa', 'aa'
);
desc day_visitor_realtime;

insert into day_visitor_realtime(
	ipaddress, iptime_first, before_url, device_info
)

# varchar(16)
values ('12345678901234567', '2023-02-23 11:34:28', 'localhost', 'PC');
# varchar(16)에 17자리의 값을 넣어서 에러 발생

INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('12345.567890');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('1234.567890');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('123'); 
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('1234'); 
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('12345');

select * from day_visitor_realtime;

drop table if exists day_visitor_realtime;
create table day_visitor_raltime (
ipaddress varchar(16) not null, 
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));

select * from day_visitor_realtime;

# 기존 테이블을 지우고 primary key가 포함된 테이블로 새로 만들기
drop table if exists day_visitor_realtime;
create table day_visitor_realtime(
id int,
ipaddress varchar(16),
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80),
primary key(id)
);

select * from day_visitor_realtime;

insert into day_visitor_realtime(
id, ipaddress, iptime_first, before_url, device_info, os_info
/*session_id*/
)

# duplicate error 발생
values (1, 'asdf', now(), 'aa', 'asdf', 'aa'),
	(1, 'asdf2', now(), 'aa2', 'asdf2', 'aa2');
 
 # 참조할 테이블
CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  order_date DATETIME,
  PRIMARY KEY(order_id)
);

insert into orders values (1, 1, now());
insert into orders values (2, 1, now());
insert into orders values (3, 1, now());
select * from orders;

CREATE TABLE order_detail (
  order_id INT,
  product_id INT,
  product_name VARCHAR(200),
  order_date DATETIME,
  CONSTRAINT FK_ORDERS_ORDERID FOREIGN KEY (order_id) REFERENCES orders(order_id),
  PRIMARY KEY(order_id, product_id)
);
 
 
 insert into order_detail (order_id, product_id, product_name) 
 values (1, 100, 'iPhone')
	,(1, 101, 'iPad');
 
 select * from order_detail;
 
 
 
 
 
 