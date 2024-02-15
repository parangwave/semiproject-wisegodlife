package ssg.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.service.FindMateService;

@Controller
public class FindMateController {
	
	@Autowired
	FindMateService service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	List<FindMateDto> list = null;

	@GetMapping("findmate.do")
	public String FindMateList(Model model) {
		System.out.println("FindMateController FindMateList " + new Date());
//		List<FindMateDto> list = null;	// 잘못된 방식

		// 하나의 예시
		System.out.println(list);	
		if (list == null || list.size() > 10) {
			// 하고자하는 프로세스 
			this.list = service.findMateList();
		}
		System.out.println(list);

		// 리턴값 주기
		model.addAttribute("list", this.list);
		System.out.println("된다");

		return "findmate/findmate";
	}
	
//	@ResponseBody
//	@GetMapping("findmatelist.do")
//	public List<FindMateDto> findMateList(int seq){
//		System.out.println("findMateList commentList " + new Date());
//		
//		List<FindMateDto> list = service.findMateList();
//		return list;
//	}
//	@GetMapping("findmatelist.do")
//	public String findMateList(Model model){
//		System.out.println("findMateList commentList " + new Date());
//		
//		List<FindMateDto> list = service.findMateList();
//		model.addAttribute("list", list);
//		
//		return "findmate/findmate";
//	}
	
	@PostMapping("findMatecommentwrite.do")
	public String commentWriteAf(FindMateDto bc) {
		System.out.println("commentWriteAf CommentWriteAf " + new Date());
		
		// 작성된 값 집어넣기
		System.out.println(bc.toString());
		// 변수값 정의
		// String id; / String id = null; || int seq; / int seq = 0; / int seq = null(X)
		
		// table에 bc 넣어주기
		FriendDto login = (FriendDto) session.getAttribute("login");
//		System.out.println(login.toString());
		
		String _profileImg = login.getChangeprofile();
		String _nickname = login.getNickname();
//		System.out.println("_profileImg: " + _profileImg);
//		System.out.println("_nickname: " + _nickname);
		bc.setProfileImg(_profileImg);
		bc.setNickname(_nickname);
//		System.out.println(bc.toString());
		
		service.writeFindMate(bc);
		
		this.list.add(bc);
		
		return "redirect:/findmate.do";
	}
}