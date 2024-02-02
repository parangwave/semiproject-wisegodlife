package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "mypage.";

	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		return session.selectList(ns + "getCalendarList", new CalendarParam(id, yyyyMM));
	}

	@Override
	public List<BbsComment> getMyCommentList(String id) {
		return session.selectList(ns + "getMyCommentList", id);
	}

	@Override
	public List<BbsDto> getMyWriteList(String id) {
		return session.selectList(ns + "getMyWriteList", id);
	}

}
