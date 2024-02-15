package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.UtBbsParam;
import ssg.com.a.dto.UtBbsDto;

public interface UtBbsService {

	List<UtBbsDto> utBbsList(UtBbsParam param);
	
	int allUtBbs(UtBbsParam param);
	
	boolean sumbnail(UtBbsDto dto);
	
	UtBbsDto getUtBbs(int seq);
	
	boolean tradeSuccess(int seq);
	
	//조회수 증가
	void readCountUtBbs(int seq);
}
