 <%@page import="ssg.com.a.dto.UtBbsDto"%>
<%@page import="ssg.com.a.util.BbsUtil"%>
<%@page import="ssg.com.a.dto.FreeBbsDto"%>
<%@page import="ssg.com.a.dto.FindMateDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.a.dto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FriendDto login = (FriendDto)session.getAttribute("login");
	if(login == null || login.getId().isEmpty()){
	       session.setAttribute("prevView", "main");
%>
<script>
	alert("로그인해 주십시오");
	location.href = "./login.do";
</script>
<%
	}
%>
<%
	/* 메이트 구하기 게시판 */
	List<FindMateDto> findMateList = (List<FindMateDto>)request.getAttribute("findMateList");
	/* 자유게시판 */
	List<FreeBbsDto> freeBbslist = (List<FreeBbsDto>)request.getAttribute("freeBbslist");
	/* 중고거래 게시판 */
	List<UtBbsDto> utBbslist = (List<UtBbsDto>)request.getAttribute("utBbslist");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메인페이지</title>
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
    <!-- 시간표 불러오기 -->
    <script type="text/javascript" src="js/mainPage/timetable.js"></script>
  </head>

  <body class="light-mode" data-bs-theme="light">

    <!-- nav-bar start -->
    <script>
      $(document).ready( function() {
        $("#topnav").load("topnav.do");
      });
    </script>

    <nav id="topnav"></nav>
    <!-- nav-bar end -->


    <!-- main-page container -->
    <div id="mainContainer" class="h-100">
        <!-- left-tab start -->
        <section id="mainContainer__leftTab" class="">
          <!-- 프로필 -->
          <div id="mainContainer__leftTab__profile">
            <div id="mainContainer__leftTab__profile__avatarContainer">
              <!-- 프로필 사진 -->
              <!-- <img src="./profile/mainprofile.png" alt="프로필 이미지"> -->
              <img src="./profile/<%=login.getChangeprofile() %>" alt="프로필 이미지">
              

              <!-- 자기소개란 -->
              <div id="mainContainer__leftTab__profile__avatarContainer__introduction">
                <div id="mainContainer__leftTab__profile__avatarContainer__introduction__idSection">
                  <!-- <h3>닉네임</h3> -->
                  <h3><%=login.getNickname() %></h3>
                  <!-- <h5>@아이디</h5> -->
                  <h5><%=login.getId() %></h5>
                </div>
                <!-- <p>hello world</p> -->
                <p><%=login.getIntroduce() %></p>
              </div>
            </div>
            <div id="mainContainer__leftTab__profile__BtnContainer">
              <a class="btn" href="mychange.do" role="button">프로필 수정</a>
              <a class="btn" href="#" role="button">프로필 공유</a>
            </div>
          </div>

          <hr>

          <!-- 날씨 -->
          <div id="mainContainer__leftTab__weather">
            <div id="mainContainer__leftTab__weather__clockSection">
              <h5>대한민국</h5>
              <h1>00:00</h1>
              <h4>2024년 2월 6일</h4>
            </div>
            <div id="mainContainer__leftTab__weather__celcius">
              <img />
              <h2></h2>
            </div>
          </div>

          <hr>

          <!-- 검색창 -->
          <div id="mainContainer__leftTab__search" class="input-group rounded">
            <input
              type="search"
          id="mainContainer__leftTab__search-placeholder"
              class="form-control rounded"
              placeholder="찾고 싶은 글을 검색"
              aria-label="Search"
              aria-describedby="search-addon"
            />
            <span class="input-group-text border-0" id="search-addon">
              <i class="bi bi-search"></i>
            </span>
          </div>

          <hr>

          <!-- 학교생활 -->
          <div id="mainContainer__leftTab__school">
            <h1>오늘의 학교생활</h1>

            <!-- 수강시간표 -->
            <ul id="mainContainer__leftTab__school__lectures">
              <table><tbody></tbody></table>
            </ul>
          </div>

        </section>
        <!-- left-tab end -->


        <!-- board-set(게시판 집합 영역) start -->
        <section id="mainContainer__boardSet" class="w-75 ">
          <div id="mainContainer__boardSet__1stCol" class="mainContainer__boardSet-col">
          
          	<!-- 메이트 구하기 게시판  -->
          	<!-- 여기서 findmatelist를 가져와서 데이터를 가져와야 하는데  list가 null로 떠요  -->
            <div id="mainContainer__boardSet__1stCol__mate" class="boardSection">
              <h1>메이트 구하기</h1>
              <table>
					      <!-- <colgroup>
                  <col width="20" />
					        <col width="10" />
					        <col width="70" />
                </colgroup> -->
                <tbody>
                  <%
                    System.out.println(findMateList);
                    if (findMateList == null || findMateList.size() == 0) {
                  %>
                  <tr>
                    <td colspan="3">작성된 글이 없습니다</td>
                  </tr>
                  <%
                  } else {
                    for (int i = 0; i < findMateList.size(); i++) {
                      FindMateDto findmate = findMateList.get(i);
/*                        System.out.println("findmate.getContent().length(): " + findmate.getContent().length());
                       System.out.println(findmate.getContent().length() > 20); */
                      System.out.println(findmate.getContent().length() >= 20 ? findmate.getContent().substring(0, 19) + "..." : findmate.getContent());
                  %>
                  <tr>
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
                      <%=findmate.getContent().length() >= 20 ? findmate.getContent().substring(0, 24) + " ..." : findmate.getContent()%>
                    </td>
                  </tr>
                  <%
                    }
                  }
                  %>
                </tbody>
				      </table>
              <div class="moreBtnContainer">
                <a class="btn" href="findmate.do" role="button">더보기</a>
              </div>
            </div>
            
            <!-- 자유게시판  -->
            <div id="mainContainer__boardSet__1stCol__public" class="boardSection">
              <h1>자유 게시판</h1>
              <ul>
		   		<table class="table table-hover">
					<col width="600" />
					<col width="100" />
					<col width="100" />
					<tbody>
						<%
						if (freeBbslist == null || freeBbslist.size() == 0) {
						%>
						<tr>
							<td colspan="5">작성된 글이 없습니다</td>
						</tr>
						<%
						} else {
							for (int i = 0; i < freeBbslist.size(); i++) {
								FreeBbsDto freebbs = freeBbslist.get(i);
						%>
						<tr>
							<td style="text-align: left;">
							<%=BbsUtil.arrow(freebbs.getDepth())%>
							<%
								if(freebbs.getDel() == 0){
							%>
								<a href="freebbsdetail.do?seq=<%=freebbs.getSeq()%>">
										<%=BbsUtil.dotmain(freebbs.getTitle())%>
							<%
								} else {
							%>
								<font color="red"> ***** 삭제된 글 입니다 *****</font>
							<%
								}
							%>
								</a>
							</td>
							<td><%=freebbs.getReadcount()%></td>
							<td><%=freebbs.getLikes()%></td>
						</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="freebbslist.do" role="button">더보기</a>
              </div>
            </div>
          </div>
          <div id="mainContainer__boardSet__2ndCol" class="mainContainer__boardSet-col">
          
          	<!-- 동아리 게시판 -->
            <div id="mainContainer__boardSet__2ndCol__club" class="boardSection">
              <h1>오늘의 동아리</h1>

              <!-- 동아리 썸네일 -->
              <div id="mainContainer__boardSet__2ndCol__club-container">
                <div class="mainContainer__boardSet__2ndCol__club-content">
                  <div class="mainContainer__boardSet__2ndCol__club-content-img">
                    <h6>D-1</h6>
                    <img src="./images/club.png" alt="동아리 썸네일 이미지">
                  </div>
                  <div class="mainContainer__boardSet__2ndCol__club-content-text">
                    <h2>1조</h2>
                    <p>화이팅!!</p>
                  </div>
                </div>
                
                <div class="mainContainer__boardSet__2ndCol__club-content">
                  <div class="mainContainer__boardSet__2ndCol__club-content-img">
                    <h6>D-1</h6>
                    <img src="./images/club2.png" alt="동아리 썸네일 이미지">
                  </div>
                  <div class="mainContainer__boardSet__2ndCol__club-content-text">
                    <h2>1조</h2>
                    <p>가 생겼으면</p>
                  </div>
                </div>
              </div>
              
              <div class="moreBtnContainer">
                <a class="btn" href="/clublist.do" role="button">더보기</a>
              </div>
            </div>
            <div id="mainContainer__boardSet__2ndCol__deal" class="boardSection">
              <h1>오늘의 중고거래</h1>
              <ul>
   		<table class="table table-hover">
			<colgroup>
				<col width="120">
				<col width="500">
				<col width="100">
			</colgroup>
			<tbody>
				<%
			if (utBbslist == null || utBbslist.size() == 0) {
				%>
				<tr>
					<td colspan="3">작성된 글이 없습니다</td>
				</tr>
				<%		
			} else {
				for(int i = 0; i < utBbslist.size(); i++){
						UtBbsDto dto = utBbslist.get(i);
			%>
				<tr>
					<% if(dto.getFilename().equals("") || dto.getFilename() == null){ %>
					<td><img src="./upload/none.PNG"></td>
						<%} else{ %>
						<td><img src="./upload/s_<%=dto.getNewfilename()%>"></td>
					<% } %>
					<td style="text-align: left">
					<% if(dto.getTrsuccess() != 1){ %>
					<a href="utbbsdetail.do?seq=<%=dto.getSeq() %>"><%=BbsUtil.dotmain(dto.getTitle()) %></a>
						<%} else { %>
						<span>중고거래가 완료된 게시글 입니다.</span>
					<%} %>
					</td>
					<td><%=dto.getReadcount() %></td>
				</tr>
				<%
				}
			}
%>
			</tbody>
		</table>
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="utbbslist.do" role="button">더보기</a>
              </div>
            </div>
          </div>
        </section>
        <!-- board-set(게시판 집합 영역) end -->
    </div>

	<!-- 시계 -->
    <script src="./js/mainPage/clock.js"></script>
	<!-- 날씨 -->
    <script src="./js/mainPage/weather.js"></script>
	<!-- animation -->
  <!-- 이상있으니 확인해야함 -->
    <!-- <script src="./js/animation.js"></script> -->
    
	  <!-- 다크모드 -->
    <script src="./js/darkmode.js"></script>
    
	</body>
</html>