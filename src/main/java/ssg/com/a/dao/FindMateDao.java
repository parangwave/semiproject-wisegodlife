package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FreeBbsDto;

public interface FindMateDao {

	List<FindMateDto> findMateList();

	int writeFindMate(FindMateDto dto);

}
