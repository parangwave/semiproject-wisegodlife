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

<nav>
	<table border="1">
	<tr>
		<th><a href="">슬갓생 </a></th>
		<th><a href="">게시판</a></th>
		<th><a href="">학교생활</a></th>
		<th><a href="mymain.do">마이페이지</a></th>
		<th>
			<button>라이트모드</button>
		</th>
	</tr>
	</table>
</nav>

<h1>내정보 - 블랙리스트</h1>

<main id="mymain">

<table id="leftMenu" border="1">
	<tr>
		<th><a href="mymain.do">기본정보</a></th>
	</tr>
	<tr>
		<th><a href="">수강 시간표 작성</a></th>
	</tr>	
	<tr>
		<th><a href="mycalendar.do">학과 일정달력</a></th>
	</tr>	
	<tr>
		<th><a href="mygradecal.do">학점 계산기</a></th>
	</tr>	
	<tr>
		<th><a href="">메시지</a></th>
	</tr>	
	<tr>
		<th><a href="">친구 정보</a></th>
	</tr>	
	<tr>
		<th><a href="mywrite.do">작성한 댓글 및 게시글</a></th>
	</tr>	
	<tr>
		<th><a href="mylike.do">좋아요한 게시글</a></th>
	</tr>
	<tr>
		<th><a href="myblacklist">블랙리스트</a></th>
	</tr>	
	<tr>
		<th><a href="mychange.do">개인정보 변경</a></th>
	</tr>	
	<tr>
		<th><a href="">학교 인증</a></th>
	</tr>
	<tr>
		<th><a href="">회원 탈퇴</a></th>
	</tr>
</table>

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