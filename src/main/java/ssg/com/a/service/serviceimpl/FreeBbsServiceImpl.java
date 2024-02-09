package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.FreeBbsDao;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;
import ssg.com.a.service.FreeBbsService;

@Service
public class FreeBbsServiceImpl implements FreeBbsService {

	@Autowired
	FreeBbsDao dao;

	@Override
	public List<FreeBbsDto> freeBbsList(FreeBbsParam param) {
		return dao.freeBbsList(param);
	}

	@Override
	public int allFreeBbs(FreeBbsParam param) {
		return dao.allFreeBbs(param);
	}

	@Override
	public boolean writeFreeBbs(FreeBbsDto dto) {
		return dao.writeFreeBbs(dto)>0?true:false;
	}

	@Override
	public FreeBbsDto getFreeBbs(int seq) {
		return dao.getFreeBbs(seq);
	}

	@Override
	public boolean freeBbsUpdate(FreeBbsDto dto) {
		int count = dao.freeBbsUpdate(dto);
		return count > 0 ? true : false;
	}

	@Override
	public boolean freeBbsDelete(int seq) {
		int count = dao.freeBbsDelete(seq);
		return count > 0 ? true : false;
	}
}