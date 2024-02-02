package ssg.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MypageController {

	@GetMapping("mymain.do")
	public String mymain() {
		return "mypage/mymain";
	}
	
}
