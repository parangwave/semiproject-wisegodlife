package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.FindMateDao;
import ssg.com.a.dto.FindMateDto;
import ssg.com.a.service.FindMateService;

@Service
public class FindMateServiceImpl implements FindMateService  {
	@Autowired
	FindMateDao dao;
	
	@Override
	public List<FindMateDto> findMateList() {
		return dao.findMateList();
	}

	@Override
	public void writeFindMate(FindMateDto dto) {
		dao.writeFindMate(dto);
	}

}
