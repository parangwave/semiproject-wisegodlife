package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;

	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		return dao.getCalendarList(id, yyyyMM);
	}
	
	
}
