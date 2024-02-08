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

}
