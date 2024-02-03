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