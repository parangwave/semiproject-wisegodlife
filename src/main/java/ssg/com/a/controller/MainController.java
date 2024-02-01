package ssg.com.a.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("main.do")
	public String regi() {
		System.out.println("MainController main " + new Date());

		return "main";
	}
	
}
