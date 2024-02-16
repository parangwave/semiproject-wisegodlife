<%@ page import="ssg.com.a.dto.FindMateDto" %> 
<%@ page import="ssg.com.a.dto.FriendDto" %> 
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 
  FriendDto login = (FriendDto)session.getAttribute("login"); 
  if(login == null || login.getId().isEmpty()) { 
%>
<script>
  alert("로그인해 주십시오");
  location.href = "./login.do";
</script>
<% 
  } 
%> 
<% List<FindMateDto> list = (List<FindMateDto>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="UTF-8" />
        <title>메이트 구하기 게시판</title>
        <link rel="icon" href="images/favicon.svg">
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
  <body id="findmateList">
      <!-- nav-bar start -->
      <script>
          $(document).ready(function () {
            $("#topnav").load("topnav.do");
          });
      </script>

      <nav id="topnav"></nav>
      <!-- nav-bar end -->

      <!-- <h1>메이트 구하기 게시판</h1> -->

      <!-- 글 리스트 -->
      <table id="findMateTable" class="table-bordered">
        <!-- col width 지정 -->
        <colgroup>
            <col width=200" />
            <col width=100" />
            <col width=800" />
            <col width=800" /> 
            <col width=100" /> 
            <col width=200" />
        </colgroup>

      <!--   <thead>
          <tr>
            <th>프로필이미지</th>
            <th>별명</th>
            <th>내용</th>

            <th>내 내용</th>
            <th>내 별명</th>
            <th>내 프로필 이미지</th>
          </tr>
        </thead> -->

        <tbody>
          <% 
            System.out.println(list.size() + "\nlist" + list); 
            if (list == null || list.size() == 0) { 
          %>
          <tr>
            <td colspan="4">작성된 글이 없습니다</td>
          </tr>
          <% /* } else if (list.size() <= 10) { */ 
              } else { 
                  for (int i = (list.size()-1); i >= 0; i--) { 
                    /* for (int i = 0; i >= (list.size()-1); i++) { */ 
                    FindMateDto findmate = list.get(i);
                    /* System.out.println("1 " + login.getNickname()); */
                    /* System.out.println("2 " + findmate.getNickname());  */

                    /* 로그인한 유저의 닉네임 != 댓글 작성자 닉네임  */
                    if (!findmate.getNickname().equals(login.getNickname())) { 
          %>
          <tr>
            <td hidden="true"><%=i + 1%>i</td>
            <!--  남이 쓴 글 -->
            <td>
              <img
                class="findMateTable__comment__avatarImg findMateTable__othercomment__avatarImg"
                src="profile/<%=findmate.getProfileImg()%>"
                alt="프로필 이미지"
              />
            </td>
            <td
              class="findMateTable__comment__writer findMateTable__othercomment__writer"
            >
              <%=findmate.getNickname()%>
            </td>
            <td
              class="findMateTable__comment__content findMateTable__othercomment__content"
            >
              <%=findmate.getContent()%>
            </td>
            <td colspan="3"></td>
          </tr>
          <% 
            } else { 
          %>
          <!-- 내가 쓴 글  -->
          <tr>
            <td colspan="3"></td>
            <td
              class="findMateTable__comment__content findMateTable__mycomment__content"
            >
              <%=findmate.getContent()%>
            </td>
            <td
              class="findMateTable__comment__writer findMateTable__mycomment__writer"
            >
              <%=findmate.getNickname()%>
            </td>
            <td>
              <img
                class="findMateTable__comment__avatarImg findMateTable__mycomment__profileImg"
                src="profile/<%=findmate.getProfileImg()%>"
                alt="프로필 이미지"
              />
            </td>
          </tr>
          <% 
              } 
            } 
          } 
          %>
        </tbody>
      </table>

      <!-- 글 작성 -->
      <div id="mateCmtSection" class="container">
        <form action="findMatecommentwrite.do" method="post">
          <table>
            <tr id="mateCmtSection__iNcontainer">
              <td id="mateCmtSection__container__plchld-Container">
                <textarea
                  cols="50"
                  rows="3"
                  class="form-control"
                  name="content"
                  placeholder="최대 200자 작성할 수 있습니다"
                  maxlength="200"
                ></textarea>
              </td>
              <td
                id="mateCmtSection__container__btn-Container"
                style="padding-left: 1rem"
              >
                <button
                  type="submit"
                  class="btn btn-primary btn-block p-4 writeBtn"
                >
                  작성완료
                </button>
              </td>
            </tr>
          </table>
        </form>
      </div>
  </body>
</html>
