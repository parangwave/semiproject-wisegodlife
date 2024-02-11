<%@page import="java.util.List"%>
<%@page import="ssg.com.a.dto.MylikeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MylikeDto> likeList = (List<MylikeDto>)request.getAttribute("likeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	<header id="header">	
		<h1>내정보 - 좋아요한 게시글</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<table>
			<thead>
				<tr>
					<th>번호</th><th>좋아요한 게시글</th><th>내용</th><th>조회수</th><th>작성일</th><th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
				if(likeList == null || likeList.size() == 0){
					%>
					<tr>
						<td colspan="6">작성된 글이 없습니다</td>
					</tr>
					<%
				}else{
					for (int i = 0;i < likeList.size(); i++) {
						MylikeDto ml = likeList.get(i);
						%>
					<tr>
						<td><%=i + 1 %></td>
						<td style="text-align: left;" colspan="2">
							<%=ml.getTitle() %>
						</td>
						<td><%=ml.getReadcount() %></td>
						<td><%=ml.getWdate() %></td>
						<td><%=ml.getLikeid() %></td>
					</tr>	
						<%
					}
				}
				%>
			</tbody>
		</table>
	</main>
</body>
</html>