package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.FreeBbsDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;
import ssg.com.a.dto.LikeDto;


@Repository
public class FreeBbsDaoImpl implements FreeBbsDao{

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Bbs.";

	String bl = "mypage.";
	
	// 블랙리스트 자유게시판 연동
	@Override
	public FreeBbsParam shareMyBlacklist(String id) {
		return session.selectOne(bl + "shareMyBlacklist", id);
	}
	
	@Override
	public List<FreeBbsDto> blockBlacklist(FreeBbsParam param) {
		return session.selectList(bl + "blockBlacklist", param);
	}
	
	@Override
	public int totalfreebbs(FreeBbsParam param) {
		return session.selectOne(bl + "totalfreebbs", param);
	}
	
	@Override
	public List<FreeBbsDto> freeBbsList(FreeBbsParam param) {
		return session.selectList(ns + "freebbslist", param);
	}

	@Override
	public int allFreeBbs(FreeBbsParam param) {
		return session.selectOne(ns + "allfreebbs", param);
	}

	@Override
	public int writeFreeBbs(FreeBbsDto dto) {
		int count = session.insert(ns + "freebbswrite", dto);
		return count;
	}

	@Override
	public FreeBbsDto getFreeBbs(int seq) {
		return session.selectOne(ns + "getfreebbs", seq);	
	}

	@Override
	public int freeBbsUpdate(FreeBbsDto dto) {
		return session.update(ns + "freebbsupdate", dto);	
	}

	@Override
	public int freeBbsDelete(int seq) {
		return session.update(ns + "freebbsdelete", seq);
	}

	@Override
	public List<BbsComment> commentList(int seq) {
		return session.selectList(ns + "commentlist", seq);
	}

	@Override
	public int commentWrite(BbsComment dto) {
		return session.update(ns + "commentwrite", dto);
	}

	@Override
	public int findLike(LikeDto dto) {
		return session.selectOne(ns + "findlike", dto);
	}

	@Override
	public int delLike(LikeDto dto) {
		return session.delete(ns + "dellike", dto);
	}

	@Override
	public int addLike(LikeDto dto) {
		return session.insert(ns + "addlike", dto);
	}

	@Override
	public int totalLikeCountUp(int seq) {
		return session.update(ns + "totallikecountup", seq);
	}

	@Override
	public int totalLikeCountDown(int seq) {
		return session.update(ns + "totallikecountdown", seq);
	}

	@Override
	public void readcount(int seq) {
		session.update(ns + "readcount", seq);
	}
}