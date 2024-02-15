<%@page import="ssg.com.a.dto.FreeBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.a.dto.MylikeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<FreeBbsDto> list = (List<FreeBbsDto>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" href="images/favicon.svg">
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/mypage/mymain.css" />
<link rel="stylesheet" href="style/css/mypage/mylike.css" />
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
  <script>
    $(document).ready( function() {
      $("#topnav").load("topnav.do");
      $("#leftMenu").load("mynav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
  <main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>

    <rightcontent id="rightContent">
      <h2 id="contentTitle">내가 좋아한 게시글</h2>
		
      <table>
        <thead>
          <tr>
            <th>번호</th><th class="title" colspan="2">좋아요한 게시글 - 내용</th><th>조회수</th><th>작성일</th><th>작성자</th>
          </tr>
        </thead>
        <tbody>
          <%
          if(list == null || list.size() == 0){
            %>
            <tr>
              <td colspan="6">작성된 글이 없습니다</td>
            </tr>
            <%
          }else{
            for (int i = 0;i < list.size(); i++) {
              FreeBbsDto dto = list.get(i);
              %>
            <tr>
              <td><%=i + 1 %></td>
              <td class="title" colspan="2">
                <a href="freebbsdetail.do?seq=<%=dto.getSeq() %>" id="link"><%=dto.getTitle() %></a>
              </td>
              <td><%=dto.getReadcount() %></td>
              <td class="day"><%=dto.getWdate().substring(0, 10) %></td>
              <td><%=dto.getId() %></td>
            </tr>	
              <%
            }
          }
          %>
        </tbody>
      </table>
    </rightcontent>
	</main>
</body>
</html>