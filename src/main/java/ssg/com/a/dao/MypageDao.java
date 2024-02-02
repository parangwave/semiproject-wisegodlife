package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;

public interface MypageDao {
	
	List<CalendarDto> getCalendarList(String id, String yyyyMM);
	List<BbsComment> getMyCommentList(String id);
	List<BbsDto> getMyWriteList(String id);

}
