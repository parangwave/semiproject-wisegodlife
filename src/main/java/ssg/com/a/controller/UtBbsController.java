package ssg.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;
import ssg.com.a.dto.UtBbsDto;
import ssg.com.a.dto.UtBbsParam;
import ssg.com.a.service.UtBbsService;
import ssg.com.a.util.UtBbsUtil;

@Controller
public class UtBbsController {

	@Autowired
	UtBbsService service;
	
	@GetMapping("utbbslist.do")
	public String utbList(Model model, UtBbsParam param) {
		System.out.println("UtBbsController utbList " + new Date());

		List<UtBbsDto> list = service.utBbsList(param);
		
		int count = service.allUtBbs(param);
		
		
		int pageBbs = count / 10;
		if((count % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		System.out.println("count : " + count);		
		System.out.println("pageBbs : " + pageBbs);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageBbs", pageBbs);
		
		return "utbbs/utbbslist";
	}
	
	@GetMapping("utbbswrite.do")
	public String utBbsWrite() {
		System.out.println("UtBbsController utBbsWrite " + new Date());
		
		return "utbbs/utbbswrite";
	}
	
	@PostMapping("sumbnail.do")
	public String sumbnail(UtBbsDto dto, Model model,
								@RequestParam(value = "fileupload", required = false)
								MultipartFile fileupload,
								HttpServletRequest req) {
		System.out.println("UtBbsController sumbnailUpload " + new Date());
		
		//filename 취득
		String filename = fileupload.getOriginalFilename();
		System.out.println("filename:" + filename);
		
		//db에 저장하기 위해서
		dto.setFilename(filename);
		
		/** upload의 경로 **/
		//tomcat(server)
		String fupload = req.getServletContext().getRealPath("/upload");
		
		//폴더(테스트용) - 록원스 다이렉트 폴더 경로
		//String fupload = "/Users/rokwon/Desktop/springframeworksts/springSamples/src/main/webapp/upload";
		System.out.println("파일업로드 경로: " + fupload);
		
		//파일명 변경 abc.txt -> 324234324.txt
		String newfilename = UtBbsUtil.getNewFileName(filename);
		System.out.println("newfilename:" +newfilename);
		
		//db에 저장하기 위해서
		dto.setNewfilename(newfilename);
		
		//파일을 업로드
		File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제 파일을 업로드
			FileUtils.writeByteArrayToFile(file, fileupload.getBytes());
			
			//db에 저장
			boolean b = service.sumbnail(dto);
			if(b) {
				System.out.println("파일업로드 성공");
	
				//확장자명 확인
				String extcheck = newfilename.substring(newfilename.indexOf('.'));

				//이미지 파일 일 경우 썸네일 파일 만들어줌.
				if(extcheck.equals(".PNG") || extcheck.equals(".png") || extcheck.equals(".jpg") || extcheck.equals(".JPG") || 
						extcheck.equals(".gif") || extcheck.equals(".GIF") || extcheck.equals(".bmp") || extcheck.equals(".BMP")) {
					
					File thumbnailFile = new File(fupload + "/s_" + newfilename);
					
					System.out.println("썸네일 경로 및 파일명 : " + thumbnailFile);
					
					//파일 업로드 성공시에 썸네일 파일 생성
					Thumbnails.of(file)
					//.size(width, height)
					.size(130, 130)
					.toFile(thumbnailFile);
				}
			} else {
				System.out.println("파일업로드 실패");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/utbbslist.do";
	}
	
	@GetMapping("utbbsdetail.do")
	public String utBbsDetail(int seq, Model model) {
		System.out.println("UtBbsController utBbsDetail " + new Date());
		
		//service.readCount(seq);
		
		UtBbsDto dto = service.getUtBbs(seq);
		model.addAttribute("dto", dto);
		
		return "utbbs/utbbsdetail";
	}
	
	@GetMapping("tradesuccess.do")
	public String trSuccess(int seq, Model model) {
		System.out.println("UtBbsController trSuccess " + new Date());
		
		boolean b = service.tradeSuccess(seq);
		
		String trsuccessMsg = "TRADE_SUCCESS";
		if (!b) {
			trsuccessMsg = "TRADE_FAIL";
		}

		model.addAttribute("trsuccessMsg", trsuccessMsg);
		
		return "message";
	}
}