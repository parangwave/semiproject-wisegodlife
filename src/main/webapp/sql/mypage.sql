use mydb;

-- seq, id, word, reason, adddate 
create table blacklist(
	seq int auto_increment primary key,
	id varchar(50) not null,
	blockid varchar(50),
	word varchar(200),
	reason varchar(200),
	adddate timestamp not null
);

-- drop table blacklist;

select *
  from blacklist
;

select seq, blockid, word, reason, adddate
  from blacklist
 where id='abc'
 ;
 
select *
  from member
 where id='abc'
;

update member
   set name='고창석', email='kbo.daum.net'
 where id='abc'
;
