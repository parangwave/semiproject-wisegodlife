package ssg.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import ssg.com.a.dto.FriendDto;
import ssg.com.a.naverlogin.NaverLoginBo;
import ssg.com.a.service.FriendService;
import ssg.com.a.util.FriendUtil;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FriendController {
	
	@Autowired
	FriendService service;
	
	/* NaverLoginBO */
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		System.out.println("MemberController login " + new Date());
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl 메소드 호출 */
		String naverAuthUrl =  naverLoginBo.getAuthorizationUrl(session);
		
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		
		/* 객체 바인딩 */
		model.addAttribute("url", naverAuthUrl);
		
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
		System.out.println(login.toString());
		
		String loginMsg = "LOGIN_FAIL";
		if (login.getName() == null) { // 아이디가 없을때
			model.addAttribute("loginMsg", loginMsg);
			
			return "message";
		}
		
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
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naverloginAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callBackNaver(
			@RequestParam String code, 
			@RequestParam String state, 
			Model model, 
			HttpSession session,
			HttpServletRequest req) throws Exception {
		System.out.println("로그인 성공 콜백");
		OAuth2AccessToken oauthToken;
		
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
	
		/* json형식으로 넘어오는 내 프로필 확인 */
		//System.out.println(response_obj);
		
		//프로필 조회
		//이메일
		String email = (String) response_obj.get("email");
		
		FriendDto login = service.naverLogin(email);
		String loginNaverMsg = "NAVER_LOGIN_FAIL";
		if(login != null) {											//로그인 성공
			req.getSession().setAttribute("login", login);			//로그인한 정보 세션에 저장
//			req.getSession().setMaxInactiveInterval(60 * 60 * 24);
			loginNaverMsg = "NAVER_LOGIN_SUCCESS";	
		} else {
			//여기서 네이버 메일로 가입한 회원이 없을 때 
			//회원가입이나 로직 추가 해야하는 부분
		}

		model.addAttribute("loginNaverMsg", loginNaverMsg);
		return "message";
	}
	
	// TODO 조교 회원가입 및 로그인
	// 조교 회원가입 페이지
	@GetMapping("assiregi.do")
	public String assiregi() {
		System.out.println("MemberController assiregi " + new Date());

		return "friend/assiregi";
	}
	// 조교 회원가입 완료
	@PostMapping("assiregiAf.do")
	public String assiregi(FriendDto dto, Model model) {
		System.out.println("HelloController assiregi " + new Date());
			
		boolean b = service.addmajorfriend(dto);
		String assiregiMsg = "ASSI_YES";
		if(!b) {
			assiregiMsg = "ASSI_NO";
		}
		
		model.addAttribute("assiregiMsg", assiregiMsg);
		
		return "message";
	}
}
