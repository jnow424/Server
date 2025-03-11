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
drop table tblAddress;
drop sequence seqAddress;

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
    values (seqAddress.nextVal, '홍길동', 20, 'm', '010-1234-56787'
            , '서울시 강남구 역삼동', default);

select * from tblAddress; --서울시 길동's 하우스

update tblAddress set age = age + 1 where seq = 2;
update tblAddress set address = '서울시 강동구 천호동' where seq = 2;
    
delete from tblAddress where seq = 2;

commit;






select name from tblAddress order by name;

select * from tblInsa;




create table tblBonus (
    seq number primary key,
    num number(5) not null references tblInsa(num), --직원번호(FK)
    bonus number not null
);
create sequence seqBonus;


select i.num, i.name, i.buseo, i.jikwi, b.bonus, b.num from tblInsa i inner join tblBonus b on i.num = b.num order by b.seq desc;


-- Ex06.java

-- m1. 인자값X, 반환값X
create or replace procedure procM1
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate)
        values (seqAddress.nextVal, '홍길동', 20, 'm', '010-1234-56787'
            , '서울시 강남구 역삼동', default);
end procM1;
/

begin
    procM1;
end;

execute procM1; --오라클 문법(벤더따라 다르게 지원)
exec procM1;
call procM1; --표준 문법(ANSI)
/

-- m2. 인자값O, 반환값X
create or replace procedure procM2 (
    pname varchar2,
    page number,
    pgender varchar2,
    ptel varchar2,
    paddress varchar2
)
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate)
        values (seqAddress.nextVal, pname, page, pgender, ptel, paddress, default);
end procM2;
/


--호출?
begin
    procM2('강아지', 3, 'f', '010', '서울시');
end;
/


-- m3. 인자값X, 반환값O
create or replace procedure procM3 (
    pcount out number
)
is
begin
    select count(*) into pcount from tblAddress;
end procM3;
/

set serveroutput on;
/

declare
    vcount number;
begin
    procM3(vcount);
    dbms_output.put_line(vcount);
end;
/



-- m4. 인자값O, 반환값O
create or replace procedure procM4 (
    pseq        in number,
    pname       out varchar2,
    page        out number,
    pgender     out varchar2,
    ptel        out varchar2,
    paddress    out varchar2
)
is
begin
    select name, age, gender, tel, address into pname, page, pgender, ptel, paddress
        from tblAddress where seq = pseq;
end procM4;
/



-- m5. 커서 반환
create or replace procedure procM5 (
    pgender in varchar2,
    pcursor out sys_refcursor
)
is
begin
    open pcursor
    for
    select * from tblAddress where gender = pgender;
end procM5;
/


declare
    vcursor sys_refcursor;
    vrow tblAddress%rowtype;
begin
    procM5('m', vcursor);
    
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        dbms_output.put_line(vrow.name || ',' || vrow.gender);        
    end loop;
    
end;
/


select * from tblAddress;


create or replace procedure procM
is
begin
    
end procM;
/

delete from tblAddress;
commit;

select * from tblAddress;












