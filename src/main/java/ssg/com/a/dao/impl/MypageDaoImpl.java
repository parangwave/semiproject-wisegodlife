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
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.MyblacklistDto;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "mypage.";

	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calpa) {
		return session.selectList(ns + "getCalendarList", calpa);
	}

	@Override
	public List<BbsComment> getMyCommentList(String id) {
		return session.selectList(ns + "getMyCommentList", id);
	}

	@Override
	public List<BbsDto> getMyWriteList(String id) {
		return session.selectList(ns + "getMyWriteList", id);
	}

	@Override
	public void addBlacklistId(MyblacklistDto dto) {
		session.insert(ns + "addBlacklistId", dto);
	}

	@Override
	public void addBlacklistWord(MyblacklistDto dto) {
		session.insert(ns + "addBlacklistWord", dto);
		
	}

	@Override
	public List<MyblacklistDto> getMyBlacklist(String id) {
		return session.selectList(ns + "getMyBlacklist", id);
	}

	@Override
	public int changeMyinfor(FriendDto dto) {
		return session.update(ns + "changeMyinfor", dto);
		
	}

	@Override
	public FriendDto changelogin(FriendDto dto) {
		return session.selectOne(ns + "changelogin", dto);
	}

	@Override
	public int closeAccount(String id) {
		return session.update(ns + "closeAccount", id);
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
