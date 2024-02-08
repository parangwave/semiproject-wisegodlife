package ssg.com.a.dao.impl;

import java.security.NoSuchAlgorithmException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.FriendDao;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.util.FriendUtil;

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
		try {
			FriendUtil.pwInsert(dto);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// System.out.println("Pw : " +dto.getPw() + " / salt : " + dto.getSalt());

		return session.insert(ns + "addfriend", dto);
	}

	@Override
	public FriendDto login(FriendDto dto) {
		FriendDto idInfo = session.selectOne(ns + "idInfo", dto.getId());

		if (idInfo != null && idInfo.getDel() > 0) {
			return idInfo;
		}
		if (idInfo == null) {
			return dto;
		}
		try {			
			dto.setSalt(idInfo.getSalt());
			FriendUtil.encryptionPw(dto);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return session.selectOne(ns + "login", dto);

	}

	@Override
	public FriendDto idinfo(String id) {
		return session.selectOne(ns + "idInfo", id);
	}

	@Override
	public int restoreAccount(String id) {
		return session.update(ns + "restoreAccount", id);
	}

	@Override
	public FriendDto naverLogin(String email) {
		return session.selectOne(ns + "naverlogin", email);
	}
}
