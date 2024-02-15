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
<title>학교생활</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" href="images/favicon.svg">
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/collegelife/comain.css" />
<link rel="stylesheet" href="style/css/collegelife/cocal.css" />
<style type="text/css">

</style>
</head>
<body>
  <script>
    $(document).ready( function() {
      $("#topnav").load("topnav.do");
      $("#leftMenu").load("collnav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
	<header id="header">	

	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>

    <rightcontent id="rightcontent">

      <h2 id="contentTitle">학과일정 </h2>

      <calender>
        <table id="calendar">
        <col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/><col width="120"/>
          <thead>
            <tr height="50">
              <td colspan="7" align="center">
                <%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;
                <font style="color: #3c3c3c; font-size: 40px; font-family: fantasy; vertical-align: middle;">
                  <%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
                </font>
                &nbsp;&nbsp;&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
              </td>
            </tr>
          </thead>
          
          <tr height="40" id="week"">
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>	
          </tr>
          
          <tbody id="calbody">
            <tr height="120" align="left" valign="top">
              <%
              // 윗쪽 빈칸
              for (int i = 1; i < dayOfWeek; i++) {
                %>
                <td>&nbsp;</td>
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
                <td>&nbsp;</td>
                <%
              }			
              %>
            </tr>
          </tbody>			
        </table>
      </calender>	
    </rightcontent>
  </main>
</body>
</html>