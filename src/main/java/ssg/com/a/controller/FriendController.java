package ssg.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.a.dto.FriendDto;
import ssg.com.a.service.FriendService;
import ssg.com.a.util.FriendUtil;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FriendController {
	
	@Autowired
	FriendService service;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		System.out.println("MemberController login " + new Date());
		
		return "friend/login";
	}
	
	@GetMapping("restore.do")
	public String restore() {
		System.out.println("MemberController restore " + new Date());

		return "friend/restore";
	}
	
	@GetMapping("regi.do")
	public String regi() {
		System.out.println("MemberController regi " + new Date());

		return "friend/regi";
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.GET, 
											produces = "application/String; charset=utf-8") // 문자열을 리턴할 때만 필요하다
	public String idcheck(String id) {
		System.out.println("HelloController idcheck " + new Date());
		System.out.println("id : " + id);
		
		boolean b = service.idcheck(id);
		
		if(b) {
			return "NO";
		}
		return "YES";
	}
	
	@PostMapping("regiAf.do")
	public String regiAf(FriendDto dto, Model model) {
		System.out.println("HelloController regiAf " + new Date());
			
		boolean b = service.addfriend(dto);
		String regiMsg = "FRIEND_YES";
		if(!b) {
			regiMsg = "FRIEND_NO";
		}
		
		model.addAttribute("regiMsg", regiMsg);
		
		return "message";
	}
	
	@PostMapping("loginAf.do")
	public String login(FriendDto dto, Model model, HttpServletRequest req) {
		System.out.println("HelloController loginAf " + new Date());

		FriendDto login = service.login(dto);
		String loginMsg = "LOGIN_FAIL";
		if(login.getDel() > 0) {
			loginMsg = "LOGIN_DEL";
			model.addAttribute("loginMsg", loginMsg);
			
			return "message";
		}
		if(login != null) {											//로그인 성공
			req.getSession().setAttribute("login", login);			//로그인한 정보 세션에 저장
//			req.getSession().setMaxInactiveInterval(60 * 60 * 24);
			loginMsg = "LOGIN_SUCCESS";	
		}

		model.addAttribute("loginMsg", loginMsg);
		return "message";
	}
	
	// TODO 탈퇴회원 함수
	// 탈퇴회원 복구가능 여부 함수
	@GetMapping("canRestore.do")
	public String canRestore(String id, Model model) {
		System.out.println("HelloController canRestore " + new Date());
		
		System.out.println(id);
		FriendDto dto = service.idinfo(id);
		int restore = FriendUtil.canRestore(dto);
		String restoreMsg = "RESTORE_FAIL";
		if (restore == 0) {
			restoreMsg = "RESTORE_SUCCESS";			
		}
		
		model.addAttribute("restoreMsg", restoreMsg);
		model.addAttribute("id", id);
		return "message";
	}
	
	// 탈퇴회원 복구 함수
	@PostMapping("RestoreAf.do")
	public String RestoreAf(String id, Model model) {
		System.out.println("HelloController RestoreAf " + new Date());
		
		boolean isS = service.restoreAccount(id);
		String reMsg = "RESTOREAF_FAIL"; 
		if (isS) {
			reMsg = "RESTOREAF_SUCCESS";
		}
		model.addAttribute("reMsg", reMsg);	
		
		return "message";
	}
}
