<%@page import="ssg.com.a.dto.FreeBbsDto"%>
<%@page import="ssg.com.a.dto.BbsComment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<BbsComment> commentList = (List<BbsComment>)request.getAttribute("commentList");
	List<FreeBbsDto> writeList = (List<FreeBbsDto>)request.getAttribute("writeList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 작성한 댓글 및 게시글</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/mypage/mymain.css" />
<link rel="stylesheet" href="style/css/mypage/mywrite.css" />
<style type="text/css">
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
      <h2 id="contentTitle">내가 쓴 댓글 및 게시글</h2>
		
		<table border="1">
		<col width="70"/><col width="450"/><col width="150"/><col width="120"/>
			<thead>
				<tr>
					<th>번호</th><th>내가작성한 댓글 - 내용</th><th>작성일</th><th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0;i < commentList.size(); i++) {
					BbsComment bc = commentList.get(i);
					%>
				<tr>
					<td class="num"><%=i + 1 %></td>
					<td style="text-align: left;" >
						<%=bc.getContent() %>
					</td>
					<td class="num"><%= bc.getWdate().substring(0, 10) %></td>
					<td class="num"><%=bc.getId() %></td>
				</tr>	
					<%
				}
				%>
			</tbody>
      <tr>
        <th colspan="5" id="space">&nbsp;</th>
      </tr>
			<tfoot>
				<tr>
					<th>번호</th><th>내가작성한 게시글 - 제목</th><th>조회수</th><th>작성자</th>
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
						FreeBbsDto bbs = writeList.get(i);
					%>
					<tr>
						<td class="num"><%=i + 1 %></td>
						<td style="text-align: left;">
						<% if(bbs.getDel() == 0){ %>
							<a href="freebbsdetail.do?seq=<%=bbs.getSeq() %>" id="link"><%=bbs.getTitle() %></a>
						<% }else{ %>
							<font color="#ff0000">[삭제한 글입니다]</font>
							<span><%=bbs.getTitle() %></span>
						<% } %>
						</td>
						<td class="num"><%=bbs.getReadcount() %></td>
						<td class="num"><%=bbs.getId() %></td>
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