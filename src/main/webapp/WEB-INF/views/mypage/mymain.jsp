<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<style type="text/css">

body{
  background-color:var(--body-bg-color)
}

#header {
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

#leftMenu {
	padding: 5px;
	margin: 0 50px 0 0;
}
#leftMenu tr th{
	text-align: left;
	font-weight: 600;
	padding: 10px 10px 10px 5px;
}
#leftMenu a:link {
	text-decoration: none;
	font-size: 30px;
	/*color: var(--gray-02);*/
}
#leftMenu a:visited {
	text-decoration: none;
	font-size: 30px;
	/*color: var(--gray-02);*/
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