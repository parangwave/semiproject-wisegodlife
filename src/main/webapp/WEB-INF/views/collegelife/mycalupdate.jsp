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
</head>
<body>

<h1>일정 수정</h1>

  <div align="center">
    <form action="mycalupdateAf.do" method="post">
    <input type="hidden" name="seq" value="<%=dto.getSeq() %>">

    <table border="1">
    <col width="200"/><col width="400"/>
      <tr>
        <th>아이디</th>
        <td>
          <input type="text" name="id" size="50px" value="<%=dto.getId() %>" readonly="readonly">
        </td>
      </tr>
      <tr>
        <th>일정 내용</th>
        <td>
          <input type="text" name="title" size="50px" value="<%=dto.getTitle() %>"/>
        </td>
      </tr>
      <tr>
        <th>일정 상세내용 및 메모</th>
        <td>
          <textarea rows="20" cols="50px" name="content"><%=dto.getContent() %></textarea>
        </td>
      </tr>
    </table>

    <br/>

    <button type="submit">수정완료</button>
    </form>
  </div>
</body>
</html>