<%@page import="ssg.com.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<nav>
		<table border="1">
			<tr>
				<th><a href="">슬갓생 </a></th>
				<th><a href="">게시판</a></th>
				<th><a href="">학교생활</a></th>
				<th><a href="mymain.do">마이페이지</a></th>
				<th><button>라이트모드</button></th>
			</tr>
		</table>
	</nav>
	
	<h1>내정보 - 블랙리스트 아이디차단추가</h1>
	
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
				<th><a href="">개인정보 변경</a></th>
			</tr>	
			<tr>
				<th><a href="">학교 인증</a></th>
			</tr>
			<tr>
				<th><a href="">회원 탈퇴</a></th>
			</tr>
		</table>
		
		<form action="addBlacklistId.do">
			<table border="1">
				<tr>
					<th>차단할 아이디</th>
					<td><input type="text" name="blockid" placeholder="아이디를 입력해주세요"> </td>
				</tr>
				<tr>
					<th colspan="2">차단 사유 입력란</th>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="15" cols="30" name="reason" placeholder="차단하시려는 이유를 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="추가하기"></td>
				</tr>	
			</table>
		</form>
	</main>
</body>
</html>