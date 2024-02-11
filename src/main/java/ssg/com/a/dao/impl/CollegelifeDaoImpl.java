package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.CollegelifeDao;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;

@Repository
public class CollegelifeDaoImpl implements CollegelifeDao{

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "collegelife.";

	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calpa) {
		return session.selectList(ns + "getCalendarList", calpa);
	}
	
	@Override
	public void addCalendarWrite(CalendarDto dto) {
		session.insert(ns + "addCalendarWrite", dto);
	}

	@Override
	public CalendarDto calendarDetail(int seq) {
		return session.selectOne(ns + "calendarDetail", seq);
	}

	@Override
	public void mycalupdateAf(CalendarDto dto) {
		session.update(ns + "mycalupdateAf", dto);
	}

	@Override
	public void mycaldelete(int seq) {
		session.delete(ns + "mycaldelete", seq);
	}

}
