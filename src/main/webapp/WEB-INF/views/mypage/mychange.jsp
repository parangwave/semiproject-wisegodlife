<%@page import="ssg.com.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
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
	
	<h1>내정보 - 개인정보 변경</h1>
	
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
				<th><a href="myblacklist.do">블랙리스트</a></th>
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
		
		<form action="mychangeAf.do" method="post">
			<table id="rightContent" border="1">
				<tr>
					<th colspan="4"> * 표시가 있는것은 필수 입력란입니다.</th>
				</tr>
				<tr>
					<th rowspan="2">
						 프로필사진칸<br/><br/>
						 <button type="button">프로필 사진변경</button>
					</th>
					<th>아이디</th>
					<td colspan="2"><input type="text" name="id" value="<%=login.getId() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>닉네임*</th>
					<td><input type="text" name="nickname"></td>
					<td>
						<button type="button" onclick="nick">닉네임 중복확인</button>
					</td>
				</tr>
				<tr>
					<th>이름*</th>
					<td colspan="3"><input type="text" name="name" value="<%=login.getName() %>"></td>
				</tr>
				<tr>
					<th>대학교</th>
					<td colspan="3"><input type="text" name="univ"></td>
				</tr>
				<tr>
					<th>연락처*</th>
					<td colspan="3"><input type="text" name="tel"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="email" value="<%=login.getEmail() %>"></td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td colspan="3"><textarea rows="5" cols="45" name="selfin"> 자기소개 나오는칸입니다. </textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="수정완료"></td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>