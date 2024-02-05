package ssg.com.a.service;

import ssg.com.a.dto.FriendDto;

public interface FriendService {
	
	boolean idcheck(String id);
	
	boolean addfriend(FriendDto dto);
	
	FriendDto login(FriendDto dto);
	
	//회원 복구
	FriendDto idinfo(String id);
	boolean restoreAccount(String id);
}
