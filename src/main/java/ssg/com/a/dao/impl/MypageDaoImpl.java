package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.LikeDto;
import ssg.com.a.dto.MyblacklistDto;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "mypage.";

	@Override
	public List<BbsComment> getMyCommentList(String id) {
		return session.selectList(ns + "getMyCommentList", id);
	}

	@Override
	public List<FreeBbsDto> getMyWriteList(String id) {
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
	public List<LikeDto> getlike(String id) {
		return session.selectList(ns + "getlike", id);
	}

	@Override
	public FreeBbsDto getlikelist(int seq) {
		return session.selectOne(ns + "getlikelist", seq);
	}

}
