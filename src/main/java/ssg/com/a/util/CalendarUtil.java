package ssg.com.a.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import ssg.com.a.dto.CalendarDto;

public class CalendarUtil {

	// TODO 문자열 검사 : 빈문자열 -> true
	public static boolean nvl(String msg) {
		return msg==null || msg.trim().equals("") ? true:false;
	}
	
	// TODO 한자리 숫자를 두자리로 만들어 주는 함수 : 1 ~ 9 -> 01 ~ 09
	public static String two(String msg) {
		return msg.trim().length()<2 ? "0"+msg.trim():msg.trim();
	}
	
	// TODO 앞에 0이 있는 문자열을 한자리 문자로 만들어 주는 함수 01 ~ 09 -> 1 ~ 9
	public static String one(String msg) {
		return msg.charAt(0)=='0' ? msg.charAt(1)+"":msg; // +""를 적어주면 String 빼면 char로 리턴해준다
	}
	
	// TODO 일정추가
	public static String calwrite(int year, int month, int day) {
		String str = "";
		
		String img = "<img src='./images/plus.svg' id='add' width='12px' height='12px' title='일정추가'>";	// title 마우스를 올려두었을때 나타나는것
		str = String.format("<a href='mycalwrite.do?&year=%d&month=%d&day=%d'>%s</a>", year, month, day, img);
		return str;
	}
	
	// TODO 일별 일정을 모두 볼 수 있는 caldaylist.jsp로 이동되도록 하는 함수
	public static String daylist(int year, int month, int day) {
		String str = "";
		
		str += String.format("&nbsp;<b id='calday'>", year, month, day);
		str += String.format("%2d", day);
		str += "</b>";
		
		return str;
	}
	
	// TODO 제목이 길 경우에 ...으로 처리하는 함수
	public static String dot3(String msg) {
		String str = "";
		if (msg.length() >= 6) {
			str = msg.substring(0, 6);
			str += "...";
		} else {
			str = msg.trim();
		}
		return str;
	}
	
	// TODO 날짜별로 테이블을 생성하기 위한 함수
	public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
		String str = "";
		
		// 202401180412
		String dates = (year + "") + two(month + "") + two(day + "");
		
		str += "<table>";		
		for (CalendarDto dto : list) {
			if (dto.getRdate().substring(0, 8).equals(dates)) {
				str += "<tr>";
				str += "	<td class='detail'>";
				str += "		<a href='mycaldetail.do?seq=" + dto.getSeq() + "'>";
				str += " 			<font>";		// detail 폰트사이즈 변경
				str += 					dot3( dto.getTitle());		
				str += "			</font>";		
				str += "		</a>";		
				str += "	</td>";
				str += "</tr>";
			}
		}
		str += "</table>";
		
		return str;
	}
	
	// TODO 날짜와 시간을 사용자가 보기 쉽게 출력하는 함수
	// 202401181622 -> 2024년 01월 18일 16시 22분 
	public static String toDates(String mdate) {
		
		// 날짜형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		
		String s = mdate.substring(0, 4) + "-"	// yyyy
				 + mdate.substring(4, 6) + "-"	// MM
				 + mdate.substring(6, 8) + " "	// dd
				 + mdate.substring(8, 10) + ":"	// hh
				 + mdate.substring(10) + ":00";	// mm:ss
		
		Timestamp d = Timestamp.valueOf(s);
		
		return sdf.format(d);
	}

}

