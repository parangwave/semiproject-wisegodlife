package ssg.com.a.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavController {
	
	// 상단네비게이션바
	@GetMapping("topnav.do")
	public String topnav() {
		System.out.println("MemberController topnav " + new Date());

		return "nav/topnav";
	}
	
	// 마이페이지 네비게이션바
	@GetMapping("mynav.do")
	public String mynav() {
		System.out.println("MemberController mynav " + new Date());

		return "nav/mynav";
	}	
	
	// 학교생활 네비게이션바
	@GetMapping("collnav.do")
	public String collnav() {
		System.out.println("MemberController collnav " + new Date());

		return "nav/collnav";
	}
}
