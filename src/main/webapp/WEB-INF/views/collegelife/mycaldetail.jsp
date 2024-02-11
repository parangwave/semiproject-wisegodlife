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
<title>Insert title here</title>
</head>
<body>

<h1>일정 상세보기</h1>

  <div align="center">
    <table border="1">
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
        <td><%=dto.getRdate() %></td>
      </tr>
      <tr>
        <th>일정 내용</th>
        <td><%=dto.getTitle() %></td>
      </tr>
      <tr>
        <th>일정 상세내용 및 메모</th>
        <td>
          <textarea rows="15" cols="90" readonly="readonly"><%=dto.getContent() %></textarea>
        </td>
      </tr>
    </table>

    <br/>

    <button type="button" onclick="updateCal(<%=dto.getSeq() %>)">수정</button>
    <button type="button" onclick="deleteCal(<%=dto.getSeq() %>)">삭제</button>
  </div>

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