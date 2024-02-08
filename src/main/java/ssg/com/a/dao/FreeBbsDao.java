package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;

public interface FreeBbsDao {
	List<FreeBbsDto> freeBbsList(FreeBbsParam param);
	
	int allFreeBbs(FreeBbsParam param);
	
	int writeFreeBbs(FreeBbsDto dto);
	
	FreeBbsDto getFreeBbs(int seq);
	
	int freeBbsUpdate(FreeBbsDto dto);

	int freeBbsDelete(int seq);
}
