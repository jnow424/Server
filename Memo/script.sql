-- Memo > script.sql

-- DDL
drop table tblMemo;
drop sequence seqMemo;

create table tblMemo (
    seq number primary key,                 --메모번호(PK)
    name varchar2(30) not null,             --작성자
    pw varchar2(30) not null,               --암호
    memo varchar2(2000) not null,           --메모
    regdate date default sysdate not null   --작성일
);
create sequence seqMemo;

-- DML
-- 메모 쓰기
insert into tblMemo (seq, name, pw, memo, regdate)
    values (seqMemo.nextVal, '홍길동', '1111', '메모입니다.', default);
    
-- 메모 목록보기
select * from tblMemo order by seq desc;

-- 작성자 확인하기? > 5번글 삭제 시도 > 5번글의 암호 입력
select count(*) as cnt from tblMemo where seq = 1 and pw = '1111';

-- 메모 수정하기
update tblMemo set memo = '수정된 내용입니다.' where seq = 1;

-- 메모 삭제하기
delete from tblMemo where seq = 1;

commit;















