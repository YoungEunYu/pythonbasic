# mysql 데이터 베이스
# user 테이블


desc mysql.user;
describe mysql.user;

show columns from mysql.user;
show full columns from mysql.user;

select Host, User
	from mysql.user;

create user 'test '@'localhost' identified by '1234';
    
create user 'anywhere'@'%'identified by '1234';

create user 'test2'@'192.168.0.%' identified by '1234';


create or replace user 'test2'@'localhost' identified by '1234';

create user if not exists 'test3'@'localhost' identified by '1234';

rename user 'test2'@'192.168.0.%' to 'test5'@'%';

set password for 'test5'@'%' = password('12345');

drop user 'test5'@'%';     # 삭제

drop  user if exists 'anywhere'@'%';

show grants for 'test'@'localhost';
grant all privileges on test.* TO 'test'@'localhost';
flush privileges;

# 데이터베이스 목록 조회
show databases;
# 데이터베이스 test라는 이름으로 생성
create database test;

# 'test'@'localhost'가 가진 권한을 조회
show grants for 'test'@'localhost';

revoke all on test.* from 'test'@'localhost';
flush privileges; # 권한을 넣었다 뺐다 하는 건 민감한 문제이기 때문에 단계가 하나 있다고 이해하면 됨.
show grants for 'test'@'localhost';

# 우리는 지금 루트 계정으로 들어와 있기 때문에 모든 데이터가 보이는 것이다.
show databases;

create database if not exists test;

# 특수문자가 포함되면 에러가 발생한다. esc키 아래의 억음부호로 이름을 감싸면 에러가 나지 않는다.
create database `test.test`;

# 데이터 베이스 삭제
drop database `test.test`;
show databases;

# 데이터베이스 명칭 변경하기
# 데이터베이스 이름은 직접 변경할 수 없다. 하지만 편법이 있음.
# 기존 데이터베이스를 덤프로 만들고, 변경할 이름으로 새로 데이터베이스를 생성하면 됨.
# 터미널에서 작업한다. 

create database if not exists test1;


#테이블 만들기
create database python;
use python;

create table table1 (column1 varchar(100));
select database();
show tables;

rename table table1 to table2;
show tables;

drop table table2;
show tables;

create table test_table(
	test_column1 int,
    test_column2 int,
    test_column3 int
    );
desc test_table;

# table에 column 추가
alter table test_table
add test_column4 int;

desc test_table;

# 테이블에 여러개의 컬럼 추가하기
alter table test_table
add(
	test_column5 int,
    test_column6 int,
    test_column7 int
);
desc test_table;

# 테이블의 컬럼 삭제
alter table test_table
drop test_columns5;

desc test_table;

# 테이블 컬럼 순서 변경하기 / test_column7을 맨 앞으로 이동시킨다.
alter table test_table
modify test_column7 int
first;

desc test_table;

# 맨 앞으로 이동시키는 것
alter table test_table
modify test_column7 int
after test_column6;

desc test_table;

# 컬럼의 이름 변경
alter table test_table
change test_column2 test_column0 int;
desc test_table;

# 데이터 타입 변경하기, 데이터 타입을 varchar(10)로 변경한다.
alter table test_table
change test_column0 test_column0 varchar(10);
desc test_table;

# 컬럼 이름과 데이터 타입을 동시에 변경하자.
alter table test_table
change test_column0 test_column2 int;
desc test_table;

# 자동으로 증가하는 컬럼 만들기
# primary key를 붙이지 않으면 에러가 난다.
create table test(id int auto_increment primary key);
describe test;
