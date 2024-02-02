package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.CalendarDto;

public interface MypageDao {
	
	List<CalendarDto> getCalendarList(String id, String yyyyMM);

}
