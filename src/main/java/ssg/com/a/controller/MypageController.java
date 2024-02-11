package ssg.com.a.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.MyblacklistDto;
import ssg.com.a.service.MypageService;
import ssg.com.a.util.CalendarUtil;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@Autowired
	HttpServletRequest request;

	// 마이페이지 네비게이션바
	@GetMapping("mynav.do")
	public String mynav() {
		System.out.println("MemberController mynav " + new Date());

		return "nav/mynav";
	}
	
	// TODO 페이지 이동란
	// 마이페이지 메인화면 이동
	@GetMapping("mymain.do")
	public String mymain() {
		System.out.println("MypageController mymain" + new Date());
		
		return "mypage/mymain";
	}
	
	// 마이페이지 개인정보변경 이동
	@GetMapping("mychange.do")
	public String mychange() {
		System.out.println("MypageController mychange" + new Date());
		
		return "mypage/mychange";
	}
		
	// 마이페이지 학점계산기 이동
	@GetMapping("mygradecal.do")
	public String mygradecal() {
		System.out.println("MypageController mygradecal" + new Date());
		
		return "mypage/mygradecal";
	}
	
	// 마이페이지 좋아요게시글 이동
	@GetMapping("mylike.do")
	public String mylike() {
		System.out.println("MypageController mylike" + new Date());
		
		return "mypage/mylike";
	}
	
	// 마이페이지 회원탈퇴 이동
	@GetMapping("myclose.do")
	public String myclose() {
		System.out.println("MypageController myclose" + new Date());
		
		return "mypage/myclose";
	}
	
	// 마이페이지 작성한 댓글&게시글 이동
	@GetMapping("mywrite.do")
	public String mywrite(Model model) {
		System.out.println("MypageController mywrite" + new Date());
		
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		List<BbsComment> commentList = service.getMyCommentList(login.getId());
		List<BbsDto> writeList = service.getMyWriteList(login.getId());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("writeList", writeList);
		
		return "mypage/mywrite";
	}
	
	// 마이페이지 블랙리스트 이동
	@GetMapping("myblacklist.do")
	public String myblacklist(Model model) {
		System.out.println("MypageController myblacklist" + new Date());
		
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		List<MyblacklistDto> bllist = service.getMyBlacklist(login.getId());
		model.addAttribute("bllist", bllist);
		
		return "mypage/myblacklist";
	}
			
	// 마이페이지 학과일정달력 이동
	@GetMapping("mycalendar.do")
	public String mycalendar(Model model) {
		System.out.println("MypageController mycalendar" + new Date());
		
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		
		String syear = request.getParameter("year");
		String smonth = request.getParameter("month");
		
		// 현재 연도와 월을 구한다	-> 처음 이 페이지가 실행시에 적용
		int year = cal.get(Calendar.YEAR);
		if (CalendarUtil.nvl(syear) == false) { // 넘어 온 파라미터 값이 있음
			year = Integer.parseInt(syear);
		}
		int month = cal.get(Calendar.MONTH) +1; // 0 ~ 11 까지이므로 +1이 필요하다
		if  (CalendarUtil.nvl(smonth) == false) {
			month = Integer.parseInt(smonth);
		}
		
		if (month < 1) {
			month = 12;
			year--;
		}
		if (month > 12) {
			month = 1;
			year++;
		}
		
		cal.set(year, month-1, 1);
		
		// 요일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		// <<	year--
		String pp = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
								+ "<img src='./images/left.png' width='20px' height='20px'>"
								+ "</a>", year-1, month);
		
		// <	month--
		String p = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
							+ "<img src='./images/prev.png' width='20px' height='20px'>"
							+ "</a>", year, month-1);
		
		// >	month++
		String n = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
							+ "<img src='./images/next.png' width='20px' height='20px'>"
							+ "</a>", year, month+1);	
		
		// >>	year++
		String nn = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
				+ "<img src='./images/last.png' width='20px' height='20px'>"
				+ "</a>", year+1, month);
		
		CalendarParam calpa = new CalendarParam(login.getId(), year + CalendarUtil.two(month + ""), login.getMajor(), login.getCollege());
		List<CalendarDto> list = service.getCalendarList(calpa);
		
		model.addAttribute("list", list);
		model.addAttribute("pp", pp);
		model.addAttribute("p", p);
		model.addAttribute("nn", nn);
		model.addAttribute("n", n);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("cal", cal);
		model.addAttribute("dayOfWeek", dayOfWeek);
		
		return "mycal/mycalendar";
	}
	
	// TODO 블랙리스트 기능란
	// 블랙리스트 아이디 차단글 작성 이동
	@GetMapping("idlistadd.do")
	public String idlistadd() {
		System.out.println("MypageController idlistadd" + new Date());
		
		return "mypage/idlistadd";
	}
	
	// 블랙리스트 아이디 차단 추가
	@GetMapping("addBlacklistId.do")
	public String addBlacklistId(MyblacklistDto dto) {
		System.out.println("MypageController addBlacklistId" + new Date());
		
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		dto.setId(login.getId());
		service.addBlacklistId(dto);
		
		return "mypage/myblacklist";
	}	
	
	// 블랙리스트 단어 차단글 작성 이동
	@GetMapping("wordlistadd.do")
	public String wordlistadd() {
		System.out.println("MypageController wordlistadd" + new Date());
		
		return "mypage/wordlistadd";
	}
	
	// 블랙리스트 단어 차단 추가
	@GetMapping("addBlacklistWord.do")
	public String addBlacklistWord(MyblacklistDto dto) {
		System.out.println("MypageController wordlistadd" + new Date());
		
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		dto.setId(login.getId());
		service.addBlacklistWord(dto);
		
		return "mypage/myblacklist";
	}
	
	// TODO 개인정보변경란
	// 개인정보 수정
	@PostMapping("mychangeAf.do")
	public String changeMyinfor(FriendDto dto, Model model, HttpSession se) {
		System.out.println("MypageController changeMyinfor" + new Date());
		FriendDto login;
		
		boolean isS = service.changeMyinfor(dto);
		String changeMsg = "CHANGE_FAIL"; 
		if (isS) {
			changeMsg = "CHANGE_SUCCESS";
			login = service.changelogin(dto);
			se.setAttribute("login", login);
		}
		model.addAttribute("changeMsg", changeMsg);
		
		return "message";
	}
	
	// TODO 회원탈퇴란
	// 마이페이지 회원탈퇴 이동
	@GetMapping("mycloseAf.do")
	public String closeAccount(Model model) {
		System.out.println("MypageController closeAccount" + new Date());
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		
		boolean isS = service.closeAccount(login.getId());
		String closeMsg = "CLOSE_FAIL"; 
		if (isS) {
			closeMsg = "CLOSE_SUCCESS";
		}
		model.addAttribute("closeMsg", closeMsg);	
		
		return "message";
	}
	
	// TODO 학과일정란
	// 학과일정 작성하기 이동
	@GetMapping("mycalwrite.do")
	public String mycalwrite(Model model, String year, String month, String day) {
		System.out.println("MypageController mycalwrite" + new Date());
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "mycal/mycalwrite";
	}
	
	// 학과일정 작성완료
	@PostMapping("mycalwriteAf.do")
	public String mycalwriteAf(Model model, CalendarDto dto, String date, String time) {
		System.out.println("MypageController mycalwriteAf" + new Date());
		
		// 일정 작성하기 위해 데이터 변형
		FriendDto login = (FriendDto)request.getSession().getAttribute("login");
		date = date.replace("-", "");
		time = time.replace(":", "");
		String rdate = date + time;
		dto.setRdate(rdate);
		dto.setAuth(login.getAuth());
		dto.setCollege(login.getCollege());
		dto.setMajor(login.getMajor());
		
		System.out.println(dto.toString());

		service.addCalendarWrite(dto);
		
		return "redirect:mycalendar.do";
	}
	
	// 학과일정 자세히 보기
	@GetMapping("mycaldetail.do")
	public String calendarDetail(Model model, int seq) {
		System.out.println("MypageController calendarDetail" + new Date());
		
		CalendarDto dto = service.calendarDetail(seq);
		model.addAttribute("dto", dto);
		
		return "mycal/mycaldetail";
	}
	
	// 학과일정 수정
	@GetMapping("mycalupdate.do")
	public String mycalupdate(Model model, int seq) {
		System.out.println("MypageController mycalupdate" + new Date());
		
		CalendarDto dto = service.calendarDetail(seq);
		model.addAttribute("dto", dto);
		
		return "mycal/mycalupdate";
	}
	
	// 학과일정 수정완료
	@PostMapping("mycalupdateAf.do")
	public String mycalupdateAf(CalendarDto dto) {
		System.out.println("MypageController mycalupdateAf" + new Date());
		
		service.mycalupdateAf(dto);
		
		return "redirect:mycalendar.do";
	}
	
	// 학과일정 삭제
	@GetMapping("mycaldelete.do")
	public String mycaldelete(int seq) {
		System.out.println("MypageController mycaldelete" + new Date());
		
		service.mycaldelete(seq);
		
		return "redirect:mycalendar.do";
	}
	
}
