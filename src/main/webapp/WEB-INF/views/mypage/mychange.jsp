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
<link rel="stylesheet" href="style/css/mypage/mymain.css" />
<link rel="stylesheet" href="style/css/mypage/mychange.css" />
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
      <h2 id="contentTitle">내정보</h2>
    
      <form action="mychangeAf.do" method="post" enctype="multipart/form-data">
        <P>프로필 사진 변경 : <input type="file" name="filepicture" /></P>        
        <table id="contentTable">
          <tr>
            <th rowspan="2" id="profilebox">
              <img id="profilepreview" src="profile/<%= login.getChangeprofile() %>"/>

            </th>
            <th>아이디</th>
            <td colspan="2"><input type="text" name="id" value="<%=login.getId() %>" readonly="readonly"></td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td><input type="text" name="nickname" value="<%=login.getNickname() %>"></td>
            <td>
              <button type="button" onclick="nick">중복확인</button>
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td colspan="3"><input type="text" name="name" value="<%=login.getName() %>"></td>
          </tr>
          <tr>
            <th>대학교</th>
            <td colspan="3"><input type="text" name="college" value="<%=login.getCollege() %>"></td>
          </tr>
          <tr>
            <th>연락처</th>
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
        </table>
        <input type="submit" value="수정완료">
      </form>
    </rightcontent>
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