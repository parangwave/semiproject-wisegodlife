 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <img src="./profile/mainprofile.png" alt="프로필 이미지">

              <!-- 자기소개란 -->
              <div id="mainContainer__leftTab__profile__avatarContainer__introduction">
                <div id="mainContainer__leftTab__profile__avatarContainer__introduction__idSection">
                  <h3>닉네임</h3>
                  <h5>@아이디</h5>
                </div>
                <p>hello world</p>
              </div>
            </div>
            <div id="mainContainer__leftTab__profile__BtnContainer">
              <a class="btn" href="#" role="button">프로필 수정</a>
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
            <div id="mainContainer__boardSet__1stCol__mate" class="boardSection">
              <h1>메이트 구하기</h1>
              <ul>
                <!-- 데이터 불러와야함 -->
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="#" role="button">더보기</a>
              </div>
            </div>
            <div id="mainContainer__boardSet__1stCol__public" class="boardSection">
              <h1>자유 게시판</h1>
              <ul>
                <!-- 데이터 불러와야함 -->
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="#" role="button">더보기</a>
              </div>
            </div>
          </div>
          <div id="mainContainer__boardSet__2ndCol" class="mainContainer__boardSet-col">
            <div id="mainContainer__boardSet__2ndCol__club" class="boardSection">
              <h1>오늘의 동아리</h1>
              <ul>
                <!-- 데이터 불러와야함 -->
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="#" role="button">더보기</a>
              </div>
            </div>
            <div id="mainContainer__boardSet__2ndCol__deal" class="boardSection">
              <h1>오늘의 중고거래</h1>
              <ul>
                <!-- 데이터 불러와야함 -->
              </ul>
              <div class="moreBtnContainer">
                <a class="btn" href="#" role="button">더보기</a>
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