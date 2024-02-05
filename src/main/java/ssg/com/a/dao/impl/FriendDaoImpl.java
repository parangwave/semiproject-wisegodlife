package ssg.com.a.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.FriendDao;
import ssg.com.a.dto.FriendDto;

@Repository
public class FriendDaoImpl implements FriendDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Friend.";
	
	@Override
	public int idcheck(String id) {
		return session.selectOne(ns + "idcheck", id);
	}

	@Override
	public int addfriend(FriendDto dto) {
		return session.insert(ns + "addfriend", dto);
	}

	@Override
	public FriendDto login(FriendDto dto) {
		return session.selectOne(ns + "login", dto);
	}

}
