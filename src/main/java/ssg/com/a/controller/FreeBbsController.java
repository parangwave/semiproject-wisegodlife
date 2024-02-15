package ssg.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FreeBbsParam;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.LikeDto;
import ssg.com.a.service.FreeBbsService;

@Controller
public class FreeBbsController {

	@Autowired
	FreeBbsService service;
	
	@Autowired
	HttpServletRequest request;

	@GetMapping("freebbslist.do")
	public String freeBbsList(Model model, FreeBbsParam param) {
		System.out.println("FreeBbsController freeBbsList " + new Date());
			
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		int count = 0;
		List<FreeBbsDto> list = null;
		
		FreeBbsParam bl = service.shareMyBlacklist(login.getId());
		if (bl != null) { 
			param.setBlockid(bl.getBlockid());
			param.setWord(bl.getWord());
			
			list = service.blockBlacklist(param);
			count = service.totalfreebbs(param);			
		} else {
			list = service.freeBbsList(param);
			count = service.allFreeBbs(param);
		}

		// 페이지 계산
		int pageBbs = count / 10;
		if ((count % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageBbs", pageBbs);
		model.addAttribute("param", param);

		return "freebbs/freebbslist";
	}

	@GetMapping("freebbswrite.do")
	public String freeBbsWrite() {
		System.out.println("FreeBbsController freeBbsWrite " + new Date());

		return "freebbs/freebbswrite";
	}

	@PostMapping("freebbswriteAf.do")
	public String freeBbsWriteAf(FreeBbsDto dto, Model model) {
		System.out.println("FreeBbsController freeBbsWriteAf " + new Date());

		boolean b = service.writeFreeBbs(dto);
		String freebbswriteMsg = "FREEBBSWRITE_SUCCESS";
		if (!b) {
			freebbswriteMsg = "FREEBBSWRITE_FAIL";
		}

		model.addAttribute("freebbswriteMsg", freebbswriteMsg);

		return "message";

		// Controller에서 controller 이동
		// redirect == sendRedirect
		// return "redirect:/bbslist.do";
	}

	@GetMapping("freebbsdetail.do")
	public String freeBbsDetail(int seq, Model model) {
		System.out.println("FreeBbsController freeBbsDetail " + new Date());

		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		
		// 접속한 이력을 조사 !참고!
		// 조회수 증가
		service.readcount(seq);
		
		FreeBbsDto dto = service.getFreeBbs(seq);

		LikeDto likestat = new LikeDto(login.getId(), seq);
		
		
		int likecount = service.findLike(likestat);
		
		
		model.addAttribute("likecount", likecount);
		model.addAttribute("dto", dto);
		
		return "freebbs/freebbsdetail";
	}

	@GetMapping("freebbsupdate.do")
	public String freebbsUpdate(@RequestParam int seq, Model model) {
		System.out.println("FreeBbsController bbsUpdate " + new Date());

		FreeBbsDto dto = service.getFreeBbs(seq);

		model.addAttribute("dto", dto);

		return "freebbs/freebbsupdate";
	}

	@PostMapping("freebbsupdateaf.do")
	public String freeBbsUpdateAf(HttpServletRequest req, Model model) {
		System.out.println("FreeBbsController freeBbsUpdateAf " + new Date());

		int seq = Integer.parseInt(req.getParameter("seq"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		FreeBbsDto updateDto = new FreeBbsDto(seq, title, content);

		boolean b = service.freeBbsUpdate(updateDto);

		String freebbsupdateMsg = "FREEBBS_UPDATE_SUCCESS";
		if (!b) {
			freebbsupdateMsg = "FREEBBS_UPDATE_SUCCESS";
		}

		model.addAttribute("freebbsupdateMsg", freebbsupdateMsg);

		return "message";
	}

	@GetMapping("freebbsdelete.do")
	public String freeBbsDelete(HttpServletRequest req, Model model) {
		System.out.println("FreeBbsController freeBbsDelete " + new Date());

		int seq = Integer.parseInt(req.getParameter("seq"));
		
		boolean b = service.freeBbsDelete(seq);

		String freebbsdeleteMsg = "FREEBBS_DELETE_SUCCESS";
		if (!b) {
			freebbsdeleteMsg = "FREEBBS_DELETE_FAIL";
		}

		model.addAttribute("freebbsdeleteMsg", freebbsdeleteMsg);

		return "message";
	}
	
	@ResponseBody
	@GetMapping("commentlist.do")
	public List<BbsComment> commentList(int seq){
		System.out.println("FreeBbsController commentList " + new Date());
		
		List<BbsComment> list = service.commentList(seq);
		return list;
	}
	
	@PostMapping("commentwriteaf.do")
	public String commentWriteAf(BbsComment bc) {
		System.out.println("FreeBbsController CommentWriteAf " + new Date());
	
		boolean b = service.commentWrite(bc);
		
		if(b) {
			System.out.println("댓글작성 성공");
		} else {
			System.out.println("댓글작성 실패");
		}
		
		return "redirect:/freebbsdetail.do?seq=" + bc.getSeq();
	}
	
	@ResponseBody
	@GetMapping("likes.do")
	public String getLikes(
			@RequestParam String id,
			@RequestParam int fbseq) {
		System.out.println("FreeBbsController getLikes " + new Date());

		LikeDto dto = new LikeDto(id, fbseq);
		
		//현재 게시글에 좋아요 있는지 없는지 확인
		int count = service.findLike(dto);
		
		//System.out.println(dto.toString());
		System.out.println("count : " + count);
		
		String mes = "";
		if(count != 0) {
			//있을때는 테이블에 값을 지워주면 됨.
			System.out.println(" 현재 좋아요가 있읍니다. ");
			
			service.delLike(dto);
			
			//지워주면서 토탈 카운트도 한개 낮춤
			boolean b = service.totalLikeCountDown(fbseq);
			if(b) {
				System.out.println("카운트 감소 확인");
			}
			mes = "LIKE_DEL";
		} else {
			//없을때는 테이블에 값을 넣어주면 됨.
			System.out.println(" 현재 좋아요가 없읍니다. ");
			service.addLike(dto);
			
			//넣어주면서 토탈 카운트도 한개 올림
			boolean b = service.totalLikeCountUp(fbseq);
			if(b) {
				System.out.println("카운트 증가 확인");
			}
			mes = "LIKE_ADD";
		}
		return mes;
	}
}