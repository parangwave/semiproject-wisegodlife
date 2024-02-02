package ssg.com.a.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.BbsDto;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.MemberDto;
import ssg.com.a.dto.MygradecalDto;
import ssg.com.a.service.MypageService;
import ssg.com.a.util.CalendarUtil;


@Controller
public class MypageController {
	
	@Autowired
	MypageService service;

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
	
	// 작성한 댓글 및 게시글 이동
		@GetMapping("mywrite.do")
		public String mywrite(Model model, HttpServletRequest request) {
			System.out.println("MypageController mywrite" + new Date());
			
			MemberDto login = (MemberDto)request.getSession().getAttribute("login");
			List<BbsComment> commentList = service.getMyCommentList(login.getId());
			List<BbsDto> writeList = service.getMyWriteList(login.getId());
			
			model.addAttribute("commentList", commentList);
			model.addAttribute("writeList", writeList);
			
			return "mypage/mywrite";
		}
	
	// TODO 학과일정달력 페이지 이동
	@GetMapping("mycalendar.do")
	public String mycalendar(Model model, HttpServletRequest request) {
		System.out.println("MypageController mycalendar" + new Date());
		
		MemberDto login = (MemberDto)request.getSession().getAttribute("login");
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
		
		List<CalendarDto> list = service.getCalendarList(login.getId(), year + CalendarUtil.two(month + ""));
		
		model.addAttribute("list", list);
		model.addAttribute("pp", pp);
		model.addAttribute("p", p);
		model.addAttribute("nn", nn);
		model.addAttribute("n", n);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("cal", cal);
		model.addAttribute("dayOfWeek", dayOfWeek);
		
		return "mypage/mycalendar";
	}
	
}
