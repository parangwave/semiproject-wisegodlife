package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.FindMateDao;
import ssg.com.a.dto.FindMateDto;


@Repository
public class FindMateDaoImpl implements FindMateDao {

	@Autowired
	SqlSessionTemplate session; // -> *.xml
	
	String ns = "Bbs.";
	
	@Override
	public List<FindMateDto> findMateList() {
		return session.selectList(ns + "findmate"); // selectList(ns + "findmatelist", 파라미터값)
	}

	@Override
	public void writeFindMate(FindMateDto dto) {
		session.insert(ns + "findmatewrite", dto);
	}
	
}