package ssg.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.service.FindMateService;

@Controller
public class FindMateController {

	@Autowired
	FindMateService service;
	
	@Autowired
	HttpServletRequest request;
	
	List<FindMateDto> list = null;

	@GetMapping("findmate.do")
	public String FindMateList(Model model) {
		System.out.println("FindMateController FindMateList " + new Date());
//		List<FindMateDto> list = null;	// 잘못된 방식

		// 하나의 예시
		System.out.println(list);	
		if (list == null) {
			// 하고자하는 프로세스 
			this.list = service.findMateList();
		}
		System.out.println("list가 null이 아님");
		
		// 리턴값 주기
		model.addAttribute("list", this.list);
		System.out.println("된다");

		return "findmate/findmate";
	}
}