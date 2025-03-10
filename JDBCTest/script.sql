/*
1. services.msc
   - OracleServiceXE
   - OracleOraDB21Home1TNSListener

2. 계정 생성 
   - system 접속
   - "server" 계정 생성
   
3. 접속   
   
*/
show user; --USER이(가) "SYSTEM"입니다.

alter session set "_ORACLE_SCRIPT"=true;
create user server identified by java1234;
grant connect, resource, dba to server;
alter user server default tablespace users; --hr > users


-- 주소록 테이블
create table tblAddress (
    seq number primary key,                                 --PK
    name varchar2(30) not null,                             --이름
    age number(3) not null check(age between 0 and 120),    --나이
    gender char(1) not null check(gender in ('m', 'f')),    --성별(m,f)
    tel varchar2(15) not null,                              --전화번호
    address varchar2(300) not null,                         --주소
    regdate date default sysdate not null                   --등록일
);
create sequence seqAddress;

-- 업무 SQL > 미리 작성해놓기 > 1. DB 테스트, 2. JDBC 작업 용이

-- CRUD
insert into tblAddress (seq, name, age, gender, tel, address, regdate)
    values (seqAddress.nextVal, '병아리', 20, 'm', '010-1234-56787'
            , '서울시 강남구 역삼동', default);

select * from tblAddress;


update tblAddress set age = age + 1 where seq = 2;
update tblAddress set name = '서울시 강동구 천호동' where seq = 2;
    
delete from tblAddress where seq = 7;

commit;















