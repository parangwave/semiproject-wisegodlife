package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.MemberDto;
import ssg.com.a.dto.MyblacklistDto;
import ssg.com.a.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;

	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		return dao.getCalendarList(id, yyyyMM);
	}

	@Override
	public List<BbsComment> getMyCommentList(String id) {
		return dao.getMyCommentList(id);
	}

	@Override
	public List<BbsDto> getMyWriteList(String id) {
		return dao.getMyWriteList(id);
	}

	@Override
	public void addBlacklistId(MyblacklistDto dto) {
		dao.addBlacklistId(dto);		
	}

	@Override
	public void addBlacklistWord(MyblacklistDto dto) {
		dao.addBlacklistWord(dto);		
	}

	@Override
	public List<MyblacklistDto> getMyBlacklist(String id) {
		return dao.getMyBlacklist(id);
	}

	@Override
	public boolean changeMyinfor(MemberDto dto) {
		return dao.changeMyinfor(dto)>0?true:false;		
	}

	@Override
	public MemberDto changelogin(MemberDto dto) {
		return dao.changelogin(dto);
	}
	
	
}
