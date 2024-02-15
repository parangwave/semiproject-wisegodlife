package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.MyblacklistDto;

public interface MypageService {
	
	// 내가 쓴 댓글 및 게시글 보기
	List<BbsComment> getMyCommentList(String id);
	List<FreeBbsDto> getMyWriteList(String id);
	
	// 블랙리스트
	void addBlacklistId(MyblacklistDto dto);
	void addBlacklistWord(MyblacklistDto dto);
	List<MyblacklistDto> getMyBlacklist(String id);

	// 개인정보변경
	boolean changeMyinfor(FriendDto dto);
	FriendDto changelogin(FriendDto dto);
	
	// 회원탈퇴
	boolean closeAccount(String id);
	
	// 좋아요리스트
	List<FreeBbsDto> getlikelist(String id);
	
}
