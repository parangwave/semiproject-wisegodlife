package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.MypageDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.MyblacklistDto;
import ssg.com.a.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;

	@Override
	public List<BbsComment> getMyCommentList(String id) {
		return dao.getMyCommentList(id);
	}

	@Override
	public List<FreeBbsDto> getMyWriteList(String id) {
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
	public boolean changeMyinfor(FriendDto dto) {
		return dao.changeMyinfor(dto)>0?true:false;		
	}

	@Override
	public FriendDto changelogin(FriendDto dto) {
		return dao.changelogin(dto);
	}

	@Override
	public boolean closeAccount(String id) {
		return dao.closeAccount(id)>0?true:false;
	}
	
}
