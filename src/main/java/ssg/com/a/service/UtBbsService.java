package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.UtBbsDto;

public interface UtBbsService {

	List<UtBbsDto> utBbsList();
	
	boolean sumbnail(UtBbsDto dto);
	
	UtBbsDto getUtBbs(int seq);
}
