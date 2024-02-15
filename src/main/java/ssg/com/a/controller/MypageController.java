package ssg.com.a.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ssg.com.a.dto.BbsComment;
import ssg.com.a.dto.CalendarDto;
import ssg.com.a.dto.CalendarParam;
import ssg.com.a.dto.FreeBbsDto;
import ssg.com.a.dto.FriendDto;
import ssg.com.a.dto.MyblacklistDto;
import ssg.com.a.service.MypageService;
import ssg.com.a.util.CalendarUtil;
import ssg.com.a.util.ProfileUtil;



@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession se;
	
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
	
	// 마이페이지 좋아요게시글 이동
	@GetMapping("mylike.do")
	public String mylike(Model model) {
		System.out.println("MypageController mylike" + new Date());
		
		FriendDto login = (FriendDto) se.getAttribute("login");
		List<FreeBbsDto> list = service.getlikelist(login.getId());
		
		model.addAttribute("list", list);
		
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
		List<FreeBbsDto> writeList = service.getMyWriteList(login.getId());
		
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
	public String changeMyinfor(@RequestParam(value = "filepicture", required = false)
								MultipartFile filepicture, FriendDto dto, Model model, HttpSession se)throws Exception {
		System.out.println("MypageController changeMyinfor" + new Date());
		FriendDto login = (FriendDto)se.getAttribute("login");
		
		String originFilename = filepicture.getOriginalFilename();
		System.out.println("originFilename: " + originFilename);
		
		// 프로필 사진을 변경유무 확인
		if (originFilename == null || originFilename.equals("")) {
			dto.setProfile(login.getProfile());
			dto.setChangeprofile(login.getChangeprofile());			
		} else {
			dto.setProfile(originFilename);

			String changefilename = ProfileUtil.getNewFileName(originFilename);
			System.out.println("changefilename: " + changefilename);	
			dto.setChangeprofile(changefilename);
		}
				
		String fupload = request.getServletContext().getRealPath("/profile");
		System.out.println("파일업로드 경로:" + fupload);
		
		File file = new File(fupload + "/" + dto.getChangeprofile());
		FileUtils.writeByteArrayToFile(file, filepicture.getBytes());
		
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

	
}
