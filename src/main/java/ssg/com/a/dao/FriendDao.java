package ssg.com.a.dao;

import ssg.com.a.dto.FriendDto;

public interface FriendDao {

	int idcheck(String id);
	int nicknamecheck(String nickname);
	int addfriend(FriendDto dto);
	FriendDto login(FriendDto dto);
	
	//네이버 로그인
	FriendDto naverLogin(String email);
	
	// 회원복구
	FriendDto idinfo(String id);
	int restoreAccount(String id);
	
	// 조교회원가입
	int addmajorfriend(FriendDto dto);
}
