<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="style/css/style.css">

<style type="text/css">
/*
body, #header, #mymain, #leftMenu, #rightContent, table, th, td, tr {
	border: 2px solid black;
}
*/
#header, #mymain {
	background-color:var(--body-bg-color)
}
#header {
	color: var(--black);
	font-size: 50px;
	font-weight: var(--header-font-weight);
	vertical-align: middle;

	border-bottom: 3px solid white;
	border-top: 3px solid white;

}

#mymain {
	display: flex;
	width: 100%;
}

#leftMenu tr th{
	text-align: left;
	font-weight: 600;
	
	padding: 10px 10px 10px 5px;
}

#leftMenu {
	padding: 5px;
	margin: 0 50px 0 0;
	
}
#leftMenu a:link {
	text-decoration: none;
	
	font-size: 30px;
	color: var(--gray-02);
}
#leftMenu a:visited {
	text-decoration: none;
	
	font-size: 30px;
	color: var(--gray-02);
}

#rightContent {
	width: 600px;
}
#rightContent tr th {
	width: 200px;
	
	font-size: 25px;	
	vertical-align: middle;

}
#rightContent tr td {
	width: 400px;

	font-size: 20px;
	vertical-align: middle;
	padding-left: 10px;
}
</style>
</head>
<body>
	<nav>
		<table>
			<tr>
				<th><a href="">슬갓생 </a></th>
				<th><a href="">게시판</a></th>
				<th><a href="">학교생활</a></th>
				<th><a href="mymain.do">마이페이지</a></th>
				<th><button>라이트모드</button></th>
			</tr>
		</table>
	</nav>
	
	<header id="header">	
		<h1>내정보</h1>
	</header>
	
	<main id="mymain">
		<table id="leftMenu">
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
				<th><a href="myclose.do">회원 탈퇴</a></th>
			</tr>
		</table>
			
		<table id="rightContent">
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