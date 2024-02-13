package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;

public interface CollegelifeDao {
	
	// 월별 일정 보기
	List<CalendarDto> getCalendarList(CalendarParam calpa);
	
	// 학과일정
	void addCalendarWrite(CalendarDto dto);
	CalendarDto calendarDetail(int seq);
	void mycalupdateAf(CalendarDto dto);
	void mycaldelete(int seq);
	
}
