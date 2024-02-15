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
<link rel="stylesheet" href="style/css/mypage/myclose.css" />
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
      <h2 id="contentTitle">회원탈퇴</h2>
      
      <div class="close">
        <table>
          <tr>
            <th>정말로 회원탈퇴를 하겠습니까?</th>
          </tr>
          <tr><th></th></tr>
          <tr><th></th></tr>
          <tr>
            <td>
              <div class="moreBtnContainer">
                <a class="btn" onclick="closeAccount()" role="button">회원탈퇴</a>
              </div>
            </td>
          </tr>
        </table>
      </div>
	  </rightcontent>
  </main>
	
	<script type="text/javascript">
		function closeAccount() {
			location.href = "mycloseAf.do";
		}
	</script>
</body>
</html>