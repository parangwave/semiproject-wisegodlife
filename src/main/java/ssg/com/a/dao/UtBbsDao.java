package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.UtBbsDto;
import ssg.com.a.dto.UtBbsParam;

public interface UtBbsDao {

	List<UtBbsDto> utBbsList(UtBbsParam param);
	
	int allUtBbs(UtBbsParam param);

	int sumbnail(UtBbsDto dto);
	
	UtBbsDto getUtBbs(int seq);
	
	int tradeSuccess(int seq);
	
	void readcountUtBbs(int seq);
	
}
