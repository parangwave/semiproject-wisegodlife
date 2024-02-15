package ssg.com.a.dao;

import java.util.List;

import ssg.com.a.dto.FindMateDto;

public interface FindMateDao {

	List<FindMateDto> findMateList();

	void writeFindMate(FindMateDto dto);

}
