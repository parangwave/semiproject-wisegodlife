package ssg.com.a.service.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.FriendDao;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.service.FriendService;

@Service
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	FriendDao dao;
	
	@Override
	public boolean idcheck(String id) {
		int count = dao.idcheck(id);
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean nicknamecheck(String nickname) {
		int count = dao.nicknamecheck(nickname);
		return count > 0 ? true : false;
	}

	@Override
	public boolean addfriend(FriendDto dto) {
		int count = dao.addfriend(dto);
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean addmajorfriend(FriendDto dto) {
		return dao.addmajorfriend(dto)>0?true:false;
	}

	@Override
	public FriendDto login(FriendDto dto) {
		return dao.login(dto);
	}

	@Override
	public FriendDto idinfo(String id) {
		return dao.idinfo(id);
	}

	@Override
	public boolean restoreAccount(String id) {
		return dao.restoreAccount(id)>0?true:false;
	}
	
	@Override
	public FriendDto naverLogin(String email) {
		return dao.naverLogin(email);
	}

}
