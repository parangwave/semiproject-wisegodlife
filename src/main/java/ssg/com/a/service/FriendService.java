package ssg.com.a.service;

import ssg.com.a.dto.FriendDto;

public interface FriendService {
	
	boolean idcheck(String id);	
	boolean addfriend(FriendDto dto);	
	FriendDto login(FriendDto dto);
	
	//네이버 로그인
	FriendDto naverLogin(String email);
	
	//회원 복구
	FriendDto idinfo(String id);
	boolean restoreAccount(String id);
	
	// 조교회원가입
	boolean addmajorfriend(FriendDto dto);
}
