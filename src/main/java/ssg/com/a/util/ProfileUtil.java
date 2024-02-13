package ssg.com.a.util;

import java.util.Date;

public class ProfileUtil {
	
	// abc.txt -> 43534534.txt 파일업로드 또는 다운로드시 이름 겹치지 않도록
	public static String getNewFileName(String filename) {
		String newfilename = "";
		String fpost = ""; // .jpg .txxt
		
		if (filename.indexOf('.') >= 0) {	// 확장자명이 있음
			fpost = filename.substring(filename.indexOf('.'));	// .txt
			newfilename = new Date().getTime() + fpost;			// 43534534.txt
		} else {							// -1 확장자명이 없음
			newfilename = new Date().getTime() + ".back";
		}
		return newfilename;
	}
}
