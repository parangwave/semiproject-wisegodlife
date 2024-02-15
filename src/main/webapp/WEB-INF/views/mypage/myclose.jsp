<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" href="images/favicon.svg">
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/mypage/mymain.css" />
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
		<h1>내정보</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<table>
			<tr>
				<th>정말로 회원탈퇴를 하겠습니까?</th>
			</tr>
			<tr>
				<td><button type="button" onclick="closeAccount()">회원탈퇴</button></td>
			</tr>
		</table>
	</main>
	
	<script type="text/javascript">
		function closeAccount() {
			location.href = "mycloseAf.do";
		}
	</script>
</body>
</html>