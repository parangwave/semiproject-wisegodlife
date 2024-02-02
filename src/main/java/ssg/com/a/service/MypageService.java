package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;

public interface MypageService {
	
	List<CalendarDto> getCalendarList(String id, String yyyyMM);
	List<BbsComment> getMyCommentList(String id);
	List<BbsDto> getMyWriteList(String id);

}
