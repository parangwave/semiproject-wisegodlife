package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.CalendarDto;

public interface MypageService {
	
	List<CalendarDto> getCalendarList(String id, String yyyyMM);

}
