<%@page import="ssg.com.a.dto.FriendDto"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <% FriendDto login
= (FriendDto)session.getAttribute("login"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>마이페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="images/favicon.svg">
    <link rel="stylesheet" href="style/css/style.css" />
    <link rel="stylesheet" href="style/css/mypage/mymain.css" />
    <link rel="stylesheet" href="style/css/mypage/mypagemain.css" />
  </head>
  <body class="light-mode" data-bs-theme="light">
    <script>
      $(document).ready(function () {
        $("#topnav").load("topnav.do");
        $("#leftMenu").load("mynav.do");
      });
    </script>
    <nav id="topnav"></nav>
    
    <main id="mymain">
      <leftmenu id="leftMenu"></leftmenu>

      <rightcontent id="rightContent">
        <h2 id="contentTitle">내정보</h2>

        <table id="contentTable">
          <tr>
            <th rowspan="2" id="profilebox" >
              <img id="profile" src="profile/<%=login.getChangeprofile() %>" alt="프로필 사진입니다." />
            </th>
            <th class="contentbox">아이디</th>
            <td><%=login.getId() %></td>
          </tr>
          <tr>
            <th class="contentbox">닉네임</th>
            <td><%=login.getNickname() %></td>
          </tr>
          <tr>
            <th class="contentbox">이름</th>
            <td colspan="2"><%=login.getName() %></td>
          </tr>
          <tr>
            <th class="contentbox">대학교</th>
            <td colspan="2"><%= login.getCollege() %></td>
          </tr>
          <tr>
            <th class="contentbox">연락처</th>
            <td colspan="2"><%= login.getTel() %></td>
          </tr>
          <tr>
            <th class="contentbox">이메일</th>
            <td colspan="2"><%=login.getEmail() %></td>
          </tr>
          <tr>
            <th class="contentbox">자기소개</th>
            <td colspan="2">
              <% if (login.getIntroduce() == null ||
              login.getIntroduce().equals("")) { %> 자기소개를 작성하지
              않으셨습니다. <% } else { %> <%=login.getIntroduce() %> <% } %>
            </td>
          </tr>
        </table>
      </rightcontent>
    </main>
  </body>
</html>
