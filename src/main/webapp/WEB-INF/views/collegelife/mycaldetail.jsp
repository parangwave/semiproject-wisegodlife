<%@page import="ssg.com.a.util.CalendarUtil"%>
<%@page import="ssg.com.a.dto.FriendDto"%>
<%@page import="ssg.com.a.dto.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CalendarDto dto = (CalendarDto)request.getAttribute("dto");
  FriendDto login = (FriendDto)session.getAttribute("login"); 
  if(login == null || login.getId().isEmpty()) { 
%>
<script>
  alert("로그인해 주십시오");
  location.href = "./login.do";
</script>
<% 
  } 
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교생활</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" href="images/favicon.svg">
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/collegelife/comain.css" />
<link rel="stylesheet" href="style/css/collegelife/caldetail.css" />
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
      <h2 id="contentTitle">수강시간표 </h2>
      <div align="center">
        <table id="detail">
          <colgroup>
            <col style="width: 200px"/>
            <col style="width: 400px"/>
          </colgroup>
          <tr>
            <th>작성자</th>
            <td><%=dto.getId() %></td>
          </tr>
          <tr>
            <th>작성일</th>
            <td><%=dto.getWdate() %></td>
          </tr>
          <tr>
            <th>일정일</th>
            <td><%=CalendarUtil.toDates(dto.getRdate()) %></td>
          </tr>
          <tr>
            <th>일정 내용</th>
            <td><%=dto.getTitle() %></td>
          </tr>
          <tr>
            <th class="contentN">일정 상세내용 <br/> 및 <br/> 메모</th>
            <td class="content">
              <%=dto.getContent() %>
              <!-- <textarea rows="15" cols="90" readonly="readonly"><%=dto.getContent() %></textarea> -->
            </td>
          </tr>
        </table>
        <br/>
        <button type="button" class="buttons" onclick="updateCal(<%=dto.getSeq() %>)">수정</button>
        <button type="button" class="buttons" onclick="deleteCal(<%=dto.getSeq() %>)">삭제</button>
      </div>
    </rightcontent>
  </main>
  <script type="text/javascript">
  function updateCal( seq ) {
    location.href = "mycalupdate.do?seq=" + seq;	
  }
  function deleteCal( seq ) {
    location.href = "mycaldelete.do?seq=" + seq;	
  }
  </script>
</body>
</html>