<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <h1>내정보 - 블랙리스트 아이디차단추가</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<form action="addBlacklistWord.do">
			<table border="1">
				<tr>
					<th>차단할 단어</th>
					<td><input type="text" name="word" placeholder="아이디를 입력해주세요"> </td>
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