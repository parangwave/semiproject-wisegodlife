package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.UtBbsDto;

public interface MainDao {

	List<FreeBbsDto> mainFreeBbsList();
	
	List<UtBbsDto> mainUtBbsList();
	
}
