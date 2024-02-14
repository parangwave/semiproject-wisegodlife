package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.FindMateDao;
import ssg.com.a.dao.FreeBbsDao;
import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;


@Repository
public class FindMateDaoImpl implements FindMateDao {

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Bbs.";
	
	@Override
	public List<FindMateDto> findMateList() {
		return session.selectList(ns + "findmatelist");
	}

	@Override
	public int writeFindMate(FindMateDto dto) {
		int count = session.insert(ns + "freebbswrite", dto);
		return count;
	}

}