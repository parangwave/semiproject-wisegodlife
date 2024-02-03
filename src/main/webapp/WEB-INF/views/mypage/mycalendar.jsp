<%@page import="ssg.com.a.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="ssg.com.a.util.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
     
<%
	List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");
	String pp = (String)request.getAttribute("pp");
	String p = (String)request.getAttribute("p");
	String nn = (String)request.getAttribute("nn");
	String n = (String)request.getAttribute("n");
	int year = (int)request.getAttribute("year");
	int month = (int)request.getAttribute("month");
	Calendar cal = (Calendar)request.getAttribute("cal");
	int dayOfWeek = (int)request.getAttribute("dayOfWeek");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 학과일정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
#mymain {
	display: flex;
	width: 100%;
}
#leftMenu tr th{
	text-align: left;
}
#lefteMenu {
	width: 10%;	
}
#rightContet {
	width: 90%;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>

<nav>
	<table border="1">
	<tr>
		<th><a href="">슬갓생 </a></th>
		<th><a href="">게시판</a></th>
		<th><a href="">학교생활</a></th>
		<th><a href="mymain.do">마이페이지</a></th>
		<th>
			<button>라이트모드</button>
		</th>
	</tr>
	</table>
</nav>

<h1>내정보 - 학과일정</h1>

<main id="mymain">

<table id="leftMenu" border="1">
	<tr>
		<th><a href="mymain.do">기본정보</a></th>
	</tr>
	<tr>
		<th><a href="">수강 시간표 작성</a></th>
	</tr>	
	<tr>
		<th><a href="mycalendar.do">학과 일정달력</a></th>
	</tr>	
	<tr>
		<th><a href="mygradecal.do">학점 계산기</a></th>
	</tr>	
	<tr>
		<th><a href="">메시지</a></th>
	</tr>	
	<tr>
		<th><a href="">친구 정보</a></th>
	</tr>	
	<tr>
		<th><a href="mywrite.do">작성한 댓글 및 게시글</a></th>
	</tr>	
	<tr>
		<th><a href="myblacklist.do">블랙리스트</a></th>
	</tr>	
	<tr>
		<th><a href="mychange.do">개인정보 변경</a></th>
	</tr>	
	<tr>
		<th><a href="">학교 인증</a></th>
	</tr>
	<tr>
		<th><a href="">회원 탈퇴</a></th>
	</tr>
</table>

<calender>
<table border="1" >
<col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/>
<tr height="80">
	<td colspan="7" align="center">
		<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;
		<font style="color: #3c3c3c; font-size: 40px; font-family: fantasy; vertical-align: middle;">
			<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
		</font>
		&nbsp;&nbsp;&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
	</td>
</tr>

<tr height="30" style="background-color: #0000ff; color: white;">
	<th class="text-center">일</th>
	<th class="text-center">월</th>
	<th class="text-center">화</th>
	<th class="text-center">수</th>
	<th class="text-center">목</th>
	<th class="text-center">금</th>
	<th class="text-center">토</th>	
</tr>

<tr height="120" align="left" valign="top">
<%
// 윗쪽 빈칸
for (int i = 1; i < dayOfWeek; i++) {
	%>
	<td style="background-color: #eeeeee">&nbsp;</td>
	<%
}

// 날짜
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for (int i = 1; i <= lastday; i++) {
	%>
	<td style="color: #3c3c3c; padding-top: 5px">
		<%=CalendarUtil.daylist(year, month, i) %>&nbsp;&nbsp;<%=CalendarUtil.calwrite(year, month, i) %>
		<%=CalendarUtil.makeTable(year, month, i, list) %>
	</td>
	<%
	if ((i + dayOfWeek - 1) % 7 == 0 && i != lastday) {
		%>
		</tr><tr height="120" align="left" valign="top">
		<%
	}
}

// 아래쪽 빈칸
cal.set(Calendar.DATE, lastday);
int weekday = cal.get(Calendar.DAY_OF_WEEK);
for (int i = 0; i < 7 - weekday; i++) {
	%>
	<td style="background-color: #eeeeee">&nbsp;</td>
	<%
}

%>
</tr>

</table>
</calender>

</main>

</body>
</html>