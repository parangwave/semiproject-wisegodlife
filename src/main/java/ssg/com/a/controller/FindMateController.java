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

	@GetMapping("findmate.do")
	public String FindMateList(Model model) {
		System.out.println("FindMateController FindMateList " + new Date());
		List<FindMateDto> list = null;

		model.addAttribute("list", list);

		return "findmate";
	}
}