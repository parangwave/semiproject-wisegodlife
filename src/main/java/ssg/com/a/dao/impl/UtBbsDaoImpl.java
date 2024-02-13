package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.UtBbsDao;
import ssg.com.a.dto.UtBbsDto;

@Repository
public class UtBbsDaoImpl implements UtBbsDao{

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Bbs.";

	@Override
	public List<UtBbsDto> utBbsList() {
		return session.selectList(ns + "utbbslist");
	}

	@Override
	public int sumbnail(UtBbsDto dto) {
		return session.insert(ns + "sumbnail", dto);
	}

	@Override
	public UtBbsDto getUtBbs(int seq) {
		return session.selectOne(ns + "getutbbs", seq);
	}
}
