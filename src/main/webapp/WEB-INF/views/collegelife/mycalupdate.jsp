<%@page import="ssg.com.a.dto.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
CalendarDto dto = (CalendarDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/collegelife/comain.css" />
<link rel="stylesheet" href="style/css/collegelife/calupdate.css" />
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

      <h2 id="contentTitle">학과일정 수정 </h2>

      <div id="contentTable">
        <br/>
        <form action="mycalupdateAf.do" method="post">
          <table id="writeTable">
          <col width="200"/><col width="500"/>
            <tr>
              <th>닉네임</th>
              <td>
                &nbsp;
                <%=dto.getNickname() %>
              </td>
            </tr>	
            <tr>
              <th>제목</th>
              <td>
                <input type="text" name="title" style="width: 80" value="<%=dto.getTitle() %>">
              </td>
            </tr>
            <tr>
              <th>내용</th>
              <td>
                <textarea rows="15" cols="80" name="content"><%=dto.getContent() %></textarea>
              </td>
            </tr>
          </table>
          <br/>
          <br/>
          <br/>
          <input type="submit" id="addcal" value="일정수정">
        </form>
      </div>
    </rightcontent>
  </main>
</body>
</html>