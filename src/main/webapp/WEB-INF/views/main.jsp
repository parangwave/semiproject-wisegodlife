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
  </head>

  <body class="light-mode" data-bs-theme="light">
    <!-- nav-bar start -->
    <!-- 공통으로 들어갈 것임 -->
    <header id="navBar-container">
      <!-- nav-bar -->
      <nav id="navBar" class="navbar">
        <div class="container-fluid">
          <!-- logo -->
          <a class="navbar-brand" href="#">
            <img
              src="./images/full-logo.svg"
              id="navBar__logo-img"
              alt="슬갓생 logo"
              width="100"
              height="100"
            />
          </a>

          <!-- link 목록 -->
          <div id="navBar__list">
            <!-- 게시판 dropdown -->
            <div class="dropdown">
              <button
                class="btn dropdown-toggle"
                type="button"
                id="navBar__list__dropdown-board"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
              >
                게시판
              </button>
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-board"
              >
                <li><a class="dropdown-item" href="#">자유 게시판</a></li>
                <li>
                  <a class="dropdown-item" href="#">메이트 구하기 게시판</a>
                </li>
                <li><a class="dropdown-item" href="#">동아리 게시판</a></li>
                <li><a class="dropdown-item" href="#">중고거래 게시판</a></li>
              </ul>
            </div>

            <!--  학교생활 dropdown -->
            <div class="dropdown">
              <button
                class="btn dropdown-toggle"
                type="button"
                id="navBar__list__dropdown-school"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
              >
                학교생활
              </button>
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-board"
              >
                <li><a class="dropdown-item" href="#">학점 계산기</a></li>
                <li><a class="dropdown-item" href="#">수강 시간표</a></li>
                <li><a class="dropdown-item" href="#">학과 일정 달력</a></li>
              </ul>
            </div>

            <div class="dropdown">
              <button
                class="btn dropdown-toggle"
                type="button"
                id="navBar__list__dropdown-mypage"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
              >
                마이페이지
              </button>
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-board"
              >
                <li><a class="dropdown-item" href="#">내 프로필</a></li>

                <li><a class="dropdown-item" href="#">내가 쓴 댓글</a></li>
                <li><a class="dropdown-item" href="#">내가 쓴 게시물</a></li>
                <li>
                  <a class="dropdown-item" href="#">내가 좋아한 게시물</a>
                </li>
                <li><a class="dropdown-item" href="#">차단리스트</a></li>
              </ul>
            </div>
          </div>

          <!-- 라이트/다크 모드 toggle -->
          <div class="form-check form-switch mx-8">
            <input
              type="checkbox"
              id="navbar__modeSwitchToggle"
              class="form-check-input p-2"
              role="switch"
              onclick="changeMode()"
              />
          </div>
          
        </div>
      </nav>
    </header>
    <!-- nav-bar end -->


    <!-- main-page container -->
    <div id="mainContainer" class="h-100">
        <!-- left-tab start -->
        <section id="mainContainer__leftTab" class="">
          <!-- 프로필 -->
          <div id="mainContainer__leftTab__profile">
            <div id="mainContainer__leftTab__profile__avatarContainer">
              <!-- 프로필 사진 -->
              <img src="./images/avatar.jpg" alt="프로필 이미지">

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
              <!-- 수강 시간표에서 data import -->
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
    
    <script>
			function changeMode () {
				const Body = document.body;
				Body.classList.toggle("dark-mode");

				const logoImg = document.getElementById("navBar__logo-img");
				logoImg.classList.toggle("navBar__logo-img-dark");
			}
		</script>
	</body>
</html>