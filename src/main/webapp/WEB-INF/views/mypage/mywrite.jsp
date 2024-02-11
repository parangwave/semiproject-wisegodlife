<%@page import="ssg.com.a.dto.BbsDto"%>
<%@page import="ssg.com.a.dto.BbsComment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<BbsComment> commentList = (List<BbsComment>)request.getAttribute("commentList");
	List<BbsDto> writeList = (List<BbsDto>)request.getAttribute("writeList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 작성한 댓글 및 게시글</title>
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
      $("#leftmenu").load("mynav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
	<header id="header">	
		<h1>내정보</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<table border="1">
		<col width="70"/><col width="600"/><col width="100"/><col width="150"/>		
			<thead>
				<tr>
					<th>번호</th><th>내가작성한 댓글</th><th>내용</th><th>작성일</th><th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0;i < commentList.size(); i++) {
					BbsComment bc = commentList.get(i);
					%>
				<tr>
					<td><%=i + 1 %></td>
					<td style="text-align: left;" colspan="2">
						<%=bc.getContent() %>
					</td>
					<td><%=bc.getWdate() %></td>
					<td><%=bc.getId() %></td>
				</tr>	
					<%
				}
				%>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="5">&nbsp;</th>
				</tr>
				<tr>
					<th>번호</th><th>내가작성한 게시글</th><th>제목</th><th>조회수</th><th>작성자</th>
				</tr>
				<%
				if(writeList == null || writeList.size() == 0){
					%>
					<tr>
						<td colspan="4">작성한 글이 없습니다</td>
					</tr>
					<%
				}else{
					for(int i = 0;i < writeList.size(); i++){
						BbsDto bbs = writeList.get(i);
					%>
					<tr>
						<td><%=i + 1 %></td>
						<td style="text-align: left;" colspan="2">
						<% if(bbs.getDel() == 0){ %>
							<a href="bbsdetail.do?seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %></a>
						<% }else{ %>
							<font color="#ff0000">[삭제한 글입니다]</font>
							<a href="bbsdetail.do?seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %></a>
						<% } %>
						</td>
						<td><%=bbs.getReadcount() %></td>
						<td><%=bbs.getId() %></td>
					</tr>		
					<%
					}
				}
				%>
			</tfoot>
		</table>
	</main>
</body>
</html>