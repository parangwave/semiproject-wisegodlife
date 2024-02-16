package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.MainDao;
import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.UtBbsDto;
import ssg.com.a.service.MainService;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao dao;
	
	@Override
	public List<FindMateDto> mainFindMateList() {
		return dao.mainFindMateList();
	}

	@Override
	public List<FreeBbsDto> mainFreeBbsList() {
		return dao.mainFreeBbsList();
	}

	@Override
	public List<UtBbsDto> mainUtBbsList() {
		return dao.mainUtBbsList();
	}
}
