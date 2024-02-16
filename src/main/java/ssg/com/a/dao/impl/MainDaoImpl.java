package ssg.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dao.MainDao;
import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.UtBbsDto;

@Repository
public class MainDaoImpl implements MainDao{

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "main.";

	@Override
	public List<FreeBbsDto> mainFreeBbsList() {
		return session.selectList(ns + "mainfreebbslist");
	}

	@Override
	public List<UtBbsDto> mainUtBbsList() {
		return session.selectList(ns + "mainutbbslist");
	}

	@Override
	public List<FindMateDto> mainFindMateList() {
		return session.selectList(ns + "mainfindmatelist");
	}
}
