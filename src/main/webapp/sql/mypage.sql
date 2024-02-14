-- DB 생성

-- 블랙리스트 파일생성
-- seq, id, blockid, word, reason, adddate 
create table blacklist(
	seq int auto_increment primary key,
	id varchar(50) not null,
	blockid varchar(50),
	word varchar(200),
	reason varchar(200),
	adddate timestamp not null
);

-- 회원가입 DB생성
-- id, pw, nickname, name, tel, email, college, major, auth, del, deldate, regidate, salt, introduce, profile, changeprofile
-- auth = 3 기본 회원, auth = 1 학과 조교, auth = 5 총괄 관리자
create table friend(
	id varchar(50) primary key,
	pw varchar(1000) not null,
	nickname varchar(50) not null,
	name varchar(50) not null,
	tel	varchar(50) not null,
	email varchar(200) not null,
	college varchar(100) not null,
	major int not null,
	auth decimal(3) not null,
	del decimal(3) not null,
	deldate timestamp,
	regidate timestamp not null,
	salt varchar(1000) not null,
	introduce varchar(1000),
	profile varchar(500),
	changeprofile varchar(500)
);

-- 좋아요 DB생성
-- id, seq, likeid, title, content, readcount, wdate
create table likelist(
	id varchar(50) primary key,
	seq int not null,
	likeid varchar(50) not null,
	title varchar(400) not null,
	content	varchar(2000) not null,
	readcount decimal(8) not null,
	wdate timestamp not null
);

-- 일정 DB생성
-- seq, id, nickname, title, content, major, college, rdate, wdate
create table calendar(
	seq int auto_increment primary key,
	id varchar(50) not null,
	nickname varchar(50) not null,
	title varchar(400) not null,
	content	varchar(2000),
	major int not null,	-- 학과를 셀렉 옵션으로 밸류값을 숫자로 표현
	college varchar(100),
	auth decimal(3) not null,
	rdate varchar(12) not null,
	wdate timestamp not null
);

-- DB 삭제 (테이블명만 변경해서 사용)
drop table calendar;

-- DB table 전체보기
select *
  from blacklist
;

select *
  from friend
;

-- 회원가입 유니크 키 설정
ALTER TABLE friend 
ADD UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE,
ADD UNIQUE INDEX name_UNIQUE (name ASC) VISIBLE;
;

-- update table
ALTER TABLE calendar ADD COLUMN nickname varchar(50) not null;
ALTER TABLE friend MODIFY COLUMN pw varchar(1000) not null;
ALTER TABLE calendar MODIFY COLUMN college varchar(100);

-- DB 더미데이터 추가
-- friend(회원가입) 계정 추가
insert into friend(id, pw, name, tel, email, college, auth, del, regidate)
values ('abc', '123', '홍길동', '010-1234-5678', 'abc@duam.net', '서울대학교', 3, 0, now())
;

-- member더미 추가
insert into member(id, pw, name, email, auth)
values ('abc', '123', '홍길동', 'abc@duam.net', 3)
;

insert into member(id, pw, name, email, auth)
values ('bcd', '123', '이몽룡', 'bcd@duam.net', 3)
;

-- 블랙리스트 추가한 내용  불러오기
select seq, blockid, word, reason, adddate
  from blacklist
 where id='abc'
 ;
 
-- 아이디를 통해 개인정보 수정
update friend
   set profile='mainprofile.png', changeprofile='mainprofile.png'
 where id='test1'
;

-- 회원탈퇴 close account
update friend
   set del=del+1
 where id='abc'
;

-- 캘린더 일정보기
select seq, id, title, content, major, college, rdate, 
	   wdate from(select row_number()over(partition by substr(rdate, 1, 8) order by rdate asc) as rnum, 
	   seq, id, title, content, major, college, rdate, wdate
  from calendar
 where id='test' and substr(rdate, 1, 6)='202402') a and (auth=1 or auth=3) and major='2' and college='서울대학교'
 where rnum between 1 and 5
;

select salt, del, deldate
  from friend 
 where id='test1'
