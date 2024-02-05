package ssg.com.a.service;

import ssg.com.a.dto.FriendDto;

public interface FriendService {
	
	boolean idcheck(String id);
	
	boolean addfriend(FriendDto dto);
	
	FriendDto login(FriendDto dto);

}
