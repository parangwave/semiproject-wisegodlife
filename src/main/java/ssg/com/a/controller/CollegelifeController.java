package ssg.com.a.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.service.CollegelifeService;
import ssg.com.a.service.MypageService;
import ssg.com.a.util.CalendarUtil;

@Controller
public class CollegelifeController {
	
	@Autowired
	CollegelifeService service;
	
	@Autowired
	HttpServletRequest request;
	
	// 학교생활 학점계산기 이동
	@GetMapping("mygradecal.do")
	public String mygradecal() {
		System.out.println("MypageController mygradecal" + new Date());
		
		return "collegelife/mygradecal";
	}	
	
	// 학교생활 수강시간표 이동
	@GetMapping("cotimetable.do")
	public String cotimetable() {
		System.out.println("MypageController cotimetable" + new Date());
		
		return "collegelife/cotimetable";
	}	
	
	// 학교생활 학과일정달력 이동
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
								+ "<img src='./images/left.png' id='left' width='20px' height='20px'>"
								+ "</a>", year-1, month);
		
		// <	month--
		String p = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
							+ "<img src='./images/prev.png' id='prev' width='20px' height='20px'>"
							+ "</a>", year, month-1);
		
		// >	month++
		String n = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
							+ "<img src='./images/next.png' id='next' width='20px' height='20px'>"
							+ "</a>", year, month+1);	
		
		// >>	year++
		String nn = String.format("<a href='mycalendar.do?param=calendarList&year=%d&month=%d' style='text-decoration:none'>"
				+ "<img src='./images/last.png' id='last' width='20px' height='20px'>"
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
		
		return "collegelife/mycalendar";
	}
	
	// TODO 학과일정란
	// 학과일정 작성하기 이동
	@GetMapping("mycalwrite.do")
	public String mycalwrite(Model model, String year, String month, String day) {
		System.out.println("MypageController mycalwrite" + new Date());
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "collegelife/mycalwrite";
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
		
		return "collegelife/mycaldetail";
	}
	
	// 학과일정 수정
	@GetMapping("mycalupdate.do")
	public String mycalupdate(Model model, int seq) {
		System.out.println("MypageController mycalupdate" + new Date());
		
		CalendarDto dto = service.calendarDetail(seq);
		model.addAttribute("dto", dto);
		
		return "collegelife/mycalupdate";
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
	
	// TODO 수강시간표란
	// 수강시간표 작성이동
	@GetMapping("coclasswirte.do")
	public String coclasswirte() {
		System.out.println("MypageController coclasswirte" + new Date());
		
		return "collegelife/coclasswirte";
	}
	
	// 수강시간표 작성완료

}
