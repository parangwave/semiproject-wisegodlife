package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.FindMateDto;

public interface FindMateService {

	List<FindMateDto> findMateList();

	int writeFindMate(FindMateDto dto);

}
