package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.UtBbsDto;

public interface MainService {

	List<FreeBbsDto> mainFreeBbsList();
	
	List<UtBbsDto> mainUtBbsList();
}