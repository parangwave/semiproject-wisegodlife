<%@page import="ssg.com.a.dto.MyblacklistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<MyblacklistDto> bllist = (List<MyblacklistDto>)request.getAttribute("bllist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <h1>내정보 - 블랙리스트</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<table border="1">
			<tr>
				<!-- 닉네임 또는 아이디로 차단하기 -->
				<th colspan="2">아이디 차단리스트</th>
				<th></th>
				<th><button type="button" onclick="idBlockAdd()">아이디 추가</button></th>
			</tr>
				
			<tbody>
				<tr>
					<td>번호</td>
					<td>차단 아이디</td>
					<td style="text-align: left;">차단 사유</td>
					<td>차단일</td>
				</tr>	
				<%
				for (int i = 0;i < bllist.size(); i++) {
					MyblacklistDto bl = bllist.get(i);
					
					if (bl.getWord() == null || bl.getWord().equals("")) {			
					%>
					<tr>
						<td><%=i + 1 %></td>
						<td><%=bl.getBlockid() %></td>
						<td style="text-align: left;"><%=bl.getReason() %></td>
						<td><%=bl.getAdddate() %></td>
					</tr>	
					<%
					}
				}
				%>	
			</tbody>	
		<tr>
			<th colspan="2">특정단어 차단리스트</th>
			<th></th>
			<th><button type="button" onclick="wordBlockAdd()">단어 추가</button></th>
		</tr>
			<tbody>
				<tr>
					<td>번호</td>
					<td>차단 단어</td>
					<td style="text-align: left;">차단 사유</td>
					<td>차단일</td>
				</tr>	
				<%
				for (int i = 0;i < bllist.size(); i++) {
					MyblacklistDto bl = bllist.get(i);
					
					if (bl.getBlockid() == null || bl.getBlockid().equals("")) {			
					%>
					<tr>
						<td><%=i + 1 %></td>
						<td><%=bl.getBlockid() %></td>
						<td style="text-align: left;"><%=bl.getReason() %></td>
						<td><%=bl.getAdddate() %></td>
					</tr>	
					<%
					}
				}
				%>	
			</tbody>
		</table>	
	</main>
	
	<script type="text/javascript">
	function idBlockAdd() {
		location.href = "idlistadd.do";
	}
	function wordBlockAdd() {
		location.href = "wordlistadd.do";
	}
	</script>
</body>
</html>