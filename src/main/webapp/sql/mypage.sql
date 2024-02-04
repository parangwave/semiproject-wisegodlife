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
-- id, pw, name, tel, email, college, auth, del 
create table friend(
	id varchar(50) primary key,
	pw varchar(50) not null,
	name varchar(50) not null,
	tel	varchar(50) not null,
	email varchar(200) not null,
	college varchar(100) not null,
	auth decimal(3) not null,
	del decimal(3) not null,
	regidate timestamp not null
);

-- DB 삭제 (테이블명만 변경해서 사용)
drop table friend;

-- DB table 전체보기
select *
  from blacklist
;

select *
  from friend
;

-- DB 더미데이터 추가
-- friend(회원가입) 계정 추가
insert into friend(id, pw, name, tel, email, college, auth, del, regidate)
values ('abc', '123', '홍길동', '010-1234-5678', 'abc@duam.net', '서울대학교', 3, 0, now())
;

-- 블랙리스트 추가한 내용  불러오기
select seq, blockid, word, reason, adddate
  from blacklist
 where id='abc'
 ;
 
-- 아이디를 통해 개인정보 수정
update member
   set name='고창석', email='kbo.daum.net'
 where id='abc'
;

-- 회원탈퇴 close account
update friend
   set del=del+1
 where id='abc'
;

