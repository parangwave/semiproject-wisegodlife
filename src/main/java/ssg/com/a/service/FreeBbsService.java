package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;

public interface FreeBbsService {

	List<FreeBbsDto> freeBbsList(FreeBbsParam param);
	
	int allFreeBbs(FreeBbsParam param);
	
	boolean writeFreeBbs(FreeBbsDto dto);
	
	FreeBbsDto getFreeBbs(int seq);

	boolean freeBbsUpdate(FreeBbsDto dto);

	boolean freeBbsDelete(int seq);

	// 블랙리스트 불러오기 및 제외 글 불러오기
	FreeBbsParam shareMyBlacklist(String id);
	List<FreeBbsDto> blockBlacklist(FreeBbsParam param);
	int totalfreebbs(FreeBbsParam param);
}
