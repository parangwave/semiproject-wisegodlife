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
import ssg.com.a.dto.MemberDto;
import ssg.com.a.dto.MyblacklistDto;

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
	public int changeMyinfor(MemberDto dto) {
		return session.update(ns + "changeMyinfor", dto);
		
	}

	@Override
	public MemberDto changelogin(MemberDto dto) {
		return session.selectOne(ns + "changelogin", dto);
	}

	@Override
	public int closeAccount(String id) {
		return session.update(ns + "closeAccount", id);
	}

}
