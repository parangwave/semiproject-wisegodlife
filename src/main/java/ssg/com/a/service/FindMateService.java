package ssg.com.a.service;

import java.util.List;

import ssg.com.a.dto.FindMateDto;

// autowired -> parent -> child
// 하나의 인터페이스는 하나의 클래스만 
public interface FindMateService {

	List<FindMateDto> findMateList();

	void writeFindMate(FindMateDto dto);

}
