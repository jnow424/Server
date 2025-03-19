-- AjaxTest > script.sql

-- 설문조사
create table tblSurvey (
    seq number primary key,            --번호(PK)
    question varchar2(300) not null,--질문
    item1 varchar2(300) not null,   --항목
    item2 varchar2(300) not null,   --항목
    item3 varchar2(300) not null,   --항목
    item4 varchar2(300) not null,   --항목
    cnt1 number default 0 not null, --선택
    cnt2 number default 0 not null, --선택
    cnt3 number default 0 not null, --선택
    cnt4 number default 0 not null  --선택
);

insert into tblSurvey values (1, '가장 자신있는 프로그래밍 언어는?'
    , 'JAVA', 'Python', 'C#', 'JavaScript', default, default, default, default);

select * from tblSurvey;

update tblSurvey set
    cnt1 = 8,
    cnt2 = 5,
    cnt3 = 15,
    cnt4 = 3
        where seq = 1;

commit;



select * from tabs;
select * from tblUser;



















select * from tabs;
select * from tblInsa; --3610000





-- 고양이 Drag & Drop
-- 프로젝트 > 조직도 편성 or 주자창 도면 편집
create table tblCat (
    catid varchar2(50) primary key, -- <img id="cat1">
    src varchar2(100) not null,     -- <img src="images/catty01.png">
    x number not null,
    y number not null
);

select * from tblCat;

select max(to_number(catid)) as catid from tblCat; --3

insert into tblCat values ('15', '01', 0, 0);
delete from tblCat where catid = '15';
commit;

delete from tblCat;

select * from tblCat order by to_number(catid) desc;
select nvl(max(to_number(catid)), 0) as catid from tblCat;













