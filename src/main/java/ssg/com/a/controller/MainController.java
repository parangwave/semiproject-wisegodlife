package ssg.com.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ssg.com.a.dto.FindMateDto;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.UtBbsDto;
import ssg.com.a.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@GetMapping("main.do")
	public String main(Model model) {
		System.out.println("MainController main " + new Date());
		
		List<FindMateDto> findMateList = service.mainFindMateList();
//		System.out.println("findMateList " + findMateList);
		List<FreeBbsDto> freeBbslist = service.mainFreeBbsList();
		List<UtBbsDto> utBbslist = service.mainUtBbsList();
		
		model.addAttribute("findMateList", findMateList);
		model.addAttribute("freeBbslist", freeBbslist);
		model.addAttribute("utBbslist", utBbslist);
		
		return "main";
	}
}