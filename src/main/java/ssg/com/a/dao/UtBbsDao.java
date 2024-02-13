package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.UtBbsDto;

public interface UtBbsDao {

	List<UtBbsDto> utBbsList();
	
	int sumbnail(UtBbsDto dto);
	
	UtBbsDto getUtBbs(int seq);
	
}
