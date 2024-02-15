package ssg.com.a.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.FreeBbsDao;
import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;
import ssg.com.a.dto.LikeDto;
import ssg.com.a.service.FreeBbsService;

@Service
public class FreeBbsServiceImpl implements FreeBbsService {

	@Autowired
	FreeBbsDao dao;

	// 블랙리스트 자유게시판 연동
	@Override
	public FreeBbsParam shareMyBlacklist(String id) {
		return dao.shareMyBlacklist(id);
	}
	
	@Override
	public List<FreeBbsDto> blockBlacklist(FreeBbsParam param) {
		return dao.blockBlacklist(param);
	}

	@Override
	public int totalfreebbs(FreeBbsParam param) {
		return dao.totalfreebbs(param);
	}
	
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

	@Override
	public List<BbsComment> commentList(int seq) {
		return dao.commentList(seq);
	}

	@Override
	public boolean commentWrite(BbsComment dto) {
		return dao.commentWrite(dto)> 0 ? true : false;
	}

	@Override
	public int findLike(LikeDto dto) {
		return dao.findLike(dto);
	}

	@Override
	public boolean delLike(LikeDto dto) {
		return dao.delLike(dto) > 0? true : false;
	}

	@Override
	public boolean addLike(LikeDto dto) {
		return dao.addLike(dto) > 0? true : false;	
	}

	@Override
	public boolean totalLikeCountUp(int seq) {
		return dao.totalLikeCountUp(seq) > 0? true : false;
	}

	@Override
	public boolean totalLikeCountDown(int seq) {
		return dao.totalLikeCountDown(seq) > 0? true : false;
	}

	@Override
	public void readcount(int seq) {
		dao.readcount(seq);
	}
}