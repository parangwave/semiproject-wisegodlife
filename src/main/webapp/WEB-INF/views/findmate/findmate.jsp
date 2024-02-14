<%@ page import="ssg.com.a.dto.FindMateDto" %> 
<%@ page import="ssg.com.a.dto.FriendDto" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% FriendDto login = (FriendDto)session.getAttribute("login"); 
  if(login == null || login.getId().isEmpty()) { 
%>
<script>
  alert("로그인해 주십시오");
  location.href = "./login.do";
</script>
<% 
  } 
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메이트 구하기 게시판</title>
    <!-- bootstrap -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <!-- css -->
    <link rel="stylesheet" href="./style/css/style.css" />
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  </head>
  <body>
    <!-- nav-bar start -->
    <script>
      $(document).ready(function () {
        $("#topnav").load("topnav.do");
      });
    </script>

    <nav id="topnav"></nav>
    <!-- nav-bar end -->

    <%-- 글 작성 --%>
    <div id="app" class="container">
      <form action="commentwriteaf.do" method="post">
        <table>
          <col width="1000px" />
          <!-- <col width="150px" /> -->
          <!-- <tr>
            <td>메이트 구하는 글 작성</td>
            <td style="padding-left: 30px">올리기</td>
          </tr> -->
          <tr
            style="
              display: flex; 
              justify-content: center; 
              align-items: center
            "
          >
            <td>
              <textarea
                rows="3"
                class="form-control"
                name="content"
                placeholder="최대 200자 작성할 수 있습니다"
                maxlength="200"
              ></textarea>
            </td>
            <td style="padding-left: 1rem">
              <button type="submit" class="btn btn-primary btn-block p-4 writeBtn">
                작성완료
              </button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>
