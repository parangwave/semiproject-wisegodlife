<%@page import="ssg.com.a.dto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	FriendDto login = (FriendDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
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
    <h1>내정보 - 개인정보 변경</h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
    
		<form action="mychangeAf.do" method="post" enctype="multipart/form-data">
			<table id="rightContent" border="1">
				<tr>
					<th colspan="4"> * 표시가 있는것은 필수 입력란입니다.</th>
				</tr>
				<tr>
					<th rowspan="2">
						<img id="profilepreview" src="profile/<%= login.getChangeprofile() %>"/>
            <br/><br/>
            프로필 사진 업로드
            <input type="file" name="filepicture">
          </th>
					<th>아이디</th>
					<td colspan="2"><input type="text" name="id" value="<%=login.getId() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>닉네임*</th>
					<td><input type="text" name="nickname" value="<%=login.getNickname() %>"></td>
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
					<td colspan="3"><input type="text" name="college" value="<%=login.getCollege() %>"></td>
				</tr>
				<tr>
					<th>연락처*</th>
					<td colspan="3"><input type="text" name="tel" value="<%=login.getTel() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="email" value="<%=login.getEmail() %>"></td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td colspan="3"><textarea rows="5" cols="45" name="selfin" placeholder="자기소개를 작성해주세요">
					<% if (login.getIntroduce() == null) {
							%>
							
							<%	
						} else {
							%><%=login.getIntroduce() %><%						
						}					
					%> </textarea></td>					 
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="수정완료"></td>
				</tr>
			</table>
		</form>
	</main>

<% 
  String fupload = request.getServletContext().getRealPath("/profile");
%>
<script>
  $(document).ready(function() {
    if ("<%= login.getProfile()%>" != null) {
      let reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('profilepreview').src = e.target.result;
      }
      reader.readAsDataURL("<%= fupload %>");
    } else {
      document.getElementById('profilepreview').src = "";
    }
  });
</script>


</body>
</html>