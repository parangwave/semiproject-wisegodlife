<%@page import="ssg.com.a.util.CalendarUtil"%>
<%@page import="ssg.com.a.dto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
FriendDto login = (FriendDto)session.getAttribute("login");
String year = (String)request.getAttribute("year");
String month = (String)request.getAttribute("month");
String day = (String)request.getAttribute("day");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/collegelife/comain.css" />
</head>
<body>
  <script>
    $(document).ready( function() {
      $("#topnav").load("topnav.do");
      $("#leftMenu").load("collnav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>

    <rightcontent id="rightcontent">

      <h2 id="contentTitle">학교생활 - 수강시간표 </h2>

      <div align="center">
        <form action="mycalwriteAf.do" method="post">
          <table border="1">
          <col width="200"/><col width="500"/>
            <tr>
              <th>아이디</th>
              <td>
                <%=login.getId() %>
                <input type="hidden" name="id" value="<%=login.getId() %>">
              </td>
            </tr>	
            <tr>
              <th>일정</th>
              <td>
                <input type="date" name="date" id="date" style="width: 30%"> <%-- value="<%=year %>" 도가능--%>
                <input type="time" name="time" id="time" style="width: 30%">
              </td>
            </tr>
            <tr>
              <th>제목</th>
              <td>
                <input type="text" name="title" style="width: 80">
              </td>
            </tr>
            <tr>
              <th>내용</th>
              <td>
                <textarea rows="15" cols="80" name="content"></textarea>
              </td>
            </tr>
          </table>
          <br/>
          <input type="submit" value="일정추가">
        </form>
      </div>
    </rightcontent>
  </main>

  <script type="text/javascript">
  $(document).ready(function () {
    
    // 월 일 시간 분 전부 한자리 수 일때 0을 붙여 두자리 수를 맞춰야 자동으로 완성이된다.	
    let year = "<%=year %>";
    let month = "<%=CalendarUtil.two(month) %>";
    let day = "<%=CalendarUtil.two(day) %>";	
    $("#date").val( year + "-" + month + "-" + day );
    
    let d = new Date();
    let hour = d.getHours();
    let minutes = d.getMinutes();
    if (d.getHours() < 10) {
      hour = "0" + hour;
    }
    if (d.getMinutes() < 10) {
      minutes = "0" + minutes;
    }

    $("#time").val( hour +":" + minutes );
    
  });
  </script>
</body>
</html>