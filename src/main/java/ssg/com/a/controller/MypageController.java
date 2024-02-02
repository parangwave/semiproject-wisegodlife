package ssg.com.a.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import ssg.com.a.dto.MygradecalDto;


@Controller
public class MypageController {

	// TODO 페이지 이동란
	// 마이페이지 메인화면 이동
	@GetMapping("mymain.do")
	public String mymain() {
		System.out.println("MypageController mymain" + new Date());
		return "mypage/mymain";
	}
	
	// 학점계산기 페이지 이동
	@GetMapping("mygradecal.do")
	public String mygradecal() {
		System.out.println("MypageController mygradecal" + new Date());
		return "mypage/mygradecal";
	}
	
	
}
