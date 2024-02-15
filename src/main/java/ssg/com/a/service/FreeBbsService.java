package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;
import ssg.com.a.dto.LikeDto;

public interface FreeBbsService {

	List<FreeBbsDto> freeBbsList(FreeBbsParam param);
	
	int allFreeBbs(FreeBbsParam param);
	
	boolean writeFreeBbs(FreeBbsDto dto);
	
	FreeBbsDto getFreeBbs(int seq);

	boolean freeBbsUpdate(FreeBbsDto dto);

	boolean freeBbsDelete(int seq);

	List<BbsComment> commentList(int seq);

	boolean commentWrite(BbsComment dto);
	
	// 좋아요 부분
	int findLike(LikeDto dto);
	boolean delLike(LikeDto dto);
	boolean addLike(LikeDto dto);
	boolean totalLikeCountUp(int seq);
	boolean totalLikeCountDown(int seq);
	
	//조회수 증가
	void readcount(int seq);
	
	// 블랙리스트 불러오기 및 제외 글 불러오기
	FreeBbsParam shareMyBlacklist(String id);
	List<FreeBbsDto> blockBlacklist(FreeBbsParam param);
	int totalfreebbs(FreeBbsParam param);
}
