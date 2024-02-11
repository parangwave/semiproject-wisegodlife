package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.CollegelifeDao;
import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.service.CollegelifeService;

@Service
public class CollegelifeServiceImpl implements CollegelifeService{
	
	@Autowired
	CollegelifeDao dao;

	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calpa) {
		return dao.getCalendarList(calpa);
	}
	
	@Override
	public void addCalendarWrite(CalendarDto dto) {
		dao.addCalendarWrite(dto);
	}

	@Override
	public CalendarDto calendarDetail(int seq) {
		return dao.calendarDetail(seq);
	}

	@Override
	public void mycalupdateAf(CalendarDto dto) {
		dao.mycalupdateAf(dto);
	}

	@Override
	public void mycaldelete(int seq) {
		dao.mycaldelete(seq);
	}

}
