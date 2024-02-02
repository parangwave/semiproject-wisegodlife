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
		<th>
			<button>라이트모드</button>
		</th>
	</tr>
	</table>
</nav>

<h1>내정보</h1>

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
		<th><a href="">작성한 댓글 및 게시글</a></th>
	</tr>	
	<tr>
		<th><a href="">블랙리스트</a></th>
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


<table id="rightContent" border="1">
	<tr>
		<th rowspan="2"> 프로필사진칸 </th>
		<th>아이디</th>
		<td>아이디 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>닉네임 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="2">이름 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>대학교</th>
		<td colspan="2">대학교 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>연락처</th>
		<td colspan="2">연락처 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="2">이메일 나오는칸입니다. </td>
	</tr>
	<tr>
		<th>자기소개</th>
		<td colspan="2">자기소개 나오는칸입니다. </td>
	</tr>
</table>
</main>
</body>
</html>