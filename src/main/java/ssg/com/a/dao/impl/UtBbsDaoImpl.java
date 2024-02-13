package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.UtBbsDao;
import ssg.com.a.dto.UtBbsParam;
import ssg.com.a.dto.UtBbsDto;

@Repository
public class UtBbsDaoImpl implements UtBbsDao{

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Bbs.";

	@Override
	public List<UtBbsDto> utBbsList(UtBbsParam param) {
		return session.selectList(ns + "utbbslist", param);
	}

	@Override
	public int allUtBbs(UtBbsParam param) {
		return session.selectOne(ns + "allutbbs", param);
	}
	
	@Override
	public int sumbnail(UtBbsDto dto) {
		return session.insert(ns + "sumbnail", dto);
	}

	@Override
	public UtBbsDto getUtBbs(int seq) {
		return session.selectOne(ns + "getutbbs", seq);
	}

	@Override
	public int tradeSuccess(int seq) {
		return session.update(ns + "tradesuccess", seq);
	}
}
